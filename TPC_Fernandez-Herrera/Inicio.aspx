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
                     <% if (item.Estado==true)//colocar los componentes en true
                         {%>
                            <div class="Componente">
                             <img  src="<%= item.ImagenUrl %>" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title"Style="color:red ; display:flex;justify-content:center""><%= item.Nombre %></h5>
                                <h5 class="card-text "Style="color:green ; display:flex;justify-content:center" ><span">$<%= item.Precio %></span></h5>
                                 <div class="columnas" style=" grid-template-columns: repeat(1,1fr)";>
                               <a href="CarritoCompra.aspx?id=<%= item.ID %>"  class="btn btn-secondary"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart-plus-fill" viewBox="0 0 16 16">
  <path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zM9 5.5V7h1.5a.5.5 0 0 1 0 1H9v1.5a.5.5 0 0 1-1 0V8H6.5a.5.5 0 0 1 0-1H8V5.5a.5.5 0 0 1 1 0z"/>
</svg></a>
                                <a href="Detalle.aspx?id=<% = item.ID %>" class="btn btn-secondary">Detalle</a>
                                     </div>
                                </div>
                            </div>
                        <%}%>
            <%} %>
        </div>
    </div>
</asp:Content>
