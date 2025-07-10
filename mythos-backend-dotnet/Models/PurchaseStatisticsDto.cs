using System;

namespace mythos_backend_dotnet.Models;

public class PurchaseStatisticsDto
{
    public string ContentId { get; set; } = string.Empty;
    public int TotalPurchases { get; set; }
    public int TotalMythras { get; set; }
    public int PricePerPurchase { get; set; }
}