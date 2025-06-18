namespace mythos_backend_dotnet.Services
{
    public interface IMythosTransactionService
    {
        Task<(bool Success, string Message, DonationResponseDto? Response)> DonateAsync(Guid senderAccountId, CreateDonationDto dto);
    }
}