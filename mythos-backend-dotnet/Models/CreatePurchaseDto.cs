namespace mythos_backend_dotnet.Models
{
    public class CreatePurchaseDto
    {
        public string ContentId { get; set; } = string.Empty;
        public int MythrasPrice { get; set; }
        public int MythosTransactionId { get; set; }
    }
}
