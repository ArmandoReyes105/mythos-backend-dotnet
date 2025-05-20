using Microsoft.EntityFrameworkCore;

namespace mythos_backend_dotnet.Entities
{
    public class SuscriptionPlan
    {
        public int SuscriptionPlanId { get; set; }
        public string Name { get; set; } = string.Empty;

        [Precision(18,2)]
        public decimal Price { get; set; }
        public int DurationDays { get; set; }
        public int MythrasMonthlyBonus { get; set; }
        public string ExtraBenefits { get; set; } = string.Empty;
        public bool IsActive { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}
