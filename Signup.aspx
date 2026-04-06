<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="HamroWard.SignUp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up - Hamro Ward</title>

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Noto+Sans+Devanagari:wght@400;500;700&display=swap" rel="stylesheet">

    <style>
        :root {
            --crimson: #DC143C;
            --navy: #002B7F;
        }

        body {
            font-family: 'Inter', 'Noto Sans Devanagari', sans-serif;
            background: linear-gradient(160deg, #f1f5f9 0%, #e0e7ff 100%);
            margin: 0;
        }

        .auth-container {
            max-width: 600px;
            margin: 50px auto;
            background: white;
            padding: 30px;
            border-radius: 18px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.08);
        }

        h3 {
            text-align: center;
            color: var(--navy);
        }

        .progress-bar {
            height: 6px;
            background: #eee;
            border-radius: 10px;
            overflow: hidden;
            margin-bottom: 20px;
        }

        .progress {
            height: 100%;
            width: 33%;
            background: linear-gradient(90deg, var(--crimson), var(--navy));
            transition: 0.4s;
        }

        .step-content {
            display: none;
            animation: slide 0.3s ease;
        }

        .step-content.active {
            display: block;
        }

        @keyframes slide {
            from { opacity: 0; transform: translateX(20px);}
            to { opacity: 1; transform: translateX(0);}
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border-radius: 10px;
            border: 1px solid #ddd;
            margin-bottom: 10px;
        }

        .btn-group {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
        }

        .btn-auth {
            padding: 10px 18px;
            border-radius: 10px;
            border: none;
            background: linear-gradient(135deg, var(--crimson), var(--navy));
            color: white;
            cursor: pointer;
        }

        .btn-secondary {
            background: #e5e7eb;
            color: black;
        }

        .strength {
            font-size: 0.8rem;
            margin-bottom: 10px;
        }

        .weak { color: red; }
        .medium { color: orange; }
        .strong { color: green; }
    </style>
</head>

<body>
<form id="form1" runat="server">

<div class="auth-container">

<h3>Create Account / दर्ता गर्नुहोस्</h3>

<div class="progress-bar">
    <div class="progress" id="progress"></div>
</div>

<!-- STEP 1 -->
<div class="step-content active" id="step1">
    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="👤 Full Name (as per citizenship)"></asp:TextBox>

    <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" placeholder="📅 Date of Birth (YYYY-MM-DD)"></asp:TextBox>

    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
        <asp:ListItem Text="Select Gender" Value="" />
        <asp:ListItem Text="Male" />
        <asp:ListItem Text="Female" />
        <asp:ListItem Text="Other" />
    </asp:DropDownList>

    <div class="btn-group">
        <div></div>
        <button type="button" class="btn-auth" onclick="validateStep1()">Next →</button>
    </div>
</div>

<!-- STEP 2 -->
<div class="step-content" id="step2">
    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="📱 Mobile Number"></asp:TextBox>

    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="📧 Email (optional)"></asp:TextBox>

    <asp:TextBox ID="txtDistrict" runat="server" CssClass="form-control" placeholder="🏙️ District"></asp:TextBox>

    <asp:TextBox ID="txtMunicipality" runat="server" CssClass="form-control" placeholder="🏠 Municipality"></asp:TextBox>

    <div class="btn-group">
        <button type="button" class="btn-auth btn-secondary" onclick="prevStep(1)">← Back</button>
        <button type="button" class="btn-auth" onclick="validateStep2()">Next →</button>
    </div>
</div>

<!-- STEP 3 -->
<div class="step-content" id="step3">

    <asp:TextBox ID="txtCitizenshipNo" runat="server" CssClass="form-control" placeholder="🪪 Citizenship Number"></asp:TextBox>

    <asp:TextBox ID="txtCitizenshipDistrict" runat="server" CssClass="form-control" placeholder="📍 Issued District"></asp:TextBox>

    <asp:TextBox ID="txtCitizenshipDate" runat="server" CssClass="form-control" placeholder="📅 Issued Date"></asp:TextBox>

    <!-- Password -->
    <div style="position:relative;">
        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="🔒 Password"></asp:TextBox>
        <span onclick="togglePassword()" style="position:absolute; right:10px; top:10px; cursor:pointer;">👁️</span>
    </div>

    <div id="strengthText" class="strength"></div>

    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="🔐 Confirm Password"></asp:TextBox>

    <div class="btn-group">
        <button type="button" class="btn-auth btn-secondary" onclick="prevStep(2)">← Back</button>
        <asp:Button ID="btnSignUp" runat="server" Text="Create Account" CssClass="btn-auth" OnClick="BtnSignUp_Click" />
    </div>

</div>

</div>

</form>

<script>

    // STEP NAV
    function nextStep(step) {
        document.querySelectorAll('.step-content').forEach(e => e.classList.remove('active'));
        document.getElementById('step' + step).classList.add('active');

        document.getElementById('progress').style.width =
            step === 1 ? '33%' : step === 2 ? '66%' : '100%';
    }

    function prevStep(step) {
        nextStep(step);
    }

    // VALIDATION
    function validateStep1() {
        let name = document.getElementById('<%= txtFullName.ClientID %>');
    let dob = document.getElementById('<%= txtDOB.ClientID %>');

        if (name.value === '' || dob.value === '') {
            alert("Fill all fields!");
            return;
        }

        nextStep(2);
    }

    function validateStep2() {
        let phone = document.getElementById('<%= txtPhone.ClientID %>');

    if (phone.value === '') {
        alert("Fill required fields!");
        return;
    }

    nextStep(3);
}

// PASSWORD STRENGTH
document.getElementById('<%= txtPassword.ClientID %>').addEventListener("input", function () {
    let val = this.value;
    let strength = document.getElementById("strengthText");

    if (val.length < 5) {
        strength.textContent = "Weak";
        strength.className = "strength weak";
    } else if (val.match(/[A-Z]/) && val.match(/[0-9]/)) {
        strength.textContent = "Strong";
        strength.className = "strength strong";
    } else {
        strength.textContent = "Medium";
        strength.className = "strength medium";
    }
});

// TOGGLE PASSWORD
function togglePassword() {
    let pass = document.getElementById('<%= txtPassword.ClientID %>');
        pass.type = pass.type === "password" ? "text" : "password";
    }

</script>

</body>
</html>