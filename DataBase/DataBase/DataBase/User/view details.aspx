<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view details.aspx.cs" Inherits="DataBase.User.view_details" %>

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
                    <a href="ShowCompany.aspx">Show Companies</a> | 
                    <a href="ShowProducts.aspx">View Products</a> | 
                    <a href="addtocart.aspx">My Cart</a>
                </div>

                <h1>Product Details</h1>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                <br /><br />
                <asp:DataList ID="DataList1" runat="server" style="margin-bottom: 1px" OnItemCommand="DataList1_ItemCommand">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Prod_Img") %>' Width="200px" Height="200px" />
                        <br /><br />
                        <b>Product Name:</b> <asp:Label ID="Name" runat="server" Text='<%# Eval("Prod_Name") %>'></asp:Label>
                        <br />
                        <b>Price:</b> &#8377;<asp:Label ID="Price" runat="server" Text='<%# Eval("Prod_Price") %>'></asp:Label>
                        <br />
                        <b>Configuration:</b> <asp:Label ID="Config" runat="server" Text='<%# Eval("Prod_Config") %>'></asp:Label>
                        <br />
                        <b>Description:</b> <asp:Label ID="Desc" runat="server" Text='<%# Eval("Prod_Desc") %>'></asp:Label>
                        <br /><br />
                        <asp:Button ID="btnViewDetail" runat="server" CommandName="cmd_vdtl" CommandArgument='<%# Eval("Prod_Id") %>' Text="View Detail" />
                        &nbsp;
                        <asp:Button ID="btnAddToCart" runat="server" CommandName="cmd_cart" CommandArgument='<%# Eval("Prod_Id") %>' Text="Add to Cart" />
                    </ItemTemplate>
                </asp:DataList>
            </center>
        </div>
    </form>
</body>
</html>
