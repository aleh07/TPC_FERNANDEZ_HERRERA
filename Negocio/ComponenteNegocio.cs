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

            Datos.setearConsulta("select Co.Id Id,Nombre,Co.Descripcion,Precio,ImagenUrl,Cantidad,Estado,M.Descripcion Marca,M.ID IDMarca ,Ca.Descripcion Categoria,Ca.ID IDCategoria from COMPONENTES Co, CATEGORIAS Ca, Marcas M Where Co.IdCategoria = Ca.Id and Co.IdMarca = M.Id");
            Datos.ejecutarLectura();

                try
                {
                    while (Datos.Lector.Read())
                    {
                        Componente aux = new Componente();                     
                        aux.ID = (long)Datos.Lector["Id"];
                        aux.Nombre = (string)Datos.Lector["Nombre"];  
                    //buscar la manera para que sean solo 2 digitos luego de la coma
                        aux.Precio = (decimal)Datos.Lector["Precio"];         
                        aux.Descripcion = (string)Datos.Lector["Descripcion"];
                        aux.ImagenUrl = (string)Datos.Lector["ImagenUrl"];
                        aux.Cantidad = (int)Datos.Lector["Cantidad"];
                        aux.Estado = (bool)Datos.Lector["Estado"];
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
                datos.setearConsulta("INSERT Into Componentes (Nombre,Descripcion,Precio,ImagenUrl,Cantidad,Estado,IdMarca,IdCategoria) " +
                                   "values (@Nombre,@Descripcion,@Precio,@ImagenUrl,@Cantidad,@Estado,@Marca,@Categoria)");

              

                datos.setearParametro("@Nombre", nuevo.Nombre);
                datos.setearParametro("@Descripcion", nuevo.Descripcion);
                datos.setearParametro("@Precio", nuevo.Precio);
                datos.setearParametro("@ImagenUrl", nuevo.ImagenUrl);
                datos.setearParametro("@Cantidad", nuevo.Cantidad);
                datos.setearParametro("@Estado", nuevo.Estado);
                datos.setearParametro("@Marca",nuevo.marca.Id);
                datos.setearParametro("@Categoria", nuevo.categoria.Id);
                
                datos.ejectutarAccion();


            }
            catch (Exception)
            {

                throw;
            }
        }


        public void modificar(Componente nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
              
                datos.setearConsulta("update Componentes set  Nombre = @nombre, Descripcion = @descripcion, ImagenUrl = @urlImagen, precio = @precio, IdMarca = @idMarca, IdCategoria = @idCategoria, Estado = @Estado where id = @id");
                datos.setearParametro("@Id", nuevo.ID);
                datos.setearParametro("@nombre", nuevo.Nombre);
                datos.setearParametro("@descripcion", nuevo.Descripcion);
                datos.setearParametro("@urlImagen", nuevo.ImagenUrl);
                datos.setearParametro("@precio", nuevo.Precio);
                datos.setearParametro("@idCategoria", nuevo.categoria.Id);
                datos.setearParametro("@idMarca", nuevo.marca.Id);
                datos.setearParametro("@Estado", nuevo.Estado);

                datos.ejectutarAccion();

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
        public void Eliminar(Componente nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {

                datos.setearConsulta("update Componentes set  Estado = @Estado where id = @id");
                
                datos.setearParametro("@Id", nuevo.ID);
                datos.setearParametro("@Estado", nuevo.Estado);

                datos.ejectutarAccion();

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
    }
}
