using mythos_backend_dotnet.Models;

namespace mythos_backend_dotnet.Services
{
    public interface IAccountService
    {
        Task<AccountDto?> GetAccountByIdAsync(Guid id);
        Task<AccountResponseDto?> GetAccountByAccessTokenCookieAsync(Guid id);
        Task<EditProfileRequestDto?> UpdateAccountAsync(Guid id, EditProfileRequestDto model);
        Task<bool> ChangePasswordAsync(Guid id, ChangePasswordRequest request);
    }
}
