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
    public partial class gestionUsuarios : System.Web.UI.Page
    {
        public List<Usuario> listaUsuarios;
        protected void Page_Load(object sender, EventArgs e)
        {
            UsuarioNegocio negocio = new UsuarioNegocio();
            try
            {
                    listaUsuarios = negocio.Listar();


               
            }
            catch (Exception ex)
            {

                //Session.Add("Error", ex.ToString());
                //Response.Redirect("Error.aspx");
            }
        }
    }
}