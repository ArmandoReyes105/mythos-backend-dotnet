using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Entities;
using Microsoft.EntityFrameworkCore;

namespace mythos_backend_dotnet.Services
{
    public class MythrasPackageService : IMythrasPackageService
    {
        private readonly MythosDbContext _context;

        public MythrasPackageService(MythosDbContext context)
        {
            _context = context;
        }

        public async Task<List<MythrasPackage>> GetActivePackagesAsync()
        {
            return await _context.MythrasPackages.Where(p => p.IsActive).ToListAsync();
        }

        public async Task<MythrasPackage?> GetActivePackageByIdAsync(int id)
        {
            return await _context.MythrasPackages.FirstOrDefaultAsync(p => p.MythrasPackageId == id && p.IsActive);
        }
    }
}