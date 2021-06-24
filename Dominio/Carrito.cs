using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    class Carrito
    {
        public int ID { get; set; }
        public long IdCliente { get; set; }
        public List<Item> listaCarrito { get; set; }
        public decimal Total { get; set; }
    }
}
