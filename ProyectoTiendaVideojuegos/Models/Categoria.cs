using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace ProyectoTiendaVideojuegos.Models
{
    [Table("CATEGORIAS")]
    public class Categoria
    {
        [Key]
        [Column("IDCATEGORIA")]
        public int IdCategoria { get; set; }

        [Column("NOMBRECATEGORIA")]
        public string NombreCategoria { get; set; }
    }
}
