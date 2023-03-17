using Microsoft.AspNetCore.Mvc;
using ProyectoTiendaVideojuegos.Models;
using ProyectoTiendaVideojuegos.Repositories;

namespace ProyectoTiendaVideojuegos.Controllers
{
    public class UsuariosController : Controller
    {
        private RepositoryUsuarios repo;

        public UsuariosController(RepositoryUsuarios repo)
        {
            this.repo = repo;
        }

        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Register(string nombre, string apellidos, string email, string password, string imagen)
        {
            await this.repo.RegisterUsuario(nombre, apellidos,email, password, imagen);
            ViewData["MENSAJE"] = "Usuario registrado correctamente";
            return View();
        }

        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Login(string email, string password)
        {
            Cliente user = this.repo.LoginUser(email, password);
            if (user == null)
            {
                ViewData["MENSAJE"] = "Creacion incorrecta";
                return View();
            }
            else
            {
                HttpContext.Session.SetString("USUARIO", email);
                HttpContext.Session.SetString("PASS", password);
                return View(user);
            }
        }

        public IActionResult CerrarSesion()
        {
            HttpContext.Session.Remove("USUARIO");
            HttpContext.Session.Remove("PASS");
            return RedirectToAction("Index", "Home");
        }
    }
}
