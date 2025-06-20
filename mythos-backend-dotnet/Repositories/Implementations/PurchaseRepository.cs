using System;
using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;
using mythos_backend_dotnet.Entities;
using System.Linq.Expressions;

namespace mythos_backend_dotnet.Repositories.Implementations;

public class PurchaseRepository(MythosDbContext _context) : IPurchaseRepository
{
    public async Task<List<string>> GetPurchasedContentIdsByAccountIdAsync(Guid accountId)
    {
        return await _context.Purchases
            .Where(p => p.AccountId == accountId)
            .Select(p => p.ContentId).ToListAsync();
    }

    public async Task AddAsync(Purchase purchase)
    {
        await _context.Purchases.AddAsync(purchase);
    }

    public async Task<bool> ExistsAsync(Expression<Func<Purchase, bool>> predicate)
    {
        return await _context.Purchases.AnyAsync(predicate);
    }
}
