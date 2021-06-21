using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Fuentes:Componente
    {

        public long ID { get; set; }
        //LAS CLASES QUE HEREDAN DE COMPONENTE LES PUSE UN ATRIBUTO
        //"IDCOMPONENTE" PERO CREO QUE ESO DEBERIA HEREDARLO PERO POR LAS DUDAS LO PUSE
        public long IdComponente { get; set; }
        public int Potencia { get; set; }
        public string certificacion { get; set; }
       
    }
}
