using System;
using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Entities;
using mythos_backend_dotnet.Repositories.Interfaces;

namespace mythos_backend_dotnet.Repositories.Implementations;

public class MythosTransactionRepository(MythosDbContext _context) : IMythosTransactionRepository
{
    public async Task AddAsync(MythosTransaction transaction)
    {
        await _context.MythosTransactions.AddAsync(transaction);
    }
}
