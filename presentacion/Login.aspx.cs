using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;

namespace presentacion
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            UsuarioNegocio negocio = new UsuarioNegocio();

            try
            {
                usuario.Email = txtboxEmail.Text;
                usuario.Pass = txtboxPass.Text;

                if (negocio.loguear(usuario))
                {
                    Session.Add("usuario", usuario);
                    Response.Redirect("Default.aspx", false);
                }
                else
                {
                    if (string.IsNullOrEmpty(txtboxEmail.Text) || string.IsNullOrEmpty(txtboxPass.Text))
                    {
                        Session.Add("error", "Debes completar ambos campos.");
                        Response.Redirect("Error.aspx", false);
                    }
                    else
                    {
                        Session.Add("error", "Usuario o Contraseña incorrecta. Por favor reintente.");
                        Response.Redirect("Error.aspx", false);
                    }
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                Response.Redirect("Error.aspx", false);
            }


        }
    }
}