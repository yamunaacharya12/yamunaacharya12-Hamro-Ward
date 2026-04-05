<%@ Page Title="Passport Services" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="Passport.aspx.cs" Inherits="HamroWard.Passport.Passport" %>

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
        position: relative;
    }
    .hero-emblem {
        width: 72px; height: 72px;
        background: white;
        border-radius: 50%;
        display: flex; align-items: center; justify-content: center;
        font-size: 40px;
        box-shadow: 0 8px 24px rgba(0,0,0,0.22);
    }
    .hero-text h1 { font-size: 1.55rem; font-weight: 700; margin: 0; }
    .hero-text p  { font-size: 1rem; margin: 0; opacity: 0.88; }

    /* ── Breadcrumb ── */
    .breadcrumb-wrap { font-size: 0.82rem; color: #6b7280; margin-bottom: 28px; }
    .breadcrumb-wrap a { color: var(--crimson); text-decoration: none; }

    /* ── Section Header ── */
    .section-intro { text-align: center; margin-bottom: 40px; }
    .section-intro h2 { font-size: 1.5rem; font-weight: 700; color: var(--navy); margin-bottom: 8px; }

    /* ── Service Grid ── */
    .service-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
        gap: 24px;
        max-width: 1100px;
        margin: 0 auto 60px;
        padding: 0 16px;
    }

    .service-card {
        background: white;
        border: 2px solid #e8eaf0;
        border-radius: 20px;
        padding: 32px 24px;
        text-align: center;
        text-decoration: none;
        color: #1e2937;
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 12px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.06);
        transition: all 0.25s ease;
        position: relative;
        overflow: hidden;
    }
    .service-card::after {
        content: '';
        position: absolute;
        bottom: 0; left: 0; right: 0; height: 4px;
        background: linear-gradient(90deg, var(--crimson), var(--navy));
        transform: scaleX(0);
        transition: transform 0.25s ease;
    }
    .service-card:hover {
        border-color: var(--crimson);
        transform: translateY(-5px);
        box-shadow: 0 12px 40px rgba(220,20,60,0.12);
    }
    .service-card:hover::after { transform: scaleX(1); }

    .service-icon {
        width: 70px; height: 70px;
        border-radius: 50%;
        background: var(--navy-light);
        display: flex; align-items: center; justify-content: center;
        font-size: 2rem;
        color: var(--navy);
        margin-bottom: 8px;
    }
    .service-title { font-size: 1.05rem; font-weight: 700; color: #1e2937; margin: 0; }
    .service-title-nep { font-size: 0.82rem; color: var(--navy); opacity: 0.8; font-weight: 500; }
    
    .service-badge {
        font-size: 0.72rem;
        font-weight: 700;
        padding: 4px 14px;
        border-radius: 999px;
        background: var(--crimson-light);
        color: var(--crimson);
        margin-top: 5px;
    }
    .badge-navy { background: var(--navy-light); color: var(--navy); }
</style>

<div class="flag-bar"></div>

<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">🌍</div>
        <div class="hero-text">
            <h1>Passport Services &nbsp;/&nbsp; राहदानी सेवा</h1>
            <p>Ward Office — e-Passport Recommendation &nbsp;|&nbsp; वडा कार्यालय — सिफारिस प्रणाली</p>
        </div>
    </div>
</div>

<main style="max-width:1200px; margin:0 auto; padding:0 16px;">
    
    <nav class="breadcrumb-wrap">
        <a href="~/Default.aspx" runat="server">Home</a> &rsaquo;
        <span>Passport Services</span>
    </nav>

    <div class="section-intro">
        <h2>Select a Passport Service &nbsp;/&nbsp; सेवा छान्नुहोस्</h2>
    </div>

    <div class="service-grid">
        <a href="#" class="service-card">
            <div class="service-icon">📕</div>
            <div>
                <p class="service-title">New Passport Recommendation</p>
                <p class="service-title-nep">नयाँ राहदानी सिफारिस</p>
            </div>
            <span class="service-badge">First Time</span>
        </a>

        <a href="#" class="service-card">
            <div class="service-icon">🔄</div>
            <div>
                <p class="service-title">Passport Renewal</p>
                <p class="service-title-nep">राहदानी नवीकरण सिफारिस</p>
            </div>
            <span class="service-badge">Renewal</span>
        </a>

        <a href="#" class="service-card">
            <div class="service-icon">⚠️</div>
            <div>
                <p class="service-title">Lost / Damaged Replacement</p>
                <p class="service-title-nep">हराएको / बिग्रिएको राहदानी</p>
            </div>
            <span class="service-badge">Replacement</span>
        </a>

        <a href="#" class="service-card">
            <div class="service-icon">🧒</div>
            <div>
                <p class="service-title">Minor Passport Service</p>
                <p class="service-title-nep">नाबालक राहदानी सिफारिस</p>
            </div>
            <span class="service-badge badge-navy">Under 16</span>
        </a>

        <a href="#" class="service-card">
            <div class="service-icon">🔍</div>
            <div>
                <p class="service-title">Track Verification Status</p>
                <p class="service-title-nep">सिफारिसको अवस्था बुझ्नुहोस्</p>
            </div>
            <span class="service-badge badge-navy">Tracking</span>
        </a>

        <a href="#" class="service-card">
            <div class="service-icon">📑</div>
            <div>
                <p class="service-title">Required Documents</p>
                <p class="service-title-nep">आवश्यक कागजातहरू</p>
            </div>
            <span class="service-badge">Guidelines</span>
        </a>
    </div>
</main>

</asp:Content>