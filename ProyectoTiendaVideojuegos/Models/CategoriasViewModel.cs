using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace ProyectoTiendaVideojuegos.Models
{
    public class CategoriasViewModel
    {
        public List<Categoria> Categorias { get; set; }

        public List<Producto> Productos { get; set; }

        public List<SubCategoria> Subcategorias { get; set; }
        public int preciomenor { get; set; }
        public int preciomayor { get; set; }
    }
}
