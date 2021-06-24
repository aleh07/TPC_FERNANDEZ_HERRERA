<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="TPC_Fernandez_Herrera.Carrito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <!-- carrito donde se va a poner solo nombre ,descripcion ,precio,cantidad y total -->
   <
    <div class="contenedor sombra" >
        <div class="table">
            <h1 class="titulo">Nombre</h1>
            <h1 class="titulo">Descripcion</h1>
            <h1 class="titulo">Precio</h1>
            <h1 class="titulo">Cantidad</h1>
        </div>
        
   <%-- <asp:Repeater runat="server" ID="repetidor">
            <ItemTemplate>
                <div class="table">
                    <p><%#Eval("Componente.Nombre")%></p>
                    <p><%#Eval("Componente.Descripcion")%></p>
                    <p>$<asp:Label ID="Label1" runat="server" Text='<%#Eval("Subtotal")%>' /></p>
                    <p>
                        <asp:TextBox TextMode="Number" runat="server" OnTextChanged="txtCantidad_TextChanged" text='<%#Eval("Cantidad")%>' ID="txtCantidad" min="1"/>
                        <asp:Button Text="Agregar" CssClass="boton__eliminar" AutoPostBack="true" ID="btnAgregar" OnClick="btnAgregar_Click" CommandArgument='<%#Eval("Componente.ID")%>' runat="server" />
                    </p>
                    <p><asp:Button Text="Eliminar" CssClass="boton__eliminar" AutoPostBack="true" ID="btnEliminar" OnClick="btnEliminar_Click" CommandArgument='<%#Eval("Componente.ID")%>' runat="server" /></p>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:Label ID="lblPrueba" runat="server" OnLoad="lblTotal_Load" Visible="false"/>
    <p class="derecha">Total: <asp:Label ID="lblTotal" runat="server" OnLoad="lblTotal_Load" /></p>
 </div>--%>
    >
</asp:Content>
