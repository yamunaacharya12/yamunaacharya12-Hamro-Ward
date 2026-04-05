<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master"
    AutoEventWireup="true" CodeBehind="Service.aspx.cs"
    Inherits="HamroWard.Service" %>

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
        margin-top: 50px;
    }

    /* ── Flag Bar ── */
    .flag-bar {
        height: 10px;
        background: repeating-linear-gradient(90deg,
            var(--crimson) 0, var(--crimson) 24px,
            var(--navy) 24px, var(--navy) 48px);
    }

    /* ── Hero Header ── */
    .hero-header {
        width: 100%;
        min-height: 380px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        text-align: center;
        padding: 60px 20px 50px;
        color: #fff;
        position: relative;
        overflow: hidden;
        background: linear-gradient(135deg, var(--crimson) 0%, var(--navy) 100%),
                    url("slider/service.jpeg") center/cover no-repeat;
        background-blend-mode: multiply;
    }

    .hero-header::before {
        content: '';
        position: absolute;
        inset: 0;
        background: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='0.04'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
    }

    .hero-emblem {
        width: 80px; height: 80px;
        background: white;
        border-radius: 50%;
        display: flex; align-items: center; justify-content: center;
        font-size: 42px;
        box-shadow: 0 8px 28px rgba(0,0,0,0.25);
        margin-bottom: 20px;
        position: relative;
        z-index: 1;
    }

    .title-main {
        font-size: 2.4rem;
        font-weight: 800;
        margin-bottom: 10px;
        position: relative;
        z-index: 1;
        text-shadow: 0 2px 12px rgba(0,0,0,0.2);
    }

    .subtitle {
        font-size: 1rem;
        max-width: 600px;
        margin-bottom: 30px;
        color: rgba(255,255,255,0.88);
        position: relative;
        z-index: 1;
    }

    /* ── Search Box ── */
    .search-box {
        width: 100%;
        max-width: 520px;
        position: relative;
        z-index: 1;
    }

    .search-input {
        width: 100%;
        padding: 14px 22px 14px 50px;
        border-radius: 50px;
        border: none;
        outline: none;
        font-size: 1rem;
        box-shadow: 0 8px 24px rgba(0,0,0,0.18);
        font-family: 'Inter', system-ui, sans-serif;
        transition: box-shadow 0.2s;
    }

    .search-input:focus {
        box-shadow: 0 8px 32px rgba(220,20,60,0.25);
    }

    .search-icon {
        position: absolute;
        left: 18px;
        top: 50%;
        transform: translateY(-50%);
        font-size: 1.2rem;
        color: #6b7280;
        z-index: 2;
    }

    /* ── Section Title ── */
    .section-title {
        text-align: center;
        font-size: 1.5rem;
        font-weight: 700;
        color: var(--navy);
        margin-bottom: 8px;
    }

    .section-subtitle {
        text-align: center;
        color: #6b7280;
        font-size: 0.92rem;
        margin-bottom: 36px;
    }

    /* ── Service Cards Grid ── */
    .popular-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 24px;
    }

    .service-card {
        background: white;
        padding: 28px 26px;
        border-radius: 20px;
        border: 2px solid #e8eaf0;
        box-shadow: 0 4px 20px rgba(0,0,0,0.06);
        transition: all 0.25s ease;
        display: flex;
        flex-direction: column;
        gap: 10px;
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
        transform: translateY(-6px);
        border-color: var(--crimson);
        box-shadow: 0 16px 40px rgba(220,20,60,0.13);
    }

    .service-card:hover::after {
        transform: scaleX(1);
    }

    .card-icon {
        width: 54px; height: 54px;
        background: var(--crimson-light);
        border-radius: 14px;
        display: flex; align-items: center; justify-content: center;
        font-size: 1.6rem;
        transition: background 0.25s;
    }

    .service-card:hover .card-icon {
        background: linear-gradient(135deg, var(--crimson-light), var(--navy-light));
    }

    .service-title {
        font-size: 1.05rem;
        font-weight: 700;
        color: #1e2937;
        margin: 0;
    }

    .service-desc {
        color: #6b7280;
        font-size: 0.88rem;
        margin: 0;
        line-height: 1.55;
        flex: 1;
    }

    .btn-start {
        display: inline-block;
        background: linear-gradient(135deg, var(--crimson), var(--navy));
        color: #fff !important;
        padding: 10px 24px;
        border-radius: 50px;
        text-decoration: none;
        font-weight: 600;
        font-size: 0.88rem;
        transition: all 0.25s ease;
        box-shadow: 0 4px 14px rgba(220,20,60,0.25);
        align-self: flex-start;
        margin-top: 4px;
    }

    .btn-start:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 20px rgba(220,20,60,0.35);
        color: white !important;
    }

    /* ── Container ── */
    .container-inner {
        max-width: 1200px;
        margin: auto;
        padding: 52px 20px 60px;
    }

    /* ── Responsive ── */
    @media (max-width: 768px) {
        .hero-header { min-height: 320px; }
        .title-main { font-size: 1.8rem; }
        .subtitle { font-size: 0.92rem; }
    }

    /* ── Language toggle ── */
    [data-lang="np"] { display: none; }
    body.np [data-lang="en"] { display: none; }
    body.np [data-lang="np"] { display: block; }
</style>

<!-- Flag Bar -->
<div class="flag-bar"></div>

<!-- HERO SECTION -->
<header class="hero-header">
    <div class="hero-emblem">⚙️</div>

    <h1 class="title-main" data-lang="en">Our Services &nbsp;/&nbsp; सेवाहरू</h1>

    <p class="subtitle" data-lang="en">
        Access all ward office services digitally in one place.<br />
        सबै वडा कार्यालय सेवाहरू डिजिटल रूपमा एकै ठाउँमा।
    </p>

    <!-- Search -->
    <div class="search-box">
        <span class="search-icon">🔍</span>
        <asp:TextBox ID="txtSearch" runat="server" CssClass="search-input"
            placeholder="Search services... / सेवाहरू खोज्नुहोस्..." />
    </div>
</header>

<!-- SERVICES SECTION -->
<div class="container-inner">

    <h2 class="section-title">Available Services &nbsp;/&nbsp; उपलब्ध सेवाहरू</h2>
    <p class="section-subtitle">वडा कार्यालयबाट प्रदान गरिने डिजिटल सेवाहरू / Digital services provided by the Ward Office</p>

    <div class="popular-grid">

        <!-- Passport -->
        <div class="service-card">
            <div class="card-icon">🛂</div>
            <h3 class="service-title">Apply for Passport / राहदानी आवेदन</h3>
            <p class="service-desc">Submit your passport application online with digital document upload and real-time tracking.</p>
            <a href="<%= ResolveUrl("~/Passport/Passport.aspx") %>" class="btn-start">Get Started →</a>
        </div>

        <!-- Birth Certificate -->
        <div class="service-card">
            <div class="card-icon">👶</div>
            <h3 class="service-title">Birth Registration / जन्मदर्ता</h3>
            <p class="service-desc">Register a new birth certificate or manage existing records online with official verification.</p>
            <a href="/Birthregistration/Birth.aspx" class="btn-start">Apply Now →</a>
        </div>

        <!-- Death Certificate -->
        <div class="service-card">
            <div class="card-icon">📋</div>
            <h3 class="service-title">Death Registration / मृत्युदर्ता</h3>
            <p class="service-desc">Register death certificate records for official documentation and legal purposes.</p>
            <a href="<%= ResolveUrl("~/DeathRegistration/Death.aspx") %>" class="btn-start">Apply Now →</a>
        </div>

        <!-- Migration Certificate -->
        <div class="service-card">
            <div class="card-icon">🏘️</div>
            <h3 class="service-title">Migration Certificate / बसाइसराइ</h3>
            <p class="service-desc">Apply for migration certificate for residential record transfer between wards or districts.</p>
            <a href="MigrationRegistration/Migration.aspx" class="btn-start">Apply Now →</a>
        </div>

        <!-- Citizenship -->
        <div class="service-card">
            <div class="card-icon">🪪</div>
            <h3 class="service-title">Citizenship Registration / नागरिकता दर्ता</h3>
            <p class="service-desc">Apply for new citizenship certificate or manage existing citizenship records online.</p>
            <a href="/CitizenshipRegistration/Citizenship.aspx" class="btn-start">Apply Now →</a>
        </div>

        <!-- Property Tax -->
        <div class="service-card">
            <div class="card-icon">🏠</div>
            <h3 class="service-title">Pay Property Tax / सम्पत्ति कर</h3>
            <p class="service-desc">Secure online portal for property tax payment with instant receipt generation.</p>
            <a href="<%= ResolveUrl("~/PropertyTax/PropertyTax.aspx") %>" class="btn-start">Pay Now →</a>
        </div>

        <!-- Business Registration -->
        <div class="service-card">
            <div class="card-icon">🏢</div>
            <h3 class="service-title">Business Registration / व्यापार दर्ता</h3>
            <p class="service-desc">Register your business with streamlined digital processing and document submission.</p>
            <a href="BusinessRegistration/BusinessDashboard.aspx" target="_blank" class="btn-start">Apply Now →</a>
        </div>

        <!-- Complaint -->
        <div class="service-card">
            <div class="card-icon">📣</div>
            <h3 class="service-title">Register Complaint / गुनासो दर्ता</h3>
            <p class="service-desc">Submit complaints or grievances to the ward office for quick resolution and follow-up.</p>
            <a href="/Complaint.aspx" class="btn-start">Submit →</a>
        </div>

    </div>
</div>

<script>
    // Search filter
    document.getElementById('<%= txtSearch.ClientID %>').addEventListener('keyup', function () {
        var value = this.value.toLowerCase();
        document.querySelectorAll('.service-card').forEach(function (card) {
            card.style.display = card.innerText.toLowerCase().includes(value) ? 'block' : 'none';
        });
    });
</script>

</asp:Content>
