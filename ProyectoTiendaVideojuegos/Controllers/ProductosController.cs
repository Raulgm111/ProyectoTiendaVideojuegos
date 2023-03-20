using Microsoft.AspNetCore.Mvc;
using ProyectoTiendaVideojuegos.Extensions;
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

        public IActionResult BuscarProductos(string buscar)
        {
            var productos = this.repo.GetBuscadorProductos(buscar);
            return PartialView("_ResultadosBusqueda", productos);
        }


        #region VISTAS COMPLETAS
        public IActionResult VistasGridTodosProductos(List<string> plataforma,
        List<string> generos, int? precioMinimo, int? precioMaximo, int? idproductoCarrito)
        {
            CategoriasViewModel enlace = new CategoriasViewModel();
            enlace.Categorias = this.repo.GetCategorias();
            enlace.Subcategorias = this.repo.GetSubCategorias();

            if (plataforma != null && plataforma.Any())
            {
                enlace.Productos = this.repo.FiltrarPorPlataforma(plataforma);
            }
            else if (generos != null && generos.Any())
            {
                enlace.Productos = this.repo.FiltrarPorGenero(generos);
            }
            else
            {
                enlace.Productos = this.repo.GetTodosProductos();
            }

            if (precioMinimo.HasValue && precioMaximo.HasValue)
            {
                enlace.Productos = enlace.Productos.Where(p => p.Precio >= precioMinimo.Value && p.Precio <= precioMaximo.Value).ToList();
            }
            return View(enlace);
        }




        public IActionResult VistasGrid(int id, List<string> plataforma,
        List<string> generos, int? precioMinimo, int? precioMaximo)
        {
            CategoriasViewModel enlace = new CategoriasViewModel();
            enlace.Categorias = this.repo.GetCategorias();
            enlace.Subcategorias = this.repo.GetSubCategorias();
            enlace.Productos = this.repo.GetPorductosGrid(id);
            if (plataforma != null && plataforma.Any())
            {
                enlace.Productos = this.repo.FiltrarPorPlataforma(plataforma);
            }
            else if (generos != null && generos.Any())
            {
                enlace.Productos = this.repo.FiltrarPorGenero(generos);
            }

            if (precioMinimo.HasValue && precioMaximo.HasValue)
            {
                enlace.Productos = enlace.Productos.Where(p => p.Precio >= precioMinimo.Value && p.Precio <= precioMaximo.Value).ToList();
            }
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

        public IActionResult VistasDetalles(int idproducto,int? idproductoCarrito)
        {
            CategoriasViewModel enlace = new CategoriasViewModel();
            enlace.Categorias = this.repo.GetCategorias();
            enlace.Subcategorias = this.repo.GetSubCategorias();
            if (idproducto != null)
            {
                List<int> carrito;
                if (HttpContext.Session.GetObject<List<int>>("CARRITO") == null)
                {
                    carrito = new List<int>();
                }
                else
                {
                    carrito = HttpContext.Session.GetObject<List<int>>("CARRITO");
                }
                if (carrito.Contains(idproducto) == false)
                {
                    carrito.Add(idproducto);
                    HttpContext.Session.SetObject("CARRITO", carrito);
                }
            }
            enlace.Producto=this.repo.DetallesProductos(idproducto);    
            return View(enlace);
        }
        #endregion


    }
}
