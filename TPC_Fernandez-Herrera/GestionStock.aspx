<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="GestionStock.aspx.cs" Inherits="TPC_Fernandez_Herrera.GestionStock" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="table-responsive">
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
                    <h4 class="titulo">Categoria</h4>
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
                        <p><%#Eval("Nombre")%></p>
                    </td>
                    <td>
                        <p><%#Eval("Descripcion")%></p>
                    </td>
                    <td>
                        <p>$<asp:Label ID="lblPrecio" runat="server" Text='<%#Eval("Precio")%>'/></p>
                    </td>
                   
                    <td>
                        <p><%#Eval("marca.Nombre")%></p>
                    </td>
                    <td>
                        <p><%#Eval("categoria.Nombre")%></p>
                    </td>
                    <td>
                        <p>
                            <asp:TextBox  TextMode="Number" runat="server" ID="txtCantidad" OnTextChanged="txtCantidad_TextChanged" Text='<%#Eval("Cantidad")%>'  min="1"/>
                           <%--<asp:Button Text="Agregar"  AutoPostBack="true" ID="btnAgregar" OnClick="btnAgregar_Click" CommandArgument='<%#Eval("ID")%>' runat="server"/>
                        </p>--%>
                    </td>
                </tbody>
            </ItemTemplate>
        </asp:Repeater>
    </table>
            <a class="btn btn-secondary" href="AltaComponente.aspx"> Alta </a>
</div>

</asp:Content>
