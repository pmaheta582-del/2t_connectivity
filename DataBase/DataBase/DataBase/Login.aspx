<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DataBase.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <center>
                <div style="background-color: #f4f4f4; padding: 10px; margin-bottom: 20px;">
                    <a href="WebForm1.aspx">Registration</a> | 
                    <a href="Login.aspx">Login</a> | 
                    <a href="User/AddCompany.aspx">Add Company</a> | 
                    <a href="User/ShowCompany.aspx">Show Companies</a> | 
                    <a href="User/AddProducts.aspx">Add Product</a> | 
                    <a href="User/ShowProducts.aspx">View Products &amp; Photos</a>
                </div>
                <h1>Login Here... </h1>
                <table border="3">
                    <tr>
                        <td>Username:</td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>

                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="Login Here" OnClick="Button1_Click" /></td>
                    </tr>
                </table>
                <asp:Label ID="Label6" runat="server"></asp:Label>
            </center>
            
        </div>
    </form>
</body>
</html>
