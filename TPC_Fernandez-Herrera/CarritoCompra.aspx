<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CarritoCompra.aspx.cs" Inherits="TPC_Fernandez_Herrera.CarritoCompra" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="table">
     <table class="table-stock">
<thead style="background-color:green">
            <tr>
                <th scope="col">
                    <h4 class="titulo">Nombre</h4>
                </th>
                <th></th>
                <th scope="col">
                    <h4 class="titulo">Descripcion</h4>
                </th>
                <th></th>
                <th scope="col">
                    <h4 class="titulo">Precio</h4>
                </th>
                <th></th>
                <th scope="col">
                    <h4 class="titulo">Marca</h4>
                </th>
                <th></th>
                <th scope="col">
                    <h4 class="titulo">Cantidad </h4>
                </th>
                <th></th>
            </tr>
        </thead>

        <asp:Repeater runat="server" ID="repetidor">
            <ItemTemplate>
                <tr>
                    <td>
                        <p><%#Eval("Componente.Nombre")%></p>
                    </td>
                    <td></td>
                    <td>
                        <p><%#Eval("Componente.Descripcion")%></p>
                    </td>
                    <td></td>
                    <td>
                        <p>$<asp:Label ID="Label1" runat="server" Text='<%#Eval("Subtotal")%>' /></p>
                    </td>
                    <td></td>
                    <td>
                        <p><%#Eval("Componente.marca.Nombre")%></p>
                    </td>
                    <td></td>
                    <td>
                        <p>
                            <asp:TextBox TextMode="Number" runat="server" OnTextChanged="txtCantidad_TextChanged" Text='<%#Eval("Cantidad")%>' ID="txtCantidad" min="1" />
                            <asp:Button Text="Agregar" CssClass="boton__eliminar"  AutoPostBack="true" ID="btnAgregar" OnClick="btnAgregar_Click" CommandArgument='<%#Eval("Componente.ID")%>' runat="server" />
                      
                        <asp:Button Text="Eliminar" CssClass="boton__eliminar" AutoPostBack="true" ID="btnEliminar" Onclick="btnEliminar_Click1" CommandArgument='<%#Eval("Componente.ID")%>' runat="server" /></p>
                  </tr>
              
            </ItemTemplate>
        </asp:Repeater>

    </table>
</div>
            <p class="d-flex justify-content-end" style="margin-right:60px; font-size:40px" >Total:
                <asp:Label ID="lblTotal" runat="server" />
            </p>
            <asp:Label ID="lblPrueba" runat="server" Visible="false" />
    <%/*agregue el bton comprar que mandaria a registrarse si es k no esta registrado o mandaria a comprar si lo esta, nose como hacerlo  todavia"*/%>
              <p><asp:Button Text="Comprar" CssClass="boton__Comprar" AutoPostBack="true" ID="btnComprar" Onclick="BtnComprar_Click" runat="server" /></p>



</asp:Content>
