using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace TPC_Fernandez_Herrera
{
    public partial class CarritoCompra : System.Web.UI.Page
    {

        Componente producto = new Componente();
        public Carrito carrito = new Carrito();
        Item item = new Item();
        decimal total;

            protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string id = Request.QueryString["ID"];
                carrito = (Carrito)Session["carrito"];
                if (carrito == null) carrito = new Carrito();
                if (carrito.Items == null) carrito.Items = new List<Item>();

                if (!IsPostBack)
                {
                    if (id != null)
                    {
                        if (carrito.Items.Find(x => x.componente.ID.ToString() == id) == null)
                        {
                            List<Componente> listado = (List<Componente>)Session["ListarComponentes"];
                            producto = listado.Find(x => x.ID.ToString() == id);

                            item.SubTotal = producto.Precio;
                            item.componente = producto;
                            item.Cantidad = 1;
                            carrito.FechaCarrito = DateTime.Today;
                            carrito.Items.Add(item);

                        }
                    }
                    //Repeater
                    repetidor.DataSource = carrito.Items;
                    repetidor.DataBind();
                }
                lblTotal.Text = carrito.totalCarrito(carrito).ToString();
                Session.Add("carrito", carrito);

            }

            catch (Exception ex)
            {
                throw ex;

            }

        }
            protected void txtCantidad_TextChanged(object sender, EventArgs e)
            {
                try
                {
                    var cantidad = ((TextBox)sender).Text;
                    lblPrueba.Text = cantidad;
                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }

            protected void btnAgregar_Click(object sender, EventArgs e)
            {
                try
                {
                    var cantidad = lblPrueba.Text;
                    if (cantidad != "")
                    {
                    var argument = ((Button)sender).CommandArgument;
                        carrito = (Carrito)Session["carrito"];
                        Item item1 = carrito.Items.Find(x => x.componente.ID.ToString() == argument);
                        item1.Cantidad = int.Parse(cantidad);
                        Session.Add("carrito", carrito);
                        repetidor.DataSource = null;
                        repetidor.DataSource = carrito.Items;
                        repetidor.DataBind();
                        lblTotal.Text = carrito.totalCarrito(carrito).ToString();
                    }
                }
                catch (Exception ex)
                {
                    throw ex;

                }
            }


            protected void btnEliminar_Click1(object sender, EventArgs e)
            {
                try
                {
                    var argument = ((Button)sender).CommandArgument;

                    carrito = (Carrito)Session["carrito"];
                    Item item1 = carrito.Items.Find(x => x.componente.ID.ToString() == argument);
                    carrito.Items.Remove(item1);
                    Session.Add("carrito", carrito);
                    repetidor.DataSource = null;
                    repetidor.DataSource = carrito.Items;
                    repetidor.DataBind();
                    lblTotal.Text = carrito.totalCarrito(carrito).ToString();
                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }

            protected void BtnComprar_Click(object sender, EventArgs e)
            {
                Response.Redirect("Login.aspx?ID=1");
                
              

        }




        
    }

}