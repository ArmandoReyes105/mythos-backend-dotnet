namespace mythos_backend_dotnet.Services
{
    public interface IWithdrawalService
    {
        Task<WithdrawalResponseDto> RequestWithdrawalAsync(Guid userId, CreateWithdrawalRequestDto dto);
    }
}