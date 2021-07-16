<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="GestionStock.aspx.cs" Inherits="TPC_Fernandez_Herrera.GestionStock" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="main-container">  
    <table class="table">
       
        <thead>
            <tr>
                <th> 
                    Nombre
                </th>
                <th>
                    Descripcion
                </th>
                <th >
                   Precio
                </th>
                <th >
                   Marca
                </th>
                 <th>
                    Categoria
                </th>
                <th>
                   Cantidad 
                </th>
                 <th>
                  Elija una opcion
                </th>
            </tr>
        </thead>
 
        <asp:Repeater runat="server" ID="repetidor">
            <ItemTemplate>
         <tr>
                    <td>
                        <p><%#Eval("Nombre")%> </p>
                    </td>
                    <td>
                        <p><%#Eval("Descripcion")%> </p>
                    </td>
                    <td>
                        <p>$<asp:Label ID="lblPrecio" runat="server" Text='<%#Eval("Precio")%>'/></p>
                    </td>
                   
                    <td>
                        <p><%#Eval("marca.Nombre")%> </p>
                    </td>
                    <td>
                        <p><%#Eval("categoria.Nombre")%> </p>
                    </td>
                    <td>
                        <p><%#Eval("Cantidad")%> </p>
                    </td>
                    <td>
                        <p>
                            <a href='AltaComponente.aspx?ID=<%#Eval("ID")%>' class="btn btn-secondary btn-lg">modificar</a>
                           <asp:Button  type="button" class="btn btn-outline-danger" id="btnEliminar" Text="Eliminar" OnClick="btnEliminar_Click" CommandArgument='<%#Eval("ID")%> ' runat="server"/>
                        </p>
                    </td>
              </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
            <asp:Button type="button" class="btn btn-lg btn-primary" id="btnAlta" Text="Alta nuevo Componente" OnClick="btnAlta_Click" runat="server"/>
     </div>
</asp:Content>
