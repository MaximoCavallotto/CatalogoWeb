using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;
namespace negocio
{
    public class FavoritoNegocio
    {
        public void agregarFavorito(Favorito nuevoFav)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("insert into FAVORITOS (IdUser, IdArticulo) values (@idUser, @idArticulo)");
                datos.setearParametro("@idUser", nuevoFav.IdUser);
                datos.setearParametro("@IdArticulo", nuevoFav.IdArticulo);
                datos.ejecutarAccion();

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
