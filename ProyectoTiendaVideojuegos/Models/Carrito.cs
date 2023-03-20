namespace ProyectoTiendaVideojuegos.Models
{
    public class Carrito
    {
        public List<Producto> Productos { get; set; }

        public Carrito()
        {
            Productos = new List<Producto>();
        }

        public void AgregarProducto(Producto producto)
        {
            Productos.Add(producto);
        }

        public void EliminarProducto(int idProducto)
        {
            var producto = Productos.FirstOrDefault(p => p.IdProducto == idProducto);
            if (producto != null)
            {
                Productos.Remove(producto);
            }
        }

        public void VaciarCarrito()
        {
            Productos.Clear();
        }

        public int TotalProductos()
        {
            return Productos.Count;
        }

        public int TotalPrecio()
        {
            return Productos.Sum(p => p.Precio);
        }
    }

}
