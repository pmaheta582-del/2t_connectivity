<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowProducts.aspx.cs" Inherits="DataBase.User.ShowProducts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mobile Products &amp; Photos</title>
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

                <h1>
                    <asp:Label ID="lblTitle" runat="server" Text="Mobile Products &amp; Photos"></asp:Label>
                </h1>
                <br />

                <asp:Label ID="lblNoData" runat="server" Text="No products found for this company." Visible="false"></asp:Label>

                <asp:DataList ID="DataListProducts" runat="server" RepeatDirection="Horizontal" RepeatColumns="3" OnItemCommand="DataListProducts_ItemCommand">
                    <ItemTemplate>
                        <table border="1" cellpadding="8" cellspacing="0" style="margin: 10px; text-align: center;">
                            <tr>
                                <td align="center">
                                    <asp:Image ID="imgProd" runat="server" ImageUrl='<%# Eval("Prod_Img") %>' Width="160px" Height="160px" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <b><asp:Label ID="lblProdName" runat="server" Text='<%# Eval("Prod_Name") %>'></asp:Label></b>
                                    <br />
                                    <span style="color: #2b8a3e; font-weight: bold; font-size: 15px;">
                                        &#8377;<asp:Label ID="lblProdPrice" runat="server" Text='<%# Eval("Prod_Price") %>'></asp:Label>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:LinkButton ID="lnkViewDetail" runat="server" CommandName="ViewDetail" CommandArgument='<%# Eval("Prod_Id") %>'>View Detail</asp:LinkButton>
                                    &nbsp; | &nbsp;
                                    <asp:LinkButton ID="lnkAddToCart" runat="server" CommandName="AddToCart" CommandArgument='<%# Eval("Prod_Id") %>'>Add to Cart</asp:LinkButton>
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
