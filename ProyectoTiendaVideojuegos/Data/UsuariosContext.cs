using Microsoft.EntityFrameworkCore;
using ProyectoTiendaVideojuegos.Models;

namespace ProyectoTiendaVideojuegos.Data
{
    public class UsuariosContext : DbContext
    {
        public UsuariosContext(DbContextOptions<UsuariosContext> options)
            : base(options) { }
        public DbSet<Cliente> Clientes { get; set; }
    }
}
