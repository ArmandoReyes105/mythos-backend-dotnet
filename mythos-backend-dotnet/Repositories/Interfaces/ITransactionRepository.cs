using mythos_backend_dotnet.Entities;

namespace mythos_backend_dotnet.Repositories.Interfaces
{
    public interface ITransactionRepository
    {
        void Add(Transaction transaction); 
    }
}
