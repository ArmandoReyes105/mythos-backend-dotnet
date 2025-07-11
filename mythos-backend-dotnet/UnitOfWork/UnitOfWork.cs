﻿
using Microsoft.EntityFrameworkCore.Storage;
using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Repositories.Interfaces;

namespace mythos_backend_dotnet.UnitOfWork
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly MythosDbContext _context;
        private IDbContextTransaction? _transaction;

        public ISubscriptionPlanRepository Subscriptions { get; }
        public IAccountSubscriptionRepository AccountSubscriptions { get; }
        public ITransactionRepository Transactions { get; }
        public IMythosWalletRepository MythosWallet { get; }
        public IAccountRepository Accounts { get; }
        public IPersonRepository People { get; }
        public IPurchaseRepository Purchases { get; }
        public IMythosTransactionRepository MythosTransactions { get; }

        public UnitOfWork(
            MythosDbContext context,
            ISubscriptionPlanRepository subscriptionRepository,
            IAccountSubscriptionRepository accountSubscriptionRepository,
            ITransactionRepository transactionRepository,
            IMythosWalletRepository mythosWalletRepository,
            IAccountRepository accountRepository,
            IPersonRepository personRepository,
            IPurchaseRepository purchaseRepository,
            IMythosTransactionRepository mythosTransactionRepository)
        {
            this._context = context;
            this.Subscriptions = subscriptionRepository;
            this.AccountSubscriptions = accountSubscriptionRepository;
            this.Transactions = transactionRepository;
            this.MythosWallet = mythosWalletRepository;
            this.Accounts = accountRepository;
            this.People = personRepository;
            this.Purchases = purchaseRepository;
            this.MythosTransactions = mythosTransactionRepository;
        }

        public async Task BeginTransactionAsync()
        {
            _transaction ??= await _context.Database.BeginTransactionAsync();
        }

        public async Task CommitTransactionAsync()
        {
            if (_transaction is null)
                throw new InvalidOperationException("No active transaction");

            await _transaction.CommitAsync();
            await _transaction.DisposeAsync();
            _transaction = null;
        }

        public async Task RollbackTransactionAsync()
        {
            if (_transaction is null)
                throw new InvalidOperationException("No active transaction");

            await _transaction.RollbackAsync();
            await _transaction.DisposeAsync();
            _transaction = null;
        }

        public async Task<int> SaveAsync()
        {
            return await _context.SaveChangesAsync();
        }

        public async Task ExecuteInTransactionAsync(Func<Task> action)
        {
            await BeginTransactionAsync();

            try
            {
                await action();
                await CommitTransactionAsync();
            }
            catch
            {
                await RollbackTransactionAsync();
                throw;
            }
        }

        public void Dispose()
        {
            _context.Dispose();
            GC.SuppressFinalize(this);
        }
    }
}
