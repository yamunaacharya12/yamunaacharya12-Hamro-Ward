<%@ Page Title="Passport Renewal" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="PassportRenewal.aspx.cs" Inherits="HamroWard.Passport.PassportRenewal" %>

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

    /* ── Renewal Specific Alert ── */
    .renewal-notice {
        background-color: #fff4f4;
        border-right: 4px solid var(--crimson);
        padding: 15px;
        margin-bottom: 25px;
        border-radius: 8px;
        font-size: 0.9rem;
        color: #b91c1c;
    }

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
        <div class="hero-emblem">🔄</div>
        <div class="hero-text">
            <h1>Passport Renewal &nbsp;/&nbsp; राहदानी नवीकरण</h1>
            <p>Renewal Recommendation Form &nbsp;|&nbsp; राहदानी नवीकरण सिफारिस फारम</p>
        </div>
    </div>
</div>

<main class="container">
    <div class="form-container">
        
        <div class="renewal-notice">
            <i class="fas fa-exclamation-triangle"></i> 
            <strong>Note:</strong> Renewal is only applicable if your passport has expired or has less than 6 months of validity remaining.
        </div>

        <h5 class="section-title">1. Previous Passport Details &nbsp;/&nbsp; पुरानो राहदानी विवरण</h5>
        <div class="row g-4">
            <div class="col-md-6">
                <label class="form-label">Old Passport Number</label>
                <asp:TextBox ID="txtOldPassportNo" runat="server" CssClass="form-control" placeholder="E.g. 12345678" />
            </div>
            <div class="col-md-6">
                <label class="form-label">Expiry Date (A.D.)</label>
                <asp:TextBox ID="txtOldExpiry" runat="server" CssClass="form-control" TextMode="Date" />
            </div>
        </div>

        <h5 class="section-title">2. Personal Information &nbsp;/&nbsp; व्यक्तिगत विवरण</h5>
        <div class="row g-4">
            <div class="col-md-6">
                <label class="form-label">Full Name (English)</label>
                <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-6">
                <label class="form-label">Citizenship Number</label>
                <asp:TextBox ID="txtCitNo" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-12">
                <label class="form-label">Reason for Renewal / Replacement</label>
                <asp:DropDownList ID="ddlReason" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select Reason" Value="" />
                    <asp:ListItem Text="Passport Expired" Value="Expired" />
                    <asp:ListItem Text="Pages Exhausted (Full)" Value="Full" />
                    <asp:ListItem Text="Damaged Passport" Value="Damaged" />
                    <asp:ListItem Text="Lost Passport" Value="Lost" />
                </asp:DropDownList>
            </div>
        </div>

        <h5 class="section-title">3. Upload Old Passport Copy &nbsp;/&nbsp; राहदानीको प्रतिलिपि</h5>
        <div class="row g-4">
            <div class="col-md-6">
                <div class="p-4 border rounded bg-light text-center">
                    <i class="fas fa-file-pdf fa-2x mb-2 text-danger"></i>
                    <p class="form-label mb-2">Old Passport (Bio Page)</p>
                    <asp:FileUpload ID="fuOldPassport" runat="server" CssClass="form-control" />
                </div>
            </div>
            <div class="col-md-6">
                <div class="p-4 border rounded bg-light text-center">
                    <i class="fas fa-file-image fa-2x mb-2 text-primary"></i>
                    <p class="form-label mb-2">Citizenship Certificate</p>
                    <asp:FileUpload ID="fuCit" runat="server" CssClass="form-control" />
                </div>
            </div>
        </div>

        <div class="text-center">
            <asp:Button ID="btnSubmitRenewal" runat="server" Text="Apply for Renewal Recommendation" CssClass="btn-submit" />
            <p class="text-muted mt-3" style="font-size: 0.85rem;">
                Verification usually takes 1-2 working days. You will be notified via SMS/Email.
            </p>
        </div>

    </div>
</main>

</asp:Content>