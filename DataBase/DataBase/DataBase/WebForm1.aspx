<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="DataBase.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Form</title>
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
                <h1>Registration Form</h1>
                <table border="3">
                    <tr>
                        <td>First Name:</td>
                        <td>
                            <asp:TextBox ID="txtnm" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Gender</td>
                        <td>
                            <asp:RadioButtonList ID="rdbgen" runat="server" AutoPostBack="True">
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>

                    </tr>
                    <tr>
                        <td>Email</td>
                        <td>
                            <asp:TextBox ID="txtemil" runat="server"></asp:TextBox>

                        </td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td>
                            <asp:TextBox ID="txtpass" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>City</td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                                <asp:ListItem>-- select city --</asp:ListItem>
                                <asp:ListItem>Rajkot</asp:ListItem>
                                <asp:ListItem>Ahmedabad</asp:ListItem>
                                <asp:ListItem>Surat</asp:ListItem>
                                <asp:ListItem>Vadodara</asp:ListItem>
                            </asp:DropDownList>

                        </td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td>
                            <asp:TextBox ID="txtadd" runat="server"></asp:TextBox>

                        </td>
                    </tr>
                    <tr>
                        <td>Mobile</td>
                        <td>
                            <asp:TextBox ID="txtmob" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Image</td>
                        <td>
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="btnsub_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand">
                                <Columns>
                                    <asp:TemplateField HeaderText="ID">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Name">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Gender">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Password">
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="City">
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("City") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Address">
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Mobile">
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Image">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" Height="50px" Width="50px" ImageUrl='<%# Eval("Image") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Edit">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_edt">Edit</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Delete">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_del">Delete</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    </table>
                    
                        
        </div>
    </form>
</body>
</html>
