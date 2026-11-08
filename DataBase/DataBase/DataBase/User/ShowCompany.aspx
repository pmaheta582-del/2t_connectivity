<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowCompany.aspx.cs" Inherits="DataBase.User.ShowCompany" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>All Mobile Companies</title>
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

                <h1>All Mobile Companies</h1>
                <br />
                
                <asp:DataList ID="DataList1" runat="server" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" RepeatDirection="Horizontal" RepeatColumns="3">
                    <ItemTemplate>
                        <table border="1" cellpadding="10" cellspacing="0" style="margin: 10px; text-align: center;">
                            <tr>
                                <td align="center">
                                    <a href='ShowProducts.aspx?cid=<%# Eval("Comp_Id") %>'>
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Comp_Cover_img") %>' Width="180px" Height="100px" />
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <a href='ShowProducts.aspx?cid=<%# Eval("Comp_Id") %>'>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Comp_Name") %>'></asp:Label>
                                    </a>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
                
            </center>
        </div>
    </form>
</body>
</html>
