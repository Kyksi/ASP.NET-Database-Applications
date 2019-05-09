<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add-new-employee.aspx.cs" Inherits="DatabaseApplications.Employees_Table.add_new_employee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Add new employee</title>
    <style>
        .form-row{
            margin: 10px;
        }
        .btn{
            width: 150px;
        }
        .invalid{
            color: red;
        }
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 50%;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: center;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <center style="margin-top: 50px;">
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="PersonalInfoView" runat="server">
                    <div class="form-row col-3">
                        <label for="inputName">Name: </label>
                        <asp:TextBox ID="txt_name" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="invalid_name" runat="server" 
                                ControlToValidate="txt_name" ErrorMessage="Invalid name" 
                                ValidationExpression="^[A-ZŚĆŻÓŃĘĄŁ][a-zćżńóęął]{1,30}$" CssClass="invalid">
                        </asp:RegularExpressionValidator>
                    </div>
                    <div class="form-row col-3">
                        <label for="inputSurname">Last name: </label>
                        <asp:TextBox ID="txt_last_name" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="invalid_surname" runat="server" 
                                ControlToValidate="txt_last_name" ErrorMessage="Invalid Last name" 
                                ValidationExpression="^[A-ZŻĆŃĄĘÓŁ][a-zżćńóąęł]{1,30}(?:[-]*[A-ZŻĆŃĄĘÓŁ][a-zżćńóąęł]{1,30})*$" CssClass="invalid">
                        </asp:RegularExpressionValidator>
                    </div>
                    <div class="form-row col-3">
                        <label for="inputName">Pesel: </label>
                        <asp:TextBox ID="txt_pesel" runat="server" CssClass="form-control" MaxLength="11"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="invalid_pesel" runat="server" 
                                ControlToValidate="txt_pesel" ErrorMessage="Invalid pesel" 
                                ValidationExpression="[0-9]{11}" CssClass="invalid">
                        </asp:RegularExpressionValidator>
                    </div>
                    <div class="form-row col-3">
                        <label for="inputSurname">Department: </label>
                        <asp:DropDownList ID="departmentDropDownList" runat="server" DataSourceID="SqlDataSource1" AppendDataBoundItems="True"
                            DataTextField="department_name" DataValueField="department_name" style="margin-left: 30px; width: 220px;">
                            <asp:ListItem Text="Please choose department"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:SomeeDatabaseConnectionString %>" 
                            SelectCommand="SELECT [department_name] FROM [Departments]">
                        </asp:SqlDataSource>
                    </div>
                        <asp:Label ID="err_msg1" runat="server" Visible="false" Text="Please don't leave empty fields" CssClass="invalid"></asp:Label>
                    <div style="margin-top: 50px;" class="form-row col-3">
                        <div style="margin: auto;" class="form-group">    
                            <asp:Button ID="btnCancel" runat="server" Text="⤫ Cancel" CssClass="btn btn-danger" OnClick="btnCancel_Click"></asp:Button>
                        </div>
                        <div style="margin: auto;" class="form-group">    
                            <asp:Button ID="btnGoNextToSecondView" runat="server" Text="Next ⇨" CssClass="btn btn-primary" OnClick="btnGoNextToSecondView_Click"></asp:Button>
                        </div>
                    </div>
                </asp:View>

                <asp:View ID="AddressView" runat="server">
                    <div class="form-row col-3">
                        <label for="inputCity">City: </label>
                        <asp:TextBox ID="txt_city" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="invalid_city" runat="server" 
                                ControlToValidate="txt_city" ErrorMessage="Invalid City name" 
                                ValidationExpression="^[a-zżćńóąęłA-ZŻĆŃĄĘÓŁ]+(?:[\s-][a-zżćńóąęłA-ZŻĆŃĄĘÓŁ]+)*$" CssClass="invalid">
                        </asp:RegularExpressionValidator>
                    </div>
                    <div class="form-row col-3">
                        <label for="inputStreet">Street: </label>
                        <asp:TextBox ID="txt_street" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="invalid_street" runat="server" 
                                ControlToValidate="txt_street" ErrorMessage="Invalid street name" 
                                ValidationExpression="^[a-zżćńóąęłA-ZŻĆŃĄĘÓŁ0-9.]{1,30}(?:[\s-][a-zżćńóąęłA-ZŻĆŃĄĘÓŁ0-9.]{1,30})*$" CssClass="invalid">
                        </asp:RegularExpressionValidator>
                    </div>
                    <div class="form-row col-3">
                        <label for="inputZip">Zip-code: </label>
                        <asp:TextBox ID="txt_zip" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="invalid_zip" runat="server" 
                                ControlToValidate="txt_zip" ErrorMessage="Invalid zip code" 
                                ValidationExpression="[0-9]{2}-[0-9]{3}" CssClass="invalid">
                        </asp:RegularExpressionValidator>
                    </div>
                    <asp:Label ID="err_msg2" runat="server" Visible="false" Text="Please don't leave empty fields" CssClass="invalid"></asp:Label>
                    <div style="margin-top: 50px;" class="form-row col-3">
                        <div style="margin: auto;" class="form-group">    
                            <asp:Button ID="btnGoBackToFirstView" runat="server" Text="⇦ Previous" CssClass="btn btn-primary" OnClick="btnGoBackToFirstView_Click"></asp:Button>
                        </div>
                        <div style="margin: auto;" class="form-group">
                            <asp:Button ID="btnGoNextToThirdView" runat="server" Text="Next ⇨" CssClass="btn btn-primary" OnClick="btnGoNextToThirdView_Click"></asp:Button>
                        </div>
                    </div>
                </asp:View>
                <asp:View ID="PhoneNrView" runat="server">
                    <div class="form-row col-3">
                        <label for="inputPhone1">Main phone number: </label>
                        <asp:TextBox ID="txt_phone1" runat="server" CssClass="form-control" AutoPostBack="True"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="invalid_phone1" runat="server" 
                                ControlToValidate="txt_phone1" ErrorMessage="Invalid phone number" 
                                ValidationExpression="^[+]*[0-9]{1,4}[-\s0-9]{4,12}$" CssClass="invalid">
                        </asp:RegularExpressionValidator>
                    </div>
                    <div class="form-row col-3">
                        <label for="inputPhone2">Aditional phone number (if exist): </label>
                        <asp:TextBox ID="txt_phone2" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="invalid_phone2" runat="server" 
                                ControlToValidate="txt_phone2" ErrorMessage="Invalid phone number" 
                                ValidationExpression="^[+]*[0-9]{1,4}[-\s0-9]{4,12}$" CssClass="invalid">
                        </asp:RegularExpressionValidator>
                    </div>
                    <asp:Label ID="err_msg3" runat="server" Visible="false" Text="Please don't leave empty fields" CssClass="invalid"></asp:Label>
                    <div style="margin-top: 50px;" class="form-row col-3">
                        <div style="margin: auto;" class="form-group">
                            <asp:Button ID="btnGoBackToSecondView" runat="server" Text="⇦ Previous" CssClass="btn btn-primary" OnClick="btnGoBackToSecondView_Click"></asp:Button>
                        </div>
                        <div style="margin: auto;" class="form-group">    
                            <asp:Button ID="btnGoNextToFoursView" runat="server" Text="Next ⇨" CssClass="btn btn-primary" OnClick="btnGoNextToFoursView_Click"></asp:Button>
                        </div>
                    </div>
                </asp:View>
                <asp:View ID="Summary" runat="server">
                    <div>
                        <table>
                            <tr>
                                <td>Name: </td>
                                <td>
                                    <asp:Label ID="label_name" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Last name: </td>
                                <td>
                                    <asp:Label ID="label_last_name" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Pesel: </td>
                                <td>
                                    <asp:Label ID="label_pesel" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Department: </td>
                                <td>
                                    <asp:Label ID="label_department" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Address: </td>
                                <td>
                                    <asp:Label ID="label_address" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Main phone number: </td>
                                <td>
                                    <asp:Label ID="label_phone1" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Aditional phone number: </td>
                                <td>
                                    <asp:Label ID="label_phone2" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <div style="margin-top: 50px;" class="form-row col-3">
                            <div style="margin: auto;" class="form-group">
                                <asp:Button ID="btnGoBackToThirdView" runat="server" Text="⇦ Previous" CssClass="btn btn-primary" OnClick="btnGoBackToThirdView_Click"></asp:Button>
                            </div>
                            <div style="margin: auto;" class="form-group">    
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit ⇨" CssClass="btn btn-success" OnClick="btnSubmit_Click"></asp:Button>
                            </div>
                        </div>
                    </div>
                </asp:View>
            </asp:MultiView>
        </center>
    </form>
</body>
</html>
