using mythos_backend_dotnet.Models;

namespace mythos_backend_dotnet.Services
{
    public interface IAccountService
    {
        Task<AccountDto?> GetAccountByIdAsync(Guid id);
        Task<AccountResponseDto?> GetAccountByAccessTokenCookieAsync(Guid id);
        Task<AccountDto?> UpdateAccountAsync(Guid id, AccountDto model);
        Task<bool> ChangePasswordAsync(Guid id, ChangePasswordRequest request);
    }
}
