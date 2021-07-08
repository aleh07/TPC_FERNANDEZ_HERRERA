<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TPC_Fernandez_Herrera.Login" %>

<!DOCTYPE html>
<html>
    <head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <title>Compu solution</title>
</head>
<body>


           
                <form class="col-12" runat="server">
                    <h1>Ingresar</h1>
                    <div class="form-group" id="user-group">
                        <asp:TextBox ID="TxtUser" placeholder="usuario" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <br />
                    <div class="form-group" id="contrasena-group">
                        <asp:TextBox ID="TxtPass" type="password" placeholder="Password" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <br />
                    <asp:Button ID="btnIngresar" runat="server" CssClass="btn btn-primary" Text="Login" OnClick="btnIngresar_Click" />
                <br />
                </form>
                <br />
                <div class="col-12 forgot">
                    <a href="#">Recordar contrasena?</a>
                </div>

</body>
</html>
