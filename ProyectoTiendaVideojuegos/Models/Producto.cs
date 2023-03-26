using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProyectoTiendaVideojuegos.Models
{
    [Table("PRODUCTOS")]
    public class Producto
    {
        [Key]
        [Column("IDPRODUCTO")]
        public int IdProducto { get; set; }

        [Column("IDCATEGORIA")]
        public int IdCategoria { get; set; }


        [Column("IDSUBCATEGORIA")]
        public int IdSubCategoria { get; set; }


        [Column("NOMBREPRODUCTO")]
        public string NombreProducto { get; set; }


        [Column("LANZAMIENTO")]
        public DateTime? Lanzamiento { get; set; }


        [Column("IMAGEN")]
        public string Imagen { get; set; }

        [Column("PRECIO")]
        public int Precio { get; set; }


        [Column("DESCRIPCION")]
        public string Descripcion { get; set; }

        [Column("GENERO")]
        public string Genero { get; set; }

    }
}
