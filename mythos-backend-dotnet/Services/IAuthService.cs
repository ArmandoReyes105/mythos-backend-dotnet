using mythos_backend_dotnet.Entities;
using mythos_backend_dotnet.Models;

namespace mythos_backend_dotnet.Services
{
    public interface IAuthService
    {
        Task<Account?> RegisterAsync(CreateAccountRequestDto request);
        Task<TokenResponseDto?> LoginAsync(AccountDto request);
        Task<TokenResponseDto?> RefreshTokensAsync(RefreshTokenRequestDto request);
    }
}
