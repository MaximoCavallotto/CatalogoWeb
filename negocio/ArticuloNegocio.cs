using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class ArticuloNegocio
    {

        public List<Articulo> listar(string id = "")
        {
            List<Articulo> lista = new List<Articulo>();
            AccesoDatos datos = new AccesoDatos();


            try
            {

                string consulta = "select A.Id, A.Codigo, M.Descripcion as Marca, Nombre as Modelo, C.Descripcion as Categoria, A.Descripcion, ImagenUrl, Precio, A.IdMarca, A.IdCategoria from ARTICULOS A, CATEGORIAS C, MARCAS M where C.Id = A.IdCategoria and M.Id = A.IdMarca ";
                if (id != "")
                {
                    consulta += " and A.Id = " + id;
                }
                datos.setearConsulta(consulta);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Articulo aux = new Articulo();
                    aux.Marca = new Marca();
                    aux.Categoria = new Categoria();

                    aux.Id = (int)datos.Lector["Id"];
                    aux.Codigo = (string)datos.Lector["Codigo"];
                    aux.Marca.Descripcion = (string)datos.Lector["Marca"];
                    aux.Modelo = (string)datos.Lector["Modelo"];
                    aux.Categoria.Descripcion = (string)datos.Lector["Categoria"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];
                    aux.UrlImagen = (string)datos.Lector["ImagenUrl"];
                    aux.PrecioFormateado = convmoneda((decimal)datos.Lector["Precio"]);
                    aux.Precio = (decimal)datos.Lector["Precio"];
                    aux.Marca.Id = (int)datos.Lector["IdMarca"];
                    aux.Categoria.Id = (int)datos.Lector["IdCategoria"];

                    lista.Add(aux);
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally { datos.cerrarConexion(); }
            return lista;
        }

        public void agregarArticulo(Articulo nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("insert into ARTICULOS (Codigo, Nombre, Descripcion, IdMarca, IdCategoria, ImagenUrl, Precio) values (@Codigo, @Nombre, @Descripcion, @IdMarca, @IdCategoria, @ImagenUrl, @Precio)");
                datos.setearParametro("@Codigo", nuevo.Codigo.ToString());
                datos.setearParametro("@Nombre", nuevo.Modelo.ToString());
                datos.setearParametro("@Descripcion", nuevo.Descripcion.ToString());
                datos.setearParametro("@IdMarca", nuevo.Marca.Id);
                datos.setearParametro("@IdCategoria", nuevo.Categoria.Id);
                datos.setearParametro("@ImagenUrl", nuevo.UrlImagen.ToString());
                datos.setearParametro("@Precio", nuevo.Precio.ToString());
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


        public string convmoneda(decimal aux)
        {
            return String.Format(CultureInfo.CreateSpecificCulture("es-AR"), "{0:00.00}", aux);
        }

        public void modificar(Articulo articulo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("update ARTICULOS set  Codigo = @codigo, Nombre = @nombre, Descripcion = @desc, IdMarca = @idmarca, IdCategoria = @idcategoria, ImagenUrl = @imagenurl, Precio = @precio where Id=@id");


                datos.setearParametro("@codigo", articulo.Codigo);
                datos.setearParametro("@nombre", articulo.Modelo);
                datos.setearParametro("@desc", articulo.Descripcion);
                datos.setearParametro("@idmarca", articulo.Marca.Id);
                datos.setearParametro("@idcategoria", articulo.Categoria.Id);
                datos.setearParametro("@imagenurl", articulo.UrlImagen);
                datos.setearParametro("@precio", articulo.Precio);
                datos.setearParametro("@id", articulo.Id);

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

        public void eliminar(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("delete from ARTICULOS where id = @id");
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

        public List<Articulo> filtrar(string campo, string criterio, string filtro)
        {
            List<Articulo> lista = new List<Articulo>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                string consulta = ("select A.Id, A.Codigo, M.Descripcion as Marca, Nombre as Modelo, C.Descripcion as Categoria, A.Descripcion, ImagenUrl, Precio, A.IdMarca, A.IdCategoria from ARTICULOS A, CATEGORIAS C, MARCAS M where C.Id = A.IdCategoria and M.Id = A.IdMarca and ");

                switch (campo)
                {
                    case "Precio":

                        switch (criterio)
                        {
                            case "Mayor a":
                                consulta += "Precio > " + filtro;
                                break;

                            case "Menor a":
                                consulta += "Precio < " + filtro;
                                break;

                            default:
                                consulta += "Precio = " + filtro;
                                break;
                        }
                        break;

                    case "Marca":

                        switch (criterio)
                        {
                            case "Comienza con":
                                consulta += "M.Descripcion like '" + filtro + "%' ";
                                break;

                            case "Termina con":
                                consulta += "M.Descripcion like '%" + filtro + "'";
                                break;

                            default:
                                consulta += "M.Descripcion like '%" + filtro + "%'";
                                break;
                        }
                        break;


                    default:
                        switch (criterio)
                        {
                            case "Comienza con":
                                consulta += "A.Descripcion like '" + filtro + "%' ";
                                break;

                            case "Termina con":
                                consulta += "A.Descripcion like '%" + filtro + "'";
                                break;

                            default:
                                consulta += "A.Descripcion like '%" + filtro + "%'";
                                break;
                        }
                        break;

                }
                datos.setearConsulta(consulta);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Articulo aux = new Articulo();
                    aux.Marca = new Marca();
                    aux.Categoria = new Categoria();

                    aux.Id = (int)datos.Lector["Id"];
                    aux.Codigo = (string)datos.Lector["Codigo"];
                    aux.Marca.Descripcion = (string)datos.Lector["Marca"];
                    aux.Modelo = (string)datos.Lector["Modelo"];
                    aux.Categoria.Descripcion = (string)datos.Lector["Categoria"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];
                    aux.UrlImagen = (string)datos.Lector["ImagenUrl"];
                    aux.PrecioFormateado = convmoneda((decimal)datos.Lector["Precio"]);
                    aux.Marca.Id = (int)datos.Lector["IdMarca"];
                    aux.Categoria.Id = (int)datos.Lector["IdCategoria"];

                    lista.Add(aux);
                }



            }
            catch (Exception ex)
            {

                throw ex;
            }
            return lista;
        }

        public List<Articulo> listarArtFavoritos(string id)
        {
            List<Articulo> listaArtFav = new List<Articulo>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT F.Id as IdFavorito, A.Id as IdArticulo, M.Descripcion AS Marca, A.Nombre AS Modelo, A.Descripcion, A.ImagenUrl, A.Precio FROM FAVORITOS F INNER JOIN ARTICULOS A ON A.Id = F.IdArticulo INNER JOIN MARCAS M ON M.Id = A.IdMarca WHERE F.IdUser = @id");
                datos.setearParametro("@id", id);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Articulo aux = new Articulo();
                    Favorito auxFav = new Favorito();
                    aux.Marca = new Marca();
                    aux.Categoria = new Categoria();

                    aux.IdFavorito = (int)datos.Lector["IdFavorito"];
                    aux.Id = (int)datos.Lector["IdArticulo"];
                    aux.Marca.Descripcion = (string)datos.Lector["Marca"];
                    aux.Modelo = (string)datos.Lector["Modelo"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];
                    aux.UrlImagen = (string)datos.Lector["ImagenUrl"];
                    aux.PrecioFormateado = convmoneda((decimal)datos.Lector["Precio"]);
                   
                    listaArtFav.Add(aux);
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            { datos.cerrarConexion(); }

            return listaArtFav;

        }

        public void esFavorito(List<Favorito> listaFavUser, List<Articulo> listaArticulos )
        {
            if (listaFavUser != null)
            {
                foreach (var articulo in listaArticulos)
                    articulo.EsFavorito = listaFavUser.Any(x => x.IdArticulo == articulo.Id);
            }
            
        }
        public bool soloNumeros(string cadena)
        {
            foreach (char item in cadena)
            {
                if (!(char.IsNumber(item)))
                {
                    return false;
                }
            }
            return true;
        }
    }

}
