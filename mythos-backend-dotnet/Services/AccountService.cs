using Microsoft.AspNetCore.Identity;
using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Entities;
using mythos_backend_dotnet.Models;

namespace mythos_backend_dotnet.Services
{
    public class AccountService(MythosDbContext context) : IAccountService
    {
        public async Task<AccountDto?> GetAccountByIdAsync(Guid id)
        {
            var account = await context.Accounts.FindAsync(id);

            if (account is null)
                return null;

            return new AccountDto()
            {
                Username = account.Username,
                Password = account.PasswordHash,
            };
        }
        
        public async Task<AccountResponseDto?> GetAccountByAccessTokenCookieAsync(Guid id)
        {
            var account = await context.Accounts.FindAsync(id);

            if (account is null)
                return null;

            return new AccountResponseDto()
            {
                AccountId = account.Id.ToString(),
                Username = account.Username,
                Email = account.Email,
                Password = account.PasswordHash,
                Role = account.Role
            };
        }

        public async Task<AccountDto?> UpdateAccountAsync(Guid id, AccountDto model)
        {
            var account = await context.Accounts.FindAsync(id);

            if (account is null)
                return null;

            account.Username = model.Username;

            await context.SaveChangesAsync();
            return model;
        }

        public async Task<bool> ChangePasswordAsync(Guid id, ChangePasswordRequest request)
        {
            var account = await context.Accounts.FindAsync(id);

            if (account is null)
                return false;

            var newPasswordHash = new PasswordHasher<Account>()
                .HashPassword(account, request.NewPassword);
            account.PasswordHash = newPasswordHash;

            var result = await context.SaveChangesAsync();

            return result > 0; 
        }
    }
}
