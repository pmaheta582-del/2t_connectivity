<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCompany.aspx.cs" Inherits="DataBase.User.AddCompany" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Company</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <center>
                <div style="background-color: #f4f4f4; padding: 10px; margin-bottom: 20px;">
                    <a href="../WebForm1.aspx">Registration</a> | 
                    <a href="../Login.aspx">Login</a> | 
                    <a href="AddCompany.aspx">Add Company</a> | 
                    <a href="ShowCompany.aspx">Show Companies</a> | 
                    <a href="AddProducts.aspx">Add Product</a> | 
                    <a href="ShowProducts.aspx">View Products &amp; Photos</a>
                </div>

                <h2>Add Company</h2>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                <br /><br />
                <table>
                    <tr>
                        <td>Company Name</td>
                        <td>
                            <asp:TextBox ID="txtnm" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Company Owner Name</td>
                        <td>
                            <asp:TextBox ID="txtonm" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Company Email</td>
                        <td>
                            <asp:TextBox ID="txteml" runat="server" TextMode="Email"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Company Address</td>
                        <td>
                            <asp:TextBox ID="txtadd" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Company Cover Image</td>
                        <td>
                            <asp:FileUpload ID="fimg" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="btnAddCompany" runat="server" Text="Add Company" OnClick="btnAddCompany_Click" />
                        </td>
                    </tr>
                </table>


            </center>
        </div>
        
    </form>
</body>
</html>
