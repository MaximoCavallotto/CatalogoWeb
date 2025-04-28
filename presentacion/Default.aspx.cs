using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace presentacion
{
    public partial class Default : System.Web.UI.Page
    {
        public List<Articulo> ListaArticulos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
                       
            ArticuloNegocio negocio = new ArticuloNegocio();
            ListaArticulos = negocio.listar();

            repArticulos.DataSource = ListaArticulos;
            repArticulos.DataBind();
        }

        protected void btnDetalle_Click(object sender, EventArgs e)
        {
            string seleccionadoId = ((Button)sender).CommandArgument;
            Response.Redirect("Detalles.aspx?id=" + seleccionadoId);
        }

        protected void btnFavorito_Click(object sender, EventArgs e)
        {
            Favorito nuevo = new Favorito();
            FavoritoNegocio favoritoNegocio = new FavoritoNegocio();

            string seleccionadoId = ((Button)sender).CommandArgument;

            nuevo.IdArticulo = int.Parse(seleccionadoId);
            nuevo.IdUser = ((Usuario)Session["usuario"]).Id;
            favoritoNegocio.agregarFavorito(nuevo);
            

        }
    }
}