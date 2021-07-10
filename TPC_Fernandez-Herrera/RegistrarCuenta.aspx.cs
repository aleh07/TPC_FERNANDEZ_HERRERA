using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Dominio;

namespace TPC_Fernandez_Herrera
{
    public partial class Loggin : System.Web.UI.Page
    {
        public List<Usuario> listaUsuario { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnAgregar_Click(object sender, EventArgs e)
        {
            UsuarioNegocio negocio = new UsuarioNegocio();

            Usuario aux = new Usuario();


            aux.Nombre = TxtNombre.Text ;
            aux.Apellido = TxtApellido.Text;
            aux.Email = TxtEmail.Text;
            aux.Pass = TxtPass.Text;  
            aux.Tipo = "U";
            aux.Estado = true;

            
            //Guardo el nuevo usuario 
            Session.Add("Usuario", aux);
            negocio.agregar(aux);
            //falta mandar el email
            Response.Redirect("Login.aspx");
        }
    }
}