<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="gestionUsuarios.aspx.cs" Inherits="TPC_Fernandez_Herrera.gestionUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="main-container">
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">
                        <h4 class="titulo">ID</h4>
                    </th>

                    <th scope="col">
                        <h4 class="titulo">Nombre</h4>
                    </th>
                    <th scope="col">
                        <h4 class="titulo">Apellido</h4>
                    </th>
                    <th scope="col">
                        <h4 class="titulo">Email</h4>
                    </th>

                    <th scope="col">
                        <h4 class="titulo">Contraseña</h4>
                    </th>
                    <th scope="col">
                        <h4 class="titulo">Tipo de cuenta</h4>
                    </th>
                    <th>
                  <asp:Button type="button" class="btn btn-lg btn-primary" id="btnAlta" Text="Alta Usuario" OnClick="btnAlta_Click" runat="server"/>
                </th>
                </tr>
            </thead>

             <asp:Repeater runat="server" ID="repetidor">
            <ItemTemplate>
         <tr>
                    <td>
                        <p><%#Eval("ID")%> </p>
                    </td>                   
                    <td>
                       <p><%#Eval("Nombre")%> </p>
                    </td>
                    <td>
                       <p><%#Eval("Apellido")%> </p> 
                    </td>
                    <td>
                        <p><%#Eval("Email")%> </p>
                    </td>
                    <td>
                        <p><%#Eval("Pass")%> </p>
                    </td>
                    <td>
                        <p><%#Eval("Tipo")%> </p>
                    </td>
                    <td>
                        <p>
                            <a href='RegistrarCuenta.aspx?ID=<%#Eval("ID")%>' class="btn btn-secondary btn-lg">modificar</a>
                           <asp:Button  type="button" class="btn btn-outline-danger" id="btnEliminar" Text="Eliminar" OnClick="btnEliminar_Click" CommandArgument='<%#Eval("ID")%> ' runat="server"/>
                        </p>
                    </td>
              </tr>
            </ItemTemplate>
        </asp:Repeater>
        </table>

    </div>
</asp:Content>
