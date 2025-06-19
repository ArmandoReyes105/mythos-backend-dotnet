using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Entities;
using mythos_backend_dotnet.Repositories.Interfaces;

namespace mythos_backend_dotnet.Repositories.Implementations
{
    public class TransactionRepository(MythosDbContext _context) : ITransactionRepository
    {
        public void Add(Transaction transaction)
        {
            _context.Transactions.Add(transaction); 
        }
    }
}
