namespace mythos_backend_dotnet.Entities
{
    public class Purchase
    {
        public int PurchaseId { get; set; }
        public string ContentId { get; set; } = string.Empty;
        public int MythrasPrice { get; set; }
        public DateTime PurchaseDate { get; set; }
        public Guid AccountId { get; set; }
        public Account? Account { get; set; }
        public int MythosTransactionId { get; set; }
        public MythosTransaction? MythosTransaction { get; set; }
    }
}
