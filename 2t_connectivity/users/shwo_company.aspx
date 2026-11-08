<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="shwo_company.aspx.cs" Inherits="_2t_connectivity.users.shwo_company" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Show Company</title>
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
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 8px;
        }

        #Label2 {
            display: inline-block;
            margin-bottom: 25px;
            padding: 6px 18px;
            background: #e4eaf2;
            color: #071a36;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 500;
        }

        /* DataList table container */
        #DataList1 {
            border: none !important;
            background: transparent !important;
        }

        #DataList1 > tbody > tr > td {
            border: none !important;
            padding: 15px;
            vertical-align: top;
        }

        /* Each Company Card inside ItemTemplate */
        #DataList1 table {
            background: #ffffff;
            border: none !important;
            border-collapse: separate !important;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 8px 25px rgba(7, 26, 54, 0.07);
            width: 290px;
            text-align: left;
            transition: all 0.3s ease;
        }

        #DataList1 table:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(7, 26, 54, 0.12);
        }

        #DataList1 table tr td {
            border: none !important;
            padding: 6px 4px;
            font-size: 13px;
            color: #4a5568;
            vertical-align: middle;
        }

        #DataList1 table tr td:first-child {
            font-weight: 600;
            color: #071a36;
            width: 45%;
        }

        .price-badge {
            color: #0b8043;
            font-weight: 600;
            font-size: 13px;
            background: #e6f4ea;
            padding: 3px 9px;
            border-radius: 5px;
            display: inline-block;
        }

        #DataList1 img {
            border-radius: 8px;
            object-fit: cover;
            border: 1px solid #e5e7eb;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <center>
                <h1>Company List</h1>
                <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                <br /><br />
                <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
                    <ItemTemplate>
                        <table border="1">
                            <tr>
                                <td>Company Name:</td>
                                <td><%# Eval("Comp_Name") %></td>
                            </tr>
                            <tr>
                                <td>Owner Name:</td>
                                <td><%# Eval("Comp_Owner_Name") %></td>
                            </tr>
                            <tr>
                                <td>Price:</td>
                                <td><span class="price-badge">₹ <%# Eval("Comp_Price") %></span></td>
                            </tr>
                            <tr>
                                <td>Email:</td>
                                <td><%# Eval("Comp_Email") %></td>
                            </tr>
                            <tr>
                                <td>Address:</td>
                                <td><%# Eval("Comp_address") %></td>
                            </tr>
                            <tr>
                                <td>Image:</td>
                                <td>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Comp_Cover_img") %>' Width="100" Height="100" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
                <br />
            </center>
        </div>
    </form>
</body>
</html>

