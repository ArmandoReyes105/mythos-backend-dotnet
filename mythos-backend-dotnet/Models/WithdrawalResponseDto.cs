public class WithdrawalResponseDto
{
    public string Message { get; set; } = string.Empty;
    public int WithdrawnMythras { get; set; }
    public decimal AmountInPesos { get; set; }
    public string Status { get; set; } = string.Empty;
    public DateTime RequestedDate { get; set; }
}