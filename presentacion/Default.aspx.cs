using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace presentacion
{
    public partial class Default : System.Web.UI.Page
    {
        public List<Articulo> ListaArticulos { get; set; }
        public List<Favorito> ListaFavUser { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            ListaFavUser = new List<Favorito>();

            if (!IsPostBack)
            {
                MarcaNegocio marcaNegocio = new MarcaNegocio();
                List<Marca> listaMarca = marcaNegocio.listar();
                ddlMarcas.DataSource = listaMarca;
                ddlMarcas.DataValueField = "Id";
                ddlMarcas.DataTextField = "Descripcion";
                ddlMarcas.DataBind();

                CategoriaNegocio negocioCategoria = new CategoriaNegocio();
                List<Categoria> listaCategoria = negocioCategoria.listar();
                ddlCategoria.DataSource = listaCategoria;
                ddlCategoria.DataValueField = "Id";
                ddlCategoria.DataTextField = "Descripcion";
                ddlCategoria.DataBind();

            }

            ArticuloNegocio negocio = new ArticuloNegocio();
            ListaArticulos = negocio.listar();
            
            FavoritoNegocio favoritoNegocio = new FavoritoNegocio();

            if (Seguridad.sesionActiva(Session["usuario"]))
            {
                ListaFavUser = favoritoNegocio.listarFavUser(((Usuario)Session["usuario"]).Id);
            }

            negocio.esFavorito(ListaFavUser, ListaArticulos);

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

            Response.Redirect("Favoritos.aspx", false);
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            ArticuloNegocio negocio = new ArticuloNegocio();
            List<Articulo> lista = negocio.listar();
            FavoritoNegocio favoritoNegocio = new FavoritoNegocio();
            if (Seguridad.sesionActiva(Session["usuario"]))
            {
                ListaFavUser = favoritoNegocio.listarFavUser(((Usuario)Session["usuario"]).Id);
                negocio.esFavorito(ListaFavUser, lista);
            }
            List<Articulo> listaFiltrada = lista.FindAll(x => x.Marca.Descripcion.ToUpper().Contains(txtboxBuscar.Text.ToUpper()) || x.Modelo.ToUpper().Contains(txtboxBuscar.Text.ToUpper()));


            repArticulos.DataSource = listaFiltrada;
            repArticulos.DataBind();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            ArticuloNegocio negocio = new ArticuloNegocio();
            FavoritoNegocio favoritoNegocio = new FavoritoNegocio();
            List<Articulo> lista = negocio.listar();

            if (Seguridad.sesionActiva(Session["usuario"]))
            {
                ListaFavUser = favoritoNegocio.listarFavUser(((Usuario)Session["usuario"]).Id);
                negocio.esFavorito(ListaFavUser, lista);
            }


            repArticulos.DataSource = lista;
            repArticulos.DataBind();

        }

        protected void ddlMarcas_SelectedIndexChanged(object sender, EventArgs e)
        {
            string marcaSeleccionada = ddlMarcas.SelectedItem.ToString();

            ArticuloNegocio negocio = new ArticuloNegocio();
            List<Articulo> lista = negocio.listar();
            FavoritoNegocio favoritoNegocio = new FavoritoNegocio();
            if (Seguridad.sesionActiva(Session["usuario"]))
            {
                ListaFavUser = favoritoNegocio.listarFavUser(((Usuario)Session["usuario"]).Id);
                negocio.esFavorito(ListaFavUser, lista);
            }

            List<Articulo> listaFiltrada = lista.FindAll(x => x.Marca.Descripcion == marcaSeleccionada);



            repArticulos.DataSource = listaFiltrada;
            repArticulos.DataBind();
        }

        protected void ddlCategoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            string categoriaSeleccionada = ddlCategoria.SelectedItem.ToString();

            ArticuloNegocio negocio = new ArticuloNegocio();
            List<Articulo> lista = negocio.listar();

            FavoritoNegocio favoritoNegocio = new FavoritoNegocio();
            if (Seguridad.sesionActiva(Session["usuario"]))
            {
                ListaFavUser = favoritoNegocio.listarFavUser(((Usuario)Session["usuario"]).Id);
                negocio.esFavorito(ListaFavUser, lista);
            }

            List<Articulo> listaFiltrada = lista.FindAll(x => x.Categoria.Descripcion == categoriaSeleccionada);



            repArticulos.DataSource = listaFiltrada;
            repArticulos.DataBind();
        }

        protected void btnMasBarato_Click(object sender, EventArgs e)
        {

            {
                ArticuloNegocio negocio = new ArticuloNegocio();
                List<Articulo> lista = negocio.listar();

                FavoritoNegocio favoritoNegocio = new FavoritoNegocio();
                if (Seguridad.sesionActiva(Session["usuario"]))
                {
                    ListaFavUser = favoritoNegocio.listarFavUser(((Usuario)Session["usuario"]).Id);
                    negocio.esFavorito(ListaFavUser, lista);
                }

                List<Articulo> masBaratos = lista.OrderBy(x => x.Precio).ToList();


                repArticulos.DataSource = masBaratos;
                repArticulos.DataBind();

            }
        }

        protected void btnMasCaro_Click(object sender, EventArgs e)
        {
            ArticuloNegocio negocio = new ArticuloNegocio();
            List<Articulo> lista = negocio.listar();

            FavoritoNegocio favoritoNegocio = new FavoritoNegocio();
            if (Seguridad.sesionActiva(Session["usuario"]))
            {
                ListaFavUser = favoritoNegocio.listarFavUser(((Usuario)Session["usuario"]).Id);
                negocio.esFavorito(ListaFavUser, lista);
            }

            List<Articulo> masCaros = lista.OrderByDescending(x => x.Precio).ToList();

           

            repArticulos.DataSource = masCaros;
            repArticulos.DataBind();
        }
    }
}