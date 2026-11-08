<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Products.aspx.cs" Inherits="_2t_connectivity.users.Add_Products" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Add Product</title>
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
            padding: 40px 20px;
        }

        h1 {
            color: #071a36;
            font-size: 30px;
            font-weight: 600;
            margin-bottom: 6px;
        }

        #Label1 {
            display: inline-block;
            margin-bottom: 12px;
            padding: 5px 16px;
            background: #e4eaf2;
            color: #071a36;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 500;
        }

        #LinkButton1 {
            display: inline-block;
            margin-bottom: 25px;
            color: #071a36;
            font-weight: 600;
            text-decoration: none;
            padding: 6px 16px;
            background: #ffffff;
            border-radius: 6px;
            border: 1px solid #d9dce1;
            font-size: 13px;
            transition: all 0.3s ease;
        }

        #LinkButton1:hover {
            background: #071a36;
            color: #ffffff;
            border-color: #071a36;
        }

        /* Modern Card Table */
        table {
            background: #ffffff;
            border: none !important;
            border-collapse: separate !important;
            border-spacing: 0;
            border-radius: 14px;
            padding: 35px 32px;
            box-shadow: 0 10px 30px rgba(7, 26, 54, 0.08);
            width: 100%;
            max-width: 560px;
            text-align: left;
        }

        table tr td {
            border: none !important;
            padding: 10px 12px;
            font-size: 14px;
            color: #30343b;
            vertical-align: middle;
        }

        table tr td:first-child {
            font-weight: 500;
            color: #071a36;
            width: 42%;
            white-space: nowrap;
        }

        input[type="text"], select {
            width: 100%;
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

        input[type="text"]:focus, select:focus {
            border-color: #071a36;
            background: #ffffff;
            box-shadow: 0 0 0 3px rgba(7, 26, 54, 0.1);
        }

        input[type="file"] {
            font-family: 'Poppins', sans-serif;
            font-size: 13px;
            color: #555;
            padding: 6px 0;
            width: 100%;
        }

        input[type="submit"] {
            width: 100%;
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
            margin-top: 8px;
        }

        input[type="submit"]:hover {
            background: #c79b4b;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(199, 155, 75, 0.25);
        }

        @media screen and (max-width: 600px) {
            table {
                padding: 22px 18px;
            }
            table tr td {
                display: block;
                width: 100% !important;
                padding: 6px 0;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <center>
                <h1>Add Product</h1>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                <br />
                <br />
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Show Company</asp:LinkButton>
                <br />
                <table border="3">
                    <tr>
                        <td>Company Name:</td>
                        <td>
                            <asp:DropDownList ID="drpcid" runat="server" AutoPostBack="True">
                                <asp:ListItem>--Select Compnay--</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>Product Name:</td>
                        <td>
                            <asp:TextBox ID="pnm" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Product Model:</td>
                        <td>
                            <asp:TextBox ID="pmdl" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Product Description:</td>
                        <td>
                            <asp:TextBox ID="pdecs" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Product Weight:</td>
                        <td>
                            <asp:TextBox ID="twgt" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Product Configuration:</td>
                        <td>
                            <asp:TextBox ID="pconfi" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Product Image:</td>
                        <td>
                            <asp:FileUpload ID="fimg" runat="server" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" /></td>
                    </tr>
                </table>
            </center>
        </div>
    </form>
</body>
</html>

