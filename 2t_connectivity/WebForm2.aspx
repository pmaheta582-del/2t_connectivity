<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="_2t_connectivity.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Stilo - Login</title>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Allison&family=Poppins:wght@300;400;500;600;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            background: linear-gradient(135deg, #071a36, #123b70);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        /* Main Login Box */

        .login-container {
            width: 900px;
            max-width: 100%;
            min-height: 550px;
            background: #ffffff;
            border-radius: 20px;
            overflow: hidden;
            display: flex;
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.25);
        }

        /* Left Side */

        .login-left {
            width: 45%;
            background:
                linear-gradient(
                    rgba(7, 26, 54, 0.78),
                    rgba(7, 26, 54, 0.78)
                ),
                url('Images/watch.jpg') center/cover no-repeat;

            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 40px;
            color: white;
        }

        .logo {
            font-family: 'Allison', cursive;
            font-size: 75px;
            color: #f6e5c3;
            margin-bottom: 10px;
        }

        .login-left h2 {
            font-size: 30px;
            font-weight: 500;
            margin-bottom: 15px;
        }

        .login-left p {
            font-size: 14px;
            line-height: 1.8;
            color: #e5e7eb;
            max-width: 300px;
        }

        .watch-line {
            width: 60px;
            height: 3px;
            background: #c79b4b;
            margin: 20px 0;
            border-radius: 5px;
        }

        /* Right Side */

        .login-right {
            width: 55%;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 50px;
        }

        .login-content {
            width: 100%;
            max-width: 400px;
        }

        .login-heading {
            color: #071a36;
            font-size: 34px;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .login-subheading {
            color: #777;
            font-size: 14px;
            margin-bottom: 30px;
        }

        /* Form */

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            color: #30343b;
            font-size: 14px;
            font-weight: 500;
            margin-bottom: 8px;
        }

        .input-box {
            width: 100%;
            height: 48px;
            border: 1px solid #d9dce1;
            border-radius: 8px;
            padding: 0 15px;
            font-family: 'Poppins', sans-serif;
            font-size: 14px;
            outline: none;
            transition: all 0.3s ease;
            background: #fafafa;
        }

        .input-box:focus {
            border-color: #123b70;
            background: #ffffff;
            box-shadow: 0 0 0 3px rgba(18, 59, 112, 0.1);
        }

        /* Login Button */

        .login-button {
            width: 100%;
            height: 50px;
            border: none;
            border-radius: 8px;
            background: #071a36;
            color: white;
            font-family: 'Poppins', sans-serif;
            font-size: 15px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 5px;
        }

        .login-button:hover {
            background: #c79b4b;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(199, 155, 75, 0.25);
        }

        /* Register */

        .register-text {
            text-align: center;
            margin-top: 25px;
            color: #777;
            font-size: 14px;
        }

        .register-link {
            color: #123b70;
            font-weight: 600;
            text-decoration: none;
            margin-left: 5px;
        }

        .register-link:hover {
            color: #c79b4b;
            text-decoration: underline;
        }

        /* Responsive */

        @media screen and (max-width: 700px) {

            body {
                padding: 15px;
            }

            .login-container {
                flex-direction: column;
                min-height: auto;
            }

            .login-left {
                width: 100%;
                min-height: 230px;
                padding: 30px 20px;
            }

            .logo {
                font-size: 60px;
            }

            .login-left h2 {
                font-size: 24px;
            }

            .login-left p {
                display: none;
            }

            .watch-line {
                margin: 10px 0;
            }

            .login-right {
                width: 100%;
                padding: 40px 25px;
            }

            .login-heading {
                font-size: 28px;
            }
        }

        @media screen and (max-width: 400px) {

            .login-left {
                min-height: 190px;
            }

            .login-right {
                padding: 30px 20px;
            }

            .logo {
                font-size: 50px;
            }

            .login-left h2 {
                font-size: 21px;
            }
        }
    </style>
</head>

<body>

    <form id="form1" runat="server">

        <div class="login-container">

            <!-- Left Section -->

            <div class="login-left">

                <div class="logo">
                    Stilo.
                </div>

                <div class="watch-line"></div>

                <h2>Welcome Back</h2>

                <p>
                    Discover timeless elegance and luxury watches
                    designed for those who appreciate true style.
                </p>

            </div>

            <!-- Right Section -->

            <div class="login-right">

                <div class="login-content">

                    <h1 class="login-heading">
                        Login
                    </h1>

                    <p class="login-subheading">
                        Sign in to continue to your Stilo account.
                    </p>

                    <!-- Username -->

                    <div class="form-group">

                        <label class="form-label">
                            Username
                        </label>

                        <asp:TextBox
                            ID="TextBox1"
                            runat="server"
                            CssClass="input-box"
                            placeholder="Enter your username">
                        </asp:TextBox>

                    </div>

                    <!-- Password -->

                    <div class="form-group">

                        <label class="form-label">
                            Password
                        </label>

                        <asp:TextBox
                            ID="TextBox2"
                            runat="server"
                            CssClass="input-box"
                            TextMode="Password"
                            placeholder="Enter your password">
                        </asp:TextBox>

                    </div>

                    <!-- Login Button -->

                    <asp:Button
                        ID="Button1"
                        runat="server"
                        Text="Login"
                        CssClass="login-button"
                        OnClick="Button1_Click" />

                    <!-- Register -->

                    <div class="register-text">

                        Don't have an account?

                        <asp:LinkButton
                            ID="LinkButton1"
                            runat="server"
                            CssClass="register-link"
                            PostBackUrl="~/WebForm1.aspx">
                            Register
                        </asp:LinkButton>

                    </div>

                </div>

            </div>

        </div>

    </form>

</body>
</html>
