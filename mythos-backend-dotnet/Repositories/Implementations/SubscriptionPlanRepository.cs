using Microsoft.EntityFrameworkCore;
using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Entities;
using mythos_backend_dotnet.Repositories.Interfaces;

namespace mythos_backend_dotnet.Repositories.Implementations
{
    public class SubscriptionPlanRepository(MythosDbContext _context) : ISubscriptionPlanRepository
    {
        public Task<SuscriptionPlan?> GetActivePlanByIdAsync(int planId)
        {
            return _context.SuscriptionPlans.FirstOrDefaultAsync(p => p.SuscriptionPlanId == planId && p.IsActive);
        }
    }
}
