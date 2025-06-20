using System;
using mythos_backend_dotnet.Entities;

namespace mythos_backend_dotnet.Repositories.Interfaces;

public interface IPersonRepository
{
    void Add(Person person);
}
