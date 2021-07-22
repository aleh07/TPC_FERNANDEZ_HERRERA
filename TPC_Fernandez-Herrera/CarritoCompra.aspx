<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CarritoCompra.aspx.cs" Inherits="TPC_Fernandez_Herrera.CarritoCompra" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div  class="main-container">
        
		<table class="table">
			<thead>
				<tr>
					<th>Imagen</th><th>Nombre</th><th>Precio</th><th>Marca</th><th>Cantidad</th><th>Elija una opcion</th>
				</tr>
			</thead>
               <asp:Repeater runat="server" ID="repetidor">
            <ItemTemplate>
			<tr>
                <td> <img style="width:50px ; height:50px" src="<%#Eval("Componente.ImagenUrl")%>" class="img-thumbnail" alt="..."></td>
				<td> <p><%#Eval("Componente.Nombre")%></p></td>  
                <td> <p>$<asp:Label ID="Label1" runat="server" Text='<%#Eval("Subtotal")%>' /></p></td>
                <td>  <p><%#Eval("Componente.marca.Nombre")%></p></td>
                <td> <p><asp:TextBox TextMode="Number" runat="server" OnTextChanged="txtCantidad_TextChanged" Text='<%#Eval("Cantidad")%>' ID="txtCantidad" min="1" /></p></td>
			    <td> <p>   
                        <asp:Button Text="Agregar" CssClass="btn-primary" AutoPostBack="true" ID="btnAgregar" OnClick="btnAgregar_Click" CommandArgument='<%#Eval("Componente.ID")%>' runat="server" />                     
                                                       
                        <asp:Button Text="Eliminar" CssClass="btn-danger" AutoPostBack="true" ID="Button2" Onclick="btnEliminar_Click1" CommandArgument='<%#Eval("Componente.ID")%>' runat="server" />
                    </p>

			   </td
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
              <p class="d-flex justify-content-end" style="margin-right:60px"><asp:Button Text="Comprar"   CssClass="btn-outline-primary" AutoPostBack="true" ID="btnComprar" Onclick="BtnComprar_Click" runat="server" /></p>


</asp:Content>
