<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adv-user-page.aspx.cs" Inherits="DatabaseApplications.AdminPanel.adv_user_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"/>
    <title>Advanced user page</title>
    <style>
        table{
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <header>
              <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                  <a href="" class="navbar-brand">ADVANCED USER PAGE</a>
                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                      <li class="nav-item active">
                          <asp:Label ID="userInfoLabel" CssClass="nav-link" runat="server" Text=""></asp:Label>
                      </li>
                    </ul>
                    </div>
                    <asp:Button ID="logout" runat="server" CssClass="btn btn-outline-light" Text="Logout" OnClick="logout_Click" />
              </nav>
            </header>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" 
                BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                <Columns>
                    <asp:BoundField DataField="login" HeaderText="Username" SortExpression="login" />
                    <asp:BoundField DataField="role_name" HeaderText="Role" SortExpression="role_name" />
                    <asp:BoundField DataField="role_description" HeaderText="Role description" SortExpression="role_description" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SomeeDatabaseConnectionString %>" SelectCommand="SELECT Users.login, Roles.role_name, Roles.role_description FROM Users INNER JOIN Roles ON Users.role_id = Roles.id_role"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
