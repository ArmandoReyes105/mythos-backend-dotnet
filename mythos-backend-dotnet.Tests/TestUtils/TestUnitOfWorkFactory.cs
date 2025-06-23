using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Repositories.Implementations;
using mythos_backend_dotnet.UnitOfWork;

namespace mythos_backend_dotnet.Tests.TestUtils
{
    public static class TestUnitOfWorkFactory
    {
        public static IUnitOfWork Create(MythosDbContext context)
        {
            return new mythos_backend_dotnet.UnitOfWork.UnitOfWork(
                context, 
                new SubscriptionPlanRepository(context),
                new AccountSubscriptionRepository(context),
                new TransactionRepository(context),
                new MythosWalletRepository(context),
                new AccountRepository(context),
                new PersonRepository(context),
                new PurchaseRepository(context),
                new MythosTransactionRepository(context)
            );
        }

        public static IUnitOfWork CreateLight(MythosDbContext context)
        {
            return new TestUnitOfWork(context);
        }
    }
}
