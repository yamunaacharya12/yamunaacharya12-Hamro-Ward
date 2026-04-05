<%@ Page Title="Business Services Dashboard" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="BusinessDashboard.aspx.cs" Inherits="HamroWard.BusinessRegistration.BusinessDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    :root {
        --crimson: #DC143C;
        --navy: #002B7F;
        --crimson-light: rgba(220, 20, 60, 0.08);
        --navy-light: rgba(0, 43, 127, 0.07);
    }

    body {
        font-family: 'Inter', 'Noto Sans Devanagari', sans-serif;
        background: linear-gradient(160deg, #f1f5f9 0%, #e0e7ff 100%);
        margin-top: 50px;
    }

    /* ── Page Hero ── */
    .page-hero {
        background: linear-gradient(135deg, var(--crimson) 0%, var(--navy) 100%);
        padding: 40px 0;
        margin-bottom: 40px;
        color: white;
    }
    .flag-bar { height: 10px; background: repeating-linear-gradient(90deg, var(--crimson) 0, var(--crimson) 24px, var(--navy) 24px, var(--navy) 48px); }
    .hero-inner { max-width: 1200px; margin: 0 auto; padding: 0 24px; display: flex; align-items: center; gap: 25px; }
    .hero-emblem { width: 80px; height: 80px; background: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 45px; box-shadow: 0 8px 24px rgba(0,0,0,0.2); }

    /* ── Service Grid ── */
    .service-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 25px;
        max-width: 1200px;
        margin: 0 auto 60px;
        padding: 0 20px;
    }

    .service-card {
        background: white;
        border-radius: 20px;
        padding: 30px;
        text-align: center;
        text-decoration: none;
        color: inherit;
        transition: 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        border: 1px solid #e2e8f0;
        display: flex;
        flex-direction: column;
        align-items: center;
        box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
    }

    .service-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
        border-color: var(--crimson);
    }

    .card-icon {
        width: 70px;
        height: 70px;
        background: var(--navy-light);
        color: var(--navy);
        border-radius: 15px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 30px;
        margin-bottom: 20px;
        transition: 0.3s;
    }

    .service-card:hover .card-icon {
        background: var(--crimson);
        color: white;
    }

    .service-card h4 { font-weight: 700; color: var(--navy); margin-bottom: 10px; }
    .service-card p { font-size: 0.9rem; color: #64748b; line-height: 1.5; }

    .badge-new { background: #10b981; color: white; padding: 4px 10px; border-radius: 20px; font-size: 10px; font-weight: 700; position: absolute; top: 15px; right: 15px; }
</style>

<div class="flag-bar"></div>

<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">💼</div>
        <div class="hero-text">
            <h1>Business Portal &nbsp;/&nbsp; व्यवसाय सेवा पोर्टल</h1>
            <p>One-stop solution for local entrepreneurs &nbsp;|&nbsp; उद्यमीहरूका लागि एकीकृत सेवा</p>
        </div>
    </div>
</div>

<main class="container">
    <div class="service-grid">
        
        <a href="BusinessRegister.aspx" class="service-card" style="position: relative;">
            <span class="badge-new">ONLINE</span>
            <div class="card-icon">🏢</div>
            <h4>New Registration</h4>
            <p>Apply for a new business operating license within the Ward.</p>
            <span class="text-primary fw-bold mt-auto">दर्ता गर्नुहोस् →</span>
        </a>

        <a href="BusinessRenewal.aspx" class="service-card">
            <div class="card-icon">🔄</div>
            <h4>Business Renewal</h4>
            <p>Renew your existing license for the current fiscal year.</p>
            <span class="text-primary fw-bold mt-auto">नवीकरण गर्नुहोस् →</span>
        </a>

        <a href="BusinessStatus.aspx" class="service-card">
            <div class="card-icon">🔍</div>
            <h4>Track Status</h4>
            <p>Check the real-time progress of your application.</p>
            <span class="text-primary fw-bold mt-auto">अवस्था हेर्नुहोस् →</span>
        </a>

        <a href="BusinessCalculator.aspx" class="service-card">
            <div class="card-icon">🧮</div>
            <h4>Fee Calculator</h4>
            <p>Estimate registration and renewal fees based on capital.</p>
            <span class="text-primary fw-bold mt-auto">हिसाब गर्नुहोस् →</span>
        </a>

        <a href="BusinessGuidelines.aspx" class="service-card">
            <div class="card-icon">📋</div>
            <h4>Requirements</h4>
            <p>View the list of documents required for different businesses.</p>
            <span class="text-primary fw-bold mt-auto">नियमहरू पढ्नुहोस् →</span>
        </a>

        <a href="BusinessClosure.aspx" class="service-card">
            <div class="card-icon">🛑</div>
            <h4>Business Closure</h4>
            <p>Request to permanently close your business records.</p>
            <span class="text-primary fw-bold mt-auto">खारेजी आवेदन →</span>
        </a>

    </div>

    <div class="text-center mb-5">
        <div class="p-4 bg-white rounded-pill d-inline-block shadow-sm border">
            <p class="mb-0 small text-muted">
                <i class="fas fa-headset text-danger me-2"></i> 
                Need help with registration? Visit the <strong>Business Help Desk</strong> at the Ward Office.
            </p>
        </div>
    </div>
</main>

</asp:Content>