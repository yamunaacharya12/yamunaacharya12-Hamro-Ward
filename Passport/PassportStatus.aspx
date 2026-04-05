<%@ Page Title="Track Passport Status" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="PassportStatus.aspx.cs" Inherits="HamroWard.Passport.PassportStatus" %>

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

    /* ── Tracker Container ── */
    .tracker-box {
        max-width: 800px;
        margin: 0 auto 60px;
        background: white;
        border-radius: 24px;
        padding: 40px;
        box-shadow: 0 10px 40px rgba(0,0,0,0.06);
        border: 1px solid #e8eaf0;
        text-align: center;
    }

    .search-group {
        display: flex;
        gap: 10px;
        margin-top: 25px;
        max-width: 600px;
        margin-left: auto;
        margin-right: auto;
    }

    .form-control {
        border-radius: 12px;
        padding: 14px 20px;
        border: 2px solid #e2e8f0;
        font-size: 1rem;
        transition: 0.3s;
    }

    .form-control:focus {
        border-color: var(--navy);
        box-shadow: 0 0 0 4px var(--navy-light);
        outline: none;
    }

    .btn-track {
        background: var(--navy);
        color: white;
        border: none;
        padding: 0 30px;
        border-radius: 12px;
        font-weight: 600;
        transition: 0.3s;
    }

    .btn-track:hover {
        background: #001e5a;
        transform: translateY(-2px);
    }

    /* ── Status Timeline ── */
    .timeline {
        margin-top: 50px;
        display: flex;
        justify-content: space-between;
        position: relative;
        padding: 0 20px;
    }
    .timeline::before {
        content: '';
        position: absolute;
        top: 20px; left: 50px; right: 50px;
        height: 4px; background: #e2e8f0;
        z-index: 1;
    }
    .step { position: relative; z-index: 2; text-align: center; width: 25%; }
    .step-icon {
        width: 44px; height: 44px;
        background: white;
        border: 4px solid #e2e8f0;
        border-radius: 50%;
        margin: 0 auto 10px;
        display: flex; align-items: center; justify-content: center;
        font-size: 18px; color: #cbd5e1;
    }
    .step.active .step-icon { border-color: var(--crimson); color: var(--crimson); background: var(--crimson-light); }
    .step.completed .step-icon { border-color: #10b981; color: #10b981; background: #ecfdf5; }
    .step-label { font-size: 0.8rem; font-weight: 700; color: #64748b; }
    .step.active .step-label { color: var(--navy); }
</style>

<div class="flag-bar"></div>

<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">🔍</div>
        <div class="hero-text">
            <h1>Track Application &nbsp;/&nbsp; आवेदनको अवस्था</h1>
            <p>Check your Passport Recommendation Status &nbsp;|&nbsp; सिफारिसको वर्तमान स्थिति</p>
        </div>
    </div>
</div>

<main class="container">
    <div class="tracker-box">
        <h4 style="color: var(--navy); font-weight: 700;">Enter Reference Details</h4>
        <p class="text-muted small">सिफारिस ट्र्याक गर्न आफ्नो टोकन नम्बर वा नागरिकता नम्बर राख्नुहोस्</p>
        
        <div class="search-group">
            <asp:TextBox ID="txtTrackID" runat="server" CssClass="form-control flex-grow-1" placeholder="Token ID or Citizenship No." />
            <asp:Button ID="btnTrack" runat="server" Text="Track Status" CssClass="btn-track" />
        </div>

        <div class="timeline">
            <div class="step completed">
                <div class="step-icon">✔</div>
                <div class="step-label">Submitted<br/>पेश गरिएको</div>
            </div>
            <div class="step active">
                <div class="step-icon">⌛</div>
                <div class="step-label">Verification<br/>प्रमाणीकरण</div>
            </div>
            <div class="step">
                <div class="step-icon">✒</div>
                <div class="step-label">Approved<br/>स्वीकृत</div>
            </div>
            <div class="step">
                <div class="step-icon">📩</div>
                <div class="step-label">Ready<br/>तयार छ</div>
            </div>
        </div>

        <div style="margin-top: 40px; padding: 20px; background: #f8fafc; border-radius: 12px; border: 1px solid #e2e8f0;">
            <p class="mb-1 fw-bold" style="color: var(--navy);">Current Remark / कैफियत:</p>
            <p class="text-muted small mb-0">Your documents are currently being reviewed by the Ward Secretary. Please check back after 24 hours.</p>
        </div>
    </div>
</main>

</asp:Content>