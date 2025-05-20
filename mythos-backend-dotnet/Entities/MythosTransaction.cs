using mythos_backend_dotnet.Enums;

namespace mythos_backend_dotnet.Entities
{
    public class MythosTransaction
    {
        public int MythosTransactionId { get; set; }
        public MythosTransactionType Type { get; set; }
        public int Amount { get; set; }
        public int BalanceAfter { get; set; }
        public DateTime CreatedAt { get; set; }
        public Guid AccountId { get; set; }
        public Account? Account { get; set; }
        public Guid CounterpartyAccountId { get; set; }
        public Account? CounterpartyAccount { get; set; }
    }
}
