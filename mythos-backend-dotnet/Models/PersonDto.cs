using System;

namespace mythos_backend_dotnet.Models;

public class PersonDto
{
    public string Name { get; set; } = string.Empty;
    public string LastName { get; set; } = string.Empty;
    public DateTime BirthDate { get; set; }
    public string Country { get; set; } = string.Empty;
    public string Biography { get; set; } = string.Empty;
}
