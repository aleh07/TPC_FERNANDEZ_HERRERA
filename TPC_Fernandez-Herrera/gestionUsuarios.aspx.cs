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
        public List<Usuario> listaUsuariosActivos;
        protected void Page_Load(object sender, EventArgs e)
        {
            UsuarioNegocio negocio = new UsuarioNegocio();
            try
            {


                if (!IsPostBack)
                {
                    listaUsuarios = negocio.Listar();

                }
                repetidor.DataSource = listaUsuarios;
                repetidor.DataBind();



            }
            catch (Exception ex)
            {

                //Session.Add("Error", ex.ToString());
                //Response.Redirect("Error.aspx");
            }
        }

        protected void btnAlta_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegistrarCuenta.aspx");
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            Usuario seleccionado = new Usuario();
            UsuarioNegocio negocio = new UsuarioNegocio();
            try
            {
                var argument = ((Button)sender).CommandArgument;
                listaUsuarios = (List<Usuario>)Session["ListarUsuarios"];

                seleccionado = listaUsuarios.Find(x => x.ID.ToString() == argument);
                listaUsuarios.Remove(seleccionado);
                Session.Add("ListarUsuarios", listaUsuarios);

                seleccionado.Estado = false;

                negocio.Eliminar(seleccionado);

                repetidor.DataSource = null;
                repetidor.DataSource = listaUsuarios;
                repetidor.DataBind();


            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}