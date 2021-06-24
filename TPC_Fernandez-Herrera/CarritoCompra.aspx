<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CarritoCompra.aspx.cs" Inherits="TPC_Fernandez_Herrera.CarritoCompra" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table class="table">
        <thead>
            <tr>
                <th scope="col">
                    <h3 class="titulo">Nombre</h3>
                </th>
                <th scope="col">
                    <h3 class="titulo">Descripcion</h3>
                </th>
                <th scope="col">
                    <h3 class="titulo">Precio</h3>
                </th>
                <th scope="col">
                    <h3 class="titulo">Cantidad </h3>
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
                        <p>
                            <asp:TextBox TextMode="Number" runat="server" OnTextChanged="txtCantidad_TextChanged" Text='<%#Eval("Cantidad")%>' ID="txtCantidad" min="1" />
                            <asp:Button Text="Agregar" CssClass="boton__eliminar" AutoPostBack="true" ID="btnAgregar" OnClick="btnAgregar_Click" CommandArgument='<%#Eval("Componente.ID")%>' runat="server" />
                        </p>
                    </td>
                    <td>
                        <p>
                            <asp:Button Text="Eliminar" CssClass="boton__eliminar" AutoPostBack="true" ID="btnEliminar" Onclick="btnEliminar_Click1" CommandArgument='<%#Eval("Componente.ID")%>' runat="server" /></p>
                    </td>
                </tbody>
            </ItemTemplate>
        </asp:Repeater>

    </table>

            <p class="d-flex justify-content-end" style="margin-right:60px; font-size:40px" >Total:
                <asp:Label ID="lblTotal" runat="server" />
            </p>
            <asp:Label ID="lblPrueba" runat="server" Visible="false" />


</asp:Content>
