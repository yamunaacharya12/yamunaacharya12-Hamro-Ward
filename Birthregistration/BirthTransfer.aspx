<%@ Page Title="Birth Registration Transfer" Language="C#" MasterPageFile="~/home.Master"
    AutoEventWireup="true" CodeBehind="BirthTransfer.aspx.cs" Inherits="HamroWard.Birthregistration.BirthTransfer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Noto+Sans+Devanagari:wght@400;500;700&display=swap');
    :root{--crimson:#DC143C;--navy:#002B7F;--crimson-light:rgba(220,20,60,0.08);--navy-light:rgba(0,43,127,0.07);}
    body{font-family:'Inter','Noto Sans Devanagari',system-ui,sans-serif;background:linear-gradient(160deg,#f1f5f9 0%,#e0e7ff 100%);color:#1e2937;line-height:1.6;margin-top:50px;}
    .page-hero{background:linear-gradient(135deg,var(--crimson) 0%,var(--navy) 100%);padding:36px 0 28px;margin-bottom:36px;position:relative;overflow:hidden;}
    .flag-bar{height:10px;background:repeating-linear-gradient(90deg,var(--crimson) 0,var(--crimson) 24px,var(--navy) 24px,var(--navy) 48px);}
    .hero-inner{max-width:1200px;margin:0 auto;padding:0 24px;display:flex;align-items:center;gap:20px;color:white;flex-wrap:wrap;}
    .hero-emblem{width:72px;height:72px;background:white;border-radius:50%;display:flex;align-items:center;justify-content:center;font-size:40px;box-shadow:0 8px 24px rgba(0,0,0,0.22);flex-shrink:0;}
    .hero-text h1{font-size:1.55rem;font-weight:700;margin:0 0 2px;}
    .hero-text p{font-size:1rem;margin:0;opacity:0.88;}
    .breadcrumb-wrap{font-size:0.82rem;color:#6b7280;margin-bottom:22px;}
    .breadcrumb-wrap a{color:var(--crimson);text-decoration:none;}
    .custom-card{background:white;border:1.5px solid #e8eaf0;border-radius:20px;box-shadow:0 8px 32px rgba(0,0,0,0.07);margin-bottom:1.5rem;overflow:hidden;}
    .card-header-custom{padding:1.2rem 1.6rem;border-bottom:2px solid #f3f4f6;background:linear-gradient(90deg,var(--crimson-light),var(--navy-light));}
    .card-header-custom h5{margin:0;font-size:1.05rem;font-weight:700;color:#1e2937;display:flex;align-items:center;gap:10px;}
    .card-header-custom h5::before{content:'';display:inline-block;width:5px;height:22px;background:linear-gradient(to bottom,var(--crimson),var(--navy));border-radius:4px;}
    .card-body-custom{padding:1.5rem 1.6rem;}
    .form-control,.form-select{border:2px solid #e5e7eb !important;border-radius:12px !important;padding:11px 15px !important;font-size:0.97rem !important;background-color:#fafafa !important;}
    .form-control:focus,.form-select:focus{border-color:var(--crimson) !important;box-shadow:0 0 0 4px rgba(220,20,60,0.13) !important;background-color:white !important;}
    .form-label{font-weight:600 !important;color:#374151 !important;font-size:0.84rem !important;margin-bottom:6px !important;}
    .upload-box{border:2.5px dashed var(--crimson);border-radius:16px;padding:1.6rem 1.2rem;text-align:center;cursor:pointer;background:var(--crimson-light);transition:background 0.2s;}
    .upload-box:hover{background:rgba(220,20,60,0.13);}
    .upload-box i{color:var(--crimson);}
    .btn-submit-main{background:linear-gradient(to right,var(--crimson),var(--navy));color:white !important;border:none;border-radius:50px;padding:13px 40px;font-size:1.05rem;font-weight:700;box-shadow:0 8px 22px rgba(220,20,60,0.30);transition:all 0.25s;cursor:pointer;}
    .btn-submit-main:hover{transform:translateY(-2px);}
    .btn-draft{background:white;color:#374151 !important;border:2px solid #d1d5db !important;border-radius:50px !important;padding:12px 32px !important;font-weight:600 !important;}
    .address-divider{display:flex;align-items:center;gap:12px;margin:1.2rem 0;}
    .address-divider::before,.address-divider::after{content:'';flex:1;height:2px;background:linear-gradient(to right,var(--crimson-light),transparent);}
    .address-divider span{font-size:0.8rem;font-weight:700;color:var(--navy);white-space:nowrap;}
</style>
<div class="flag-bar"></div>
<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">🏘️</div>
        <div class="hero-text">
            <h1>Transfer / Migration &nbsp;/&nbsp; जन्मदर्ता स्थानान्तरण</h1>
            <p>HamroWard Digital Services &nbsp;·&nbsp; Birth Registration</p>
        </div>
    </div>
</div>
<main class="container-xl py-4">
    <nav class="breadcrumb-wrap mb-4">
        <a href="/Default.aspx">Home</a> &rsaquo;
        <a href="/Birthregistration/Birth.aspx">Birth Registration</a> &rsaquo;
        <span class="text-dark fw-medium">Transfer / Migration</span>
    </nav>
    <div class="row g-4">
        <div class="col-lg-8">
            <div class="custom-card">
                <div class="card-header-custom"><h5>Child Details &nbsp;/&nbsp; बच्चाको विवरण</h5></div>
                <div class="card-body-custom row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Child's Name (Nepali) <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtChildNameNep" runat="server" CssClass="form-control" placeholder="बच्चाको नाम" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Child's Name (English) <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtChildNameEng" runat="server" CssClass="form-control" placeholder="Child's Name" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Birth Registration Number <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtRegNo" runat="server" CssClass="form-control" placeholder="e.g. BR-2081-12345" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Date of Birth (A.D.) <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtDOBAD" runat="server" CssClass="form-control" TextMode="Date" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Mobile Number <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="98XXXXXXXX" />
                    </div>
                </div>
            </div>
            <div class="custom-card">
                <div class="card-header-custom"><h5>Address Details &nbsp;/&nbsp; ठेगाना विवरण</h5></div>
                <div class="card-body-custom">
                    <p class="fw-bold small mb-2" style="color:var(--navy);">Previous Address / पुरानो ठेगाना</p>
                    <div class="row g-3">
                        <div class="col-md-4"><label class="form-label">District <span class="text-danger">*</span></label><asp:TextBox ID="txtOldDistrict" runat="server" CssClass="form-control" placeholder="Old District" /></div>
                        <div class="col-md-4"><label class="form-label">Municipality <span class="text-danger">*</span></label><asp:TextBox ID="txtOldMunicipality" runat="server" CssClass="form-control" placeholder="Old Municipality" /></div>
                        <div class="col-md-4"><label class="form-label">Ward No.</label><asp:TextBox ID="txtOldWard" runat="server" CssClass="form-control" placeholder="No." TextMode="Number" /></div>
                    </div>
                    <div class="address-divider"><span>➡️ Migrated To / नयाँ ठेगाना</span></div>
                    <div class="row g-3">
                        <div class="col-md-4"><label class="form-label">District <span class="text-danger">*</span></label><asp:TextBox ID="txtNewDistrict" runat="server" CssClass="form-control" placeholder="New District" /></div>
                        <div class="col-md-4"><label class="form-label">Municipality <span class="text-danger">*</span></label><asp:TextBox ID="txtNewMunicipality" runat="server" CssClass="form-control" placeholder="New Municipality" /></div>
                        <div class="col-md-4"><label class="form-label">Ward No. <span class="text-danger">*</span></label><asp:TextBox ID="txtNewWard" runat="server" CssClass="form-control" placeholder="No." TextMode="Number" /></div>
                    </div>
                </div>
            </div>
            <div class="custom-card">
                <div class="card-header-custom"><h5>Required Documents &nbsp;/&nbsp; आवश्यक कागजातहरू</h5></div>
                <div class="card-body-custom d-flex flex-column gap-3">
                    <div class="upload-box" onclick="document.getElementById('<%=fileOriginalCert.ClientID%>').click();">
                        <i class="bi bi-file-earmark-pdf fs-2"></i>
                        <div class="fw-bold mt-2">Original Birth Certificate <span class="text-danger">*</span></div>
                        <small class="text-muted">मूल जन्मदर्ता प्रमाणपत्र (PDF/JPG)</small>
                        <asp:FileUpload ID="fileOriginalCert" runat="server" CssClass="d-none" />
                    </div>
                    <div class="upload-box" onclick="document.getElementById('<%=fileMigrationCert.ClientID%>').click();">
                        <i class="bi bi-geo-alt fs-2"></i>
                        <div class="fw-bold mt-2">Migration Certificate (Basai Sarai) <span class="text-danger">*</span></div>
                        <small class="text-muted">बसाइसराइ प्रमाणपत्र (PDF/JPG)</small>
                        <asp:FileUpload ID="fileMigrationCert" runat="server" CssClass="d-none" />
                    </div>
                </div>
            </div>
            <asp:Label ID="lblMessage" runat="server" Visible="false" CssClass="d-block mb-3" />
            <div class="d-flex justify-content-end gap-3 mt-4 mb-5">
                <asp:Button ID="btnDraft" runat="server" Text="Save as Draft" CssClass="btn btn-draft" />
                <asp:Button ID="btnSubmit" runat="server" Text="Submit Application →" CssClass="btn btn-submit-main" OnClick="btnSubmit_Click" />
            </div>
        </div>
        <div class="col-lg-4">
            <div class="alert border-0 d-flex gap-3 p-4" style="background:rgba(220,20,60,0.07);color:#7f1d1d;border-radius:16px;">
                <i class="bi bi-info-circle-fill h4 mb-0" style="color:var(--crimson);"></i>
                <div><h6 class="fw-bold">Important Note</h6>
                <p class="small mb-0">Migration Certificate must be obtained from your previous ward before submitting this application.</p></div>
            </div>
        </div>
    </div>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
