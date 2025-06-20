using System;

namespace mythos_backend_dotnet.Models;

public class PurchaseRequestDto
{
    public string ContentId { get; set; } = string.Empty;
    public int Price { get; set; }
}
