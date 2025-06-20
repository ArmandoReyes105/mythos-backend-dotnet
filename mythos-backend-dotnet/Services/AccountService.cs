using Microsoft.AspNetCore.Identity;
using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Entities;
using mythos_backend_dotnet.Exceptions;
using mythos_backend_dotnet.Models;
using mythos_backend_dotnet.UnitOfWork;

namespace mythos_backend_dotnet.Services
{
    public class AccountService(MythosDbContext context, IUnitOfWork _unitOfWork) : IAccountService
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

        public async Task<EditProfileRequestDto?> UpdateAccountAsync(Guid id, EditProfileRequestDto model)
        {
            var account = await context.Accounts.FindAsync(id);

            if (account is null)
                return null;

            account.Username = model.Username;
            account.Email = model.Email;

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

        public async Task<BecomeWriterResponse> BecomeWriterAsync(Guid accountId, PersonDto dto)
        {
            var account = await _unitOfWork.Accounts.GetByIdAsync(accountId);
            if (account == null)
                throw new BusinessException("Cuenta no encontrada.");

            if (account.Role == "writer")
                throw new BusinessException("Ya eres escritor.");
            if (account.Role != "reader")
                throw new BusinessException("No tienes permiso para convertirte en escritor.");

            await _unitOfWork.ExecuteInTransactionAsync(async () =>
            {
                var person = new Person
                {
                    PersonId = Guid.NewGuid(),
                    Name = dto.Name,
                    Surnames = dto.LastName,
                    BirthDate = dto.BirthDate,
                    Country = dto.Country,
                    Biography = dto.Biography,
                    AccountId = accountId
                };

                _unitOfWork.People.Add(person);

                account.Role = "writer";
                _unitOfWork.Accounts.Update(account);

                await _unitOfWork.SaveAsync();
            });

            return new BecomeWriterResponse();
        }
    }
}
