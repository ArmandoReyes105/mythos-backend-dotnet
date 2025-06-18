using mythos_backend_dotnet.Models;

namespace mythos_backend_dotnet.Services
{
    public interface IMythosWalletService
    {
        Task<WalletResponseDto?> GetWalletByUserIdAsync(Guid userId);
        Task<bool> BlockWalletAsync(Guid userId);
        Task<bool> UnblockWalletAsync(Guid userId);
    }
}