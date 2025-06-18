using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Entities;
using mythos_backend_dotnet.Enums;
using mythos_backend_dotnet.Services;
using Microsoft.EntityFrameworkCore;

public class MythosTransactionService : IMythosTransactionService
{
    private readonly MythosDbContext _context;

    public MythosTransactionService(MythosDbContext context)
    {
        _context = context;
    }

    public async Task<(bool, string, DonationResponseDto?)> DonateAsync(Guid senderAccountId, CreateDonationDto dto)
    {
        if (dto.Amount <= 0)
            return (false, "La cantidad a donar debe ser mayor a cero.", null);

        if (senderAccountId == dto.ReceiverAccountId)
            return (false, "No puedes donar a ti mismo.", null);

        var senderWallet = await GetWalletAsync(senderAccountId);
        if (senderWallet == null)
            return (false, "El usuario autenticado no tiene wallet. Realiza primero una compra de mythras.", null);

        var receiverWallet = await GetWalletAsync(dto.ReceiverAccountId);
        if (receiverWallet == null)
            return (false, "El escritor receptor no tiene wallet.", null);

        if (senderWallet.IsLocked)
            return (false, "Tu wallet está bloqueada. No puedes donar.", null);
        if (receiverWallet.IsLocked)
            return (false, "La wallet del receptor está bloqueada. No puede recibir donaciones.", null);

        if (senderWallet.MythrasBalance < dto.Amount)
            return (false, "Saldo insuficiente para donar.", null);

        using var transaction = await _context.Database.BeginTransactionAsync();
        try
        {
            senderWallet.MythrasBalance -= dto.Amount;
            receiverWallet.MythrasBalance += dto.Amount;
            senderWallet.LastUpdated = DateTime.UtcNow;
            receiverWallet.LastUpdated = DateTime.UtcNow;

            await _context.MythosTransactions.AddRangeAsync(
                BuildTransaction(senderAccountId, dto.ReceiverAccountId, -dto.Amount, senderWallet.MythrasBalance, MythosTransactionType.DonationSent),
                BuildTransaction(dto.ReceiverAccountId, senderAccountId, dto.Amount, receiverWallet.MythrasBalance, MythosTransactionType.DonationReceived)
            );

            await _context.SaveChangesAsync();
            await transaction.CommitAsync();

            var response = new DonationResponseDto
            {
                Message = "Donación realizada con éxito.",
                SenderBalance = senderWallet.MythrasBalance,
                ReceiverBalance = receiverWallet.MythrasBalance
            };

            return (true, "Donación exitosa", response);
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();
            return (false, $"Error al procesar la donación: {ex.Message}", null);
        }
    }

    private async Task<MythosWallet?> GetWalletAsync(Guid userId)
        => await _context.MythosWallets.FirstOrDefaultAsync(w => w.UserId == userId);

    private MythosTransaction BuildTransaction(Guid accountId, Guid counterpartyId, int amount, int balanceAfter, MythosTransactionType type)
        => new MythosTransaction
        {
            Type = type,
            Amount = amount,
            BalanceAfter = balanceAfter,
            CreatedAt = DateTime.UtcNow,
            AccountId = accountId,
            CounterpartyAccountId = counterpartyId
        };
}