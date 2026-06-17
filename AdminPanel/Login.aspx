<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HamroWard.AdminPanel.Login" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login - Hamro Ward</title>
    <style>
        * { margin:0; padding:0; box-sizing:border-box; }
        body { font-family:Arial; background:#f4f6f9;
               display:flex; justify-content:center;
               align-items:center; height:100vh; }
        .box { background:#fff; padding:40px; border-radius:10px;
               border:1px solid #dde1e7; width:340px; }
        .box h2 { margin-bottom:24px; color:#1e2a3a; font-size:20px; }
        .box input[type=text],
        .box input[type=password] {
            width:100%; padding:10px 12px; margin-bottom:14px;
            border:1px solid #ccc; border-radius:6px; font-size:14px; }
        .box input[type=submit] {
            width:100%; padding:11px; background:#1e2a3a;
            color:#fff; border:none; border-radius:6px;
            font-size:15px; cursor:pointer; }
        .error { color:red; font-size:13px; margin-bottom:12px; display:block; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="box">
            <h2>Hamro Ward — Admin</h2>
            <asp:Label ID="lblError" runat="server"
                CssClass="error" Visible="false" />
            <asp:TextBox ID="txtUsername" runat="server"
                placeholder="Username" /><br />
            <asp:TextBox ID="txtPassword" runat="server"
                TextMode="Password" placeholder="Password" /><br />
            <asp:Button ID="btnLogin" runat="server"
                Text="Login" OnClick="BtnLogin_Click" />
        </div>
    </form>
</body>
</html>