using System.ComponentModel.DataAnnotations;

namespace mythos_backend_dotnet.Entities
{
    public class Person
    {
        public Guid PersonId { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Surnames { get; set; } = string.Empty;
        public DateTime BirthDate { get; set; }
        public string Biography { get; set; } = string.Empty;
        public string Country { get; set; } = string.Empty;
        public Guid AccountId { get; set; }
        public Account? Account { get; set; }

    }
}
