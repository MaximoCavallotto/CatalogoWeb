using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;
namespace dominio
{
    public class Articulo
    {
        public int Id { get; set; }
        public Marca Marca { get; set; }
        public  string Modelo { get; set; }
        public string Codigo { get; set; }
        public string Descripcion { get; set; }
        public Categoria Categoria { get; set; }
        public string UrlImagen { get; set; }

        //prop auxiliar para poder evaluar en la funcion eliminar favorito.
        public int IdFavorito { get; set; }
        public bool EsFavorito { get; set; }

        public decimal Precio { get; set; }

        [DisplayName ("Precio")]
        public string PrecioFormateado { get; set; }

    }
}
