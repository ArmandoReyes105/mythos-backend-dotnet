namespace mythos_backend_dotnet.Entities
{
    public class Transaction
    {
        public int TransactionId { get; set; }
        public Guid AccountId { get; set; }
        public Account? Account { get; set; }
        public int? SuscriptionPlanId { get; set; }
        public SuscriptionPlan? SuscriptionPlan { get; set; }
        public int? MythrasPackageId { get; set; }
        public MythrasPackage? MythrasPackage { get; set; }
        public string Type { get; set; } = string.Empty; 
        public string AmountRealMoney { get; set; } = string.Empty;
        public string PaymentMethod { get; set; } = string.Empty;
        public string Status { get; set; } = string.Empty;
        public DateTime CreatedAt { get; set; }
    }
}
