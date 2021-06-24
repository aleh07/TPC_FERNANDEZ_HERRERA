using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
   public class Carrito
    {
   
        public long IdCliente { get; set; }
     

        public DateTime FechaCarrito { get; set; }
        public List<Item> Items { get; set; }
        public decimal totalCarrito(Carrito carrito)
        {
            decimal total = 0;
            foreach (Item item in carrito.Items)
            {

                total += item.componente.Precio * item.Cantidad;
            }
            return total;
        }
    }
}
