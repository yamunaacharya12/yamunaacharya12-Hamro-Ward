<%@ Page Title="Death Registration" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="deathregistration.aspx.cs" Inherits="xyz.Death1" %>

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
        line-height: 1.6;
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
        content: '';
        position: absolute;
        inset: 0;
        background: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='0.04'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
    }
    .flag-bar {
        height: 10px;
        background: repeating-linear-gradient(90deg, var(--crimson) 0, var(--crimson) 24px, var(--navy) 24px, var(--navy) 48px);
    }
    .hero-inner {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 24px;
        display: flex;
        align-items: center;
        gap: 20px;
        color: white;
        flex-wrap: wrap;
    }
    .hero-emblem {
        width: 72px; height: 72px;
        background: white;
        border-radius: 50%;
        display: flex; align-items: center; justify-content: center;
        font-size: 40px;
        box-shadow: 0 8px 24px rgba(0,0,0,0.22);
        flex-shrink: 0;
    }
    .hero-text h1 { font-size: 1.55rem; font-weight: 700; margin: 0 0 2px; }
    .hero-text p  { font-size: 1rem; margin: 0; opacity: 0.88; }

    /* ── Breadcrumb ── */
    .breadcrumb-wrap { font-size: 0.82rem; color: #6b7280; margin-bottom: 28px; }
    .breadcrumb-wrap a { color: var(--crimson); text-decoration: none; }
    .breadcrumb-wrap a:hover { text-decoration: underline; }

    /* ── Section intro ── */
    .section-intro {
        text-align: center;
        margin-bottom: 40px;
    }
    .section-intro h2 {
        font-size: 1.5rem;
        font-weight: 700;
        color: var(--navy);
        margin-bottom: 8px;
    }
    .section-intro p {
        color: #6b7280;
        font-size: 0.97rem;
        max-width: 560px;
        margin: 0 auto;
    }

    /* ── Service Cards ── */
    .service-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
        gap: 24px;
        max-width: 1100px;
        margin: 0 auto 60px;
        padding: 0 16px;
    }

    .service-card {
        background: white;
        border: 2px solid #e8eaf0;
        border-radius: 20px;
        padding: 32px 28px;
        text-align: center;
        text-decoration: none;
        color: #1e2937;
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 14px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.06);
        transition: all 0.25s ease;
        cursor: pointer;
        position: relative;
        overflow: hidden;
    }
    .service-card::after {
        content: '';
        position: absolute;
        bottom: 0; left: 0; right: 0;
        height: 4px;
        background: linear-gradient(90deg, var(--crimson), var(--navy));
        transform: scaleX(0);
        transition: transform 0.25s ease;
    }
    .service-card:hover {
        border-color: var(--crimson);
        box-shadow: 0 12px 40px rgba(220,20,60,0.14);
        transform: translateY(-4px);
        color: #1e2937;
        text-decoration: none;
    }
    .service-card:hover::after {
        transform: scaleX(1);
    }

    .service-icon {
        width: 72px; height: 72px;
        border-radius: 50%;
        background: var(--crimson-light);
        display: flex; align-items: center; justify-content: center;
        font-size: 2rem;
        transition: background 0.25s;
    }
    .service-card:hover .service-icon {
        background: linear-gradient(135deg, var(--crimson-light), var(--navy-light));
    }

    .service-title {
        font-size: 1.05rem;
        font-weight: 700;
        color: #1e2937;
        margin: 0;
        line-height: 1.3;
    }
    .service-title-nep {
        font-size: 0.82rem;
        color: var(--navy);
        font-weight: 500;
        opacity: 0.85;
    }
    .service-desc {
        font-size: 0.84rem;
        color: #6b7280;
        margin: 0;
        line-height: 1.5;
    }
    .service-badge {
        font-size: 0.72rem;
        font-weight: 600;
        padding: 3px 12px;
        border-radius: 999px;
        background: var(--crimson-light);
        color: var(--crimson);
    }
    .service-badge.badge-info {
        background: var(--navy-light);
        color: var(--navy);
    }
    .service-badge.badge-warning {
        background: #fefce8;
        color: #92400e;
    }

    /* ── Search Form ── */
    .search-section {
        max-width: 560px;
        margin: 0 auto 60px;
        background: white;
        border-radius: 20px;
        padding: 36px 32px;
        box-shadow: 0 4px 24px rgba(0,0,0,0.09);
        border: 2px solid #e8eaf0;
    }
    .search-section h3 {
        color: var(--navy);
        font-size: 1.15rem;
        font-weight: 700;
        margin-bottom: 6px;
    }
    .search-section p {
        color: #6b7280;
        font-size: 0.88rem;
        margin-bottom: 24px;
    }
    .search-section label {
        font-size: 0.88rem;
        font-weight: 600;
        color: #374151;
        display: block;
        margin-bottom: 6px;
    }
    .search-section .form-control {
        width: 100%;
        padding: 10px 14px;
        border: 1.5px solid #d1d5db;
        border-radius: 10px;
        font-size: 0.95rem;
        margin-bottom: 18px;
        transition: border-color 0.2s;
        box-sizing: border-box;
    }
    .search-section .form-control:focus {
        border-color: var(--crimson);
        outline: none;
        box-shadow: 0 0 0 3px rgba(220,20,60,0.1);
    }
    .btn-search {
        width: 100%;
        padding: 12px;
        background: linear-gradient(135deg, var(--crimson), var(--navy));
        color: white;
        border: none;
        border-radius: 10px;
        font-size: 1rem;
        font-weight: 600;
        cursor: pointer;
        transition: opacity 0.2s;
    }
    .btn-search:hover { opacity: 0.9; }
</style>

<div class="flag-bar"></div>

<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">🕊️</div>
        <div class="hero-text">
            <h1>Death Registration &nbsp;/&nbsp; मृत्यु दर्ता</h1>
            <p>Ward Office — Digital Services Portal &nbsp;|&nbsp; वडा कार्यालय — डिजिटल सेवा</p>
        </div>
    </div>
</div>

<main style="max-width:1200px; margin:0 auto; padding:0 16px;">

    <nav class="breadcrumb-wrap">
        <a href="~/Default.aspx" runat="server">गृहपृष्ठ (Home)</a> &rsaquo;
        <a href="/Service.aspx" runat="server">पञ्जीकरण (Vital Registration)</a> &rsaquo;
        <span>मृत्यु दर्ता (Death Registration)</span>
    </nav>

    <div class="section-intro">
        <h2>Select a Death Registration Service &nbsp;/&nbsp; मृत्यु दर्ता सेवा छान्नुहोस्</h2>
    </div>

    <!-- Service Cards -->
    <div class="service-grid">

        <a href="~/DeathRegistration/DeathNew.aspx" runat="server" class="service-card">
            <div class="service-icon">📝</div>
            <div>
                <p class="service-title">Register New Death</p>
                <p class="service-title-nep">नयाँ मृत्यु दर्ता गर्नुहोस्</p>
            </div>
            <span class="service-badge">नयाँ आवेदन (New Application)</span>
        </a>

        <a href="~/DeathRegistration/DeathStatus.aspx" runat="server" class="service-card">
            <div class="service-icon">🔍</div>
            <div>
                <p class="service-title">Check Application Status</p>
                <p class="service-title-nep">आवेदन स्थिति जाँच्नुहोस्</p>
            </div>
            <span class="service-badge badge-info">स्थिति ट्र्याक गर्नुहोस् (Track Status)</span>
        </a>

        <a href="~/DeathRegistration/DeathCertificate.aspx" runat="server" class="service-card">
            <div class="service-icon">📜</div>
            <div>
                <p class="service-title">Get Death Certificate</p>
                <p class="service-title-nep">मृत्यु प्रमाणपत्र लिनुहोस्</p>
            </div>
            <span class="service-badge">प्रमाणपत्र अनुरोध (Certificate Request)</span>
        </a>

        <a href="~/DeathRegistration/DeathCorrection.aspx" runat="server" class="service-card">
            <div class="service-icon">✏️</div>
            <div>
                <p class="service-title">Correction of Details</p>
                <p class="service-title-nep">विवरण सच्याउनुहोस्</p>
            </div>
            <span class="service-badge badge-info">सच्याउने (Correction)</span>
        </a>

        <a href="~/DeathRegistration/DeathVerification.aspx" runat="server" class="service-card">
            <div class="service-icon">✅</div>
            <div>
                <p class="service-title">Death Verification</p>
                <p class="service-title-nep">मृत्यु प्रमाणितकरण</p>
            </div>
            <span class="service-badge badge-warning">प्रमाणितकरण (Verification)</span>
        </a>

    </div>

    <!-- Search / Track Application Form -->
    <div class="search-section">
        <h3>🔎 Track Your Application &nbsp;/&nbsp; आवेदन ट्र्याक गर्नुहोस्</h3>
        <p>Enter your application number and citizenship number to check status.</p>

        <label for="txtDeathAppNo">Application Number &nbsp;/&nbsp; आवेदन नम्बर</label>
        <asp:TextBox ID="txtDeathAppNo" runat="server" CssClass="form-control"
            placeholder="e.g. DEATH-2081-00123" />

        <label for="txtInformantCitizen">Citizenship Number &nbsp;/&nbsp; नागरिकता नम्बर</label>
        <asp:TextBox ID="txtInformantCitizen" runat="server" CssClass="form-control"
            placeholder="e.g. 12-34-56-78901" />

        <asp:Button ID="BtnDeathSearch" runat="server" Text="Search Status / स्थिति खोज्नुहोस्"
            CssClass="btn-search" OnClick="BtnDeathSearch_Click" />
    </div>

</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</asp:Content>
