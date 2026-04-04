<%@ Page Title="Correction of Birth Details" Language="C#" MasterPageFile="~/home.Master"
    AutoEventWireup="true" CodeBehind="BirthCorrection.aspx.cs" Inherits="HamroWard.Birthregistration.BirthCorrection" %>
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
    .correction-row{background:#f9fafb;border:1.5px solid #e5e7eb;border-radius:14px;padding:1rem;margin-bottom:1rem;}
</style>
<div class="flag-bar"></div>
<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">✏️</div>
        <div class="hero-text">
            <h1>Correction of Birth Details &nbsp;/&nbsp; जन्मदर्ता विवरण सच्याउनुहोस्</h1>
            <p>HamroWard Digital Services &nbsp;·&nbsp; Birth Registration</p>
        </div>
    </div>
</div>
<main class="container-xl py-4">
    <nav class="breadcrumb-wrap mb-4">
        <a href="/Default.aspx">Home</a> &rsaquo;
        <a href="/Birthregistration/Birth.aspx">Birth Registration</a> &rsaquo;
        <span class="text-dark fw-medium">Correction of Details</span>
    </nav>
    <div class="row g-4">
        <div class="col-lg-8">
            <div class="custom-card">
                <div class="card-header-custom"><h5>Current Birth Certificate Details &nbsp;/&nbsp; हालको विवरण</h5></div>
                <div class="card-body-custom row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Child's Current Name (Nepali) <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtCurrentNameNep" runat="server" CssClass="form-control" placeholder="हालको नाम" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Child's Current Name (English) <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtCurrentNameEng" runat="server" CssClass="form-control" placeholder="Current Name" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Birth Registration Number <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtRegNo" runat="server" CssClass="form-control" placeholder="e.g. BR-2081-12345" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Mobile Number <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="98XXXXXXXX" />
                    </div>
                </div>
            </div>
            <div class="custom-card">
                <div class="card-header-custom"><h5>What Needs Correction? &nbsp;/&nbsp; के सच्याउनु छ?</h5></div>
                <div class="card-body-custom">
                    <div class="row g-3 mb-3">
                        <div class="col-md-4"><div class="form-check"><asp:CheckBox ID="chkName" runat="server" CssClass="form-check-input" /><label class="form-check-label" for="<%=chkName.ClientID%>">Child's Name</label></div></div>
                        <div class="col-md-4"><div class="form-check"><asp:CheckBox ID="chkDOB" runat="server" CssClass="form-check-input" /><label class="form-check-label" for="<%=chkDOB.ClientID%>">Date of Birth</label></div></div>
                        <div class="col-md-4"><div class="form-check"><asp:CheckBox ID="chkParent" runat="server" CssClass="form-check-input" /><label class="form-check-label" for="<%=chkParent.ClientID%>">Parent Name</label></div></div>
                        <div class="col-md-4"><div class="form-check"><asp:CheckBox ID="chkGender" runat="server" CssClass="form-check-input" /><label class="form-check-label" for="<%=chkGender.ClientID%>">Gender</label></div></div>
                        <div class="col-md-4"><div class="form-check"><asp:CheckBox ID="chkOther" runat="server" CssClass="form-check-input" /><label class="form-check-label" for="<%=chkOther.ClientID%>">Other</label></div></div>
                    </div>
                    <div class="correction-row">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Current (Incorrect) Value</label>
                                <asp:TextBox ID="txtCurrentValue" runat="server" CssClass="form-control" placeholder="What it currently says..." />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Correct Value <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtCorrectValue" runat="server" CssClass="form-control" placeholder="What it should say..." />
                            </div>
                        </div>
                    </div>
                    <label class="form-label">Additional Notes</label>
                    <asp:TextBox ID="txtNotes" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Any additional explanation..." />
                </div>
            </div>
            <div class="custom-card">
                <div class="card-header-custom"><h5>Supporting Documents &nbsp;/&nbsp; सहायक कागजातहरू</h5></div>
                <div class="card-body-custom d-flex flex-column gap-3">
                    <div class="upload-box" onclick="document.getElementById('<%=fileOriginalCert.ClientID%>').click();">
                        <i class="bi bi-file-earmark-pdf fs-2"></i>
                        <div class="fw-bold mt-2">Original Birth Certificate <span class="text-danger">*</span></div>
                        <small class="text-muted">मूल जन्मदर्ता प्रमाणपत्र (PDF/JPG)</small>
                        <asp:FileUpload ID="fileOriginalCert" runat="server" CssClass="d-none" />
                    </div>
                    <div class="upload-box" onclick="document.getElementById('<%=fileSupportingDoc.ClientID%>').click();">
                        <i class="bi bi-file-earmark-check fs-2"></i>
                        <div class="fw-bold mt-2">Supporting Document (SLC, Hospital Record, etc.) <span class="text-danger">*</span></div>
                        <small class="text-muted">सच्याउन प्रमाण (PDF/JPG)</small>
                        <asp:FileUpload ID="fileSupportingDoc" runat="server" CssClass="d-none" />
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
                <p class="small mb-0">Supporting document must clearly prove the correct information (e.g. hospital records, SLC certificate).</p></div>
            </div>
        </div>
    </div>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
