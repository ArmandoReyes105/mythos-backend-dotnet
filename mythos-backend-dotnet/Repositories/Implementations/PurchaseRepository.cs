using System;
using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;
using mythos_backend_dotnet.Entities;
using System.Linq.Expressions;
using mythos_backend_dotnet.Models;

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

    public async Task<List<PurchaseStatisticsDto>> GetPurchaseStatisticsAsync(DateTime startDate, DateTime endDate)
    {
        endDate = endDate.Date.AddDays(1).AddTicks(-1);

        return await _context.Purchases
            .Where(p => p.PurchaseDate >= startDate && p.PurchaseDate <= endDate)
            .GroupBy(p => p.ContentId)
            .Select(g => new PurchaseStatisticsDto
            {
                ContentId = g.Key,
                TotalPurchases = g.Count(),
                TotalMythras = g.Sum(p => p.MythrasPrice),
                PricePerPurchase = g.First().MythrasPrice
            })
            .ToListAsync();
    }
}
