using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace ProyectoTiendaVideojuegos.Models
{
    [Table("DETALLESPEDIDO")]
    public class DetallesPedido
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]

        [Column("IDDETALLEPEDIDO")]
        public int IdDetallesPedido { get; set; }

        [Column("IDPEDIDO")]
        public int IdPedido { get; set; }

        [Column("IDPRODUCTO")]
        public int IdProducto { get; set; }

        [Column("CANTIDAD")]
        public int Cantidad { get; set; }

        [Column("PRECIOTOTAL")]
        public int PrecioTotal { get; set; }

        [NotMapped]
        public string NombreProducto { get; set; }


    }

}
