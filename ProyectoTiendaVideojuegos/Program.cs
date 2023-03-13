using Microsoft.EntityFrameworkCore;
using ProyectoTiendaVideojuegos.Data;
using ProyectoTiendaVideojuegos.Repositories;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

string connectionString =
    builder.Configuration.GetConnectionString("SqlTiendaCasa");
builder.Services.AddTransient<IRepositoryProductos, RepositoryProductos>();
builder.Services.AddDbContext<TiendaContext>
    (options => options.UseSqlServer(connectionString));

builder.Services.AddControllersWithViews();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.UseEndpoints(endpoints =>
{
    endpoints.MapControllerRoute(
        name: "CategoriasNavegacion",
        pattern: "Productos/GridProductos/{id?}",
        defaults: new { controller = "Productos", action = "CategoriasNavegacion" });

        endpoints.MapControllerRoute(
        name: "Index",
        pattern: "Index",
        defaults: new { controller = "Productos", action = "Index" });

        endpoints.MapControllerRoute(
        name: "SubCategoriasNavegacion",
        pattern: "eee",
        defaults: new { controller = "Productos", action = "SubCategoriasNavegacion" });

    endpoints.MapControllerRoute(
        name: "default",
        pattern: "{controller=Productos}/{action=MisVistas}/{id?}");
});


app.Run();
