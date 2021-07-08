using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace TPC_Fernandez_Herrera
{
    public partial class Compras : System.Web.UI.Page
    {
        Componente producto = new Componente();
        public Carrito carrito = new Carrito();
        Item item = new Item();
        decimal total;

        protected void Page_Load(object sender, EventArgs e)
        {
            //aca intente mostrar en esto label lo que se traigo guardado en la session "usuario"
            
            Usuario usuariologuiado = new Usuario();
            usuariologuiado = (Usuario)Session["cuenta"];
            
            LblNombre.Text = usuariologuiado.Nombre;
            LblApellido.Text = usuariologuiado.Apellido;
           
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

        protected void btnEliminar_Click(object sender, EventArgs e)
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

        protected void btnConfirmarCompra_Click(object sender, EventArgs e)
        {
       
            PedidoNegocio negocio = new PedidoNegocio();
            int id =  + 1;
            //aca agrego la direccion y un telefono es es opcional por que son campos null en la DB y genero  un pedido ahi si con todos los datos necesarios
            //desorrolar la funcion en negocio que inserte en la  DB un pedido
            Pedidos pedido= new Pedidos();
            pedido.direccion = TxtDireccion.Text;
            pedido.Telefono = Convert.ToInt32(TxtTelefono.Text);

            pedido.Estado = true;
            //cargar en la DB los tipos de pedidos
            pedido.Tipos.Id= 1;
            //dentro de carrito tengo el id del usuario ,el producto y el item
            pedido.carrito.Id = id;
            pedido.carrito = carrito;
          
            negocio.agregar(pedido);
            //mandar mensaje de alta exitosa 
            
         
        }
    }
}