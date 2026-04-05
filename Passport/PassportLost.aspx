<%@ Page Title="Lost/Damaged Passport" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="PassportLost.aspx.cs" Inherits="HamroWard.Passport.PassportLost" %>

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

    .warning-box {
        background-color: #fffaf0;
        border: 1px solid #feebc8;
        border-left: 5px solid #ed8936;
        padding: 15px;
        margin-bottom: 30px;
        border-radius: 8px;
        color: #c05621;
        font-size: 0.9rem;
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
    .form-control { border-radius: 10px; padding: 12px 16px; border: 1px solid #d1d5db; background-color: #f9fafb; }
    .form-control:focus { border-color: var(--crimson); box-shadow: 0 0 0 4px var(--crimson-light); background-color: #fff; }

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
        <div class="hero-emblem">⚠️</div>
        <div class="hero-text">
            <h1>Lost / Damaged Passport &nbsp;/&nbsp; राहदानी प्रतिलिपि सिफारिस</h1>
            <p>Application for Replacement &nbsp;|&nbsp; राहदानी हराएको वा बिग्रिएको सिफारिस</p>
        </div>
    </div>
</div>

<main class="container">
    <div class="form-container">
        
        <div class="warning-box">
            <i class="fas fa-info-circle"></i> 
            <strong>Note:</strong> If your passport is lost, you must attach a Police Report. If it is damaged, the physical passport must be surrendered to the Ward Office.
        </div>

        <h5 class="section-title">1. Lost/Damaged Passport Info &nbsp;/&nbsp; पुरानो राहदानीको विवरण</h5>
        <div class="row g-4">
            <div class="col-md-6">
                <label class="form-label">Lost/Damaged Passport No.</label>
                <asp:TextBox ID="txtLostPassportNo" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-6">
                <label class="form-label">Police Report Number (If Lost)</label>
                <asp:TextBox ID="txtPoliceReport" runat="server" CssClass="form-control" placeholder="E.g. POL-9982" />
            </div>
            <div class="col-md-12">
                <label class="form-label">Circumstances of Loss or Damage</label>
                <asp:TextBox ID="txtIncident" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Explain briefly..." />
            </div>
        </div>

        <h5 class="section-title">2. Applicant Information &nbsp;/&nbsp; व्यक्तिगत विवरण</h5>
        <div class="row g-4">
            <div class="col-md-6">
                <label class="form-label">Full Name</label>
                <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-6">
                <label class="form-label">Citizenship Number</label>
                <asp:TextBox ID="txtCitNo" runat="server" CssClass="form-control" />
            </div>
        </div>

        <h5 class="section-title">3. Supporting Documents &nbsp;/&nbsp; आवश्यक प्रमाणहरू</h5>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="p-3 border rounded text-center bg-light">
                    <i class="fas fa-shield-alt fa-2x mb-2 text-warning"></i>
                    <p class="form-label small">Police Report (PDF)</p>
                    <asp:FileUpload ID="fuPoliceReport" runat="server" CssClass="form-control" />
                </div>
            </div>
            <div class="col-md-4">
                <div class="p-3 border rounded text-center bg-light">
                    <i class="fas fa-id-card fa-2x mb-2 text-primary"></i>
                    <p class="form-label small">Citizenship Card</p>
                    <asp:FileUpload ID="fuCit" runat="server" CssClass="form-control" />
                </div>
            </div>
            <div class="col-md-4">
                <div class="p-3 border rounded text-center bg-light">
                    <i class="fas fa-image fa-2x mb-2 text-success"></i>
                    <p class="form-label small">Photo of Damaged Passport</p>
                    <asp:FileUpload ID="fuDamageImg" runat="server" CssClass="form-control" />
                </div>
            </div>
        </div>

        <div class="text-center">
            <asp:Button ID="btnSubmitReplacement" runat="server" Text="Request Replacement Recommendation" CssClass="btn-submit" />
            <p class="text-muted mt-3" style="font-size: 0.85rem;">
                <i class="fas fa-lock"></i> Fraudulent reporting of a lost passport is a legal offense under the Passport Act.
            </p>
        </div>

    </div>
</main>

</asp:Content>