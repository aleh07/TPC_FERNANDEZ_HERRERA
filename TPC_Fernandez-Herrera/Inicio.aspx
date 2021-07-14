<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="TPC_Fernandez_Herrera.Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--banner-->
    <div class="cover d-flex justify-content-center align-items-center flex-column ">
        <h1>Compu Solution
        </h1>
        <p>
            Todo lo que necesitas esta aca
        </p>
        <a class="btn btn-dark" href="NuestraEmpresa.aspx" runat="server">Conoce mas</a>
    </div>
    <!--textbox de buscar-->
    <div class="container">
        <div class="d-flex justify-content-center">
            <asp:TextBox ID="TxtBuscar" runat="server" ></asp:TextBox>
            <asp:Button ID="BtnBuscar" style="margin-left:5px;" class="btn btn-outline-dark" OnClick="BtnBuscar_Click" runat="server" Text="Buscar" />
        </div>
        <!--cards -->
        <div class="row row-cols-1 row-cols-md-4 g-4 "style="padding:2rem">

            <%foreach (Dominio.Componente item in listaComponentes)
                {%>

                <div class="Componente">
                    <img src="<%= item.ImagenUrl %>" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title"Style="color:red ; display:flex;justify-content:center""><%= item.Nombre %></h5>

                        <h5 class="card-text "Style="color:green ; display:flex;justify-content:center" ><span">$<%= item.Precio %></span></h5>
                         <div class="columnas">
                        <a href="CarritoCompra.aspx?id=<% = item.ID %>"  class="btn btn-secondary">Carrito</a>
                        <a href="Detalle.aspx" class="btn btn-secondary">Detalle</a>
                             </div>
                    </div>
                </div>
            <%} %>
        </div>
    </div>
</asp:Content>
