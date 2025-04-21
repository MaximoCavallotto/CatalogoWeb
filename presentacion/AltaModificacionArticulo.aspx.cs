using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;

namespace presentacion
{
    public partial class AltaModificacionArticulo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CategoriaNegocio negocioCategoria = new CategoriaNegocio();
                List<Categoria> listaCategoria = negocioCategoria.listar();
                
                ddlCategoria.DataSource = listaCategoria;
                ddlCategoria.DataValueField = "Id";
                ddlCategoria.DataTextField = "Descripcion";
                ddlCategoria.DataBind();

                MarcaNegocio marcaNegocio = new MarcaNegocio();
                List<Marca> listaMarca = marcaNegocio.listar();
                ddlMarca.DataSource = listaMarca;
                ddlMarca.DataValueField = "Id";
                ddlMarca.DataTextField = "Descripcion";
                ddlMarca.DataBind();

            }

            //if (Request.QueryString["Id"] != null)
            //{
            //    int id = int.Parse(Request.QueryString["Id"].ToString());

            //    List<Articulo> temporal = (List<Articulo>)Session["lista"];
            //    Articulo seleccionado = temporal.Find(x=> x.Id == id);
            //}
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Articulo articuloNuevo = new Articulo();

            articuloNuevo.Marca = new Marca();
            articuloNuevo.Marca.Id = int.Parse(ddlMarca.SelectedValue);
            articuloNuevo.Modelo = txtboxModelo.Text;
            articuloNuevo.Codigo = txtboxCodigo.Text;
            articuloNuevo.Descripcion = txtboxDescripcion.Text;
            articuloNuevo.Categoria = new Categoria();
            articuloNuevo.Categoria.Id = int.Parse(ddlCategoria.SelectedValue);
            articuloNuevo.Precio = decimal.Parse(txtboxPrecio.Text);
            articuloNuevo.UrlImagen = "Test";

            ArticuloNegocio negocio = new ArticuloNegocio();
            negocio.agregarArticulo(articuloNuevo);
            Response.Redirect("Administracion.aspx",false);

        }
    }
}