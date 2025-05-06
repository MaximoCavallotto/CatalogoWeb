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
    public partial class MiPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Seguridad.sesionActiva(Session["usuario"]))
                    {
                        Usuario user = (Usuario)Session["Usuario"];

                        txtboxEmail.Text = user.Email;
                        txtboxEmail.ReadOnly = true;
                        txtboxNombre.Text = user.Nombre;
                        txtboxApellido.Text = user.Apellido;

                        if (!string.IsNullOrEmpty(user.UrlImagenPerfil))
                            imgPerfil.ImageUrl = "~/Images/" + user.UrlImagenPerfil;
                    }
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                Page.Validate();
                if (!Page.IsValid)
                {
                    return;
                }
                UsuarioNegocio negocio = new UsuarioNegocio();
                Usuario user = (Usuario)Session["usuario"];

                if (txtImagen.PostedFile.FileName != "")
                {
                    string ruta = Server.MapPath("./Images/");
                    txtImagen.PostedFile.SaveAs(ruta + "perfil-" + user.Id + ".jpg");
                    user.UrlImagenPerfil = "perfil-" + user.Id + ".jpg";
                }

                user.UrlImagenPerfil = "perfil-" + user.Id + ".jpg";
                user.Nombre = txtboxNombre.Text;
                user.Apellido = txtboxApellido.Text;
                negocio.actualizarUser(user);

                Image imgAvatar = (Image)Master.FindControl("imgAvatar");
                imgPerfil.ImageUrl = "~/images/" + user.UrlImagenPerfil;
                imgAvatar.ImageUrl = "~/images/" + user.UrlImagenPerfil;
                lblPerfilActualizado.Visible = true;


            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}