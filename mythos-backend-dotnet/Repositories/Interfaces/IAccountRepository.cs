using System;
using mythos_backend_dotnet.Entities;

namespace mythos_backend_dotnet.Repositories.Interfaces;

public interface IAccountRepository
{
    Task<Account?> GetByIdAsync(Guid id);
    void Update(Account account);
}
