using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Componente
    {
        public long ID { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }   
        public decimal Precio { get; set; }
        public string ImagenUrl { get; set; }
        public int Cantidad{ get; set; }
        public bool Estado { get; set; }
      
        public int marc { get; set; }
        public int cat { get; set; }

        public Marca marca { get; set; }
        public Categoria categoria { get; set; }
        
    }

}
