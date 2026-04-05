<%@ Page Title="Minor Passport Application" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="PassportMinor.aspx.cs" Inherits="HamroWard.Passport.PassportMinor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Noto+Sans+Devanagari:wght@400;500;700&display=swap');

    :root {
        --crimson: #DC143C;
        --navy: #002B7F;
        --crimson-light: rgba(220, 20, 60, 0.08);
        --navy-light: rgba(0, 43, 127, 0.07);
    }

    body {
        font-family: 'Inter', 'Noto Sans Devanagari', system-ui, sans-serif;
        background: linear-gradient(160deg, #f1f5f9 0%, #e0e7ff 100%);
        margin-top: 50px;
    }

    /* ── Page Hero ── */
    .page-hero {
        background: linear-gradient(135deg, var(--crimson) 0%, var(--navy) 100%);
        padding: 36px 0 28px;
        margin-bottom: 36px;
        position: relative;
        overflow: hidden;
    }
    .flag-bar { height: 10px; background: repeating-linear-gradient(90deg, var(--crimson) 0, var(--crimson) 24px, var(--navy) 24px, var(--navy) 48px); }
    .hero-inner { max-width: 1200px; margin: 0 auto; padding: 0 24px; display: flex; align-items: center; gap: 20px; color: white; position: relative; }
    .hero-emblem { width: 72px; height: 72px; background: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 40px; box-shadow: 0 8px 24px rgba(0,0,0,0.22); }

    /* ── Form Container ── */
    .form-container {
        max-width: 1000px;
        margin: 0 auto 60px;
        background: white;
        border-radius: 24px;
        padding: 45px;
        box-shadow: 0 10px 40px rgba(0,0,0,0.06);
        border: 1px solid #e8eaf0;
    }

    .section-title {
        font-weight: 700;
        margin: 35px 0 20px;
        color: var(--navy);
        border-left: 5px solid var(--crimson);
        padding-left: 15px;
        font-size: 1.2rem;
        background: var(--navy-light);
        padding-top: 8px;
        padding-bottom: 8px;
    }

    .form-label { font-weight: 600; color: #374151; font-size: 0.9rem; margin-bottom: 8px; }
    
    .form-control {
        border-radius: 10px;
        padding: 12px 16px;
        border: 1px solid #d1d5db;
        background-color: #f9fafb;
    }

    .form-control:focus {
        border-color: var(--crimson);
        box-shadow: 0 0 0 4px var(--crimson-light);
        background-color: #fff;
    }

    .upload-card {
        border: 2px dashed #cbd5e1;
        border-radius: 16px;
        padding: 20px;
        text-align: center;
        background: #f8fafc;
        transition: 0.3s;
    }
    .upload-card:hover { border-color: var(--crimson); background: var(--crimson-light); }

    .btn-submit {
        background: linear-gradient(135deg, var(--crimson) 0%, var(--navy) 100%);
        color: white;
        border: none;
        padding: 18px;
        font-weight: 700;
        border-radius: 12px;
        width: 100%;
        margin-top: 40px;
        font-size: 1.1rem;
    }
</style>

<div class="flag-bar"></div>

<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">🧒</div>
        <div class="hero-text">
            <h1>Minor Passport Recommendation &nbsp;/&nbsp; नाबालक राहदानी सिफारिस</h1>
            <p>For Citizens Under 16 Years &nbsp;|&nbsp; १६ वर्ष मुनिका नागरिकहरूका लागि</p>
        </div>
    </div>
</div>

<main class="container">
    <div class="form-container">
        
        <h5 class="section-title">1. Minor's Personal Details &nbsp;/&nbsp; नाबालकको विवरण</h5>
        <div class="row g-4">
            <div class="col-md-6">
                <label class="form-label">Minor's Full Name (English)</label>
                <asp:TextBox ID="txtMinorName" runat="server" CssClass="form-control" placeholder="AS PER BIRTH CERTIFICATE" />
            </div>
            <div class="col-md-6">
                <label class="form-label">Birth Registration Number (नविकरण नं.)</label>
                <asp:TextBox ID="txtBirthReg" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-6">
                <label class="form-label">Date of Birth (B.S.)</label>
                <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" placeholder="YYYY-MM-DD" />
            </div>
            <div class="col-md-6">
                <label class="form-label">Gender / लिङ्ग</label>
                <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select Gender" Value="" />
                    <asp:ListItem Text="Male" Value="M" />
                    <asp:ListItem Text="Female" Value="F" />
                    <asp:ListItem Text="Other" Value="O" />
                </asp:DropDownList>
            </div>
        </div>

        <h5 class="section-title">2. Parent/Guardian Information &nbsp;/&nbsp; अभिभावकको विवरण</h5>
        <div class="row g-4">
            <div class="col-md-6">
                <label class="form-label">Father's Name</label>
                <asp:TextBox ID="txtFatherName" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-6">
                <label class="form-label">Mother's Name</label>
                <asp:TextBox ID="txtMotherName" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-6">
                <label class="form-label">Guardian's Citizenship No.</label>
                <asp:TextBox ID="txtGuardianCitNo" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-6">
                <label class="form-label">Guardian's Mobile Number</label>
                <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" />
            </div>
        </div>

        <h5 class="section-title">3. Required Documents &nbsp;/&nbsp; आवश्यक कागजातहरू</h5>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="upload-card">
                    <i class="fas fa-baby fa-2x mb-2 text-muted"></i>
                    <p class="form-label mb-1">Birth Certificate</p>
                    <asp:FileUpload ID="fuBirthCert" runat="server" CssClass="form-control" />
                </div>
            </div>
            <div class="col-md-4">
                <div class="upload-card">
                    <i class="fas fa-id-card fa-2x mb-2 text-muted"></i>
                    <p class="form-label mb-1">Father's Citizenship</p>
                    <asp:FileUpload ID="fuFatherCit" runat="server" CssClass="form-control" />
                </div>
            </div>
            <div class="col-md-4">
                <div class="upload-card">
                    <i class="fas fa-id-card fa-2x mb-2 text-muted"></i>
                    <p class="form-label mb-1">Mother's Citizenship</p>
                    <asp:FileUpload ID="fuMotherCit" runat="server" CssClass="form-control" />
                </div>
            </div>
        </div>

        <div class="text-center">
            <asp:Button ID="btnSubmitMinor" runat="server" Text="Apply for Minor Passport Recommendation" CssClass="btn-submit" />
            <p class="text-muted mt-3" style="font-size: 0.85rem;">
                <i class="fas fa-user-shield"></i> Guardian presence may be required at the Ward Office for physical verification.
            </p>
        </div>

    </div>
</main>

</asp:Content>