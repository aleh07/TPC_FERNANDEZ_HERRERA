using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace TPC_Fernandez_Herrera
{
    public partial class Inicio : System.Web.UI.Page
    {
        public List<Componente> lista;
        protected void Page_Load(object sender, EventArgs e)
        {
            ComponenteNegocio negocio = new ComponenteNegocio();

            lista = negocio.Listar();
        }
    }
}