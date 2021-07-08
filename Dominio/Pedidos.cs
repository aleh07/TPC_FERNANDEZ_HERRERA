using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Dominio
{
    public class Pedidos
    {

     
        public string direccion { get; set; }
        public int Telefono { get; set; }

       public  Carrito carrito { get; set; }

        public bool Estado { get; set; }

       public TiposPedidos Tipos { get; set; }


    }
}