<%@ Page Title="Passport Guidelines" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="PassportGuidelines.aspx.cs" Inherits="HamroWard.Passport.PassportGuidelines" %>

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

    /* ── Content Layout ── */
    .guide-container {
        max-width: 1000px;
        margin: 0 auto 60px;
        background: white;
        border-radius: 24px;
        padding: 45px;
        box-shadow: 0 10px 40px rgba(0,0,0,0.06);
    }

    .info-card {
        border: 1px solid #e2e8f0;
        border-radius: 16px;
        padding: 24px;
        margin-bottom: 24px;
        transition: 0.3s;
    }
    .info-card:hover { border-color: var(--navy); background: var(--navy-light); }

    .card-icon {
        font-size: 1.5rem;
        color: var(--crimson);
        margin-bottom: 12px;
        display: block;
    }

    .doc-list { list-style: none; padding: 0; margin: 0; }
    .doc-list li {
        padding: 10px 0;
        border-bottom: 1px solid #f1f5f9;
        display: flex;
        align-items: center;
        gap: 12px;
        font-size: 0.95rem;
    }
    .doc-list li:last-child { border-bottom: none; }
    .doc-list li::before { content: '✔'; color: #10b981; font-weight: bold; }

    .fee-badge {
        background: var(--crimson);
        color: white;
        padding: 4px 12px;
        border-radius: 6px;
        font-weight: 700;
        font-size: 0.85rem;
        float: right;
    }

    .btn-apply-now {
        display: inline-block;
        background: var(--navy);
        color: white;
        padding: 14px 30px;
        border-radius: 12px;
        text-decoration: none;
        font-weight: 700;
        margin-top: 20px;
        transition: 0.3s;
    }
    .btn-apply-now:hover { background: var(--crimson); color: white; transform: translateY(-2px); }
</style>

<div class="flag-bar"></div>

<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">📑</div>
        <div class="hero-text">
            <h1>Required Documents &nbsp;/&nbsp; आवश्यक कागजातहरू</h1>
            <p>Guidelines for Passport Application &nbsp;|&nbsp; राहदानी आवेदनका लागि निर्देशिका</p>
        </div>
    </div>
</div>

<main class="container">
    <div class="guide-container">
        
        <div class="row">
            <div class="col-md-6">
                <div class="info-card">
                    <span class="card-icon">📕</span>
                    <h5 class="fw-bold" style="color: var(--navy);">New Passport (Adult)</h5>
                    <p class="text-muted small">नयाँ राहदानीका लागि आवश्यक कागजातहरू</p>
                    <ul class="doc-list">
                        <li>Original Citizenship Certificate</li>
                        <li>Marriage Certificate (If applicable)</li>
                        <li>Pre-enrollment Form (Online Copy)</li>
                        <li>Payment Voucher of NRS 5,000/12,000</li>
                    </ul>
                </div>
            </div>

            <div class="col-md-6">
                <div class="info-card">
                    <span class="card-icon">🧒</span>
                    <h5 class="fw-bold" style="color: var(--navy);">Minor (Under 16)</h5>
                    <p class="text-muted small">नाबालक राहदानीका लागि आवश्यक कागजातहरू</p>
                    <ul class="doc-list">
                        <li>Birth Registration Certificate</li>
                        <li>Father/Mother's Citizenship</li>
                        <li>Guardian Presence at Ward</li>
                        <li>Recent Passport Size Photos (2)</li>
                    </ul>
                </div>
            </div>

            <div class="col-md-12">
                <div class="info-card" style="border-left: 5px solid var(--crimson);">
                    <h5 class="fw-bold" style="color: var(--navy);"><i class="fas fa-money-bill-wave"></i> Service Fees &nbsp;/&nbsp; दस्तुर विवरण</h5>
                    <hr/>
                    <div class="mb-2">
                        <span>Normal Processing (DAO)</span>
                        <span class="fee-badge">NRS 5,000</span>
                    </div>
                    <div class="mb-2">
                        <span>Expedited Processing (Department)</span>
                        <span class="fee-badge">NRS 12,000</span>
                    </div>
                    <p class="text-muted small mt-3">* Ward recommendation charges may apply separately as per local bylaws.</p>
                </div>
            </div>
        </div>

        <div class="text-center">
            <h5 class="fw-bold mb-3">Ready to Start?</h5>
            <a href="Passport.aspx" class="btn-apply-now">Apply for Recommendation Now</a>
        </div>

    </div>
</main>

</asp:Content>