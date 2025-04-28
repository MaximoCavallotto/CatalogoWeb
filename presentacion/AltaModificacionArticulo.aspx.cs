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
        public bool banEliminar = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.esAdmin(Session["usuario"]))
            {
                Session.Add("error", "Se requiere una cuenta de administrador para acceder a este contenido");
                Response.Redirect("Error.aspx", false);
            }

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

            string id = Request.QueryString["id"] != null ? Request.QueryString["id"] : "";
            if (id != "" && !IsPostBack)
            {
                btneliminar.Visible = true;
                
                ArticuloNegocio negocio = new ArticuloNegocio();
                Articulo seleccionado = negocio.listar(id)[0];
                Session.Add("articuloSeleccionado", seleccionado);

                ddlMarca.SelectedValue = seleccionado.Marca.Id.ToString();
                ddlCategoria.SelectedValue = seleccionado.Categoria.Id.ToString();
                txtboxModelo.Text = seleccionado.Modelo;
                txtboxCodigo.Text = seleccionado.Codigo;
                txtboxDescripcion.Text = seleccionado.Descripcion;
                txtboxPrecio.Text = seleccionado.PrecioFormateado;
                txtboxUrlImagenProducto.Text = seleccionado.UrlImagen;
                imgArticulo.ImageUrl = txtboxUrlImagenProducto.Text;
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Articulo nuevo = new Articulo();
            ArticuloNegocio negocio = new ArticuloNegocio();

            nuevo.Marca = new Marca();
            nuevo.Marca.Id = int.Parse(ddlMarca.SelectedValue);
            nuevo.Modelo = txtboxModelo.Text;
            nuevo.Codigo = txtboxCodigo.Text;
            nuevo.Descripcion = txtboxDescripcion.Text;
            nuevo.Categoria = new Categoria();
            nuevo.Categoria.Id = int.Parse(ddlCategoria.SelectedValue);
            nuevo.Precio = decimal.Parse(txtboxPrecio.Text);
            nuevo.UrlImagen = txtboxUrlImagenProducto.Text;

            if (Request.QueryString["id"] != null)
            {
                nuevo.Id = int.Parse(Request.QueryString["id"]);
                negocio.modificar(nuevo);
                Response.Redirect("Administracion.aspx");
            }
            else
            { 
                negocio.agregarArticulo(nuevo);
                Response.Redirect("Administracion.aspx");
            }




            //ArticuloNegocio negocio = new ArticuloNegocio();
            //negocio.agregarArticulo(articuloNuevo);
            //Response.Redirect("Administracion.aspx", false);

        }

        protected void txtboxUrlImagenProducto_TextChanged(object sender, EventArgs e)
        {
            imgArticulo.ImageUrl = txtboxUrlImagenProducto.Text;
        }

        protected void btnConfirmarEliminacion_Click(object sender, EventArgs e)
        {
            ArticuloNegocio negocio = new ArticuloNegocio();
            negocio.eliminar(int.Parse(Request.QueryString["id"]));
        }

        protected void btneliminar_Click(object sender, EventArgs e)
        {
            banEliminar = true;
        }
    }
}