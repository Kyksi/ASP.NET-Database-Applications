<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin-page.aspx.cs" Inherits="DatabaseApplications.AdminPanel.admin_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"/>
    <title>Admin page</title>
    <style>
        .form{
            margin-top: 60px;
        }
        table{
            width: 100%;
        }
        #LabelError{
            color: red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <header>
              <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                  <a href="" class="navbar-brand">ADMIN PAGE</a>
                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                      <li class="nav-item active">
                          <asp:Label ID="userInfoLabel" CssClass="nav-link" runat="server" Text="Username: "></asp:Label>
                      </li>
                    </ul>
                    <form class="form-inline my-4 my-lg-0">
                        <asp:Button ID="logout" runat="server" CssClass="btn btn-outline-light" Text="Logout" OnClick="logout_Click" />
                    </form>
                  </div>
              </nav>
            </header>
            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" 
                BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" 
                 DataKeyNames="id_user" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" EnableModelValidation="False" >
                <Columns>
                    <asp:TemplateField HeaderText="Id">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("id_user") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Username">
                        <ItemTemplate>
                           <asp:Label ID="Label2" runat="server" Text='<%# Bind("login") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Role">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("role_name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Role Description">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("role_description") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="Button3" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete?'); "/>
                        </ItemTemplate>
                        <ControlStyle CssClass="btn btn-danger" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <div class="form col-sm-4">
                <label>Select id of user you want to edit</label>
                <asp:DropDownList ID="DropID_user" runat="server" CssClass="form-control" DataSourceID="id_source" DataTextField="id_user" DataValueField="id_user" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DropID_user_SelectedIndexChanged">
                    <asp:ListItem>Please select id</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="id_source" runat="server" ConnectionString="<%$ ConnectionStrings:SomeeDatabaseConnectionString %>" SelectCommand="SELECT [id_user] FROM [Users]"></asp:SqlDataSource>
                <div class="form-group">
                    <label>Username: </label>
                    <asp:TextBox ID="TextBoxUsername" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Password: </label>
                    <asp:TextBox ID="TextBoxPassword" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                     <label>Role: </label>
                    <asp:DropDownList ID="DropRole" runat="server" CssClass="form-control" DataSourceID="role_source" DataTextField="role_name" DataValueField="role_name">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="role_source" runat="server" ConnectionString="<%$ ConnectionStrings:SomeeDatabaseConnectionString %>" SelectCommand="SELECT [role_name] FROM [Roles]"></asp:SqlDataSource>
                </div>
                <div class="form-group">
                    <asp:Label ID="LabelError" runat="server" Text=""></asp:Label>
                </div>
                <div class="form-groupl">
                    <asp:Button ID="Edit" runat="server" CssClass="btn btn-outline-warning" Text="Edit user" OnClick="Edit_Click" />
                    <asp:Button ID="Add_new" runat="server" CssClass="btn btn-primary" Text="Add new user" OnClick="Add_new_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
