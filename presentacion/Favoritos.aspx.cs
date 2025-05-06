using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace presentacion
{
    public partial class Favoritos : System.Web.UI.Page
    {
        public List<Articulo> articulosFavoritos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Seguridad.sesionActiva(Session["usuario"]))
            {
                string userId = ((Usuario)Session["usuario"]).Id.ToString();
                ArticuloNegocio negocio = new ArticuloNegocio();
                articulosFavoritos = negocio.listarArtFavoritos(userId);

                repArticulos.DataSource = articulosFavoritos;
                repArticulos.DataBind();
            }
        }

        protected void btnEliminarFav_Click(object sender, EventArgs e)
        {
            FavoritoNegocio favoritoNegocio = new FavoritoNegocio();
            
            int IdFavorito = int.Parse(((Button)sender).CommandArgument);
            favoritoNegocio.eliminarFavorito(IdFavorito);
            Response.Redirect("Favoritos.aspx", false);




        }

        protected void btnDetalle_Click(object sender, EventArgs e)
        {
            string seleccionadoId = ((Button)sender).CommandArgument;
            Response.Redirect("Detalles.aspx?id=" + seleccionadoId);
        }
    }
}