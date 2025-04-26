using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class UsuarioNegocio
    {
        public int insertarNuevo(Usuario nuevo)
        { 
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("insert into USERS (email, pass, admin) output inserted.Id values (@email, @pass, 0)");
                datos.setearParametro("@email", nuevo.Email);
                datos.setearParametro("@pass", nuevo.Pass);
                return datos.ejecutarAccionScalar();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            { datos.cerrarConexion(); }
        
        
        }
        public bool loguear( Usuario usuario)
        { 
            AccesoDatos datos = new AccesoDatos();
            
            try
            {
                datos.setearConsulta("Select id, admin from Users where email = @email and pass = @pass");
                datos.setearParametro("@email", usuario.Email);
                datos.setearParametro("@pass", usuario.Pass);

                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    usuario.Id = (int)datos.Lector["id"];
                    usuario.TipoUsuario = (bool)datos.Lector["admin"] == true ? Usuario.tipoUsuario.admin : Usuario.tipoUsuario.normal;
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            { datos.cerrarConexion(); }
        }
    }
}
