<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DatabaseApplications.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"/>
<style>
    .container{
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        font-size: 20px;
    }
    .students{
        margin: 100px 100px 100px 100px;
        width: 300px;
        height: 300px;
        background-color: coral;
        border-radius: 50px;
        display: flex;
        align-items: center;
        justify-content: center;
        transition: 1s;
    }
    .employees{
        margin: 100px 100px 100px 100px;
        width: 300px;
        height: 300px;
        background-color: darkcyan;
        border-radius: 50px;
        display: flex;
        align-items: center;
        justify-content: center;
        transition: 1s;
    }
    .students:hover, .employees:hover{
        -webkit-transform: scale(1.3);
        -ms-ransform: scale(1.3);
        transform: scale(1.3);
    }
    span{
         color: white;
    }
</style>
    <title>Default</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <a href="Students-Table/students-table.aspx" style="text-decoration: none">
                <div class="students">
                    <span>Students...</span>
                </div>
            </a>
            <a href="Employees-Table/employee-table.aspx" style="text-decoration: none">
                <div class="employees">
                    <span>Employees...</span>
                </div>
            </a>
        </div>
    </form>
</body>
</html>
