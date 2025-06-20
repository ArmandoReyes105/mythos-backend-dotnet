using System;
using System.Linq.Expressions;
using mythos_backend_dotnet.Entities;

namespace mythos_backend_dotnet.Repositories.Interfaces;

public interface IPurchaseRepository
{
    Task<List<string>> GetPurchasedContentIdsByAccountIdAsync(Guid accountId);
    Task AddAsync(Purchase purchase);
    Task<bool> ExistsAsync(Expression<Func<Purchase, bool>> predicate);
}
