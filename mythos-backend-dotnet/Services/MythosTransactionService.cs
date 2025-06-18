using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Entities;
using mythos_backend_dotnet.Enums;
using Microsoft.EntityFrameworkCore;

namespace mythos_backend_dotnet.Services
{
    public class MythosTransactionService : IMythosTransactionService
    {
        private readonly MythosDbContext _context;

        public MythosTransactionService(MythosDbContext context)
        {
            _context = context;
        }

        public async Task<(bool Success, string Message)> DonateAsync(Guid senderAccountId, Guid receiverAccountId, int amount)
        {
            if (amount <= 0)
                return (false, "La cantidad debe ser mayor a cero.");

            if (senderAccountId == receiverAccountId)
                return (false, "No puedes donar a ti mismo.");

            var senderWallet = await _context.MythosWallets
                .FirstOrDefaultAsync(w => w.UserId == senderAccountId && !w.IsLocked);
            var receiverWallet = await _context.MythosWallets
                .FirstOrDefaultAsync(w => w.UserId == receiverAccountId && !w.IsLocked);

            if (senderWallet == null)
                return (false, "El usuario autenticado no tiene wallet o está bloqueada.");
            if (receiverWallet == null)
                return (false, "El escritor receptor no tiene wallet o está bloqueada.");

            if (senderWallet.MythrasBalance < amount)
                return (false, "Saldo insuficiente para donar.");

            using var transaction = await _context.Database.BeginTransactionAsync();

            try
            {
                senderWallet.MythrasBalance -= amount;
                receiverWallet.MythrasBalance += amount;
                senderWallet.LastUpdated = DateTime.UtcNow;
                receiverWallet.LastUpdated = DateTime.UtcNow;

                var sendTx = new MythosTransaction
                {
                    Type = MythosTransactionType.DonationSent,
                    Amount = -amount,
                    BalanceAfter = senderWallet.MythrasBalance,
                    CreatedAt = DateTime.UtcNow,
                    AccountId = senderAccountId,
                    CounterpartyAccountId = receiverAccountId
                };
                var receiveTx = new MythosTransaction
                {
                    Type = MythosTransactionType.DonationReceived,
                    Amount = amount,
                    BalanceAfter = receiverWallet.MythrasBalance,
                    CreatedAt = DateTime.UtcNow,
                    AccountId = receiverAccountId,
                    CounterpartyAccountId = senderAccountId
                };

                await _context.MythosTransactions.AddAsync(sendTx);
                await _context.MythosTransactions.AddAsync(receiveTx);
                await _context.SaveChangesAsync();

                await transaction.CommitAsync();
                return (true, "Donación realizada con éxito.");
            }
            catch (Exception ex)
            {
                await transaction.RollbackAsync();
                return (false, "Error al procesar la donación: " + ex.Message);
            }
        }
    }
}