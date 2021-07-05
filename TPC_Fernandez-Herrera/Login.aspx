<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TPC_Fernandez_Herrera.Login" %>

<!DOCTYPE html>
<html>
    <head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <title>Compu solution</title>
</head>
<body>
    <form id="form1" runat="server">
          <div class="container">
            <div class="row">
                <div class="col-12 col-md-6 col-lg-6">
                    <h3>Ingreso al sistema</h3>
                     <img class="img-fluid rounded-circle  centrado" src="" alt="cpiprodesign">
                 
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputCity">Usuario</label>
                        <asp:TextBox ID="TextBox1" placeholder="usuario" CssClass="form-control" runat="server"></asp:TextBox>
                    <br />
                     <label for="inputCity">Password</label>

                    <asp:TextBox ID="TextBox2" type="password" placeholder="Password" CssClass="form-control" runat="server"></asp:TextBox><br />
                    <asp:Label ID="Label1" runat="server" ForeColor="#CC0000"></asp:Label>
                    <br />
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Login" OnClick="Button1_Click"/>
              
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </form>
</body>
</html>
