<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user-page.aspx.cs" Inherits="DatabaseApplications.AdminPanel.user_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"/>
    <title>User page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <header>
              <nav class="navbar navbar-expand-lg navbar-light bg-light">
                  <a href="" class="navbar-brand">USER PAGE</a>
                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                      <li class="nav-item active">
                          <asp:Label ID="userInfoLabel" CssClass="nav-link" runat="server" Text=""></asp:Label>
                      </li>
                    </ul>
                    <form class="form-inline my-4 my-lg-0">
                        <asp:Button ID="logout" runat="server" CssClass="btn btn-outline-dark" Text="Logout" OnClick="logout_Click" />
                    </form>
                  </div>
              </nav>
            </header>
        </div>
    </form>
</body>
</html>
