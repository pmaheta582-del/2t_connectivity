 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="_2t_connectivity.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Registration & Employee List</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            background: #f5f6f8;
            color: #1d1d1d;
            padding: 40px 15px;
        }

        /* Outer Table Form Container */
        form > div > center > table {
            background: #ffffff;
            border: none !important;
            border-collapse: separate !important;
            border-spacing: 0;
            border-radius: 14px;
            padding: 35px 30px;
            box-shadow: 0 10px 30px rgba(7, 26, 54, 0.08);
            width: 100%;
            max-width: 900px;
            text-align: left;
        }

        form > div > center > table > tbody > tr > td {
            border: none !important;
            padding: 10px 12px;
            font-size: 14px;
            color: #30343b;
            vertical-align: middle;
        }

        form > div > center > table > tbody > tr > td:first-child {
            font-weight: 500;
            color: #071a36;
            width: 18%;
            white-space: nowrap;
        }

        /* Input Controls */
        input[type="text"], input[type="password"] {
            width: 100%;
            max-width: 420px;
            height: 44px;
            border: 1px solid #d9dce1;
            border-radius: 8px;
            padding: 0 14px;
            font-family: 'Poppins', sans-serif;
            font-size: 14px;
            outline: none;
            background: #fafafa;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #071a36;
            background: #ffffff;
            box-shadow: 0 0 0 3px rgba(7, 26, 54, 0.1);
        }

        /* DropDownList */
        select {
            width: 100%;
            max-width: 420px;
            height: 44px;
            border: 1px solid #d9dce1;
            border-radius: 8px;
            padding: 0 14px;
            font-family: 'Poppins', sans-serif;
            font-size: 14px;
            outline: none;
            background: #fafafa;
            transition: all 0.3s ease;
        }

        select:focus {
            border-color: #071a36;
            background: #ffffff;
            box-shadow: 0 0 0 3px rgba(7, 26, 54, 0.1);
        }

        /* RadioButtonList */
        #RadioButtonList1 {
            border: none !important;
            background: transparent !important;
            box-shadow: none !important;
            padding: 0 !important;
            margin: 0 !important;
        }

        #RadioButtonList1 td {
            border: none !important;
            padding: 4px 15px 4px 0 !important;
            color: #333;
            font-size: 14px;
        }

        #RadioButtonList1 input[type="radio"] {
            margin-right: 6px;
            accent-color: #071a36;
        }

        /* File Upload */
        input[type="file"] {
            font-family: 'Poppins', sans-serif;
            font-size: 13px;
            color: #555;
            padding: 6px 0;
        }

        /* Save / Update Button */
        input[type="submit"] {
            min-width: 160px;
            height: 46px;
            border: none;
            border-radius: 8px;
            background: #071a36;
            color: white;
            font-family: 'Poppins', sans-serif;
            font-size: 15px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        input[type="submit"]:hover {
            background: #c79b4b;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(199, 155, 75, 0.25);
        }

        /* Login Link */
        #LinkButton3 {
            color: #071a36;
            font-weight: 600;
            text-decoration: none;
            margin-left: 6px;
        }

        #LinkButton3:hover {
            color: #c79b4b;
            text-decoration: underline;
        }

        /* GridView Styling */
        #GridView1 {
            width: 100%;
            border-collapse: collapse !important;
            background: #ffffff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            margin-top: 25px;
            border: 1px solid #e5e7eb !important;
        }

        #GridView1 th {
            background: #071a36;
            color: #ffffff;
            padding: 12px 14px;
            font-size: 13px;
            font-weight: 500;
            text-align: left;
            border: none !important;
        }

        #GridView1 td {
            padding: 10px 14px;
            font-size: 13px;
            color: #374151;
            border-bottom: 1px solid #f0f2f5 !important;
            border-top: none !important;
            border-left: none !important;
            border-right: none !important;
            vertical-align: middle;
        }

        #GridView1 tr:hover td {
            background: #f8fafc;
        }

        #GridView1 img {
            border-radius: 6px;
            object-fit: cover;
            border: 1px solid #e5e7eb;
        }

        #GridView1 a {
            display: inline-block;
            color: #071a36;
            font-weight: 500;
            text-decoration: none;
            padding: 6px 14px;
            border-radius: 6px;
            background: #edf2f7;
            transition: all 0.2s ease;
            font-size: 12px;
        }

        #GridView1 a:hover {
            background: #c79b4b;
            color: #ffffff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <center>
                <table border="1">
                    <tr>
                        <td>Name:</td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Gender:</td>
                        <td>

                            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:RadioButtonList>

                        </td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td>

                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>

                        </td>
                      </tr>
                    <tr>
                        <td>Password:</td>
                        <td>

                            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>

                        </td>
                    </tr>
                    <tr>
                        <td>City:</td>
                        <td>

                            <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem>--Selected City--</asp:ListItem>
                                <asp:ListItem>Rajkot</asp:ListItem>
                                <asp:ListItem>Surat</asp:ListItem>
                                <asp:ListItem>Ahemdabad</asp:ListItem>
                            </asp:DropDownList>

                        </td>
                    </tr>
                    <tr>
                        <td>Address:</td>
                        <td>

                            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>

                        </td>
                    </tr>
                    <tr>
                        <td>Mobile:</td>
                        <td>

                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>

                        </td>
                    </tr>
                    <tr>
                        <td>Image:</td>
                        <td>

                            <asp:FileUpload ID="FileUpload1" runat="server" />

                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>

                            <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" /><br /><br />
                            Already you have a account ?<asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/WebForm2.aspx">Login</asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand1">
                                <Columns>
                                    <asp:TemplateField HeaderText="Id">
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
                                            <asp:Image ID="Image1" runat="server" Height="100" Width="100" ImageUrl='<%# Eval("Image") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Edit">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_edt" Text="Edit"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Delete">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_dlt">Delete</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </center>
        </div>
    </form>
</body>
</html>

