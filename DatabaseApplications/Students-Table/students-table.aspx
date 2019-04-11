<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="students-table.aspx.cs" Inherits="DatabaseApplications.Students_Table.students_table" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Students</title>
    <style>
        table{
            width: 90%;
            margin-top:15px;
            text-align: center;
        }
        input[type='text']{
            width: 250px;
            height: 30px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            padding-left: 10px;
            margin-top:15px;
        }
        tr:hover{
            background-color: lightgray;
            transition: 1s;
        }
        input[type='button'], input[type='submit']{
            width: 80px;
            height: 40px;
        }
        .invalid{
            color: red;
            display: block;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <center>
            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" 
                BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" 
                 DataKeyNames="Id" 
                AutoGenerateColumns="False" 
                OnRowDeleting="GridView1_RowDeleting" OnRowCancelingEdit="GridView1_RowCancelingEdit" 
                OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" EnableModelValidation="False" ShowFooter="True">
                <Columns>
                    <asp:TemplateField HeaderText="Id" Visible="False">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Id") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" MaxLength="30" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="invalid_name" runat="server" 
                                ControlToValidate="TextBox2" ErrorMessage="Invalid name" 
                                ValidationExpression="^[A-ZŚĆŻÓŃĘĄŁ][a-zćżńóęął]{1,30}$" CssClass="invalid">
                            </asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                           <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" placeholder="Name"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="invalid_name2" runat="server" 
                                ControlToValidate="TextBox5" ErrorMessage="Invalid name" 
                                ValidationExpression="^[A-ZŚĆŻÓŃĘĄŁ][a-zćżńóęął]{1,30}$" CssClass="invalid">
                            </asp:RegularExpressionValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Surname">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" MaxLength="30" runat="server" Text='<%# Bind("Surname") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="invalid_surname" runat="server" 
                                ControlToValidate="TextBox3" ErrorMessage="Invalid surname" 
                                ValidationExpression="^[A-ZŻĆŃĄĘÓŁ][a-zżćńóąęł]{1,30}(?:[-]*[A-ZŻĆŃĄĘÓŁ][a-zżćńóąęł]{1,30})*$" CssClass="invalid">
                            </asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Surname") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" placeholder="Surname"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="invalid_surname2" runat="server" 
                                ControlToValidate="TextBox6" ErrorMessage="Invalid surname" 
                                ValidationExpression="^[A-ZŻĆŃĄĘÓŁ][a-zżćńóąęł]{1,30}(?:[-]*[A-ZŻĆŃĄĘÓŁ][a-zżćńóąęł]{1,30})*$" CssClass="invalid">
                            </asp:RegularExpressionValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Index">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" MaxLength="6" runat="server" Text='<%# Bind("StudentIndex") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="invalid_index" runat="server" 
                                ControlToValidate="TextBox4" ErrorMessage="Invalid index №" 
                                ValidationExpression="[0-9]{1,}" CssClass="invalid">
                            </asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("StudentIndex") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" placeholder="Index №"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="invalid_index2" runat="server" 
                                ControlToValidate="TextBox7" ErrorMessage="Invalid index №" 
                                ValidationExpression="[0-9]{1,}" CssClass="invalid">
                            </asp:RegularExpressionValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                            &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                        </ItemTemplate>
                        <ControlStyle CssClass="btn btn-dark" />
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="Button3" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete?'); "/>
                        </ItemTemplate>
                        <ControlStyle CssClass="btn btn-danger" />
                        <FooterTemplate>
                            <asp:Button ID="Button4" runat="server" OnClick="AddNew" CssClass="btn btn-success" Text="Add +"></asp:Button>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="LightGray" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
            <asp:Label ID="Label5" runat="server" Text="Please don't leave empty fields" CssClass="invalid" Visible="false"></asp:Label>
        </center>
    </form>
</body>
</html>
