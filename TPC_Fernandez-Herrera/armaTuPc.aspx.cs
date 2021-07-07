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
    public partial class armaTuPc : System.Web.UI.Page
    {
    
    public List<Componente> listaComponente;
        List<Componente> listaArmado;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if(!IsPostBack)
                {
                    cargarCatalogo();
                        listaComponente = (List<Componente>)Session["ListaComponente"];
                    
                    
                }
                repetidor.DataSource = listaComponente;
                repetidor.DataBind();
            }
            catch (Exception)
            {

                throw;
            }

        }

        public void cargarCatalogo()
        {
            List<Componente> listaComponentes = (List<Componente>)Session["ListarComponentes"];
            listaArmado = (List<Componente>)Session["ListaPC"];

            if (listaArmado == null)
            {
                listaComponente = listaComponentes.FindAll(x => x.categoria.Nombre.ToLower().Contains("procesadores") );
                Session.Add("listaComponente", listaComponente);

            }
            else if (listaArmado.Count == 1)
            {
                listaComponente = listaComponentes.FindAll(x => x.categoria.Nombre.ToLower().Contains("motherboards"));
                Session.Add("listaComponente", listaComponente);
            }
            else if (listaArmado.Count == 2)
            {
                listaComponente = listaComponentes.FindAll(x => x.categoria.Nombre.ToLower().Contains("cooler"));
                Session.Add("listaComponente", listaComponente);
            }
            else if (listaArmado.Count == 3)
            {
                listaComponente = listaComponentes.FindAll(x => x.categoria.Nombre.ToLower().Contains("ram"));
                Session.Add("listaComponente", listaComponente);
            }
            else if (listaArmado.Count == 4)
            {
                listaComponente = listaComponentes.FindAll(x => x.categoria.Nombre.ToLower().Contains("fuentes"));
                Session.Add("listaComponente", listaComponente);
            }
            else if (listaArmado.Count == 5)
            {
                listaComponente = listaComponentes.FindAll(x => x.categoria.Nombre.ToLower().Contains("gabinetes"));
                Session.Add("listaComponente", listaComponente);
            }
            else if (listaArmado.Count == 6)
            {
                listaComponente = listaComponentes.FindAll(x => x.categoria.Nombre.ToLower().Contains("tarjetaDeVideo"));
                Session.Add("listaComponente", listaComponente);
            }
            else if (listaArmado.Count == 7)
            {
                listaComponente = listaComponentes.FindAll(x => x.categoria.Nombre.ToLower().Contains("perifericos"));
                Session.Add("listaComponente", listaComponente);
            }
            else if (listaArmado.Count == 8)
            {
                listaComponente = listaComponentes.FindAll(x => x.categoria.Nombre.ToLower().Contains("pantallas"));
                Session.Add("listaComponente", listaComponente);
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            List<Componente> Seleccionado = new List<Componente>();
            try
            {
                var argument = ((Button)sender).CommandArgument;
                listaComponente = (List<Componente>)Session["ListarComponentes"];
                Componente componente = listaComponente.Find(x => x.ID.ToString() == argument);
                Seleccionado.Add(componente);
                Session.Add("ListaPC", Seleccionado);
                Response.Redirect("armaTuPc.aspx");

            }
            catch (Exception ex)
            {
                throw ex;

            }
        }
    }
}