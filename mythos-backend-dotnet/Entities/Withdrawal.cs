namespace mythos_backend_dotnet.Entities
{
    public class Withdrawal
    {
        public int WithdrawalId { get; set; }
        public Guid WriterUserId { get; set; }
        public int SubtractedMythras { get; set; }
        public decimal AmountRealMoney { get; set; }
        public DateTime RequestedDate { get; set; }
        public string Status { get; set; } = string.Empty;
    }
}