using System;
using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Entities;
using mythos_backend_dotnet.Repositories.Interfaces;

namespace mythos_backend_dotnet.Repositories.Implementations;

public class AccountRepository(MythosDbContext _context) : IAccountRepository
{
    public async Task<Account?> GetByIdAsync(Guid id)
    {
        return await _context.Accounts.FindAsync(id);
    }

    public void Update(Account account)
    {
        _context.Accounts.Update(account);
    }
}
