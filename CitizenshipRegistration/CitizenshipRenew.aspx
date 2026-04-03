<%@ Page Title="Renew / Replace Citizenship" Language="C#" MasterPageFile="~/home.Master"
    AutoEventWireup="true" CodeBehind="CitizenshipRenew.aspx.cs" Inherits="HamroWard.CitizenshipRegistration.CitizenshipRenew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Noto+Sans+Devanagari:wght@400;500;700&display=swap');
    :root { --crimson:#DC143C; --navy:#002B7F; --crimson-light:rgba(220,20,60,0.08); --navy-light:rgba(0,43,127,0.07); }
    body { font-family:'Inter','Noto Sans Devanagari',system-ui,sans-serif; background:linear-gradient(160deg,#f1f5f9 0%,#e0e7ff 100%); color:#1e2937; line-height:1.6; margin-top:50px; }
    .page-hero { background:linear-gradient(135deg,var(--crimson) 0%,var(--navy) 100%); padding:36px 0 28px; margin-bottom:36px; position:relative; overflow:hidden; }
    .page-hero::before { content:''; position:absolute; inset:0; background:url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='0.04'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E"); }
    .flag-bar { height:10px; background:repeating-linear-gradient(90deg,var(--crimson) 0,var(--crimson) 24px,var(--navy) 24px,var(--navy) 48px); }
    .hero-inner { max-width:1200px; margin:0 auto; padding:0 24px; display:flex; align-items:center; gap:20px; color:white; flex-wrap:wrap; }
    .hero-emblem { width:72px; height:72px; background:white; border-radius:50%; display:flex; align-items:center; justify-content:center; font-size:40px; box-shadow:0 8px 24px rgba(0,0,0,0.22); flex-shrink:0; }
    .hero-text h1 { font-size:1.55rem; font-weight:700; margin:0 0 2px; }
    .hero-text p  { font-size:1rem; margin:0; opacity:0.88; }
    .breadcrumb-wrap { font-size:0.82rem; color:#6b7280; margin-bottom:22px; }
    .breadcrumb-wrap a { color:var(--crimson); text-decoration:none; }
    .custom-card { background:white; border:1.5px solid #e8eaf0; border-radius:20px; box-shadow:0 8px 32px rgba(0,0,0,0.07); margin-bottom:1.5rem; overflow:hidden; }
    .card-header-custom { padding:1.2rem 1.6rem; border-bottom:2px solid #f3f4f6; background:linear-gradient(90deg,var(--crimson-light),var(--navy-light)); }
    .card-header-custom h5 { margin:0; font-size:1.05rem; font-weight:700; color:#1e2937; display:flex; align-items:center; gap:10px; }
    .card-header-custom h5::before { content:''; display:inline-block; width:5px; height:22px; background:linear-gradient(to bottom,var(--crimson),var(--navy)); border-radius:4px; }
    .card-body-custom { padding:1.5rem 1.6rem; }
    .form-control,.form-select,.form-control-textarea { border:2px solid #e5e7eb !important; border-radius:12px !important; padding:11px 15px !important; font-size:0.97rem !important; background-color:#fafafa !important; transition:border-color 0.2s,box-shadow 0.2s !important; }
    .form-control:focus,.form-select:focus { border-color:var(--crimson) !important; box-shadow:0 0 0 4px rgba(220,20,60,0.13) !important; background-color:white !important; }
    .form-label { font-weight:600 !important; color:#374151 !important; font-size:0.84rem !important; margin-bottom:6px !important; }
    .upload-box { border:2.5px dashed var(--crimson); border-radius:16px; padding:1.6rem 1.2rem; text-align:center; cursor:pointer; background:var(--crimson-light); transition:background 0.2s; }
    .upload-box:hover { background:rgba(220,20,60,0.13); border-color:var(--navy); }
    .upload-box i { color:var(--crimson); }
    .btn-submit-main { background:linear-gradient(to right,var(--crimson),var(--navy)); color:white !important; border:none; border-radius:50px; padding:13px 40px; font-size:1.05rem; font-weight:700; box-shadow:0 8px 22px rgba(220,20,60,0.30); transition:all 0.25s; cursor:pointer; }
    .btn-submit-main:hover { transform:translateY(-2px); box-shadow:0 12px 30px rgba(220,20,60,0.38); }
    .btn-draft { background:white; color:#374151 !important; border:2px solid #d1d5db !important; border-radius:50px !important; padding:12px 32px !important; font-weight:600 !important; }
    .conditional-block { background:#f9fafb; border:1.5px solid #e5e7eb; border-radius:14px; padding:1.1rem; margin-top:0.5rem; }
    .fee-total { background:linear-gradient(to right,var(--crimson-light),var(--navy-light)); border-radius:10px; padding:10px 14px; }
</style>

<div class="flag-bar"></div>
<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">🔄</div>
        <div class="hero-text">
            <h1>Renew / Replace Citizenship &nbsp;/&nbsp; नवीकरण / हराएको नागरिकता</h1>
            <p>HamroWard Digital Services &nbsp;·&nbsp; Department of Civil Registration</p>
        </div>
    </div>
</div>

<main class="container-xl py-4">
    <nav class="breadcrumb-wrap mb-4">
        <a href="/Default.aspx">Home</a>
        <i class="bi bi-chevron-right mx-2" style="font-size:0.7rem;"></i>
        <a href="/CitizenshipRegistration/Citizenship.aspx">Citizenship Registration</a>
        <i class="bi bi-chevron-right mx-2" style="font-size:0.7rem;"></i>
        <span class="text-dark fw-medium">Renew / Replace</span>
    </nav>

    <div class="row g-4">
        <div class="col-lg-8">

            <!-- Request Type -->
            <div class="custom-card">
                <div class="card-header-custom"><h5>Request Type &nbsp;/&nbsp; अनुरोधको प्रकार</h5></div>
                <div class="card-body-custom">
                    <div class="row g-3">
                        <div class="col-md-4">
                            <div class="form-check">
                                <asp:RadioButton ID="rbLost" runat="server" GroupName="RenewType" CssClass="form-check-input" value="Lost" onclick="toggleReason()" />
                                <label class="form-check-label" for="<%=rbLost.ClientID%>">Lost / हराएको</label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-check">
                                <asp:RadioButton ID="rbDamaged" runat="server" GroupName="RenewType" CssClass="form-check-input" value="Damaged" onclick="toggleReason()" />
                                <label class="form-check-label" for="<%=rbDamaged.ClientID%>">Damaged / क्षतिग्रस्त</label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-check">
                                <asp:RadioButton ID="rbRenew" runat="server" GroupName="RenewType" CssClass="form-check-input" value="Renew" onclick="toggleReason()" />
                                <label class="form-check-label" for="<%=rbRenew.ClientID%>">Renewal / नवीकरण</label>
                            </div>
                        </div>
                    </div>
                    <div class="mt-3" id="lostReasonBlock" style="display:none;">
                        <label class="form-label">Police Report / पुलिस रिपोर्ट नं.</label>
                        <asp:TextBox ID="txtPoliceReport" runat="server" CssClass="form-control" placeholder="e.g. KTM/2081/1234" />
                    </div>
                </div>
            </div>

            <!-- Applicant Details -->
            <div class="custom-card">
                <div class="card-header-custom"><h5>Applicant Details &nbsp;/&nbsp; निवेदकको विवरण</h5></div>
                <div class="card-body-custom row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Full Name (Nepali) <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtNameNep" runat="server" CssClass="form-control" placeholder="पूरा नाम" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Full Name (English) <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtNameEng" runat="server" CssClass="form-control" placeholder="Full Name" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Old Citizenship Number <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtOldCitizenshipNo" runat="server" CssClass="form-control" placeholder="e.g. 12-01-75-12345" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Date of Birth (A.D.) <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtDOBAD" runat="server" CssClass="form-control" TextMode="Date" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Mobile Number <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="98XXXXXXXX" />
                    </div>
                    <div class="col-12">
                        <label class="form-label">Reason / कारण <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtReason" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Briefly explain the reason for renewal or replacement..." />
                    </div>
                </div>
            </div>

            <!-- Documents -->
            <div class="custom-card">
                <div class="card-header-custom"><h5>Required Documents &nbsp;/&nbsp; आवश्यक कागजातहरू</h5></div>
                <div class="card-body-custom d-flex flex-column gap-3">
                    <div class="upload-box" onclick="document.getElementById('<%=filePhoto.ClientID%>').click();">
                        <i class="bi bi-person-bounding-box fs-2"></i>
                        <div class="fw-bold mt-2">Passport Size Photo <span class="text-danger">*</span></div>
                        <small class="text-muted">पासपोर्ट साइजको फोटो (Max 2MB)</small>
                        <asp:FileUpload ID="filePhoto" runat="server" CssClass="d-none" />
                    </div>
                    <div class="upload-box" onclick="document.getElementById('<%=fileOldCitizenship.ClientID%>').click();">
                        <i class="bi bi-card-heading fs-2"></i>
                        <div class="fw-bold mt-2">Old / Damaged Citizenship (if available)</div>
                        <small class="text-muted">पुरानो वा क्षतिग्रस्त नागरिकताको प्रतिलिपि (PDF/JPG)</small>
                        <asp:FileUpload ID="fileOldCitizenship" runat="server" CssClass="d-none" />
                    </div>
                    <div class="upload-box" onclick="document.getElementById('<%=filePoliceReport.ClientID%>').click();">
                        <i class="bi bi-shield-check fs-2"></i>
                        <div class="fw-bold mt-2">Police Report (if Lost) / प्रहरी प्रतिवेदन</div>
                        <small class="text-muted">हराएको भए प्रहरी प्रतिवेदन अनिवार्य (PDF/JPG)</small>
                        <asp:FileUpload ID="filePoliceReport" runat="server" CssClass="d-none" />
                    </div>
                    <div class="upload-box" onclick="document.getElementById('<%=fileBirth.ClientID%>').click();">
                        <i class="bi bi-file-earmark-pdf fs-2"></i>
                        <div class="fw-bold mt-2">Birth Registration Certificate <span class="text-danger">*</span></div>
                        <small class="text-muted">जन्म दर्ता प्रमाणपत्र (PDF/JPG)</small>
                        <asp:FileUpload ID="fileBirth" runat="server" CssClass="d-none" />
                    </div>
                </div>
            </div>

            <asp:Label ID="lblMessage" runat="server" Visible="false" CssClass="d-block mb-3" />

            <div class="d-flex justify-content-end gap-3 mt-4 mb-5">
                <asp:Button ID="btnDraft" runat="server" Text="Save as Draft" CssClass="btn btn-draft" />
                <asp:Button ID="btnSubmit" runat="server" Text="Submit Application →"
                    CssClass="btn btn-submit-main" OnClick="btnSubmit_Click" />
            </div>
        </div>

        <!-- Sidebar -->
        <div class="col-lg-4">
            <div class="alert border-0 d-flex gap-3 p-4 mb-4"
                 style="background:rgba(220,20,60,0.07);color:#7f1d1d;border-radius:16px;">
                <i class="bi bi-info-circle-fill h4 mb-0" style="color:var(--crimson);"></i>
                <div><h6 class="fw-bold">Important Note</h6>
                <p class="small mb-0">For lost citizenship, a Police Report (FIR) is mandatory. For damaged cards, bring the original damaged certificate.</p></div>
            </div>
            <div class="custom-card">
                <div class="card-header-custom"><h5>Document Checklist</h5></div>
                <div class="card-body-custom">
                    <ul class="list-unstyled small mb-0">
                        <li class="mb-2"><i class="bi bi-check-circle-fill me-2" style="color:var(--crimson);"></i>Passport Size Photo</li>
                        <li class="mb-2"><i class="bi bi-check-circle-fill me-2" style="color:var(--crimson);"></i>Birth Registration Certificate</li>
                        <li class="mb-2 text-muted"><i class="bi bi-circle me-2"></i>Old / Damaged Citizenship (if available)</li>
                        <li class="mb-2 text-muted"><i class="bi bi-circle me-2"></i>Police Report (if lost)</li>
                    </ul>
                </div>
            </div>
            <div class="custom-card mt-3">
                <div class="card-header-custom"><h5>Application Fee &nbsp;/&nbsp; दस्तुर</h5></div>
                <div class="card-body-custom">
                    <div class="d-flex justify-content-between mb-2 small"><span class="text-muted">Service Fee</span><span class="fw-bold">Rs. 500</span></div>
                    <div class="d-flex justify-content-between mb-3 small"><span class="text-muted">Ticket Fee</span><span class="fw-bold">Rs. 10</span></div>
                    <div class="fee-total d-flex justify-content-between align-items-center">
                        <span class="fw-bold" style="color:var(--navy);">Total</span>
                        <span class="fw-bold fs-5" style="color:var(--crimson);">Rs. 510</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function toggleReason() {
        var lostChecked = document.getElementById('<%=rbLost.ClientID%>').checked;
        document.getElementById('lostReasonBlock').style.display = lostChecked ? 'block' : 'none';
    }
</script>
</asp:Content>
