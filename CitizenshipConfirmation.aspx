<%@ Page Title="Application Submitted" Language="C#" MasterPageFile="~/home.Master"
    AutoEventWireup="true" CodeBehind="CitizenshipConfirmation.aspx.cs" Inherits="HamroWard.CitizenshipConfirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Noto+Sans+Devanagari:wght@400;500;700&display=swap');
    :root { --crimson:#DC143C; --navy:#002B7F; --crimson-light:rgba(220,20,60,0.08); --navy-light:rgba(0,43,127,0.07); }
    body { font-family:'Inter','Noto Sans Devanagari',system-ui,sans-serif; background:linear-gradient(160deg,#f1f5f9 0%,#e0e7ff 100%); color:#1e2937; line-height:1.6; margin-top:50px; }
    .flag-bar { height:10px; background:repeating-linear-gradient(90deg,var(--crimson) 0,var(--crimson) 24px,var(--navy) 24px,var(--navy) 48px); }

    .confirmation-wrapper {
        max-width: 620px;
        margin: 60px auto 80px;
        padding: 0 16px;
        text-align: center;
    }

    .success-icon {
        width: 90px; height: 90px;
        background: linear-gradient(135deg, #22c55e, #16a34a);
        border-radius: 50%;
        display: flex; align-items: center; justify-content: center;
        font-size: 48px;
        margin: 0 auto 24px;
        box-shadow: 0 12px 30px rgba(34,197,94,0.35);
    }

    .confirmation-wrapper h1 {
        font-size: 1.8rem;
        font-weight: 700;
        color: #166534;
        margin-bottom: 8px;
    }

    .confirmation-wrapper p {
        color: #6b7280;
        font-size: 1rem;
        margin-bottom: 32px;
    }

    .token-box {
        background: white;
        border: 2.5px solid #22c55e;
        border-radius: 20px;
        padding: 28px;
        margin-bottom: 28px;
        box-shadow: 0 8px 30px rgba(0,0,0,0.07);
    }

    .token-label {
        font-size: 0.82rem;
        font-weight: 600;
        color: #6b7280;
        text-transform: uppercase;
        letter-spacing: 0.06em;
        margin-bottom: 8px;
    }

    .token-number {
        font-size: 1.6rem;
        font-weight: 700;
        color: var(--navy);
        letter-spacing: 0.05em;
        background: var(--navy-light);
        padding: 10px 24px;
        border-radius: 12px;
        display: inline-block;
        margin-bottom: 12px;
    }

    .token-note {
        font-size: 0.83rem;
        color: #6b7280;
    }

    .info-card {
        background: #fefce8;
        border: 2px solid #facc15;
        border-radius: 16px;
        padding: 18px 20px;
        text-align: left;
        margin-bottom: 28px;
        font-size: 0.87rem;
        color: #713f12;
    }

    .info-card i { color: #ca8a04; margin-right: 8px; }

    .btn-check-status {
        background: linear-gradient(to right, var(--crimson), var(--navy));
        color: white !important;
        border: none;
        border-radius: 50px;
        padding: 13px 40px;
        font-size: 1.05rem;
        font-weight: 700;
        box-shadow: 0 8px 22px rgba(220,20,60,0.30);
        transition: all 0.25s;
        text-decoration: none;
        display: inline-block;
        margin: 6px;
    }
    .btn-check-status:hover { transform: translateY(-2px); color: white !important; }

    .btn-home {
        background: white;
        color: #374151 !important;
        border: 2px solid #d1d5db;
        border-radius: 50px;
        padding: 12px 32px;
        font-size: 1rem;
        font-weight: 600;
        text-decoration: none;
        display: inline-block;
        margin: 6px;
        transition: all 0.2s;
    }
    .btn-home:hover { border-color: var(--navy); color: var(--navy) !important; }
</style>

<div class="flag-bar"></div>

<div class="confirmation-wrapper">

    <div class="success-icon">✅</div>

    <h1>Application Submitted!</h1>
    <p>Your citizenship application has been received successfully.<br />
    नागरिकता आवेदन सफलतापूर्वक पेश गरियो।</p>

    <!-- Token Box -->
    <div class="token-box">
        <div class="token-label">Your Token Number / तपाईंको टोकन नम्बर</div>
        <div class="token-number">
            <asp:Label ID="lblToken" runat="server" Text="—" />
        </div>
        <div class="token-note">
            📋 Please save this token number. You will need it to check your application status.<br />
            यो टोकन नम्बर सुरक्षित राख्नुहोस्।
        </div>
    </div>

    <!-- What happens next -->
    <div class="info-card">
        <p class="fw-bold mb-2"><i class="bi bi-info-circle-fill"></i>What happens next?</p>
        <p class="mb-1">1. Ward office will review your application within <strong>3–5 working days</strong>.</p>
        <p class="mb-1">2. You will be contacted on your mobile number if anything is needed.</p>
        <p class="mb-0">3. Visit the ward office with <strong>original documents</strong> when notified.</p>
    </div>

    <!-- Buttons -->
    <div>
        <a href="/CitizenshipRegistration/CitizenshipStatus.aspx" class="btn-check-status">
            🔍 Check Status
        </a>
        <a href="/Default.aspx" class="btn-home">
            🏠 Go to Home
        </a>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
