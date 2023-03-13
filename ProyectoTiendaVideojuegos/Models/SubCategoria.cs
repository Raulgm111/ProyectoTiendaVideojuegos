using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProyectoTiendaVideojuegos.Models
{
    [Table("SUBCATEGORIAS")]
    public class SubCategoria
    {
        [Key]
        [Column("IDSUBCATEGORIA")]
        public int IdSubCategoria { get; set; }

        [Column("NOMBRESUBCATEGORIA")]
        public string NombreSubCategoria { get; set; }

        [Column("IDCATEGORIA")]
        public int IdCategoria { get; set; }
    }
}
