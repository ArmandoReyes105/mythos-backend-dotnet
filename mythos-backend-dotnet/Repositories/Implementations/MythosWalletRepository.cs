using Microsoft.EntityFrameworkCore;
using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Repositories.Interfaces;

namespace mythos_backend_dotnet.Repositories.Implementations
{
    public class MythosWalletRepository(MythosDbContext _context) : IMythosWalletRepository
    {
        public async Task AddBonusAsync(Guid userId, int bonus)
        {
            var wallet = await _context.MythosWallets.FirstOrDefaultAsync(w => w.UserId == userId);
            if (wallet != null)
            {
                wallet.MythrasBalance += bonus;
                wallet.LastUpdated = DateTime.UtcNow;
            }
        }
    }
}
