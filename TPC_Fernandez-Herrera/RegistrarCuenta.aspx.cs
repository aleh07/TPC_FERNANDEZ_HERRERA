using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Dominio;
using System.Drawing;

namespace TPC_Fernandez_Herrera
{
    public partial class Loggin : System.Web.UI.Page
    {
        public List<Usuario> listaUsuario { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            
        }
        bool  ValidarVacios()
        {
            TxtNombre.BorderColor = Color.White;
            TxtApellido.BorderColor = Color.White;
            TxtEmail.BorderColor = Color.White;
            TxtPass.BorderColor = Color.White;
            bool vacios = false;
            if (TxtNombre.Text == ""  )
            {
                TxtNombre.BorderColor = Color.Red;
                vacios= true;
            }
            if (TxtApellido.Text == "")
            {
                TxtApellido.BorderColor = Color.Red;
                vacios = true;
            }
            if (TxtEmail.Text == "")
            {
                TxtEmail.BorderColor = Color.Red;
                vacios = true;
            }
            if (TxtPass.Text == "")
            {
                TxtPass.BorderColor = Color.Red;
                vacios = true;
            }
            return vacios;

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

            if (ValidarVacios()==false) { 
            //Guardo el nuevo usuario 
            Session.Add("Usuario", aux);
            negocio.agregar(aux);
            //falta mandar el email
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Cuenta Registrada correctamente');window.location ='Login.aspx';", true);
           }
        }
    }
}