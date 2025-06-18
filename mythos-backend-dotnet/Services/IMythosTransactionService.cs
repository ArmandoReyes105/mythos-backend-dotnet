namespace mythos_backend_dotnet.Services
{
    public interface IMythosTransactionService
    {
        Task<(bool Success, string Message)> DonateAsync(Guid senderAccountId, Guid receiverAccountId, int amount);
    }
}