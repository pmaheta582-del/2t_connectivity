<%@ Page Language="C#" AutoEventWireup="true" %>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        string pid = Request.QueryString["pid"] != null ? Request.QueryString["pid"].ToString() : "";
        Response.Redirect("view details.aspx" + (string.IsNullOrEmpty(pid) ? "" : "?pid=" + pid));
    }
</script>
<!DOCTYPE html>
<html>
<head>
    <title>Redirecting...</title>
</head>
<body>
    <p>Redirecting to product details...</p>
</body>
</html>
