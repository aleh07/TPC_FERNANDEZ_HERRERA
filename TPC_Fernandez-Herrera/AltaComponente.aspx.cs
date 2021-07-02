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
    public partial class AltaComponente : System.Web.UI.Page
    {
        Componente componente = new Componente();
        protected void Page_Load(object sender, EventArgs e)
        {
         

        }

        protected void BtnAgregar_Click(object sender, EventArgs e)
        {
            AccesoDatos datos = new AccesoDatos();
            ComponenteNegocio negocio = new ComponenteNegocio();
            Componente aux = new Componente();
            aux.Nombre = TxtNombre.Text;
            aux.Descripcion = TxtDescripcion.Text;
            aux.ImagenUrl = TxtImagenUrl.Text;
            negocio.agregar(aux);
            Response.Redirect("GestionStock.aspx");

        }
    }
}