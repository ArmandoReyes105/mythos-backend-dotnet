using System;
using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Entities;
using mythos_backend_dotnet.Repositories.Interfaces;

namespace mythos_backend_dotnet.Repositories.Implementations;

public class PersonRepository(MythosDbContext _context) : IPersonRepository
{
    public void Add(Person person)
    {
        _context.People.Add(person);
    }
}
