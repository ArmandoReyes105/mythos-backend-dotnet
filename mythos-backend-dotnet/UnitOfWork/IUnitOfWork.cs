using mythos_backend_dotnet.Repositories.Interfaces;

namespace mythos_backend_dotnet.UnitOfWork
{
    public interface IUnitOfWork : IDisposable
    {
        ISubscriptionPlanRepository Subscriptions { get; }
        IAccountSubscriptionRepository AccountSubscriptions { get; }
        ITransactionRepository Transactions { get; }
        IMythosWalletRepository MythosWallet { get; }
        IAccountRepository Accounts { get; }
        IPersonRepository People { get; }


        Task BeginTransactionAsync();
        Task CommitTransactionAsync();
        Task RollbackTransactionAsync();
        Task<int> SaveAsync();
        Task ExecuteInTransactionAsync(Func<Task> action);
    }
}
