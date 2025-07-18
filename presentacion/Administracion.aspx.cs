﻿using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace presentacion
{
    public partial class Administracion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Seguridad.esAdmin(Session["usuario"]))
                {
                    Session.Add("error", "Se requiere una cuenta de administrador para acceder a este contenido.");
                    Response.Redirect("Error.aspx", false);
                }

                ArticuloNegocio negocio = new ArticuloNegocio();
                Session.Add("listaArticulos", negocio.listar());
                dgvArticulos.DataSource = Session["listaArticulos"];
                dgvArticulos.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void dgvArticulos_SelectedIndexChanged(object sender, EventArgs e)
        {
            var id = dgvArticulos.SelectedDataKey.Value.ToString();
            Response.Redirect("AltaModificacionArticulo.aspx?id=" + id, false);
        }

        protected void txtboxFiltroRapido_TextChanged(object sender, EventArgs e)
        {
            try
            {
                List<Articulo> lista = (List<Articulo>)Session["listaArticulos"];
                List<Articulo> listaFiltrada = lista.FindAll(x => x.Marca.Descripcion.ToUpper().Contains(txtboxFiltroRapido.Text.ToUpper()) || x.Modelo.ToUpper().Contains(txtboxFiltroRapido.Text.ToUpper()));
                if (listaFiltrada.Count == 0)
                {
                    lblNingunArticulo.Visible = true;
                }
                dgvArticulos.DataSource = listaFiltrada;
                dgvArticulos.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnLimpiarFiltro_Click(object sender, EventArgs e)
        {
            try
            {
                dgvArticulos.DataSource = Session["listaArticulos"];
                dgvArticulos.DataBind();
                lblNingunArticulo.Visible = false;
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                Response.Redirect("Error.aspx", false);
            }

        }

        protected void chboxFiltroAvanzado_CheckedChanged(object sender, EventArgs e)
        {
            txtboxFiltroRapido.Enabled = !chboxFiltroAvanzado.Checked;
        }

        protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCriterio.Items.Clear();

            if (ddlCampo.SelectedItem.ToString() == "Precio")
            {
                ddlCriterio.Items.Add("Mayor a");
                ddlCriterio.Items.Add("Menor a");
                ddlCriterio.Items.Add("Igual a");
            }
            else
            {
                ddlCriterio.Items.Add("Comienza con");
                ddlCriterio.Items.Add("Termina con");
                ddlCriterio.Items.Add("Contiene");
            }

        }
        protected void btnBuscarFiltroAvanzado_Click(object sender, EventArgs e)
        {
            try
            {
                ArticuloNegocio negocio = new ArticuloNegocio();

                if (ddlCampo.SelectedItem.ToString() == "Precio")
                {
                    if (string.IsNullOrEmpty(txtboxFiltro.Text) || !negocio.soloNumeros(txtboxFiltro.Text))
                    {
                        lblSoloNumeros.Visible = true;
                        return;
                    }

                }

                List<Articulo> listaFiltrada = negocio.filtrar(ddlCampo.SelectedItem.ToString(), ddlCriterio.SelectedItem.ToString(), txtboxFiltro.Text);
                lblSoloNumeros.Visible = false;
                if (listaFiltrada.Count == 0)
                {
                    lblNingunArticulo.Visible = true;
                }

                dgvArticulos.DataSource = listaFiltrada;
                dgvArticulos.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnBorrarFiltro_Click(object sender, EventArgs e)
        {
            try
            {
                lblNingunArticulo.Visible = false;
                lblSoloNumeros.Visible = false;
                dgvArticulos.DataSource = Session["listaArticulos"];
                dgvArticulos.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                Response.Redirect("Error.aspx", false);
            }

        }
    }
}