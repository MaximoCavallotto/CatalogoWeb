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

        public void eliminarFavorito(int id)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("delete from FAVORITOS where id = @id");
                datos.setearParametro("@id", id);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }



        }

        public List<Favorito> listarFavUser(int idUser)
        {
            List<Favorito> listaFavUser = new List<Favorito>();

            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select Id, IdArticulo from FAVORITOS where IdUser = @iduser");
                datos.setearParametro("@iduser", idUser);

                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Favorito aux = new Favorito();

                    aux.IdArticulo = (int)datos.Lector["IdArticulo"];
                    aux.Id = (int)datos.Lector["Id"];
                    listaFavUser.Add(aux);
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
            return listaFavUser;
            
        }
        
    }
}
