using mythos_backend_dotnet.Models;

namespace mythos_backend_dotnet.Services
{
    public interface IMythrasPurchaseService
    {
        Task<(bool Success, string Message, PurchaseMythrasResponseDto? Response)> PurchaseMythrasAsync(Guid userId, PurchaseMythrasRequestDto dto);
    }
}