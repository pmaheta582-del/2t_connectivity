<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="_2t_connectivity.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Stilo - Dashboard</title>

    <style>

        @import url('https://fonts.googleapis.com/css2?family=Allison&family=Poppins:wght@300;400;500;600;700&display=swap');

        /* =========================
           RESET
        ========================= */

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
        }

        /* =========================
           MAIN LAYOUT
        ========================= */

        .dashboard {
            min-height: 100vh;
            display: flex;
        }

        /* =========================
           SIDEBAR
        ========================= */

        .sidebar {
            width: 260px;
            min-height: 100vh;
            background: #071a36;
            padding: 35px 25px;
            position: fixed;
            left: 0;
            top: 0;
            bottom: 0;
            display: flex;
            flex-direction: column;
        }

        .logo {
            font-family: 'Allison', cursive;
            font-size: 65px;
            color: #f6e5c3;
            text-align: center;
            margin-bottom: 50px;
        }

        .menu-title {
            color: #8d99aa;
            font-size: 11px;
            font-weight: 600;
            letter-spacing: 2px;
            text-transform: uppercase;
            margin-bottom: 15px;
            padding-left: 10px;
        }

        .menu {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .dashboard-link {
            width: 100%;
            display: block;
            padding: 15px 18px;
            border-radius: 8px;
            text-decoration: none;
            color: #dce2eb;
            background: transparent;
            font-family: 'Poppins', sans-serif;
            font-size: 14px;
            font-weight: 500;
            border: none;
            cursor: pointer;
            text-align: left;
            transition: all 0.3s ease;
        }

        .dashboard-link:hover {
            background: #123b70;
            color: #ffffff;
            transform: translateX(5px);
        }

        .dashboard-link.active {
            background: #c79b4b;
            color: #ffffff;
        }

        /* =========================
           MAIN CONTENT
        ========================= */

        .main-content {
            margin-left: 260px;
            width: calc(100% - 260px);
            min-height: 100vh;
        }

        /* =========================
           TOP NAVBAR
        ========================= */

        .topbar {
            height: 85px;
            background: #ffffff;
            border-bottom: 1px solid #e5e7eb;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 45px;
        }

        .page-title {
            color: #071a36;
            font-size: 25px;
            font-weight: 600;
        }

        .admin-name {
            color: #777;
            font-size: 13px;
        }

        .admin-name span {
            color: #071a36;
            font-weight: 600;
        }

        /* =========================
           CONTENT
        ========================= */

        .content {
            padding: 45px;
        }

        .welcome-section {
            margin-bottom: 35px;
        }

        .welcome-section h1 {
            color: #071a36;
            font-size: 32px;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .welcome-section p {
            color: #777;
            font-size: 14px;
        }

        /* =========================
           DASHBOARD CARDS
        ========================= */

        .card-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 25px;
            max-width: 900px;
        }

        .dashboard-card {
            background: #ffffff;
            border-radius: 12px;
            padding: 35px;
            min-height: 230px;
            border: 1px solid #e8e9ec;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .dashboard-card::before {
            content: "";
            position: absolute;
            left: 0;
            top: 0;
            width: 4px;
            height: 100%;
            background: #c79b4b;
        }

        .dashboard-card:hover {
            transform: translateY(-7px);
            box-shadow: 0 18px 40px rgba(0, 0, 0, 0.1);
        }

        .card-icon {
            width: 55px;
            height: 55px;
            border-radius: 50%;
            background: #edf2f8;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #071a36;
            font-size: 25px;
            margin-bottom: 20px;
        }

        .dashboard-card h2 {
            color: #071a36;
            font-size: 21px;
            margin-bottom: 10px;
        }

        .dashboard-card p {
            color: #777;
            font-size: 13px;
            line-height: 1.7;
            margin-bottom: 20px;
        }

        /* =========================
           CARD BUTTONS
        ========================= */

        .card-link {
            display: inline-block;
            padding: 10px 20px;
            background: #071a36;
            color: #ffffff;
            text-decoration: none;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .card-link:hover {
            background: #c79b4b;
            transform: translateY(-2px);
        }

        /* =========================
           LABEL
        ========================= */

        .user-label {
            display: inline-block;
            margin-bottom: 30px;
            padding: 10px 18px;
            background: #edf2f8;
            color: #071a36;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 500;
        }

        /* =========================
           FOOTER
        ========================= */

        .footer {
            margin-top: 60px;
            padding: 25px 45px;
            border-top: 1px solid #e5e7eb;
            color: #888;
            font-size: 12px;
        }

        /* =========================
           TABLET
        ========================= */

        @media screen and (max-width: 900px) {

            .sidebar {
                width: 210px;
            }

            .main-content {
                margin-left: 210px;
                width: calc(100% - 210px);
            }

            .card-container {
                grid-template-columns: 1fr;
            }

            .topbar {
                padding: 0 25px;
            }

            .content {
                padding: 30px;
            }
        }

        /* =========================
           MOBILE
        ========================= */

        @media screen and (max-width: 650px) {

            .dashboard {
                display: block;
            }

            .sidebar {
                position: relative;
                width: 100%;
                min-height: auto;
                padding: 20px;
            }

            .logo {
                font-size: 55px;
                margin-bottom: 20px;
            }

            .menu-title {
                display: none;
            }

            .menu {
                flex-direction: row;
                flex-wrap: wrap;
                justify-content: center;
            }

            .dashboard-link {
                width: auto;
                padding: 10px 15px;
                font-size: 12px;
            }

            .main-content {
                margin-left: 0;
                width: 100%;
            }

            .topbar {
                height: 70px;
                padding: 0 20px;
            }

            .page-title {
                font-size: 20px;
            }

            .admin-name {
                display: none;
            }

            .content {
                padding: 25px 20px;
            }

            .welcome-section h1 {
                font-size: 27px;
            }

            .card-container {
                grid-template-columns: 1fr;
            }

            .dashboard-card {
                padding: 25px;
            }

            .footer {
                padding: 20px;
                text-align: center;
            }
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

    <div class="dashboard">

        <!-- =========================
             SIDEBAR
        ========================= -->

        <aside class="sidebar">

            <div class="logo">
                Stilo.
            </div>

            <div class="menu-title">
                Management
            </div>

            <div class="menu">

                <asp:LinkButton
                    ID="LinkButton1"
                    runat="server"
                    CssClass="dashboard-link"
                    PostBackUrl="~/users/Add_Company.aspx"
                    OnClick="LinkButton1_Click">
                    Add Company
                </asp:LinkButton>

                <asp:LinkButton
                    ID="LinkButton2"
                    runat="server"
                    CssClass="dashboard-link"
                    PostBackUrl="~/users/Add_Products.aspx"
                    OnClick="LinkButton2_Click">
                    Add Product
                </asp:LinkButton>

            </div>

        </aside>


        <!-- =========================
             MAIN CONTENT
        ========================= -->

        <main class="main-content">

            <!-- Top Bar -->

            <div class="topbar">

                <div class="page-title">
                    Dashboard
                </div>

                <div class="admin-name">
                    Welcome, <span>Admin</span>
                </div>

            </div>


            <!-- Dashboard Content -->

            <div class="content">

                <div class="welcome-section">

                    <h1>
                        Welcome to Stilo
                    </h1>

                    <p>
                        Manage your watch store, companies and products from here.
                    </p>

                </div>


                <!-- Existing Label -->

                <asp:Label
                    ID="Label1"
                    runat="server"
                    CssClass="user-label">
                </asp:Label>


                <!-- Cards -->

                <div class="card-container">

                    <!-- Company Card -->

                    <div class="dashboard-card">

                        <div class="card-icon">
                            🏢
                        </div>

                        <h2>
                            Manage Companies
                        </h2>

                        <p>
                            Add and manage the companies or brands
                            available in your Stilo watch store.
                        </p>

                        <asp:LinkButton
                            ID="CompanyCardButton"
                            runat="server"
                            CssClass="card-link"
                            PostBackUrl="~/users/Add_Company.aspx">
                            Add Company
                        </asp:LinkButton>

                    </div>


                    <!-- Product Card -->

                    <div class="dashboard-card">

                        <div class="card-icon">
                            ⌚
                        </div>

                        <h2>
                            Manage Products
                        </h2>

                        <p>
                            Add new watches and manage your existing
                            products in the online store.
                        </p>

                        <asp:LinkButton
                            ID="ProductCardButton"
                            runat="server"
                            CssClass="card-link"
                            PostBackUrl="~/users/Add_Products.aspx">
                            Add Product
                        </asp:LinkButton>

                    </div>

                </div>

            </div>


            <!-- Footer -->

            <div class="footer">
                © 2025 Stilo. Watch Store Dashboard. All rights reserved.
            </div>

        </main>

    </div>

</form>

</body>
</html>
</html>

