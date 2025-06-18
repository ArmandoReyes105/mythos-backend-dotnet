namespace mythos_backend_dotnet.Models
{
    public class PurchaseMythrasResponseDto
    {
        public string Message { get; set; } = string.Empty;
        public int MythrasBalance { get; set; }
        public DateTime WalletLastUpdated { get; set; }
    }
}