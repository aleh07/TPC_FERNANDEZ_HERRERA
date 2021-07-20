using System;
using System.Collections.Generic;
using System.Drawing;
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
        ComponenteNegocio negocio = new ComponenteNegocio();
        List<Componente> listaComponente = new List<Componente>();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            string id = Request.QueryString["ID"];
            
            listaComponente = negocio.Listar();

            if (!IsPostBack)
            {
                MarcaNegocio marcaNegocio = new MarcaNegocio();
                CategoriaNegocio categoriaNegocio = new CategoriaNegocio();



                List<Marca> ListaMarcas = marcaNegocio.listar();
                Session.Add("listaMarcas", ListaMarcas);
                ddlMarca.DataSource = ListaMarcas;
                ddlMarca.DataTextField = "Nombre";
                ddlMarca.DataValueField = "Id";
                ddlMarca.DataBind();

                List<Categoria> ListaCategoria = categoriaNegocio.listar();

                Session.Add("listaCat", ListaCategoria);

                ddlCategoria.DataSource = ListaCategoria;
                ddlCategoria.DataTextField = "Nombre";
                ddlCategoria.DataValueField = "Id";
                ddlCategoria.DataBind();

            }
            if (id != null)
            {
                CargarForm(id);
                
            }
        }

        public void CargarForm(string id)
        {
            Componente modificar = listaComponente.Find(x => x.ID.ToString() == id);

            TxtNombre.Text = modificar.Nombre;
            TxtDescripcion.Text = modificar.Descripcion;
            TxtPrecio.Text = modificar.Precio.ToString();
            TxtCant.Text = modificar.Cantidad.ToString();
            TxtImagenUrl.Text = modificar.ImagenUrl;
            ddlCategoria.SelectedIndex = modificar.categoria.Id - 1;
            ddlMarca.SelectedIndex = modificar.marca.Id - 1;

        }
        public void GuardarForm(Componente aux)
        {
            List<Marca> marcas = (List<Marca>)Session["listaMarcas"];
            List<Categoria> categorias = (List<Categoria>)Session["listaCat"];
            aux.Nombre = TxtNombre.Text;
            aux.Descripcion = TxtDescripcion.Text;
            aux.ImagenUrl = TxtImagenUrl.Text;
            aux.Cantidad = Convert.ToInt32(TxtCant.Text);
            aux.Estado = true;
            aux.marca = marcas.Find(x => x.Id == int.Parse(ddlMarca.SelectedValue));
            aux.categoria = categorias.Find(x => x.Id == Convert.ToInt32(ddlCategoria.SelectedItem.Value));
            if (TxtPrecio.Text == "") aux.Precio = 0;
            aux.Precio = decimal.Parse(TxtPrecio.Text);
        }

        bool ValidarVacios()
        {
            TxtNombre.BorderColor = Color.White;
            TxtDescripcion.BorderColor = Color.White;
            TxtPrecio.BorderColor = Color.White;
            TxtCant.BorderColor = Color.White;
            bool vacios = false;
            if (TxtNombre.Text == "")
            {
                TxtNombre.BorderColor = Color.Red;
                vacios = true;
            }
            if (TxtDescripcion.Text == "")
            {
                TxtDescripcion.BorderColor = Color.Red;
                vacios = true;
            }
            if (TxtPrecio.Text == "")
            {
                TxtPrecio.BorderColor = Color.Red;
                vacios = true;
            }
            if (TxtCant.Text == "")
            {
                TxtCant.BorderColor = Color.Red;
                vacios = true;
            }
            return vacios;
        }
        protected void BtnAgregar_Click(object sender, EventArgs e)
        {
            ComponenteNegocio negocio = new ComponenteNegocio();
            Componente aux = new Componente();
            ///para poder cargar los dropdowns hay que pasarle los objetos buscado con el find de las listas
            List<Marca> marcas = (List<Marca>) Session["listaMarcas"];
            List<Categoria> categorias = (List<Categoria>)Session["listaCat"];
            string id = Request.QueryString["ID"];
            
           

            if (ValidarVacios()==false)
            {
                if (id==null)
                {
                    List<Componente> ListaAux = new List<Componente>();
                    ListaAux = (List<Componente>)Session["ListarComponentes"];
                    //el problema es que no refresca ver el video de mxi, kDA CARGADO CON LA VARIABLE MODIFICAR,PD ESTO NO VA ACA
                    aux.Nombre = TxtNombre.Text;
                    aux.Descripcion = TxtDescripcion.Text;
                    aux.ImagenUrl = TxtImagenUrl.Text;
                    aux.Cantidad = Convert.ToInt32(TxtCant.Text);
                    aux.Estado = true;
                    aux.marca = marcas.Find(x => x.Id == int.Parse(ddlMarca.SelectedValue));
                    aux.categoria = categorias.Find(x => x.Id == Convert.ToInt32(ddlCategoria.SelectedItem.Value));
                    if (TxtPrecio.Text == "") aux.Precio = 0;
                    aux.Precio = decimal.Parse(TxtPrecio.Text);

                    negocio.agregar(aux);

                    ListaAux.Add(aux);
                    Session["ListarComponentes"] = ListaAux;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Alta Registrada');window.location ='GestionStock.aspx';", true);
                                
                }
                else {

                    
                    List<Componente> ListaAux = new List<Componente>();
                    ListaAux = (List<Componente>)Session["ListarComponentes"];

                    //aux.Nombre = TxtNombre.Text;
                    //aux.Descripcion = TxtDescripcion.Text;
                    //aux.ImagenUrl = TxtImagenUrl.Text;
                    //aux.Cantidad = Convert.ToInt32(TxtCant.Text);
                    //aux.Estado = true;
                    //aux.marca = marcas.Find(x => x.Id == int.Parse(ddlMarca.SelectedValue));
                    //aux.categoria = categorias.Find(x => x.Id == Convert.ToInt32(ddlCategoria.SelectedItem.Value));
                    //if (TxtPrecio.Text == "") aux.Precio = 0;
                    //aux.Precio = decimal.Parse(TxtPrecio.Text);
                    GuardarForm(aux);
                   
                    negocio.modificar(aux);
                   
                    ListaAux.RemoveAll(item => item.ID == int.Parse(Request.QueryString["ID"]));
                    ListaAux.Add(aux);
                    Session["ListarComponentes"] = ListaAux;

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Registro Modificado');window.location ='GestionStock.aspx';", true);
                }
            }
           
          

        }
    }
}