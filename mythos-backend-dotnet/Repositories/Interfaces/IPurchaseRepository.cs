using System;
using System.Linq.Expressions;
using mythos_backend_dotnet.Entities;
using mythos_backend_dotnet.Models;

namespace mythos_backend_dotnet.Repositories.Interfaces;

public interface IPurchaseRepository
{
    Task<List<string>> GetPurchasedContentIdsByAccountIdAsync(Guid accountId);
    Task AddAsync(Purchase purchase);
    Task<bool> ExistsAsync(Expression<Func<Purchase, bool>> predicate);
    Task<List<PurchaseStatisticsDto>> GetPurchaseStatisticsAsync(DateTime startDate, DateTime endDate);

}
