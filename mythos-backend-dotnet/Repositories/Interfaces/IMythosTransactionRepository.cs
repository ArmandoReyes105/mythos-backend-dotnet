using System;
using mythos_backend_dotnet.Entities;

namespace mythos_backend_dotnet.Repositories.Interfaces;

public interface IMythosTransactionRepository
{
    Task AddAsync(MythosTransaction transaction);
}
