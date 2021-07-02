using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class ComponenteNegocio
    {
        public List<Componente> Listar()
        {
            List<Componente> lista = new List<Componente>();
            AccesoDatos Datos = new AccesoDatos();

            Datos.setearConsulta("select Co.Id Id,Nombre,Co.Descripcion,Precio,ImagenUrl,M.Descripcion Marca,M.ID IDMarca ,Ca.Descripcion Categoria,Ca.ID IDCategoria from COMPONENTES Co, CATEGORIAS Ca, Marcas M Where Co.IdCategoria = Ca.Id and Co.IdMarca = M.Id");
            Datos.ejecutarLectura();

                try
                {
                    while (Datos.Lector.Read())
                    {
                        Componente aux = new Componente();                     
                        aux.ID = (long)Datos.Lector["Id"];
                        aux.Nombre = (string)Datos.Lector["Nombre"];  
                    //buscar la manera para que sean solo 2 digitos luego de la coma
                        aux.Precio = (Decimal)Datos.Lector["Precio"];         
                        aux.Descripcion = (string)Datos.Lector["Descripcion"];
                        aux.ImagenUrl = (string)Datos.Lector["ImagenUrl"];

                        aux.marca = new Marca((int)Datos.Lector["IDMarca"], (string)Datos.Lector["Marca"]);

                        aux.categoria = new Categoria((int)Datos.Lector["IDCategoria"], (string)Datos.Lector["Categoria"]);

                        lista.Add(aux);
                    }
                    return lista;
                }
                catch (Exception)
                {

                    throw;
                }
                finally
                {
                    Datos.cerrarConexion();
                }

        }


        public void agregar(Componente nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT Into Componentes (Nombre,Descripcion,Precio,ImagenUrl,IdMarca,IdCategoria) " +
                                   "values (@Nombre,@Descripcion,@Precio,@ImagenUrl,@Marca,@Categoria)");


                datos.setearParametro("@Nombre", nuevo.Nombre);
                datos.setearParametro("@Descripcion", nuevo.Descripcion);
                datos.setearParametro("@ImagenUrl", nuevo.ImagenUrl);
                datos.setearParametro("@Marca",1);
                datos.setearParametro("@Categoria", 1);
                datos.setearParametro("@Precio", nuevo.Precio);
                datos.ejectutarAccion();


            }
            catch (Exception)
            {

                throw;
            }
        }
         

        //public void modificar(Producto nuevo)
        //{
        //    AccesoDatos datos = new AccesoDatos();
        //    try
        //    {
        //        //datos.setearConsulta("update ARTICULOS set codigo ='" + nuevo.CodigoArt + "' where id = " + nuevo.Id);
        //        datos.setearConsulta("update ARTICULOS set codigo = '" + nuevo.CodigoArt + "', nombre = '" + nuevo.Nombre + "',Descripcion = '" + nuevo.Descripcion + "', ImagenUrl = '" + nuevo.UrlImagen + "', precio = '" + nuevo.Precio + "', idmarca = '" + nuevo.Marca.Id + "' , idcategoria = '" + nuevo.Categoria.Id + "' where id = '" + nuevo.Id + "'");
        //        /*datos.setearConsulta("update ARTICULOS set codigo = @codigo, nombre = @nombre, Descripcion = @descripcion, ImagenUrl = @urlImagen, precio = @precio, IdMarca = @idMarca, IdCategoria = @idCategoria where codigo = @id");
        //        datos.setearParametro("@codigo", nuevo.CodigoArt);
        //        datos.setearParametro("@nombre", nuevo.Nombre);
        //        datos.setearParametro("@descripcion", nuevo.Descripcion);
        //        datos.setearParametro("@urlImagen", nuevo.UrlImagen);
        //        datos.setearParametro("@precio", nuevo.Precio);
        //        datos.setearParametro("@idCategoria", nuevo.Categoria.Id);
        //        datos.setearParametro("@idMarca", nuevo.Marca.Id);
        //        datos.setearParametro("@id", nuevo.Id);*/

        //        datos.ejectutarAccion();

        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    finally
        //    {
        //        datos.cerrarConexion();
        //    }
        //}
    }
}
