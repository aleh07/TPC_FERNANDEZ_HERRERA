using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;


namespace Negocio
{
    public class ItemNegocio
    {
        public void Agregar (Item item)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT Into Items (IdCarrito,IDComponente,Cantidad,SubTotal) " +
                                   "values (@IdCarrito,@IDComponente,@Cantidad,@SubTotal)");


                datos.setearParametro("@IdCarrito", item.IdCarrito);
                datos.setearParametro("@IDComponente", item.componente.ID);
                datos.setearParametro("@Cantidad", item.Cantidad);
                datos.setearParametro("@SubTotal", item.SubTotal);
                datos.ejectutarAccion();


            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
