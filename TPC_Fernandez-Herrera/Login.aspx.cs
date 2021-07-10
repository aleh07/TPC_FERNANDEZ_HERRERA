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
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            
        //    string user = TxtUser.Text;
        //    string pass = TxtPass.Text;
        //    Usuario cuenta = negocio.ValidarUsuarios(user, pass);
       
        //    if (cuenta.Tipo =="C") 
        //    {
        //        Session.Add("admin","yes");

        //    }

        //    //string pag = (string)Session["Pagina"];

        //    if (cuenta != null  )
        //    {


        //        Session.Add("Cuenta", cuenta);
                   
        //            Response.Write("<script>alert('Cuenta Registrada');</script>");
               
        //            Response.Redirect("Compras.aspx");
        //            }
           
        //    else
        //    {
        //        //mandar un mensaje de "debe loguiarse"
        //        Response.Redirect("Inicio.aspx");
        //    }


        }

        protected void EntrarCuenta_Click(object sender, EventArgs e)
        {
            Response.Redirect("Compras.aspx");
        }
    }
}