namespace mythos_backend_dotnet.Entities
{
    public class MythosWallet
    {
        public int MythosWalletId { get; set; }
        public Guid UserId { get; set; }
        public int MythrasBalance { get; set; }
        public bool IsLocked { get; set; }
        public DateTime LastUpdated { get; set; }
    }
}