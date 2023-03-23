using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.EntityFrameworkCore;
using ProyectoTiendaVideojuegos.Data;
using ProyectoTiendaVideojuegos.Repositories;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddSession(options => {

    options.IdleTimeout = TimeSpan.FromMinutes(30);

});

builder.Services.AddAuthentication(options =>
{
    options.DefaultSignInScheme =
    CookieAuthenticationDefaults.AuthenticationScheme;
    options.DefaultAuthenticateScheme =
    CookieAuthenticationDefaults.AuthenticationScheme;
    options.DefaultChallengeScheme =
    CookieAuthenticationDefaults.AuthenticationScheme;
}).AddCookie();

string connectionString =
    builder.Configuration.GetConnectionString("SqlTienda");
builder.Services.AddTransient<IRepositoryProductos, RepositoryProductos>();
builder.Services.AddDbContext<TiendaContext>
    (options => options.UseSqlServer(connectionString));
builder.Services.AddTransient<RepositoryUsuarios>();
builder.Services.AddDbContext<UsuariosContext>
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

app.UseAuthentication();
app.UseAuthorization();

app.UseSession();

app.UseEndpoints(endpoints =>
{
    endpoints.MapControllerRoute(
        name: "default",
        pattern: "{controller=Productos}/{action=MisVistas}/{id?}");
});


app.Run();
