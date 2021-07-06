<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Compras.aspx.cs" Inherits="TPC_Fernandez_Herrera.Compras" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    >
    <%/*aca pongo lo que me traje  en la session"carrito" no decidi de que manera ponerlo todavia*/%>
      <div class="table-responsive">

<%/*aca pongo lo que me traje el en la session "usuario" definir y rearmar lo que se va atraer y mostrar*/%>
  
     <p>  <asp:Label ID="LblNombre" runat="server" /> </p>
     <p>  <asp:Label ID="LblApellido" runat="server" /> </p>

    <table class="table">
        <thead>
            <tr>
                <th scope="col">
                    <h4 class="titulo">Nombre</h4>
                </th>
                <th scope="col">
                    <h4 class="titulo">Descripcion</h4>
                </th>
                <th scope="col">
                    <h4 class="titulo">Precio</h4>
                </th>
                <th scope="col">
                    <h4 class="titulo">Marca</h4>
                </th>
                <th scope="col">
                    <h4 class="titulo">Cantidad </h4>
                </th>
            </tr>
        </thead>

        <asp:Repeater runat="server" ID="repetidor">
            <ItemTemplate>
                <tbody>
                    <td>
                        <p><%#Eval("Componente.Nombre")%></p>
                    </td>
                    <td>
                        <p><%#Eval("Componente.Descripcion")%></p>
                    </td>
                    <td>
                        <p>$<asp:Label ID="Label1" runat="server" Text='<%#Eval("Subtotal")%>' /></p>
                    </td>
                    <td>
                        <p><%#Eval("Componente.marca.Nombre")%></p>
                    </td>
                    <td>
                        <p>
                            <asp:TextBox TextMode="Number" runat="server" OnTextChanged="txtCantidad_TextChanged" Text='<%#Eval("Cantidad")%>' ID="txtCantidad" min="1" />
                            <asp:Button Text="Agregar" CssClass="boton__eliminar"  AutoPostBack="true" ID="btnAgregar" OnClick="btnAgregar_Click" CommandArgument='<%#Eval("Componente.ID")%>' runat="server" />
                        </p>
                    </td>
                    <td>
                        <p><asp:Button Text="Eliminar" CssClass="boton__eliminar" AutoPostBack="true" ID="btnEliminar" Onclick ="btnEliminar_Click" CommandArgument='<%#Eval("Componente.ID")%>' runat="server" /></p>
                    </td>
                </tbody>
            </ItemTemplate>
        </asp:Repeater>

        <%/*aca pongo la direccion de entrega*/%>
  
     <p>  <asp:Label ID="LblDireccion" runat="server" /> </p>
     <p>  <asp:Label ID="LblTelofono" runat="server" /> </p>
         <p> <asp:Button Text="Confirmar Compra" CssClass="boton__ConfirmarCompra"  AutoPostBack="true" ID="btnConfirmarCompra" OnClick="btnConfirmarCompra_Click" runat="server" />   </p>



    </table>
</div>
            <p class="d-flex justify-content-end" style="margin-right:60px; font-size:40px" >Total:
                <asp:Label ID="lblTotal" runat="server" />
            </p>
            <asp:Label ID="lblPrueba" runat="server" Visible="false" />

 
   
</asp:Content>
