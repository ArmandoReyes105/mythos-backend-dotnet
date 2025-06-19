using mythos_backend_dotnet.Entities;

namespace mythos_backend_dotnet.Repositories.Interfaces
{
    public interface IAccountSubscriptionRepository
    {
        Task<bool> HasActiveSubscription(Guid userId);
        void Add(AccountSuscriptionPlan subscription);
    }
}
