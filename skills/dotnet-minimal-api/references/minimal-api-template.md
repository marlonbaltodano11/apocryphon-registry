# Plantilla mínima

```csharp
var builder = WebApplication.CreateBuilder(args);
builder.Services.AddProblemDetails();
builder.Services.AddOpenApi();
builder.Services.AddHealthChecks();

var app = builder.Build();
app.UseExceptionHandler();
app.MapOpenApi();
app.MapHealthChecks("/health");

var invoices = app.MapGroup("/invoices").WithTags("Invoices");

invoices.MapGet("/{id:guid}", async (Guid id, IInvoiceService service, CancellationToken ct) =>
{
    var invoice = await service.GetAsync(id, ct);
    return invoice is null ? Results.NotFound() : Results.Ok(invoice);
});

app.Run();

public partial class Program;
```
