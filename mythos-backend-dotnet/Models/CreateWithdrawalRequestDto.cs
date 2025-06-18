public class CreateWithdrawalRequestDto
{
    public int Amount { get; set; }
    public string CardNumber { get; set; } = string.Empty;
    public string CardHolder { get; set; } = string.Empty;
    public string Bank { get; set; } = string.Empty;
    public string Concept { get; set; } = string.Empty;
}