using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Dominio;
using System.Threading;
using System.Text;


namespace TPC_Fernandez_Herrera
{
    public partial class Login : System.Web.UI.Page
    {
        UsuarioNegocio negocio = new UsuarioNegocio();
        Usuario cuenta = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {

            Session.Add("Cuenta", null);
        }

        protected void BtnAgregar_Click(object sender, EventArgs e)
        {

            string user = TxtEmail.Text;
            string pass = TxtPass.Text;
            Usuario cuenta = negocio.ValidarUsuarios(user, pass);

            if (cuenta != null)
            {


                Session.Add("Cuenta", cuenta);

                Response.Write("<script>alert('Cuenta Registrada');</script>");
                //Nose como hacer para que despues de la alerta redirija a la pag compras
                //Response.Redirect("Compras.aspx");
            }

            else
            {
                //mandar un mensaje de "debe loguiarse"
                Response.Write("<script>alert('Cuenta o usuario Incorrecta');</script>");
                //Response.Redirect("Inicio.aspx");


            }


        }
    }
}