using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using mythos_backend_dotnet.Enums;

namespace mythos_backend_dotnet.Models
{
    [Route("api/[controller]")]
    [ApiController]
    public class CreateMythosTransactionDto : ControllerBase
    {
        public MythosTransactionType Type { get; set; }
        public int Amount { get; set; }
        public Guid CounterpartyAccountId { get; set; }
    }
}
