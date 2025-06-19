namespace mythos_backend_dotnet.Services.Interfaces
{
    public interface ISubscriptionService
    {
        Task<bool> SubscribeToPlanAsync(Guid userId, int planId); 
    }
}
