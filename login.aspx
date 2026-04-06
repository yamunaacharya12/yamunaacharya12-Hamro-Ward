
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="HamroWard.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - Hamro Ward</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Noto+Sans+Devanagari:wght@400;500;700&display=swap" rel="stylesheet">

    <style>
        :root {
            --crimson: #DC143C;
            --navy: #002B7F;
            --crimson-light: rgba(220, 20, 60, 0.08);
            --navy-light: rgba(0, 43, 127, 0.07);
        }

        body {
            font-family: 'Inter', 'Noto Sans Devanagari', sans-serif;
            background: linear-gradient(160deg, #f1f5f9 0%, #e0e7ff 100%);
            margin: 0;
        }

        /* Top flag bar */
        .flag-bar {
            height: 8px;
            background: repeating-linear-gradient(90deg, var(--crimson) 0, var(--crimson) 24px, var(--navy) 24px, var(--navy) 48px);
        }

        /* Hero */
        .page-hero {
            background: linear-gradient(135deg, var(--crimson), var(--navy));
            padding: 30px 20px;
            color: white;
            text-align: center;
        }

        .page-hero h1 {
            margin: 0;
            font-size: 1.5rem;
            font-weight: 700;
        }

        .page-hero p {
            margin: 5px 0 0;
            opacity: 0.9;
        }

        /* Login Card */
        .login-container {
            max-width: 400px;
            margin: 50px auto;
            background: white;
            padding: 30px 25px;
            border-radius: 18px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.08);
        }

        .login-title {
            text-align: center;
            font-weight: 700;
            font-size: 1.3rem;
            color: var(--navy);
            margin-bottom: 20px;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border-radius: 10px;
            border: 1px solid #ddd;
            margin-bottom: 15px;
        }

        .btn-login {
            width: 100%;
            padding: 10px;
            border-radius: 10px;
            border: none;
            background: linear-gradient(135deg, var(--crimson), var(--navy));
            color: white;
            font-weight: 600;
            cursor: pointer;
        }

        .btn-login:hover {
            opacity: 0.9;
        }

        .footer-text {
            text-align: center;
            margin-top: 15px;
            font-size: 0.9rem;
        }

        .footer-text a {
            color: var(--crimson);
            text-decoration: none;
            font-weight: 600;
        }

        .error-msg {
            color: red;
            text-align: center;
            margin-bottom: 10px;
        }
    </style>
</head>

<body>

    <form id="form1" runat="server">

        <div class="flag-bar"></div>

        <div class="page-hero">
            <h1>Hamro Ward Portal</h1>
            <p>Digital Service Login / डिजिटल लगइन</p>
        </div>

        <div class="login-container">

            <div class="login-title">Sign In / लगइन गर्नुहोस्</div>

            <asp:Label ID="lblMessage" runat="server" CssClass="error-msg"></asp:Label>

            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="👤 Citizenship No / Phone"></asp:TextBox>

            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="🔒 Password"></asp:TextBox>

            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-login" OnClick="BtnLogin_Click" />

            <div class="footer-text">
                Don't have an account? 
                <a href="signup.aspx">Sign Up</a>
                <br />
                <small>© 2026 Hamro Ward</small>
            </div>

        </div>

    </form>

</body>
</html>
```
