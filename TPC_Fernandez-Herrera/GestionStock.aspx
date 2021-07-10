<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="GestionStock.aspx.cs" Inherits="TPC_Fernandez_Herrera.GestionStock" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        
    <table class="table-stock">
       
        <thead style="background-color:green">
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
                            <%--<asp:TextBox  TextMode="Number" runat="server" ID="txtCantidad" OnTextChanged="txtCantidad_TextChanged" Text='<%#Eval("Cantidad")%>'  min="1"/>--%>
                           <%--<asp:Button Text="Agregar"  AutoPostBack="true" ID="btnAgregar" OnClick="btnAgregar_Click" CommandArgument= runat="server"/>--%>
                        </p>
                    </td>
                </tbody>
            </ItemTemplate>
        </asp:Repeater>
    </table>

            
            <asp:Button type="button" class="btn btn-lg btn-primary" id="btnAlta" Text="Alta nuevo Componente" OnClick="btnAlta_Click" runat="server"/>
     <asp:Button type="button" class="btn btn-secondary btn-lg"  id="btnModificar" Text="Modificar" OnClick="btnModificar_Click" runat="server"/>
    <asp:Button  type="button" class="btn btn-outline-danger" id="btnEliminar" Text="Eliminar" OnClick="btnEliminar_Click" runat="server"/>


</asp:Content>
