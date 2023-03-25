using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProyectoTiendaVideojuegos.Models
{
    [Table("PEDIDOS")]
    public class Pedido
    {
        [Key]
        [Column("IDPEDIDO")]
        public int IdPedido { get; set; }

        [Column("IDPRODUCTO")]
        public int IdProducto { get; set; }


        [Column("IDCLIENTE")]
        public int IdCliente { get; set; }


        [Column("PRECIOTOTAL")]
        public int PrecioTotal { get; set; }


        [Column("CANTIDAD")]
        public int Cantidad { get; set; }


    }
}
