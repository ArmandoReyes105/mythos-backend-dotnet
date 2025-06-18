namespace mythos_backend_dotnet.Models
{
    public class WalletResponseDto
    {
        public Guid UserId { get; set; }
        public int MythrasBalance { get; set; }
        public bool IsLocked { get; set; }
        public DateTime LastUpdated { get; set; }
    }
}