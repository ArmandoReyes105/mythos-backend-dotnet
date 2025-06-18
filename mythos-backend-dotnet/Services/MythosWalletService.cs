using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Entities;
using mythos_backend_dotnet.Models;
using Microsoft.EntityFrameworkCore;

namespace mythos_backend_dotnet.Services
{
    public class MythosWalletService : IMythosWalletService
    {
        private readonly MythosDbContext _context;

        public MythosWalletService(MythosDbContext context)
        {
            _context = context;
        }

        public async Task<WalletResponseDto?> GetWalletByUserIdAsync(Guid userId)
        {
            var wallet = await _context.MythosWallets.FirstOrDefaultAsync(w => w.UserId == userId);
            if (wallet == null)
                return null;
            return new WalletResponseDto
            {
                UserId = wallet.UserId,
                MythrasBalance = wallet.MythrasBalance,
                IsLocked = wallet.IsLocked,
                LastUpdated = wallet.LastUpdated
            };
        }

        public async Task<bool> BlockWalletAsync(Guid userId)
        {
            var wallet = await _context.MythosWallets.FirstOrDefaultAsync(w => w.UserId == userId);
            if (wallet == null || wallet.IsLocked)
                return false;
            wallet.IsLocked = true;
            await _context.SaveChangesAsync();
            return true;
        }

        public async Task<bool> UnblockWalletAsync(Guid userId)
        {
            var wallet = await _context.MythosWallets.FirstOrDefaultAsync(w => w.UserId == userId);
            if (wallet == null || !wallet.IsLocked)
                return false;
            wallet.IsLocked = false;
            await _context.SaveChangesAsync();
            return true;
        }
    }
}