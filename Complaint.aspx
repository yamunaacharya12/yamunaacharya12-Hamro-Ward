<%@ Page Title="Citizen Complaint" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="Complaint.aspx.cs" Inherits="HamroWard.Complaint" %>

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
    .flag-bar { height: 10px; background: repeating-linear-gradient(90deg, var(--crimson) 0, var(--crimson) 24px, var(--navy) 24px, var(--navy) 48px); }
    .hero-inner { max-width: 1200px; margin: 0 auto; padding: 0 24px; display: flex; align-items: center; gap: 20px; color: white; position: relative; }
    .hero-emblem { width: 72px; height: 72px; background: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 40px; box-shadow: 0 8px 24px rgba(0,0,0,0.22); }
    .hero-text h1 { font-size: 1.55rem; font-weight: 700; margin: 0; }
    .hero-text p { font-size: 1rem; margin: 0; opacity: 0.88; }

    /* ── Form Container ── */
    .complaint-container {
        max-width: 950px;
        margin: 0 auto 60px;
        background: white;
        border-radius: 24px;
        padding: 40px;
        box-shadow: 0 10px 40px rgba(0,0,0,0.06);
        border: 1px solid #e8eaf0;
    }

    .section-title {
        font-weight: 700;
        margin: 32px 0 18px;
        color: var(--navy);
        border-left: 4px solid var(--crimson);
        padding-left: 12px;
        font-size: 1.15rem;
    }

    /* ── Category Cards ── */
    .category-card {
        background: white;
        border: 2px solid #f1f5f9;
        border-radius: 16px;
        padding: 20px 10px;
        text-align: center;
        cursor: pointer;
        transition: all 0.25s ease;
    }
    .category-card:hover {
        border-color: var(--crimson);
        background: var(--crimson-light);
        transform: translateY(-4px);
    }
    .category-card.active {
        background: var(--navy);
        border-color: var(--navy);
        color: white;
    }
    .category-card.active h6 { color: white; }
    
    .icon-circle {
        width: 60px; height: 60px;
        border-radius: 50%;
        display: flex; align-items: center; justify-content: center;
        margin: 0 auto 12px;
        font-size: 24px;
        background: var(--navy-light);
        color: var(--navy);
        transition: 0.3s;
    }
    .category-card.active .icon-circle { background: rgba(255,255,255,0.2); color: white; }

    /* ── Inputs & Upload ── */
    .form-control {
        border-radius: 10px;
        padding: 12px 16px;
        border: 1px solid #d1d5db;
    }
    .form-control:focus {
        border-color: var(--crimson);
        box-shadow: 0 0 0 3px var(--crimson-light);
    }
    .upload-box {
        border: 2px dashed #cbd5e1;
        border-radius: 16px;
        padding: 30px;
        background: #f8fafc;
        text-align: center;
        transition: 0.3s;
    }
    .upload-box:hover { border-color: var(--crimson); background: var(--crimson-light); }

    /* ── Submit Button ── */
    .btn-submit {
        background: linear-gradient(135deg, var(--crimson) 0%, var(--navy) 100%);
        color: white;
        border: none;
        padding: 16px;
        font-weight: 600;
        border-radius: 12px;
        width: 100%;
        margin-top: 20px;
        transition: 0.3s;
    }
    .btn-submit:hover { opacity: 0.9; transform: scale(1.01); }
</style>

<div class="flag-bar"></div>

<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">📢</div>
        <div class="hero-text">
            <h1>Citizen Complaint Form &nbsp;/&nbsp; नागरिक गुनासो फारम</h1>
            <p>Ward Office Digital Services &nbsp;|&nbsp; डिजिटल वडा सेवा</p>
        </div>
    </div>
</div>

<main class="container">
    <div class="complaint-container">
        <asp:Label ID="lblMessage" runat="server" CssClass="d-block text-center mb-3 fw-bold text-success"></asp:Label>

        <h5 class="section-title">1. Select Category &nbsp;/&nbsp; विधा छान्नुहोस्</h5>
        <asp:HiddenField ID="hfCategory" runat="server" />
        
        <div class="row g-3 mb-4">
            <div class="col-md-2 col-6">
                <div class="category-card" onclick="selectCategory(this,'Electricity')">
                    <div class="icon-circle"><i class="fas fa-bolt"></i></div>
                    <h6>Electricity</h6>
                </div>
            </div>
            <div class="col-md-2 col-6">
                <div class="category-card" onclick="selectCategory(this,'Water')">
                    <div class="icon-circle"><i class="fas fa-tint"></i></div>
                    <h6>Water</h6>
                </div>
            </div>
            <div class="col-md-2 col-6">
                <div class="category-card" onclick="selectCategory(this,'Road')">
                    <div class="icon-circle"><i class="fas fa-road"></i></div>
                    <h6>Road</h6>
                </div>
            </div>
             <div class="col-md-2 col-6">
                <div class="category-card" onclick="selectCategory(this,'Dispute')">
                    <div class="icon-circle"><i class="fas fa-handshake-slash"></i></div>
                    <h6>Dispute</h6>
                </div>
            </div>
            <div class="col-md-2 col-6">
                <div class="category-card" onclick="selectCategory(this,'Others')">
                    <div class="icon-circle"><i class="fas fa-ellipsis-h"></i></div>
                    <h6>Others</h6>
                </div>
            </div>
        </div>

        <h5 class="section-title">2. Personal Information &nbsp;/&nbsp; व्यक्तिगत विवरण</h5>
        <div class="row g-3">
            <div class="col-md-6">
                <label class="form-label fw-bold">Full Name</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="John Doe" />
            </div>
            <div class="col-md-6">
                <label class="form-label fw-bold">Email Address</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="example@mail.com" />
            </div>
        </div>

        <h5 class="section-title">3. Complaint Details &nbsp;/&nbsp; गुनासो विवरण</h5>
        <div class="row g-3">
            <div class="col-md-12">
                <label class="form-label fw-bold">Subject</label>
                <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-12">
                <label class="form-label fw-bold">Detailed Description</label>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" />
            </div>
        </div>

        <h5 class="section-title">4. Evidence &nbsp;/&nbsp; प्रमाण (Optional)</h5>
        <div class="upload-box">
            <i class="fas fa-cloud-upload-alt fa-2x mb-2 text-muted"></i>
            <p class="fw-bold mb-2">Upload supporting photos or documents</p>
            <asp:FileUpload ID="fuPhoto" runat="server" CssClass="form-control" />
            <small class="text-muted">JPG, PNG, or PDF • Max 2MB</small>
        </div>

        <button type="submit" class="btn-submit">Submit Complaint &nbsp;|&nbsp; गुनासो पेश गर्नुहोस्</button>
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