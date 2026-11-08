<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProducts.aspx.cs" Inherits="DataBase.User.AddProducts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add &amp; View Products</title>
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

                <h2>Add Product</h2>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                <br /><br />
                <table>
                    <tr>
                        <td>Select Company</td>
                        <td>
                            <asp:DropDownList ID="drpcid" runat="server">
                                <asp:ListItem Text="-- Select Company --" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>Product Name</td>
                        <td>
                            <asp:TextBox ID="pnm" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Product Model</td>
                        <td>
                            <asp:TextBox ID="pmdl" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Product Description</td>
                        <td>
                            <asp:TextBox ID="pdecs" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Product Weight</td>
                        <td>
                            <asp:TextBox ID="twgt" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Product Configuration</td>
                        <td>
                            <asp:TextBox ID="pconfi" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Product Price (&#8377;)</td>
                        <td>
                            <asp:TextBox ID="pprice" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Product Image</td>
                        <td>
                            <asp:FileUpload ID="fuProductImage" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="btnAddProduct" runat="server" Text="Add Product" OnClick="btnAddProduct_Click" />
                        </td>
                    </tr>
                </table>



            </center>
        </div>
    </form>
</body>
</html>
