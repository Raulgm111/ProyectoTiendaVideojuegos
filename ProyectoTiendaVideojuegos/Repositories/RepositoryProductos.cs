using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using ProyectoTiendaVideojuegos.Data;
using ProyectoTiendaVideojuegos.Models;

namespace ProyectoTiendaVideojuegos.Repositories
{
    #region PROCEDIMIENTOS
    //CREATE PROCEDURE SP_PRODUCTOS_PS4
    //AS
    //      select top 4 * from Productos where Productos.IdCategoria=2
    //	    ORDER BY NEWID()
    //GO
    #endregion
    public class RepositoryProductos : IRepositoryProductos
    {
        private TiendaContext context;

        public RepositoryProductos(TiendaContext context)
        {
            this.context = context;
        }
        public List<Producto> GetProductosPS4()
        {
            var consulta = from datos in this.context.Productos
                           where datos.IdCategoria == 2
                           orderby Guid.NewGuid()
                           select datos;
            var productos = consulta.Take(4).ToList();
            return productos;

        }
        public List<Categoria> GetCategorias()
        {
            var consulta = from datos in this.context.Categorias
                           select datos;
            return consulta.ToList();
        }

        public List<SubCategoria> GetSubCategorias()
        {
            var consulta = from datos in this.context.SubCategorias
                           select datos;
            return consulta.ToList();

        }

        public List<Producto> GetPorductosGrid(int id)
        {
            var consulta = from datos in context.Productos
                           where datos.IdSubCategoria == id
                           select datos;

            return consulta.ToList();
        }

        public List<Producto> GetTodosProductos()
        {
            var consulta = from datos in context.Productos
                           select datos;
            return consulta.ToList();
        }

        public List<Producto> GetBuscadorProductos(string buscar)
        {
            var consulta = from datos in this.context.Productos
                           select datos;

            if (!string.IsNullOrEmpty(buscar))
            {
                consulta = consulta.Where(x => x.NombreProducto.Contains(buscar));
            }

            return consulta.ToList();
        }

        public List<Producto> FiltrarPorPlataforma(List<string> plataformas)
        {
            var consulta = from productos in context.Productos
                           join categorias in context.Categorias
                           on productos.IdCategoria equals categorias.IdCategoria
                           where plataformas.Contains(categorias.NombreCategoria)
                           select productos;

            return consulta.ToList();
        }
    }
}
