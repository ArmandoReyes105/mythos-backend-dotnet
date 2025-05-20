using Microsoft.EntityFrameworkCore;

namespace mythos_backend_dotnet.Entities
{
    public class MythrasPackage
    {
        public int MythrasPackageId { get; set; }
        public string Name { get; set; } = string.Empty;
        public int MythrasAmount { get; set; }

        [Precision(18,2)]
        public decimal Price { get; set; }
        public bool IsActive { get; set; }
        public int BonusMythras { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}
