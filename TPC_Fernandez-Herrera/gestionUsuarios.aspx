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

                </tr>
            </thead>



            <%foreach (Dominio.Usuario item in listaUsuarios)
                {%>
            <tr>
                <td>
                    <p><%=item.ID%></p>
                </td>
                <td>
                    <p><%=item.Nombre%></p>
                </td>

                <td>
                    <p><%=item.Apellido%></p>
                </td>

                <td>
                    <p><%=item.Email%></p>
                </td>
                <td>
                    <p><%=item.Pass%></p>
                </td>
                <td>
                    <p><%=item.Tipo%></p>
                </td>


            </tr>


            <%} %>
        </table>

    </div>
</asp:Content>
