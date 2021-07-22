using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
   public class PedidoNegocio
    {

        public List<TiposPedidos> listar()
        {
            List<TiposPedidos> lista = new List<TiposPedidos>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("select id, nombre from TiposPedidos");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    lista.Add(new TiposPedidos((int)datos.Lector["id"], (string)datos.Lector["nombre"]));
                }

                return lista;
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


        public void agregar(Pedidos nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
           
            try
            {
                datos.setearConsulta("insert into Pedidos (Usuario,Direccion,TelefonoContacto,EstadoPedido,Carrito)" +
                                    " values(@Usuario,@Direccion,@TelefonoContacto,@EstadoPedido,@Carrito)");


                datos.setearParametro("@Usuario", nuevo.usuario.ID);
                datos.setearParametro("@Direccion", nuevo.direccion);
                datos.setearParametro("@TelefonoContacto", nuevo.Telefono);
                datos.setearParametro("@EstadoPedido", nuevo.Tipos.Id);  
                datos.setearParametro("@Carrito", nuevo.carrito.Id);


                datos.ejectutarAccion();


            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
