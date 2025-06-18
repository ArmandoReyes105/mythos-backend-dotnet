namespace mythos_backend_dotnet.Models
{
    public class PurchaseMythrasRequestDto
    {
        public int MythrasPackageId { get; set; }
        public string CardNumber { get; set; } = string.Empty;
        public string CardHolder { get; set; } = string.Empty;
        public string ExpiryDate { get; set; } = string.Empty;
        public string Cvc { get; set; } = string.Empty;
        public string CardType { get; set; } = string.Empty;
        public BillingAddressDto BillingAddress { get; set; } = new();
    }

    public class BillingAddressDto
    {
        public string Street { get; set; } = string.Empty;
        public string PostalCode { get; set; } = string.Empty;
        public string City { get; set; } = string.Empty;
        public string Country { get; set; } = string.Empty;
    }
}