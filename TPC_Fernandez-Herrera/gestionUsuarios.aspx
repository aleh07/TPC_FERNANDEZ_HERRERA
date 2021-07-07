<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="gestionUsuarios.aspx.cs" Inherits="TPC_Fernandez_Herrera.gestionUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="table-responsive">
    <table class="table">
        <thead>
            <tr>
                <th scope="col">
                    <h4 class="titulo">NombreUsuario</h4>
                </th>
                <th scope="col">
                    <h4 class="titulo">Nombre</h4>
                </th>
                <th scope="col">
                    <h4 class="titulo">Apellido</h4>
                </th>
                <th scope="col">
                    <h4 class="titulo">DNI</h4>
                </th>
                <th scope="col">
                    <h4 class="titulo">Nacimiento</h4>
                </th>
                 
                <th scope="col">
                    <h4 class="titulo">Estado </h4>
                </th>
            </tr>
        </thead>

        <asp:Repeater runat="server" ID="repetidor">
            <ItemTemplate>
                <tbody>
                    <td>
                        <p><%#Eval("NombreUsuario")%></p>
                    </td>
                    <td>
                        <p><%#Eval("Nombre")%></p>
                    </td>
                    <td>
                        <p><%#Eval("Apellido")%></p>
                    </td>
                   
                    <td>
                        <p><%#Eval("Dni")%></p>
                    </td>
                    <td>
                        <p><%#Eval("Fecha")%></p>
                    </td>
                    <td>
                        <p><%#Eval("Estado")%></p>
                    </td>
                </tbody>
            </ItemTemplate>
        </asp:Repeater>
    </table>
     
</div>
</asp:Content>
