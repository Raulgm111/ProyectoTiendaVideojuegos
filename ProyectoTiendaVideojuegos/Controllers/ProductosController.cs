using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProyectoTiendaVideojuegos.Models;
using ProyectoTiendaVideojuegos.Repositories;
namespace ProyectoTiendaVideojuegos.Controllers
{
    public class ProductosController : Controller
    {
        private IRepositoryProductos repo;

        public ProductosController(IRepositoryProductos repo)
        {
            this.repo = repo;
        }

        public IActionResult Index()
        {
            List<Producto> productos = this.repo.GetProductosPS4();
            return View(productos);
        }

        public IActionResult CategoriasNavegacion()
        {
            List<Categoria> categorias = this.repo.GetCategorias();
            return View(categorias);
        }

        public IActionResult SubCategoriasNavegacion()
        {
            List<SubCategoria> subcategorias =this.repo.GetSubCategorias();
            return View(subcategorias);

        }

        public IActionResult VistasGridTodosProductos(string buscar, List<string> plataforma,
            List<string> generos, List<int> preciomenor, List<int> preciomayor)
        {
            CategoriasViewModel enlace = new CategoriasViewModel();
            enlace.Categorias = this.repo.GetCategorias();
            enlace.Subcategorias = this.repo.GetSubCategorias();
            enlace.Productos = this.repo.FiltrarPorPrecio(preciomenor, preciomayor);
            if (!string.IsNullOrEmpty(buscar))
            {
                enlace.Productos = this.repo.GetBuscadorProductos(buscar);
            }
            else if (plataforma != null && plataforma.Any())
            {
                enlace.Productos = this.repo.FiltrarPorPlataforma(plataforma);
            }else if (generos!=null && generos.Any())
            {
                enlace.Productos = this.repo.FiltrarPorGenero(generos);
            }
            else
            {
                enlace.Productos = this.repo.GetTodosProductos();
            }

            return View(enlace);
        }


        public IActionResult VistasGrid(int id)
        {
            CategoriasViewModel enlace = new CategoriasViewModel();
            enlace.Categorias = this.repo.GetCategorias();
            enlace.Subcategorias = this.repo.GetSubCategorias();
            enlace.Productos = this.repo.GetPorductosGrid(id);
            return View(enlace);
        }

        public IActionResult MisVistas(string nombre)
        {
            CategoriasViewModel enlace = new CategoriasViewModel();
            enlace.Categorias = this.repo.GetCategorias();
            enlace.Productos = this.repo.GetProductosPS4();
            enlace.Subcategorias = this.repo.GetSubCategorias();
            return View(enlace);

        }
        public IActionResult BuscarProductos(string buscar)
        {
            var productos = this.repo.GetBuscadorProductos(buscar);
            return PartialView("_ResultadosBusqueda", productos);
        }


    }
}
