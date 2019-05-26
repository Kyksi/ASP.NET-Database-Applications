<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DatabaseApplications.Login.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"/>
    <style>
        .container{
            text-align: center;
            margin-top: 80px; 
            width: 25%;
        }
        .btn{
            width: 250px;
        }
        #LoginResult{
            color: red;
        }
    </style>
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mx-auto">
            <div class="form-group">
                <label>Login</label>
                <asp:TextBox ID="login" CssClass="form-control" MaxLength="50" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Password</label>
                <asp:TextBox MaxLength="30" CssClass="form-control" ID="password" TextMode="Password" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            </div>
            <asp:Label ID="LoginResult" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
