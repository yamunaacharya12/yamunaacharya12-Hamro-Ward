<%@ Page Title="Document Checklist" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="PassportChecklist.aspx.cs" Inherits="HamroWard.Passport.PassportChecklist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Noto+Sans+Devanagari:wght@400;500;700&display=swap');

    :root {
        --crimson: #DC143C;
        --navy: #002B7F;
        --crimson-light: rgba(220, 20, 60, 0.08);
        --navy-light: rgba(0, 43, 127, 0.07);
        --success-green: #10b981;
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

    /* ── Checklist Container ── */
    .checklist-card {
        max-width: 1000px;
        margin: 0 auto 60px;
        background: white;
        border-radius: 24px;
        padding: 40px;
        box-shadow: 0 10px 40px rgba(0,0,0,0.06);
    }

    .check-item {
        display: flex;
        align-items: flex-start;
        gap: 15px;
        padding: 15px;
        border-bottom: 1px solid #f1f5f9;
        transition: 0.2s;
    }
    .check-item:hover { background: var(--navy-light); border-radius: 12px; }
    
    .custom-checkbox {
        width: 22px; height: 22px;
        border: 2px solid var(--navy);
        border-radius: 6px;
        flex-shrink: 0;
        margin-top: 3px;
        cursor: pointer;
    }

    .check-text h6 { margin: 0; font-weight: 700; color: var(--navy); font-size: 1rem; }
    .check-text p { margin: 0; color: #64748b; font-size: 0.85rem; }

    /* ── Photo Guide ── */
    .photo-guide-box {
        background: #f8fafc;
        border-radius: 16px;
        padding: 25px;
        margin-top: 30px;
        border: 1px solid #e2e8f0;
    }
    .photo-spec {
        display: inline-block;
        background: white;
        padding: 10px 20px;
        border-radius: 10px;
        border: 1px solid #cbd5e1;
        margin: 5px;
        font-weight: 600;
        font-size: 0.85rem;
        color: var(--navy);
    }

    .print-btn {
        background: var(--crimson);
        color: white;
        border: none;
        padding: 12px 25px;
        border-radius: 10px;
        font-weight: 700;
        cursor: pointer;
        transition: 0.3s;
    }
    .print-btn:hover { background: #b91c1c; transform: scale(1.05); }
</style>

<div class="flag-bar"></div>

<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">✅</div>
        <div class="hero-text">
            <h1>Final Checklist &nbsp;/&nbsp; अन्तिम चेकलिस्ट</h1>
            <p>Ensure everything is ready for submission &nbsp;|&nbsp; पेश गर्नु अघि सबै कुरा रुजु गर्नुहोस्</p>
        </div>
    </div>
</div>

<main class="container">
    <div class="checklist-card">
        
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4 class="fw-bold m-0" style="color: var(--navy);">Required for Appointment</h4>
            <button type="button" class="print-btn" onclick="window.print();">
                <i class="fas fa-print"></i> Print Checklist
            </button>
        </div>

        <div class="check-item">
            <div class="custom-checkbox"></div>
            <div class="check-text">
                <h6>Printed Pre-Enrollment Form</h6>
                <p>Download and print the form with the Barcode after online submission.</p>
            </div>
        </div>

        <div class="check-item">
            <div class="custom-checkbox"></div>
            <div class="check-text">
                <h6>Original Citizenship Certificate</h6>
                <p>Mandatory for all adults. Must be clearly legible with no physical damage.</p>
            </div>
        </div>

        <div class="check-item">
            <div class="custom-checkbox"></div>
            <div class="check-text">
                <h6>Ward Recommendation Letter</h6>
                <p>Required for new passports, name changes, or minor applications.</p>
            </div>
        </div>

        <div class="check-item">
            <div class="custom-checkbox"></div>
            <div class="check-text">
                <h6>Payment Receipt / Voucher</h6>
                <p>Proof of payment of NRS 5,000 or 12,000 as per chosen service.</p>
            </div>
        </div>

        <div class="photo-guide-box">
            <h5 class="fw-bold mb-3" style="color: var(--crimson);">e-Passport Photo Specs (ICAO Standard)</h5>
            <div class="row align-items-center">
                <div class="col-md-8">
                    <p class="small text-muted mb-3">While photos are captured at the DAO, you may need physical photos for minor applications at the ward office.</p>
                    <div class="photo-spec">Size: 35mm x 45mm</div>
                    <div class="photo-spec">Background: Plain White</div>
                    <div class="photo-spec">Expression: Neutral (No Smile)</div>
                    <div class="photo-spec">Clothing: Dark Colored (No White)</div>
                </div>
                <div class="col-md-4 text-center">
                    <i class="fas fa-camera-retro fa-4x text-muted opacity-25"></i>
                </div>
            </div>
        </div>

        <div class="mt-5 p-3 text-center" style="border-top: 1px dashed #cbd5e1;">
            <p class="small text-muted mb-0">Note: This checklist is for information purposes based on current DoP guidelines.</p>
        </div>
    </div>
</main>

</asp:Content>