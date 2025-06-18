using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Entities;
using mythos_backend_dotnet.Services;
using Microsoft.EntityFrameworkCore;

public class WithdrawalService : IWithdrawalService
{
    private readonly MythosDbContext _context;
    private const decimal ConversionRate = 1.0M;

    public WithdrawalService(MythosDbContext context)
    {
        _context = context;
    }

    public async Task<WithdrawalResponseDto> RequestWithdrawalAsync(Guid userId, CreateWithdrawalRequestDto dto)
    {
        var user = await _context.Accounts.FindAsync(userId);
        if (user == null)
            return BuildResponse("Solo escritores pueden solicitar retiros.", 0, 0, "Rechazado");

        var wallet = await _context.MythosWallets.FirstOrDefaultAsync(w => w.UserId == userId);
        if (wallet == null || wallet.IsLocked)
            return BuildResponse("No tienes wallet activa o está bloqueada.", 0, 0, "Rechazado");

        if (dto.Amount <= 0)
            return BuildResponse("La cantidad a retirar debe ser mayor a cero.", 0, 0, "Rechazado");

        if (wallet.MythrasBalance < dto.Amount)
            return BuildResponse("Saldo insuficiente para el retiro.", 0, 0, "Rechazado");

        if (!ValidateCardNumber(dto.CardNumber, out string cardError))
            return BuildResponse(cardError, 0, 0, "Rechazado");

        if (string.IsNullOrWhiteSpace(dto.CardHolder) || dto.CardHolder.Length < 4)
            return BuildResponse("El nombre del titular es obligatorio y debe tener al menos 4 caracteres.", 0, 0, "Rechazado");

        if (string.IsNullOrWhiteSpace(dto.Bank))
            return BuildResponse("El banco es obligatorio.", 0, 0, "Rechazado");

        using var tx = await _context.Database.BeginTransactionAsync();
        try
        {
            wallet.MythrasBalance -= dto.Amount;
            wallet.LastUpdated = DateTime.UtcNow;
            var withdrawal = new Withdrawal
            {
                WriterUserId = userId,
                SubtractedMythras = dto.Amount,
                AmountRealMoney = dto.Amount * ConversionRate,
                RequestedDate = DateTime.UtcNow,
                Status = "Aceptado"
            };

            await _context.Withdrawals.AddAsync(withdrawal);
            await _context.SaveChangesAsync();
            await tx.CommitAsync();

            return BuildResponse("Retiro solicitado exitosamente.", dto.Amount, withdrawal.AmountRealMoney, withdrawal.Status, withdrawal.RequestedDate);
        }
        catch
        {
            await tx.RollbackAsync();
            return BuildResponse("Error al procesar el retiro. Intenta de nuevo.", 0, 0, "Rechazado");
        }
    }

    private WithdrawalResponseDto BuildResponse(string message, int mythras, decimal pesos, string status, DateTime? date = null)
    {
        return new WithdrawalResponseDto
        {
            Message = message,
            WithdrawnMythras = mythras,
            AmountInPesos = pesos,
            Status = status,
            RequestedDate = date ?? DateTime.UtcNow
        };
    }

    private bool ValidateCardNumber(string cardNumber, out string error)
    {
        error = "";
        if (string.IsNullOrWhiteSpace(cardNumber) || cardNumber.Length != 16 || !cardNumber.All(char.IsDigit))
        {
            error = "El número de tarjeta debe tener 16 dígitos.";
            return false;
        }
        if (!LuhnCheck(cardNumber))
        {
            error = "El número de tarjeta no es válido (falló la validación Luhn).";
            return false;
        }
        return true;
    }

    private bool LuhnCheck(string number)
    {
        int sum = 0;
        bool alternate = false;
        for (int i = number.Length - 1; i >= 0; i--)
        {
            int n = int.Parse(number[i].ToString());
            if (alternate)
            {
                n *= 2;
                if (n > 9)
                    n -= 9;
            }
            sum += n;
            alternate = !alternate;
        }
        return sum % 10 == 0;
    }
}