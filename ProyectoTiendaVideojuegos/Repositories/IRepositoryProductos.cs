using ProyectoTiendaVideojuegos.Models;
using System.Collections.Generic;

namespace ProyectoTiendaVideojuegos.Repositories
{
    public interface IRepositoryProductos
    {
        List<Producto> GetProductosPS4();
        List<Categoria>GetCategorias();
        List<SubCategoria> GetSubCategorias();
        List<Producto> GetPorductosGrid(int id);
        List<Producto> GetTodosProductos();
        List<Producto> GetBuscadorProductos(string buscar);
        List<Producto> FiltrarPorPlataforma(List<string> plataformas);
        List<Producto> FiltrarPorGenero(List<string> generos);
        List<Producto> FiltrarPorPrecio(int? precioMinimo, int? precioMaximo);
        Producto DetallesProductos(int idproducto);
        List<Producto> BuscarProductoCarrito(List<int> id);
    }
}
