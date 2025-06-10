using System.ComponentModel.DataAnnotations;

namespace mythos_backend_dotnet.Models
{
    public class ChangePasswordRequest
    {
        [Required]
        [StringLength(100, MinimumLength = 8)]
        public string NewPassword { get; set; } = string.Empty; 
    }
}
