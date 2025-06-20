using System;

namespace mythos_backend_dotnet.Services.Interfaces;

public interface IPurchaseService
{
    Task<List<string>> GetPurchasedContentIdsAsync(Guid accountId);
    Task<(bool Success, string Message, int? NewBalance)> PurchaseContentAsync(Guid userId, string contentId, int price);
}
