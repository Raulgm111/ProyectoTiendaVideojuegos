using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace ProyectoTiendaVideojuegos.Models
{
    public class CategoriasViewModel
    {
        public List<Categoria> Categorias { get; set; }

        public List<Producto> Productos { get; set; }

        public List<SubCategoria> Subcategorias { get; set; }
        
        public Producto Producto { get; set; }

        public List<Producto> ProductosPS4 { get; set; }
        public List<Producto> ProductosPS5 { get; set; }
        public List<Producto> Tazas { get; set; }
    }
}
