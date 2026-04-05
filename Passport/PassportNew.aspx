<%@ Page Title="New Passport Application" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="PassportNew.aspx.cs" Inherits="HamroWard.Passport.PassportNew" %>
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
        color: #1e2937;
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
    .page-hero::before {
        content: ''; position: absolute; inset: 0;
        background: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4z' fill='%23fff' fill-opacity='0.04'/%3E%3C/svg%3E");
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
        transition: all 0.2s;
    }

    .form-control:focus {
        background-color: #fff;
        border-color: var(--crimson);
        box-shadow: 0 0 0 4px var(--crimson-light);
    }

    /* ── Upload Box ── */
    .upload-card {
        border: 2px dashed #cbd5e1;
        border-radius: 16px;
        padding: 25px;
        text-align: center;
        background: #f8fafc;
        transition: 0.3s;
        height: 100%;
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
        box-shadow: 0 4px 15px rgba(220, 20, 60, 0.2);
    }
</style>

<div class="flag-bar"></div>

<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">📕</div>
        <div class="hero-text">
            <h1>New Passport Application &nbsp;/&nbsp; नयाँ राहदानी आवेदन</h1>
            <p>E-Passport Recommendation Form &nbsp;|&nbsp; इ-राहदानी सिफारिस फारम</p>
        </div>
    </div>
</div>

<main class="container">
    <div class="form-container">
        
        <h5 class="section-title">1. Applicant Details &nbsp;/&nbsp; निवेदकको विवरण</h5>
        <div class="row g-4">
            <div class="col-md-6">
                <label class="form-label">Full Name (English)</label>
                <asp:TextBox ID="txtFullNameEng" runat="server" CssClass="form-control" placeholder="AS PER CITIZENSHIP" />
            </div>
            <div class="col-md-6">
                <label class="form-label">पुरा नाम (नेपालीमा)</label>
                <asp:TextBox ID="txtFullNameNep" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-4">
                <label class="form-label">Date of Birth (B.S.)</label>
                <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" placeholder="YYYY-MM-DD" />
            </div>
            <div class="col-md-4">
                <label class="form-label">Gender / लिङ्ग</label>
                <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select Gender" Value="" />
                    <asp:ListItem Text="Male" Value="M" />
                    <asp:ListItem Text="Female" Value="F" />
                    <asp:ListItem Text="Other" Value="O" />
                </asp:DropDownList>
            </div>
            <div class="col-md-4">
                <label class="form-label">Citizenship Number</label>
                <asp:TextBox ID="txtCitNo" runat="server" CssClass="form-control" />
            </div>
        </div>

        <h5 class="section-title">2. Contact Information &nbsp;/&nbsp; सम्पर्क विवरण</h5>
        <div class="row g-4">
            <div class="col-md-6">
                <label class="form-label">Mobile Number</label>
                <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-6">
                <label class="form-label">Email Address</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
            </div>
        </div>

        <h5 class="section-title">3. Required Documents &nbsp;/&nbsp; आवश्यक कागजातहरू</h5>
        <div class="row g-4">
            <div class="col-md-6">
                <div class="upload-card">
                    <i class="fas fa-id-card fa-2x mb-3 text-muted"></i>
                    <p class="fw-bold mb-1">Citizenship (Front)</p>
                    <small class="text-muted d-block mb-3">Clear scan of the front side</small>
                    <asp:FileUpload ID="fuCitFront" runat="server" CssClass="form-control" />
                </div>
            </div>
            <div class="col-md-6">
                <div class="upload-card">
                    <i class="fas fa-id-card fa-2x mb-3 text-muted"></i>
                    <p class="fw-bold mb-1">Citizenship (Back)</p>
                    <small class="text-muted d-block mb-3">Clear scan of the back side</small>
                    <asp:FileUpload ID="fuCitBack" runat="server" CssClass="form-control" />
                </div>
            </div>
        </div>

        <div class="text-center">
            <asp:Button ID="btnSubmitPassport" runat="server" Text="Submit Application for Verification" CssClass="btn-submit" />
            <p class="text-muted mt-3" style="font-size: 0.85rem;">
                <i class="fas fa-info-circle"></i> Once submitted, your ward secretary will verify the details before recommending to the DAO.
            </p>
        </div>

    </div>
</main>

</asp:Content>