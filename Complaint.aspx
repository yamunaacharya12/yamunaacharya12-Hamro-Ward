<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="Complaint.aspx.cs" Inherits="HamroWard.Complaint" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />

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
    }

    /* ── Flag Bar ── */
    .flag-bar {
        height: 10px;
        background: repeating-linear-gradient(90deg,
            var(--crimson) 0, var(--crimson) 24px,
            var(--navy) 24px, var(--navy) 48px);
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

    .hero-inner {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 24px;
        display: flex;
        align-items: center;
        gap: 20px;
        color: white;
        flex-wrap: wrap;
        position: relative;
        z-index: 1;
    }

    .hero-emblem {
        width: 72px; height: 72px;
        background: white;
        border-radius: 50%;
        display: flex; align-items: center; justify-content: center;
        font-size: 38px;
        box-shadow: 0 8px 24px rgba(0,0,0,0.22);
        flex-shrink: 0;
    }

    .hero-text h1 { font-size: 1.55rem; font-weight: 700; margin: 0 0 2px; }
    .hero-text p  { font-size: 1rem; margin: 0; opacity: 0.88; }

    /* ── Breadcrumb ── */
    .breadcrumb-wrap { font-size: 0.82rem; color: #6b7280; margin-bottom: 28px; }
    .breadcrumb-wrap a { color: var(--crimson); text-decoration: none; }
    .breadcrumb-wrap a:hover { text-decoration: underline; }

    /* ── Main Card ── */
    .complaint-card {
        max-width: 950px;
        margin: 0 auto 60px;
        border-radius: 20px;
        box-shadow: 0 8px 32px rgba(0,0,0,0.08);
        background: white;
        border: 1.5px solid #e8eaf0;
        overflow: hidden;
    }

    .complaint-body { padding: 36px 36px; }

    /* ── Section Titles ── */
    .section-title {
        font-weight: 700;
        font-size: 1rem;
        margin: 32px 0 16px;
        color: #1e2937;
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .section-title::before {
        content: '';
        display: inline-block;
        width: 5px;
        height: 22px;
        background: linear-gradient(to bottom, var(--crimson), var(--navy));
        border-radius: 4px;
        flex-shrink: 0;
    }

    /* ── Form Controls ── */
    .form-control {
        border: 2px solid #e5e7eb !important;
        border-radius: 12px !important;
        padding: 11px 15px !important;
        font-size: 0.97rem !important;
        background-color: #fafafa !important;
        transition: border-color 0.2s, box-shadow 0.2s !important;
        font-family: 'Inter', system-ui, sans-serif !important;
    }

    .form-control:focus {
        border-color: var(--crimson) !important;
        box-shadow: 0 0 0 4px rgba(220,20,60,0.12) !important;
        background-color: white !important;
    }

    label {
        font-weight: 600;
        color: #374151;
        font-size: 0.84rem;
        margin-bottom: 6px;
        display: block;
    }

    /* ── Category Cards ── */
    .category-card {
        background: #fafafa;
        border-radius: 16px;
        padding: 22px 10px;
        text-align: center;
        cursor: pointer;
        border: 2px solid #e8eaf0;
        transition: all 0.25s ease;
        position: relative;
        overflow: hidden;
    }

    .category-card::after {
        content: '';
        position: absolute;
        bottom: 0; left: 0; right: 0;
        height: 3px;
        background: linear-gradient(90deg, var(--crimson), var(--navy));
        transform: scaleX(0);
        transition: transform 0.25s ease;
    }

    .category-card:hover {
        transform: translateY(-5px);
        border-color: var(--crimson);
        box-shadow: 0 10px 28px rgba(220,20,60,0.12);
        background: white;
    }

    .category-card:hover::after { transform: scaleX(1); }

    .category-card.active {
        border-color: var(--crimson);
        background: var(--crimson-light);
        box-shadow: 0 8px 24px rgba(220,20,60,0.15);
    }

    .category-card.active::after { transform: scaleX(1); }

    .category-card.active h6 { color: var(--crimson); }

    .icon-circle {
        width: 64px; height: 64px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto;
        font-size: 26px;
        color: white;
        box-shadow: 0 6px 18px rgba(0,0,0,0.18);
        transition: transform 0.25s ease;
    }

    .category-card:hover .icon-circle { transform: scale(1.12); }

    .electricity { background: linear-gradient(135deg, #fbbf24, #f97316); }
    .water       { background: linear-gradient(135deg, #38bdf8, #3b82f6); }
    .road        { background: linear-gradient(135deg, #6b7280, #374151); }
    .dispute     { background: linear-gradient(135deg, var(--crimson), #9f1239); }
    .others      { background: linear-gradient(135deg, #10b981, var(--navy)); }

    .category-card h6 {
        margin-top: 12px;
        font-weight: 600;
        font-size: 0.88rem;
        color: #374151;
        margin-bottom: 0;
    }

    /* ── Upload Box ── */
    .upload-box {
        border: 2.5px dashed var(--crimson);
        border-radius: 16px;
        padding: 24px 18px;
        background: var(--crimson-light);
        text-align: center;
        transition: background 0.2s;
    }

    .upload-box:hover { background: rgba(220,20,60,0.13); }
    .upload-box i { color: var(--crimson); }

    /* ── Submit Button ── */
    .btn-submit {
        background: linear-gradient(135deg, var(--crimson), var(--navy));
        border: none;
        padding: 14px;
        font-size: 1.05rem;
        font-weight: 700;
        border-radius: 50px;
        color: white !important;
        box-shadow: 0 8px 22px rgba(220,20,60,0.30);
        transition: all 0.25s ease;
        cursor: pointer;
        width: 100%;
    }

    .btn-submit:hover {
        transform: translateY(-2px);
        box-shadow: 0 12px 30px rgba(220,20,60,0.40);
    }

    /* ── Message Label ── */
    .message-label {
        font-weight: 700;
        text-align: center;
        display: block;
        margin-bottom: 16px;
        color: #166534;
        background: #f0fdf4;
        border: 2px solid #86efac;
        border-radius: 12px;
        padding: 12px;
    }

    /* ── Step number badges ── */
    .step-badge {
        width: 28px; height: 28px;
        background: linear-gradient(135deg, var(--crimson), var(--navy));
        color: white;
        border-radius: 50%;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        font-size: 0.78rem;
        font-weight: 700;
        flex-shrink: 0;
    }
</style>

<!-- Flag Bar -->
    <!--
<div class="flag-bar"></div>
    -->

<!-- Hero -->
<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">📣</div>
        <div class="hero-text">
            <h1>Citizen Complaint Form &nbsp;/&nbsp; नागरिक गुनासो फारम</h1>
            <p>Ward Office — Digital Services Portal &nbsp;|&nbsp; वडा कार्यालय — डिजिटल सेवा</p>
        </div>
    </div>
</div>

<main style="max-width:1200px; margin:0 auto; padding:0 16px;">

    <!-- Breadcrumb -->
    <nav class="breadcrumb-wrap">
        <a href="/Default.aspx">Home</a> &rsaquo;
        <span>Complaint Registration</span>
    </nav>

    <div class="complaint-card">
        <div class="complaint-body">

            <asp:Label ID="lblMessage" runat="server" CssClass="message-label" Visible="false"></asp:Label>

            <!-- STEP 1: Category -->
            <h5 class="section-title">
                <span class="step-badge">1</span>
                Select Complaint Category &nbsp;/&nbsp; गुनासोको प्रकार छान्नुहोस्
            </h5>

            <asp:HiddenField ID="hfCategory" runat="server" />

            <div class="row g-3 mb-2 text-center">
                <div class="col-md-3 col-6">
                    <div class="category-card" onclick="selectCategory(this,'Electricity')">
                        <div class="icon-circle electricity"><i class="fas fa-bolt"></i></div>
                        <h6>Electricity / बिजुली</h6>
                    </div>
                </div>
                <div class="col-md-3 col-6">
                    <div class="category-card" onclick="selectCategory(this,'Water')">
                        <div class="icon-circle water"><i class="fas fa-tint"></i></div>
                        <h6>Water / पानी</h6>
                    </div>
                </div>
                <div class="col-md-3 col-6">
                    <div class="category-card" onclick="selectCategory(this,'Road')">
                        <div class="icon-circle road"><i class="fas fa-road"></i></div>
                        <h6>Road / सडक</h6>
                    </div>
                </div>
                <div class="col-md-3 col-6">
                    <div class="category-card" onclick="selectCategory(this,'Dispute')">
                        <div class="icon-circle dispute"><i class="fas fa-handshake-slash"></i></div>
                        <h6>Dispute / विवाद</h6>
                    </div>
                </div>
                <div class="col-md-3 col-6">
                    <div class="category-card" onclick="selectCategory(this,'Others')">
                        <div class="icon-circle others"><i class="fas fa-ellipsis-h"></i></div>
                        <h6>Others / अन्य</h6>
                    </div>
                </div>
            </div>

            <!-- STEP 2: Personal Info -->
            <h5 class="section-title">
                <span class="step-badge">2</span>
                Personal Information &nbsp;/&nbsp; व्यक्तिगत विवरण
            </h5>

            <div class="row g-3">
                <div class="col-md-6">
                    <label>Full Name / पूरा नाम <span class="text-danger">*</span></label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Your full name" />
                </div>
                <div class="col-md-6">
                    <label>Email / इमेल</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="your@email.com" />
                </div>
                <div class="col-md-4">
                    <label>Ward Number / वडा नं. <span class="text-danger">*</span></label>
                    <asp:TextBox ID="txtWardNumber" runat="server" CssClass="form-control" placeholder="e.g. 5" />
                </div>
                <div class="col-md-4">
                    <label>Phone / फोन नं.</label>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="98XXXXXXXX" />
                </div>
            </div>

            <!-- STEP 3: Complaint Details -->
            <h5 class="section-title">
                <span class="step-badge">3</span>
                Complaint Details &nbsp;/&nbsp; गुनासोको विवरण
            </h5>

            <div class="row g-3">
                <div class="col-md-12">
                    <label>Subject / विषय <span class="text-danger">*</span></label>
                    <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Brief subject of your complaint" />
                </div>
                <div class="col-md-12">
                    <label>Description / विस्तृत विवरण <span class="text-danger">*</span></label>
                    <asp:TextBox ID="txtDescription" runat="server"
                        CssClass="form-control" TextMode="MultiLine" Rows="5"
                        placeholder="Describe your complaint in detail..." />
                </div>
                <div class="col-md-12">
                    <label>Location / स्थान</label>
                    <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" placeholder="Where is the problem located?" />
                </div>
            </div>

            <!-- STEP 4: Upload -->
            <h5 class="section-title">
                <span class="step-badge">4</span>
                Upload Evidence &nbsp;/&nbsp; प्रमाण अपलोड गर्नुहोस् (Optional)
            </h5>

            <div class="upload-box my-2" onclick="document.getElementById('<%=fuPhoto.ClientID%>').click();">
                <i class="fas fa-camera fa-2x mb-2"></i>
                <div class="fw-bold mt-1">Click to Upload Photo</div>
                <small class="text-muted">JPG / PNG &nbsp;•&nbsp; Max 2MB</small>
                <asp:FileUpload ID="fuPhoto" runat="server" CssClass="d-none" />
            </div>

            <!-- STEP 5: Submit -->
            <h5 class="section-title mt-4">
                <span class="step-badge">5</span>
                Submit Complaint &nbsp;/&nbsp; गुनासो पेश गर्नुहोस्
            </h5>

            <div class="mt-2">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit Complaint →"
                    CssClass="btn-submit" OnClick="btnSubmit_Click" />
            </div>

        </div>
    </div>

</main>

<script>
    function selectCategory(el, value) {
        document.getElementById('<%= hfCategory.ClientID %>').value = value;
        document.querySelectorAll('.category-card').forEach(c => c.classList.remove('active'));
        el.classList.add('active');
    }
</script>

</asp:Content>
