using Microsoft.EntityFrameworkCore;
using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Entities;
using mythos_backend_dotnet.Repositories.Interfaces;

namespace mythos_backend_dotnet.Repositories.Implementations
{
    public class AccountSubscriptionRepository(MythosDbContext _context) : IAccountSubscriptionRepository
    {
        public void Add(AccountSuscriptionPlan subscription)
        {
            _context.AccountSuscriptionPlans.Add(subscription);
        }

        public Task<bool> HasActiveSubscription(Guid userId)
        {
            return _context.AccountSuscriptionPlans
            .AnyAsync(s => s.AccountId == userId && s.EndDate > DateTime.UtcNow && s.Status == "Active");
        }
    }
}
