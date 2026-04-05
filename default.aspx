<%@ Page Title="Home" Language="C#" MasterPageFile="home.master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="HamroWard._default" %>

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
      
    }

    /* ── Flag Bar ── */
    .flag-bar {
        height: 10px;
        background: repeating-linear-gradient(90deg,
            var(--crimson) 0, var(--crimson) 24px,
            var(--navy) 24px, var(--navy) 48px);
    }

    /* ── Hero Section ── */
    .hero-wrapper {
        position: relative;
        overflow: hidden;
    }

    .hero-wrapper img {
        height: 80vh;
        object-fit: cover;
        object-position: center;
        width: 100%;
        filter: brightness(0.45);
    }

    .hero-overlay {
       
        position: absolute;
        inset: 0;
        background: linear-gradient(135deg,
            rgba(220,20,60,0.55) 0%,
            rgba(0,43,127,0.65) 100%);
    }

    .hero-content {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        text-align: center;
        color: white;
        width: 100%;
        padding: 0 20px;
        z-index: 3;
    }

    .hero-content h1 {
        font-size: 2.4rem;
        font-weight: 700;
        margin-bottom: 10px;
        text-shadow: 0 2px 12px rgba(0,0,0,0.3);
    }

    .hero-content p {
        font-size: 1.05rem;
        opacity: 0.92;
        margin-bottom: 36px;
        text-shadow: 0 1px 6px rgba(0,0,0,0.2);
    }

    .hero-btn {
        width: 180px;
        padding: 18px 12px;
        border-radius: 20px;
        color: white;
        text-decoration: none;
        font-weight: 600;
        display: inline-block;
        margin: 8px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.25);
        transition: all 0.3s;
        backdrop-filter: blur(6px);
        border: 2px solid rgba(255,255,255,0.2);
    }

    .hero-btn i { font-size: 28px; display: block; margin-bottom: 8px; }
    .hero-btn small { font-size: 0.78rem; opacity: 0.88; display: block; margin-top: 4px; }
    .hero-btn.green  { background: rgba(34,167,69,0.85); }
    .hero-btn.orange { background: rgba(242,101,34,0.85); }
    .hero-btn.blue   { background: rgba(37,99,235,0.85); }
    .hero-btn:hover  { transform: translateY(-6px); color: white; box-shadow: 0 16px 35px rgba(0,0,0,0.3); }

    /* ── Popular Services ── */
    .services-section {
        margin-top: -80px;
        position: relative;
        z-index: 3;
        padding: 0 16px;
    }

    .services-card {
        background: white;
        border-radius: 24px;
        padding: 36px 32px;
        box-shadow: 0 20px 60px rgba(0,0,0,0.12);
        border: 1.5px solid #e8eaf0;
    }

    .services-title {
        font-size: 1.25rem;
        font-weight: 700;
        color: var(--navy);
        margin-bottom: 0;
    }

    .view-all-link {
        color: var(--crimson);
        text-decoration: none;
        font-weight: 600;
        font-size: 0.9rem;
        border: 2px solid var(--crimson-light);
        padding: 6px 16px;
        border-radius: 50px;
        transition: all 0.2s;
    }
    .view-all-link:hover {
        background: var(--crimson);
        color: white;
        border-color: var(--crimson);
    }

    .service-box {
        background: #fafafa;
        border: 2px solid #e8eaf0;
        border-radius: 16px;
        padding: 22px 14px;
        text-align: center;
        transition: all 0.25s ease;
        cursor: pointer;
        height: 100%;
    }

    .service-box i {
        font-size: 32px;
        background: linear-gradient(135deg, var(--crimson), var(--navy));
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
    }

    .service-box h6 {
        font-size: 0.88rem;
        font-weight: 700;
        color: #1e2937;
        margin-top: 10px;
        margin-bottom: 4px;
    }

    .service-box p {
        font-size: 0.75rem;
        color: #9ca3af;
        margin: 0;
    }

    .service-box:hover {
        border-color: var(--crimson);
        background: white;
        box-shadow: 0 8px 28px rgba(220,20,60,0.12);
        transform: translateY(-4px);
    }

    /* ── News Section ── */
    .news-section {
        margin: 48px 0;
        padding: 0 16px;
    }

    .news-wrapper {
        background: white;
        border-radius: 24px;
        padding: 36px 32px;
        box-shadow: 0 12px 40px rgba(0,0,0,0.08);
        border: 1.5px solid #e8eaf0;
    }

    .news-title {
        font-size: 1.25rem;
        font-weight: 700;
        color: var(--navy);
        margin-bottom: 2px;
    }

    .news-item {
        position: relative;
        padding-left: 18px;
        margin-bottom: 24px;
    }

    .news-line {
        position: absolute;
        left: 0;
        top: 0;
        width: 4px;
        height: 100%;
        background: linear-gradient(to bottom, var(--crimson), var(--navy));
        border-radius: 4px;
    }

    .news-item small {
        font-size: 0.75rem;
        color: var(--crimson);
        font-weight: 600;
        background: var(--crimson-light);
        padding: 2px 10px;
        border-radius: 50px;
    }

    .news-item h6 {
        font-size: 0.92rem;
        font-weight: 700;
        color: #1e2937;
        margin-top: 8px;
        margin-bottom: 4px;
    }

    .news-item p {
        font-size: 0.82rem;
        color: #6b7280;
        margin: 0;
        line-height: 1.5;
    }

    /* ── Stats Strip ── */
    .stats-strip {
        background: linear-gradient(135deg, var(--crimson) 0%, var(--navy) 100%);
        padding: 36px 16px;
        margin: 0 0 48px;
    }

    .stat-item {
        text-align: center;
        color: white;
    }

    .stat-number {
        font-size: 2.2rem;
        font-weight: 700;
        display: block;
        line-height: 1;
    }

    .stat-label {
        font-size: 0.85rem;
        opacity: 0.85;
        margin-top: 6px;
    }
</style>

<!-- Flag Bar -->

    <!--
<div class="flag-bar"></div>

        -->

<!-- Hero -->
<div class="hero-wrapper">
    <img src="slider/rho.jpeg" alt="Hamro Ward" />
    <div class="hero-overlay"></div>
    <div class="hero-content">
        <h1>डिजिटल वडा सेवा — Hamro Ward</h1>
        <p>आफ्नो वडा सेवाहरु छिटो र सजिलो &nbsp;/&nbsp; Your ward services made simple and accessible</p>
        <div class="mt-2">
            <a href="/Service.aspx" class="hero-btn green">
                <i class="bi bi-file-earmark-text"></i>
                सेवा आवेदन
                <small>Apply for Service</small>
            </a>
            <a href="/Complaint.aspx" class="hero-btn orange">
                <i class="bi bi-exclamation-circle"></i>
                गुनासो दर्ता
                <small>Register Complaint</small>
            </a>
            <a href="#" class="hero-btn blue">
                <i class="bi bi-search"></i>
                आवेदन स्थिति
                <small>Track Application</small>
            </a>
        </div>
    </div>
</div>

<!-- Popular Services -->
<section class="container services-section">
    <div class="services-card">
        <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-3">
            <div>
                <h4 class="services-title">लोकप्रिय सेवाहरु &nbsp;/&nbsp; Popular Services</h4>
                <p class="text-muted small mb-0 mt-1">वडा कार्यालयबाट प्रदान गरिने सेवाहरू</p>
            </div>
            <a href="/Service.aspx" class="view-all-link">सबै हेर्नुहोस् / View All →</a>
        </div>
        <div class="row g-3">
            <div class="col-md-2 col-6">
                <a href="/Service.aspx" class="text-decoration-none">
                    <div class="service-box">
                        <i class="bi bi-card-text"></i>
                        <h6>पञ्जीकरण सेवा</h6>
                        <p>Vital Registration</p>
                    </div>
                </a>
            </div>
            <div class="col-md-2 col-6">
                <a href="/Service.aspx" class="text-decoration-none">
                    <div class="service-box">
                        <i class="bi bi-people"></i>
                        <h6>सिफारिस तथा प्रमाणपत्र</h6>
                        <p>Recommendation & Certification</p>
                    </div>
                </a>
            </div>
            <div class="col-md-2 col-6">
                <a href="/Service.aspx" class="text-decoration-none">
                    <div class="service-box">
                        <i class="bi bi-building"></i>
                        <h6>पूर्वाधार तथा विकास</h6>
                        <p>Infrastructure & Development</p>
                    </div>
                </a>
            </div>
            <div class="col-md-2 col-6">
                <a href="/Service.aspx" class="text-decoration-none">
                    <div class="service-box">
                        <i class="bi bi-file-earmark"></i>
                        <h6>स्थानीय कर संकलन</h6>
                        <p>Local Tax Collection</p>
                    </div>
                </a>
            </div>
            <div class="col-md-2 col-6">
                <a href="/Service.aspx" class="text-decoration-none">
                    <div class="service-box">
                        <i class="bi bi-shield-check"></i>
                        <h6>सामाजिक सुरक्षा</h6>
                        <p>Social Security</p>
                    </div>
                </a>
            </div>
            <div class="col-md-2 col-6">
                <a href="/Service.aspx" class="text-decoration-none">
                    <div class="service-box">
                        <i class="bi bi-grid"></i>
                        <h6>अन्य सेवा</h6>
                        <p>Other Services</p>
                    </div>
                </a>
            </div>
        </div>
    </div>
</section>

<!-- Stats Strip -->
<section class="stats-strip mt-5">
    <div class="container">
        <div class="row g-4">
            <div class="col-6 col-md-3">
                <div class="stat-item">
                    <span class="stat-number">5,200+</span>
                    <div class="stat-label">दर्ता नागरिक / Registered Citizens</div>
                </div>
            </div>
            <div class="col-6 col-md-3">
                <div class="stat-item">
                    <span class="stat-number">1,800+</span>
                    <div class="stat-label">आवेदन प्रशोधित / Applications Processed</div>
                </div>
            </div>
            <div class="col-6 col-md-3">
                <div class="stat-item">
                    <span class="stat-number">12</span>
                    <div class="stat-label">डिजिटल सेवाहरू / Digital Services</div>
                </div>
            </div>
            <div class="col-6 col-md-3">
                <div class="stat-item">
                    <span class="stat-number">98%</span>
                    <div class="stat-label">सन्तुष्टि दर / Satisfaction Rate</div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- News & Notices -->
<section class="container news-section">
    <div class="news-wrapper">
        <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-3">
            <div>
                <h4 class="news-title">सूचना तथा समाचार &nbsp;/&nbsp; News & Notices</h4>
                <p class="text-muted small mb-0 mt-1">वडा कार्यालयका नवीनतम गतिविधिहरु / Latest activities</p>
            </div>
            <a href="/NewsNotices.aspx" class="view-all-link">सबै हेर्नुहोस् / View All →</a>
        </div>
        <div class="row mt-2 g-4">
            <div class="col-md-4">
                <div class="news-item">
                    <div class="news-line"></div>
                    <small>2080-10-11</small>
                    <h6 class="mt-2">वडा स्तरीय स्वास्थ्य शिविर संचालन सम्बन्धी सूचना</h6>
                    <p>यस वडा कार्यालयको आयोजनामा मिति २०८०/१०/१५ गते निःशुल्क स्वास्थ्य शिविर...</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="news-item">
                    <div class="news-line"></div>
                    <small>2080-10-12</small>
                    <h6 class="mt-2">वडा स्तरीय स्वास्थ्य शिविर संचालन सम्बन्धी सूचना</h6>
                    <p>यस वडा कार्यालयको आयोजनामा मिति २०८०/१०/१५ गते निःशुल्क स्वास्थ्य शिविर...</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="news-item">
                    <div class="news-line"></div>
                    <small>2080-10-13</small>
                    <h6 class="mt-2">वडा स्तरीय स्वास्थ्य शिविर संचालन सम्बन्धी सूचना</h6>
                    <p>यस वडा कार्यालयको आयोजनामा मिति २०८०/१०/१५ गते निःशुल्क स्वास्थ्य शिविर...</p>
                </div>
            </div>
        </div>
    </div>
</section>

</asp:Content>
