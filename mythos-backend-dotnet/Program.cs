using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Middleware;
using mythos_backend_dotnet.Repositories.Implementations;
using mythos_backend_dotnet.Repositories.Interfaces;
using mythos_backend_dotnet.Services;
using mythos_backend_dotnet.Services.Implementations;
using mythos_backend_dotnet.Services.Interfaces;
using mythos_backend_dotnet.UnitOfWork;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring OpenAPI at https://aka.ms/aspnet/openapi
builder.Services.AddOpenApi();

builder.Services.AddDbContext<MythosDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("MythosDatabase")));

builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(options =>
    {
        options.TokenValidationParameters = new TokenValidationParameters
        {
            ValidateIssuer = true,
            ValidIssuer = builder.Configuration["AppSettings:Issuer"],
            ValidateAudience = true,
            ValidAudience = builder.Configuration["AppSettings:Audience"],
            ValidateLifetime = true,
            IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration["AppSettings:Token"]!)),
            ValidateIssuerSigningKey = true
        };

        options.Events = new JwtBearerEvents
        {
            OnMessageReceived = context =>
            {
                if (context.Request.Cookies.TryGetValue("accessToken", out var cookieToken) && !string.IsNullOrEmpty(cookieToken))
                {
                    context.Token = cookieToken;
                }
                else
                {
                    var authHeader = context.Request.Headers["Authorization"].FirstOrDefault();
                    if (!string.IsNullOrEmpty(authHeader) && authHeader.StartsWith("Bearer "))
                    {
                        context.Token = authHeader.Substring("Bearer ".Length).Trim();
                    }
                }

                return Task.CompletedTask;
            }
        };
    });

builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowDotnetFrontend", policy =>
    {
        policy.WithOrigins("https://localhost:7133", "http://localhost:3000").AllowAnyHeader().AllowAnyMethod().AllowCredentials();


    });
});

builder.Services.AddScoped<IAuthService, AuthService>();
builder.Services.AddScoped<IAccountService, AccountService>();
builder.Services.AddScoped<IMythosTransactionService, MythosTransactionService>();
builder.Services.AddScoped<IMythrasPurchaseService, MythrasPurchaseService>();
builder.Services.AddScoped<IWithdrawalService, WithdrawalService>();
builder.Services.AddScoped<IMythosWalletService, MythosWalletService>();
builder.Services.AddScoped<IMythrasPackageService, MythrasPackageService>();
builder.Services.AddScoped<ISubscriptionService, SubscriptionService>();
builder.Services.AddScoped<IPurchaseService, PurchaseService>();

builder.Services.AddScoped<IUnitOfWork, UnitOfWork>();
builder.Services.AddScoped<ISubscriptionPlanRepository, SubscriptionPlanRepository>();
builder.Services.AddScoped<ITransactionRepository, TransactionRepository>();
builder.Services.AddScoped<IAccountSubscriptionRepository, AccountSubscriptionRepository>();
builder.Services.AddScoped<IMythosWalletRepository, MythosWalletRepository>();
builder.Services.AddScoped<IAccountRepository, AccountRepository>();
builder.Services.AddScoped<IPersonRepository, PersonRepository>();
builder.Services.AddScoped<IPurchaseRepository, PurchaseRepository>();
builder.Services.AddScoped<IMythosTransactionRepository, MythosTransactionRepository>();

var app = builder.Build();

using (var scope = app.Services.CreateScope())
{
    var dbContext = scope.ServiceProvider.GetRequiredService<MythosDbContext>();

    if (dbContext.Database.IsRelational())
    {
        dbContext.Database.Migrate();
    }
}

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
}

app.UseHttpsRedirection();

app.UseCors("AllowDotnetFrontend");

app.UseMiddleware<ExceptionHandlerMiddleware>();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.Run();
