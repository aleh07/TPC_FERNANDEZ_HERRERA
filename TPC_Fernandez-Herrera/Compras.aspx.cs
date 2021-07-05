using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Fernandez_Herrera
{
    public partial class Compras : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuariologuiado = new Usuario();
            usuariologuiado = (Usuario)Session["Usuario"];
            lblNombreUsuario.Text = usuariologuiado.NombreUsuario;
            lblNombreUsuario.Text = usuariologuiado.Nombre;
            LblApellido.Text = usuariologuiado.Apellido;


        }
    }
}