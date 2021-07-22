using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class CarritoNegocio
    {
        public void Agregar (Carrito carrito,decimal Total)
        {

            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT Into Carrito (IDUsuario,Total) " +
                                      "values (@IDUsuario,@Total)");

                datos.setearParametro("@IDUsuario", carrito.IdUsuario);
                datos.setearParametro("@Total", Total);

                datos.ejectutarAccion();


            }
            catch (Exception)
            {

                throw;
            }
        }

        public List<Carrito> ListaCarritos ()
        {
            List<Carrito> lista = new List<Carrito>();
            AccesoDatos Datos = new AccesoDatos();

            Datos.setearConsulta("select id,idUsuario,Total from carrito");
            Datos.ejecutarLectura();

            try
            {
                while (Datos.Lector.Read())
                {
                    Carrito aux = new Carrito();
                    aux.Id = (int)Datos.Lector["Id"];
                    aux.IdUsuario = (long)Datos.Lector["idUsuario"];
                    aux.Total = (decimal)Datos.Lector["Total"];
                    
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
        public void Total(long id,decimal Total)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {

                datos.setearConsulta("update Carrito set  Total = @Total  where id = @id");
                datos.setearParametro("@Id",id);
                datos.setearParametro("@Total", Total);

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
