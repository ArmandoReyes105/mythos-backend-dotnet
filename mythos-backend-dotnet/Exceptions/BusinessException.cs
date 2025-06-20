using System;

namespace mythos_backend_dotnet.Exceptions;

public class BusinessException : Exception
{
    public BusinessException(string message) : base(message) { }
}
