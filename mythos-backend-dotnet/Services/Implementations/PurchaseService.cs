using System;
using mythos_backend_dotnet.Entities;
using mythos_backend_dotnet.Models;
using mythos_backend_dotnet.Services.Interfaces;
using mythos_backend_dotnet.UnitOfWork;

namespace mythos_backend_dotnet.Services.Implementations;

public class PurchaseService(IUnitOfWork _unitOfWork) : IPurchaseService
{
    public async Task<List<string>> GetPurchasedContentIdsAsync(Guid accountId)
    {
        return await _unitOfWork.Purchases.GetPurchasedContentIdsByAccountIdAsync(accountId);
    }

    public async Task<(bool Success, string Message, int? NewBalance)> PurchaseContentAsync(Guid userId, PurchaseRequestDto request)
    {
        var wallet = await _unitOfWork.MythosWallet.GetByUserIdAsync(userId);

        if (wallet == null)
            return (false, "Wallet no encontrada", null);

        if (wallet.IsLocked)
            return (false, "La wallet está bloqueada", null);

        if (wallet.MythrasBalance < request.Price)
            return (false, "Fondos insuficientes", wallet.MythrasBalance);

        if (!Guid.TryParse(request.WriterId, out var writerId))
            return (false, "ID del escritor inválido", null);

        if (await _unitOfWork.Purchases.ExistsAsync(p => p.AccountId == userId && p.ContentId == request.ContentId))
            return (true, "Contenido ya comprado", wallet.MythrasBalance);

        var writerWallet = await _unitOfWork.MythosWallet.GetByUserIdAsync(writerId);

        var buyerTransaction = new MythosTransaction
        {
            AccountId = userId,
            CounterpartyAccountId = writerId,
            Amount = request.Price,
            CreatedAt = DateTime.UtcNow,
            Type = Enums.MythosTransactionType.PurchaseMade
        };

        var writerTransaction = new MythosTransaction
        {
            AccountId = writerId,
            CounterpartyAccountId = userId,
            Amount = request.Price,
            CreatedAt = DateTime.UtcNow,
            Type = Enums.MythosTransactionType.PurchaseReceived
        };

        await _unitOfWork.MythosTransactions.AddAsync(buyerTransaction);
        await _unitOfWork.MythosTransactions.AddAsync(writerTransaction);

        var purchase = new Purchase
        {
            AccountId = userId,
            ContentId = request.ContentId,
            MythrasPrice = request.Price,
            PurchaseDate = DateTime.UtcNow,
            MythosTransaction = buyerTransaction
        };

        await _unitOfWork.Purchases.AddAsync(purchase);

        wallet.MythrasBalance -= request.Price;
        wallet.LastUpdated = DateTime.UtcNow;
        _unitOfWork.MythosWallet.Update(wallet);

        if (writerWallet is not null)
        {
            writerWallet.MythrasBalance += request.Price;
            writerWallet.LastUpdated = DateTime.UtcNow;
            _unitOfWork.MythosWallet.Update(writerWallet);
        }

        await _unitOfWork.SaveAsync();

        return (true, "Compra exitosa", wallet.MythrasBalance);
    }

}
