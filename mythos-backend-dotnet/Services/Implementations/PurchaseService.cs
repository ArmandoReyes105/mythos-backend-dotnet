using System;
using mythos_backend_dotnet.Entities;
using mythos_backend_dotnet.Services.Interfaces;
using mythos_backend_dotnet.UnitOfWork;

namespace mythos_backend_dotnet.Services.Implementations;

public class PurchaseService(IUnitOfWork _unitOfWork) : IPurchaseService
{
    public async Task<List<string>> GetPurchasedContentIdsAsync(Guid accountId)
    {
        return await _unitOfWork.Purchases.GetPurchasedContentIdsByAccountIdAsync(accountId);
    }

    public async Task<(bool Success, string Message, int? NewBalance)> PurchaseContentAsync(Guid userId, string contentId, int price)
    {
        // 1. Obtener wallet
        var wallet = await _unitOfWork.MythosWallet.GetByUserIdAsync(userId);
        if (wallet == null)
            return (false, "Wallet no encontrada", null);

        if (wallet.IsLocked)
            return (false, "La wallet está bloqueada", null);

        // 2. Verificar saldo
        if (wallet.MythrasBalance < price)
            return (false, "Fondos insuficientes", wallet.MythrasBalance);

        // 3. Verificar si ya compró ese contenido
        var alreadyPurchased = await _unitOfWork.Purchases.ExistsAsync(p => p.AccountId == userId && p.ContentId == contentId);
        if (alreadyPurchased)
            return (true, "Contenido ya comprado", wallet.MythrasBalance);

        // 4. Crear transacción (simplificado)
        var transaction = new MythosTransaction
        {
            AccountId = userId,
            CounterpartyAccountId = userId, // <-- Asignar el mismo userId o un account válido aquí
            Amount = price,
            CreatedAt = DateTime.UtcNow,
            Type = Enums.MythosTransactionType.PurchaseMade
        };
        await _unitOfWork.MythosTransactions.AddAsync(transaction);
        await _unitOfWork.SaveAsync();

        // 5. Crear purchase
        var purchase = new Purchase
        {
            AccountId = userId,
            ContentId = contentId,
            MythrasPrice = price,
            PurchaseDate = DateTime.UtcNow,
            MythosTransactionId = transaction.MythosTransactionId,
            MythosTransaction = transaction
        };
        await _unitOfWork.Purchases.AddAsync(purchase);

        // 6. Descontar Mythras
        wallet.MythrasBalance -= price;
        wallet.LastUpdated = DateTime.UtcNow;
        _unitOfWork.MythosWallet.Update(wallet);

        await _unitOfWork.SaveAsync();

        return (true, "Compra exitosa", wallet.MythrasBalance);
    }
}
