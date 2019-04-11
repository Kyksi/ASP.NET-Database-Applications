<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="employee-table.aspx.cs" Inherits="DatabaseApplications.Employees_Table.employee_table" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <center>
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
            <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:SomeeDatabaseConnectionString %>" 
                SelectCommand="SELECT Employees.id_employee, Employees.name, Employees.last_name, Employees.pesel, Adresses.city, Adresses.zip_code, Adresses.street, Departments.department_name, Phones.phone_number FROM Adresses INNER JOIN Employees ON Adresses.id_emoloyee = Employees.id_employee INNER JOIN Departments ON Employees.id_department = Departments.id_department INNER JOIN Phones ON Employees.id_employee = Phones.id_employee">
            </asp:SqlDataSource>
        </center>
    </form>
</body>
</html>
