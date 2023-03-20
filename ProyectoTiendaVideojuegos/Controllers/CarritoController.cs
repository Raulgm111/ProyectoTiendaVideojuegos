using Microsoft.AspNetCore.Mvc;
using ProyectoTiendaVideojuegos.Data;
using ProyectoTiendaVideojuegos.Extensions;
using ProyectoTiendaVideojuegos.Models;

namespace ProyectoTiendaVideojuegos.Controllers
{
    public class CarritoController : Controller
    {
        private TiendaContext context;

        public CarritoController(TiendaContext context)
        {
            this.context = context;
        }

        public IActionResult Index()
        {
            var carrito = HttpContext.Session.GetObject<Carrito>("Carrito") ?? new Carrito();
            return View(carrito);
        }

        [HttpPost]
        public IActionResult AgregarProducto(int idProducto)
        {
            var producto = context.Productos.FirstOrDefault(p => p.IdProducto == idProducto);
            if (producto != null)
            {
                var carrito = HttpContext.Session.GetObject<Carrito>("Carrito") ?? new Carrito();
                carrito.AgregarProducto(producto);
                HttpContext.Session.SetObject("Carrito", carrito);
            }

            return RedirectToAction(nameof(Index));
        }

        [HttpPost]
        public IActionResult EliminarProducto(int idProducto)
        {
            var carrito = HttpContext.Session.GetObject<Carrito>("Carrito") ?? new Carrito();
            carrito.EliminarProducto(idProducto);
            HttpContext.Session.SetObject("Carrito", carrito);
            return RedirectToAction(nameof(Index));
        }

        [HttpPost]
        public IActionResult VaciarCarrito()
        {
            HttpContext.Session.Remove("Carrito");
            return RedirectToAction(nameof(Index));
        }
    }
}
