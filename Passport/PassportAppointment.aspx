<%@ Page Title="Passport Appointment Guide" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="PassportAppointment.aspx.cs" Inherits="HamroWard.Passport.PassportAppointment" %>

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
        font-family: 'Inter', 'Noto Sans Devanagari', sans-serif;
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

    /* ── Process Steps ── */
    .process-container {
        max-width: 900px;
        margin: 0 auto 60px;
        background: white;
        border-radius: 24px;
        padding: 40px;
        box-shadow: 0 10px 40px rgba(0,0,0,0.06);
    }

    .step-item {
        display: flex;
        gap: 25px;
        margin-bottom: 35px;
        position: relative;
    }
    .step-item:not(:last-child)::after {
        content: '';
        position: absolute;
        left: 25px; top: 60px; bottom: -20px;
        width: 2px; background: #e2e8f0;
    }

    .step-number {
        width: 54px; height: 54px;
        background: var(--navy);
        color: white;
        border-radius: 50%;
        display: flex; align-items: center; justify-content: center;
        font-weight: 700; font-size: 1.2rem;
        flex-shrink: 0;
        box-shadow: 0 4px 12px rgba(0, 43, 127, 0.2);
    }

    .step-content { padding-top: 10px; }
    .step-content h5 { font-weight: 700; color: var(--navy); margin-bottom: 8px; }
    .step-content p { color: #64748b; font-size: 0.95rem; line-height: 1.5; }

    .external-link {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        color: var(--crimson);
        font-weight: 600;
        text-decoration: none;
        background: var(--crimson-light);
        padding: 8px 16px;
        border-radius: 8px;
        margin-top: 10px;
    }
</style>

<div class="flag-bar"></div>

<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">📅</div>
        <div class="hero-text">
            <h1>Pre-Enrollment Guide &nbsp;/&nbsp; आवेदन प्रक्रिया</h1>
            <p>Step-by-step to your e-Passport &nbsp;|&nbsp; विद्युतीय राहदानी प्राप्त गर्ने प्रक्रिया</p>
        </div>
    </div>
</div>

<main class="container">
    <div class="process-container">
        
        <div class="step-item">
            <div class="step-number">1</div>
            <div class="step-content">
                <h5>Ward Recommendation / वडा सिफारिस</h5>
                <p>First, complete the online recommendation form on this portal and visit the Ward Office for verification. 
                <br/><span class="text-danger small fw-bold">Note: Required only for new or minor passports.</span></p>
            </div>
        </div>

        <div class="step-item">
            <div class="step-number">2</div>
            <div class="step-content">
                <h5>Online Pre-Enrollment / अनलाइन फारम</h5>
                <p>Visit the official Department of Passport (DoP) website to fill the pre-enrollment form and choose your appointment date.</p>
                <a href="https://emrtds.nepalpassport.gov.np/" target="_blank" class="external-link">
                    Open Official Portal <i class="fas fa-external-link-alt"></i>
                </a>
            </div>
        </div>

        <div class="step-item">
            <div class="step-number">3</div>
            <div class="step-content">
                <h5>Payment & Submission / दस्तुर र बुझाउने</h5>
                <p>Pay the required fee at the DAO (District Administration Office) or designated banks and provide your biometrics on the scheduled date.</p>
            </div>
        </div>

        <div class="step-item">
            <div class="step-number">4</div>
            <div class="step-content">
                <h5>Collection / राहदानी संकलन</h5>
                <p>Once you receive an SMS from the DoP, visit the office with your old passport or citizenship to collect your new e-Passport.</p>
            </div>
        </div>

        <div class="text-center mt-5 p-4" style="background: #f8fafc; border-radius: 16px; border: 1px solid #e2e8f0;">
            <p class="mb-2 fw-bold" style="color: var(--navy);">Need Assistance? &nbsp;/&nbsp; सहायता आवश्यक छ?</p>
            <p class="small text-muted mb-0">Visit the Ward Office help desk for free assistance with online pre-enrollment.</p>
        </div>

    </div>
</main>

</asp:Content>