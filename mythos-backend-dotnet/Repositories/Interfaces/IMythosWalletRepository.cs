﻿using mythos_backend_dotnet.Entities;

namespace mythos_backend_dotnet.Repositories.Interfaces
{
    public interface IMythosWalletRepository
    {
        Task AddBonusAsync(Guid userId, int bonus);
        Task<MythosWallet?> GetByUserIdAsync(Guid userId);
        void Update(MythosWallet wallet);
    }
}
