using System;
using mythos_backend_dotnet.Models;

namespace mythos_backend_dotnet.Services.Interfaces;

public interface IPurchaseService
{
    Task<List<string>> GetPurchasedContentIdsAsync(Guid accountId);
    Task<(bool Success, string Message, int? NewBalance)> PurchaseContentAsync(Guid userId, PurchaseRequestDto request);
    Task<List<PurchaseStatisticsDto>> GetPurchaseStatisticsAsync(DateTime startDate, DateTime endDate);
}
