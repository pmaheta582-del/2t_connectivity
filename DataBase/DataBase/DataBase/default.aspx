<%@ Page Language="C#" AutoEventWireup="true" %>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Redirect("~/User/ShowCompany.aspx");
    }
</script>
<!DOCTYPE html>
<html>
<head>
    <title>Redirecting...</title>
    <meta http-equiv="refresh" content="0;url=User/ShowCompany.aspx" />
</head>
<body>
    <p>Redirecting to <a href="User/ShowCompany.aspx">Show Companies</a>...</p>
</body>
</html>
