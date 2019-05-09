<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="employee-table.aspx.cs" Inherits="DatabaseApplications.Employees_Table.employee_table" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Table Employees</title>
    <style>
        table{
            text-align: center;
            width: 80%;
            margin: 50px auto;
        }
        th{
            width:10%;
        }
        tr{
            height: 40px;
        }
        tr:hover{
            background-color: lightgray;
            font-size: 17px;
            transition: 1s;
        }
        form{
        	margin-bottom: 70px;
        }
        .btn{
            position: fixed;
            z-index: 10;
            bottom: 10px;
            right: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <center>
            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SomeeDatabaseConnectionString %>" SelectCommand="SELECT Employees.id_employee, Employees.name, Employees.last_name, Employees.pesel, Adresses.city, Adresses.zip_code, Adresses.street, Departments.department_name, Phones.phone_number FROM Adresses INNER JOIN Employees ON Adresses.id_emoloyee = Employees.id_employee INNER JOIN Departments ON Employees.id_department = Departments.id_department INNER JOIN Phones ON Employees.id_employee = Phones.id_employee"></asp:SqlDataSource>
        </center>
        <asp:Button ID="AddNewEmployee" CssClass="btn btn-primary" runat="server" Text="Add new employee" OnClick="AddNewEmployee_Click" />
    </form>
</body>
</html>
