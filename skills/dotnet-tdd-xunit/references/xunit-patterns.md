# Patrones xUnit

```csharp
public class InvoiceTests
{
    [Fact]
    public void Total_sums_lines()
    {
        var invoice = new Invoice(new[] { new Line(10m), new Line(5m) });
        Assert.Equal(15m, invoice.Total);
    }

    [Theory]
    [InlineData(0)]
    [InlineData(-1)]
    public void Total_rejects_invalid_quantity(int quantity)
    {
        Assert.Throws<ArgumentOutOfRangeException>(() => new Line(quantity));
    }
}
```

Integración de API:

```csharp
public class ApiTests : IClassFixture<WebApplicationFactory<Program>>
{
    private readonly HttpClient _client;
    public ApiTests(WebApplicationFactory<Program> factory) => _client = factory.CreateClient();

    [Fact]
    public async Task Health_returns_ok()
    {
        var response = await _client.GetAsync("/health");
        response.EnsureSuccessStatusCode();
    }
}
```

Reglas:
- Un test, una razón para fallar.
- Fixtures para setup costoso.
- Reloj y aleatoriedad controlados.
