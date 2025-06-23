using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Repositories.Implementations;
using mythos_backend_dotnet.Repositories.Interfaces;
using mythos_backend_dotnet.UnitOfWork;

namespace mythos_backend_dotnet.Tests.TestUtils
{
    public class TestUnitOfWork(MythosDbContext context) : IUnitOfWork
    {
        private readonly MythosDbContext _context = context;

        public IAccountRepository Accounts { get; } = new AccountRepository(context);
        public IPersonRepository People { get; } = new PersonRepository(context);
        public ISubscriptionPlanRepository Subscriptions { get; } = new SubscriptionPlanRepository(context);
        public IAccountSubscriptionRepository AccountSubscriptions { get; } = new AccountSubscriptionRepository(context);
        public ITransactionRepository Transactions { get; } = new TransactionRepository(context);
        public IMythosWalletRepository MythosWallet { get; } = new MythosWalletRepository(context);
        public IPurchaseRepository Purchases { get; } = new PurchaseRepository(context);
        public IMythosTransactionRepository MythosTransactions { get; } = new MythosTransactionRepository(context);

        public Task ExecuteInTransactionAsync(Func<Task> action)
        {
            return action();
        }

        public Task<int> SaveAsync() => _context.SaveChangesAsync();

        public Task BeginTransactionAsync() => Task.CompletedTask;
        public Task CommitTransactionAsync() => Task.CompletedTask;
        public Task RollbackTransactionAsync() => Task.CompletedTask;
        public void Dispose()
        {
            _context.Dispose();
        }
    }
}
