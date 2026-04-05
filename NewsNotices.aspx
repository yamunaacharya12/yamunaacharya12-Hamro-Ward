<%@ Page Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="NewsNotices.aspx.cs" Inherits="HamroWard.NewsNotices" %>

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
        background: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='0.04'%3E%3Cpath d='M36 34v-4h-2v4-h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
    }
    .flag-bar { height: 10px; background: repeating-linear-gradient(90deg, var(--crimson) 0, var(--crimson) 24px, var(--navy) 24px, var(--navy) 48px); }
    .hero-inner { max-width: 1200px; margin: 0 auto; padding: 0 24px; display: flex; align-items: center; gap: 20px; color: white; position: relative; }
    .hero-emblem { width: 72px; height: 72px; background: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 36px; box-shadow: 0 8px 24px rgba(0,0,0,0.22); }
    .hero-text h1 { font-size: 1.55rem; font-weight: 700; margin: 0; }
    .hero-text p { font-size: 1rem; margin: 0; opacity: 0.88; }

    /* ── Section Title ── */
    .section-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 40px;
        flex-wrap: wrap;
        gap: 20px;
    }
    .section-title { font-size: 1.5rem; font-weight: 700; color: var(--navy); margin: 0; }
    .section-subtitle { color: #6b7280; font-size: 0.95rem; margin-top: 4px; }

    /* ── View Toggle Button ── */
    .btn-view-toggle {
        background: white;
        color: var(--crimson);
        border: 2px solid var(--crimson);
        padding: 10px 24px;
        border-radius: 12px;
        font-weight: 600;
        transition: all 0.3s ease;
    }
    .btn-view-toggle:hover {
        background: var(--crimson);
        color: white;
        box-shadow: 0 4px 12px rgba(220, 20, 60, 0.2);
    }

    /* ── Notice Cards ── */
    .notice-card {
        background: white;
        border-radius: 20px;
        overflow: hidden;
        border: 1px solid #e8eaf0;
        box-shadow: 0 4px 20px rgba(0,0,0,0.05);
        transition: all 0.3s ease;
        height: 100%;
        display: flex;
        flex-direction: column;
        position: relative;
    }
    .notice-card:hover {
        transform: translateY(-6px);
        box-shadow: 0 12px 30px rgba(0, 43, 127, 0.12);
        border-color: var(--navy-light);
    }
    .notice-card::after {
        content: '';
        position: absolute;
        top: 0; left: 0; width: 4px; height: 100%;
        background: var(--crimson);
    }

    .notice-date-badge {
        position: absolute;
        top: 1.25rem;
        right: 1.25rem;
        background: var(--navy-light);
        color: var(--navy);
        padding: 5px 14px;
        border-radius: 999px;
        font-size: 0.75rem;
        font-weight: 700;
    }

    .notice-content {
        padding: 2rem 1.5rem 1.5rem;
        flex: 1;
    }
    .notice-title {
        font-size: 1.1rem;
        font-weight: 700;
        color: var(--navy);
        margin: 1rem 0;
        line-height: 1.4;
    }
    .notice-description {
        font-size: 0.9rem;
        color: #6b7280;
        margin-bottom: 0;
    }

    .notice-footer {
        padding: 1.25rem 1.5rem;
        background: #f8fafc;
        border-top: 1px solid #f1f5f9;
    }
    .btn-read-more {
        background: none;
        border: none;
        color: var(--crimson);
        font-weight: 700;
        font-size: 0.85rem;
        padding: 0;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }
    .btn-read-more:hover { text-decoration: underline; }

    .notice-col.d-none-extra { display: none !important; }
</style>

<div class="flag-bar"></div>

<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">📰</div>
        <div class="hero-text">
            <h1>News & Notices &nbsp;/&nbsp; सूचना तथा समाचार</h1>
            <p>Ward Office — Stay Updated &nbsp;|&nbsp; वडा कार्यालय — सधैं सूचित रहनुहोस्</p>
        </div>
    </div>
</div>

<main class="container py-4">
    <div class="section-header">
        <div>
            <h2 class="section-title">Latest Updates &nbsp;/&nbsp; पछिल्लो जानकारी</h2>
            <p class="section-subtitle">Important announcements and community activities.</p>
        </div>
        <button type="button" class="btn btn-view-toggle" id="btnViewToggle" onclick="toggleView()">
            View All &nbsp;/&nbsp; सबै हेर्नुहोस्
        </button>
    </div>

    <div class="row row-cols-1 row-cols-md-2 row-cols-xl-3 g-4">
        <div class="col notice-col" data-index="1">
            <div class="notice-card">
                <div class="notice-date-badge">2080-10-13</div>
                <div class="notice-content">
                    <h3 class="notice-title">वडा स्तरीय स्वास्थ्य शिविर संचालन सम्बन्धी सूचना</h3>
                    <p class="notice-description">यस वडा कार्यालयको आयोजनामा मिति २०८०/१०/१५ गते निःशुल्क स्वास्थ्य शिविर सञ्चालन गरिनेछ।</p>
                </div>
                <div class="notice-footer">
                    <button class="btn-read-more">Read Full Notice &rsaquo;</button>
                </div>
            </div>
        </div>

        <div class="col notice-col" data-index="2">
            <div class="notice-card">
                <div class="notice-date-badge">2080-10-12</div>
                <div class="notice-content">
                    <h3 class="notice-title">स्वास्थ्य शिविर सम्बन्धी सूचना</h3>
                    <p class="notice-description">स्वास्थ्य सेवा सम्बन्धी आवश्यक जानकारीका लागि वडा कार्यालयमा सम्पर्क गर्नुहोस्।</p>
                </div>
                <div class="notice-footer"><button class="btn-read-more">Read Full Notice &rsaquo;</button></div>
            </div>
        </div>

        <div class="col notice-col" data-index="3">
            <div class="notice-card">
                <div class="notice-date-badge">2080-10-11</div>
                <div class="notice-content">
                    <h3 class="notice-title">स्वास्थ्य शिविर कार्यक्रम</h3>
                    <p class="notice-description">निःशुल्क स्वास्थ्य परीक्षण सेवा उपलब्ध हुनेछ। सबैलाई उपस्थित हुन अनुरोध।</p>
                </div>
                <div class="notice-footer"><button class="btn-read-more">Read Full Notice &rsaquo;</button></div>
            </div>
        </div>

        <div class="col notice-col d-none-extra" data-index="7">
            <div class="notice-card">
                <div class="notice-date-badge">2080-10-07</div>
                <div class="notice-content">
                    <h3 class="notice-title">जेष्ठ नागरिक परिचयपत्र वितरण</h3>
                    <p class="notice-description">परिचयपत्र वितरण कार्यक्रम वडा कार्यालयमा हुनेछ।</p>
                </div>
                <div class="notice-footer"><button class="btn-read-more">Read Full Notice &rsaquo;</button></div>
            </div>
        </div>
        
        </div>
</main>

<script>
    var expanded = false;
    function toggleView() {
        expanded = !expanded;
        var hiddenCards = document.querySelectorAll('[data-index]');
        var btn = document.getElementById('btnViewToggle');

        hiddenCards.forEach(function (col) {
            var idx = parseInt(col.getAttribute('data-index'), 10);
            if (idx > 6) {
                if (expanded) {
                    col.classList.remove('d-none-extra');
                } else {
                    col.classList.add('d-none-extra');
                }
            }
        });

        btn.innerHTML = expanded
            ? 'View Less &nbsp;/&nbsp; कम देखाउनुहोस्'
            : 'View All &nbsp;/&nbsp; सबै हेर्नुहोस्';
    }
</script>

</asp:Content>