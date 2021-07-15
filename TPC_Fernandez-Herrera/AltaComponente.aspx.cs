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
    public partial class AltaComponente : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["ID"];
            List<Componente> listaComponente = (List<Componente>)Session["ListarComponentes"];

            if (id != null)
            {

                Componente modificar = listaComponente.Find(x => x.ID.ToString() == id);

                TxtNombre.Text = modificar.Nombre;
                TxtDescripcion.Text = modificar.Descripcion;
                txtPrecio.Text = modificar.Precio.ToString();
                TxtCant.Text = modificar.Cantidad.ToString();
                TxtImagenUrl.Text = modificar.ImagenUrl;

            }

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
            

        }
       

    protected void BtnAgregar_Click(object sender, EventArgs e)
        {
            ComponenteNegocio negocio = new ComponenteNegocio();
            Componente aux = new Componente();
            ///para poder cargar los dropdowns hay que pasarle los objetos buscado con el find de las listas
            List<Marca> marcas = (List<Marca>) Session["listaMarcas"];
            List<Categoria> categorias = (List<Categoria>)Session["listaCat"];
           
            aux.Nombre = TxtNombre.Text;
            aux.Descripcion = TxtDescripcion.Text;
            aux.ImagenUrl = TxtImagenUrl.Text;
            aux.Cantidad = Convert.ToInt32(TxtCant.Text);

            aux.Estado = true;
            aux.marca = marcas.Find(x => x.Id == int.Parse(ddlMarca.SelectedValue));
            aux.categoria = categorias.Find(x => x.Id == Convert.ToInt32(ddlCategoria.SelectedItem.Value));
            aux.Precio = decimal.Parse(txtPrecio.Text);
          
            if (aux.Nombre !="" && aux.Descripcion != "" && aux.Cantidad > 0)
            {
                negocio.agregar(aux);
            }
            else
            {
                Response.Write("<script>alert('Los campos con * son obligarotios');</script>");
            }
                

            Response.Redirect("GestionStock.aspx");

        }
    }
}