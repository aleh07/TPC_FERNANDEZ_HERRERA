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
        public void agregar(Pedidos nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
           
            try
            {
                datos.setearConsulta("insert into Pedidos (Usuario,Direccion,TelefonoContacto,EstadoPedido,Carrito,Estado)" +
                    " values(@Usuario,@Direccion,@TelefonoContacto,@EstadoPedido,Carrito,Estado)");


                datos.setearParametro("@Usuario", nuevo.carrito.IdUsuario);
                datos.setearParametro("@Direccion", nuevo.direccion);
                datos.setearParametro("@TelefonoContacto", nuevo.Telefono);
                datos.setearParametro("@EstadoPedido", nuevo.Tipos.Id);  
                datos.setearParametro("@Cantidad", nuevo.carrito.Id);
                datos.setearParametro("@Estado", nuevo.Estado);
                

                datos.ejectutarAccion();


            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
