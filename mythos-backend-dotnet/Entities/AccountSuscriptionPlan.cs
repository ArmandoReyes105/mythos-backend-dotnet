namespace mythos_backend_dotnet.Entities
{
    public class AccountSuscriptionPlan
    {
        public Guid AccountId { get; set; }
        public Account? Account { get; set; }
        public int SuscriptionPlanId { get; set; }
        public SuscriptionPlan? SuscriptionPlan { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public string Status { get; set; } = string.Empty; 

    }
}
