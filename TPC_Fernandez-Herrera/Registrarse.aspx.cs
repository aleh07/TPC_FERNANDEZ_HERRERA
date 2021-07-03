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
    public partial class Registrarse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
           

        }

        protected void BtnAgregar_Click(object sender, EventArgs e)
        {
            UsuarioNegocio negocio = new UsuarioNegocio();

            Usuario aux = new Usuario();

            aux.NombreUsuario = TxtUsuario.Text;
            aux.Pass = TxtContraseña.Text;
            aux.Nombre = TxtNombre.Text;
            aux.Apellido = TxtApellido.Text;
            aux.Fecha = Convert.ToDateTime(TxtFechaNac.Text);
            aux.Dni = Convert.ToInt32(TxtDni.Text);
            aux.Tipo = 'C';
            aux.Estado = 1;
            
          

            negocio.agregar(aux);
            //falta mandar el email
            Response.Redirect("Login.aspx");

        }
    }
}