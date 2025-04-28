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
    public partial class Detalles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse((Request.QueryString["id"].ToString()));

                ArticuloNegocio negocio = new ArticuloNegocio();
                Articulo seleccionado = negocio.listar().Find(x => x.Id == id);

                lblTitulo.Text = seleccionado.Marca.Descripcion + " " + seleccionado.Modelo;
                imgImagen.ImageUrl = seleccionado.UrlImagen;
                lblDescripcion.Text = seleccionado.Descripcion;
                lblPrecio.Text = "$" + seleccionado.PrecioFormateado;
            }
        }
    }
}