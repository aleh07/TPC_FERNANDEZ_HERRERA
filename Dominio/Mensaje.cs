using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Mensaje 
    {

        public long ID { get; set; }
        public Usuario usuario { get; set; }      
        public string mensaje { get; set; }
        public string Respuesta { get; set; }
         public bool Estado { get; set; }
      
    }
}
