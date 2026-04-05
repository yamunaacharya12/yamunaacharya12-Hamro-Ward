<%@ Page Title="New Birth Registration" Language="C#" MasterPageFile="~/home.Master"
    AutoEventWireup="true" CodeBehind="BirthNew.aspx.cs" Inherits="HamroWard.Birthregistration.BirthNew" %>

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
    .hero-text p { font-size:1rem; margin:0; opacity:0.88; }
    .breadcrumb-wrap { font-size:0.82rem; color:#6b7280; margin-bottom:22px; }
    .breadcrumb-wrap a { color:var(--crimson); text-decoration:none; }
    .custom-card { background:white; border:1.5px solid #e8eaf0; border-radius:20px; box-shadow:0 8px 32px rgba(0,0,0,0.07); margin-bottom:1.5rem; overflow:hidden; transition:box-shadow 0.2s; }
    .custom-card:hover { box-shadow:0 12px 40px rgba(220,20,60,0.10); }
    .card-header-custom { padding:1.2rem 1.6rem; border-bottom:2px solid #f3f4f6; background:linear-gradient(90deg,var(--crimson-light),var(--navy-light)); }
    .card-header-custom h5 { margin:0; font-size:1.05rem; font-weight:700; color:#1e2937; display:flex; align-items:center; gap:10px; }
    .card-header-custom h5::before { content:''; display:inline-block; width:5px; height:22px; background:linear-gradient(to bottom,var(--crimson),var(--navy)); border-radius:4px; }
    .card-body-custom { padding:1.5rem 1.6rem; }
    .form-control,.form-select { border:2px solid #e5e7eb !important; border-radius:12px !important; padding:11px 15px !important; font-size:0.97rem !important; background-color:#fafafa !important; transition:border-color 0.2s,box-shadow 0.2s !important; }
    .form-control:focus,.form-select:focus { border-color:var(--crimson) !important; box-shadow:0 0 0 4px rgba(220,20,60,0.13) !important; background-color:white !important; }
    .form-label { font-weight:600 !important; color:#374151 !important; font-size:0.84rem !important; margin-bottom:6px !important; }
    .form-text { font-size:0.78rem; color:#9ca3af; margin-top:4px; }
    .upload-box { border:2.5px dashed var(--crimson); border-radius:16px; padding:1.6rem 1.2rem; text-align:center; cursor:pointer; background:var(--crimson-light); transition:background 0.2s; }
    .upload-box:hover { background:rgba(220,20,60,0.13); border-color:var(--navy); }
    .upload-box i { color:var(--crimson); }
    .section-divider { border:none; border-top:2px solid #f0f0f5; margin:1.4rem 0 1.1rem; }
    .sub-section-title { font-size:0.82rem; font-weight:700; color:var(--navy); text-transform:uppercase; letter-spacing:0.06em; margin-bottom:0.75rem; display:flex; align-items:center; gap:8px; }
    .sub-section-title::after { content:''; flex:1; height:2px; background:linear-gradient(to right,var(--crimson-light),transparent); border-radius:2px; }
    .btn-submit-main { background:linear-gradient(to right,var(--crimson),var(--navy)); color:white !important; border:none; border-radius:50px; padding:13px 40px; font-size:1.05rem; font-weight:700; box-shadow:0 8px 22px rgba(220,20,60,0.30); transition:all 0.25s; cursor:pointer; }
    .btn-submit-main:hover { transform:translateY(-2px); box-shadow:0 12px 30px rgba(220,20,60,0.38); color:white !important; }
    .btn-draft { background:white; color:#374151 !important; border:2px solid #d1d5db !important; border-radius:50px !important; padding:12px 32px !important; font-weight:600 !important; transition:all 0.2s; }
    .btn-draft:hover { border-color:var(--navy) !important; color:var(--navy) !important; }
    .declaration-box { background:#fefce8; border:2px solid #facc15; border-radius:14px; padding:18px 20px; margin-top:8px; }
    .fee-total { background:linear-gradient(to right,var(--crimson-light),var(--navy-light)); border-radius:10px; padding:10px 14px; }
</style>

<div class="flag-bar"></div>
<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">👶</div>
        <div class="hero-text">
            <h1>New Birth Registration &nbsp;/&nbsp; नयाँ जन्मदर्ता दर्ता</h1>
            <p>HamroWard Digital Services &nbsp;·&nbsp; Department of Civil Registration</p>
        </div>
    </div>
</div>

<main class="container-xl py-4">
    <nav class="breadcrumb-wrap mb-4">
        <a href="/Default.aspx">Home</a>
        <i class="bi bi-chevron-right mx-2" style="font-size:0.7rem;"></i>
        <a href="/Birthregistration/Birth.aspx">Birth Registration</a>
        <i class="bi bi-chevron-right mx-2" style="font-size:0.7rem;"></i>
        <span class="text-dark fw-medium">New Birth Registration</span>
    </nav>

    <div class="row g-4">
        <div class="col-lg-8">

            <!-- Child Details -->
            <div class="custom-card">
                <div class="card-header-custom"><h5>Child Details &nbsp;/&nbsp; बच्चाको विवरण</h5></div>
                <div class="card-body-custom row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Child's Full Name (Nepali) <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtChildNameNep" runat="server" CssClass="form-control" placeholder="बच्चाको पूरा नाम" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Child's Full Name (English) <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtChildNameEng" runat="server" CssClass="form-control" placeholder="Child's Full Name" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Date of Birth (B.S.) <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtDOBBS" runat="server" CssClass="form-control" placeholder="e.g. 2081-04-15" />
                        <div class="form-text">Bikram Sambat — YYYY-MM-DD</div>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Date of Birth (A.D.) <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtDOBAD" runat="server" CssClass="form-control" TextMode="Date" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Gender / लिङ्ग <span class="text-danger">*</span></label>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-select">
                            <asp:ListItem Text="Select / छान्नुहोस्" Value="" />
                            <asp:ListItem Text="Male / पुरुष" Value="Male" />
                            <asp:ListItem Text="Female / महिला" Value="Female" />
                            <asp:ListItem Text="Other / अन्य" Value="Other" />
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Birth Order / जन्म क्रम</label>
                        <asp:DropDownList ID="ddlBirthOrder" runat="server" CssClass="form-select">
                            <asp:ListItem Text="First / पहिलो" Value="1" />
                            <asp:ListItem Text="Second / दोस्रो" Value="2" />
                            <asp:ListItem Text="Third / तेस्रो" Value="3" />
                            <asp:ListItem Text="Fourth+ / चौथो+" Value="4+" />
                        </asp:DropDownList>
                    </div>
                </div>
            </div>

            <!-- Place of Birth -->
            <div class="custom-card">
                <div class="card-header-custom"><h5>Place of Birth &nbsp;/&nbsp; जन्मस्थान</h5></div>
                <div class="card-body-custom row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Province / प्रदेश <span class="text-danger">*</span></label>
                        <asp:DropDownList ID="ddlProvince" runat="server" CssClass="form-select">
                            <asp:ListItem Text="Select / छान्नुहोस्" Value="" />
                            <asp:ListItem Text="Koshi / कोशी" Value="Koshi" />
                            <asp:ListItem Text="Madhesh / मधेश" Value="Madhesh" />
                            <asp:ListItem Text="Bagmati / बागमती" Value="Bagmati" />
                            <asp:ListItem Text="Gandaki / गण्डकी" Value="Gandaki" />
                            <asp:ListItem Text="Lumbini / लुम्बिनी" Value="Lumbini" />
                            <asp:ListItem Text="Karnali / कर्णाली" Value="Karnali" />
                            <asp:ListItem Text="Sudurpashchim / सुदूरपश्चिम" Value="Sudurpashchim" />
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">District / जिल्ला <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtBirthDistrict" runat="server" CssClass="form-control" placeholder="e.g. Kathmandu" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Municipality / VDC <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtBirthMunicipality" runat="server" CssClass="form-control" placeholder="Municipality name" />
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Ward No. <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtBirthWard" runat="server" CssClass="form-control" placeholder="No." TextMode="Number" />
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Birth Place Type</label>
                        <asp:DropDownList ID="ddlBirthPlaceType" runat="server" CssClass="form-select">
                            <asp:ListItem Text="Hospital" Value="Hospital" />
                            <asp:ListItem Text="Home" Value="Home" />
                            <asp:ListItem Text="Health Post" Value="HealthPost" />
                            <asp:ListItem Text="Other" Value="Other" />
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-12">
                        <label class="form-label">Hospital / Health Facility Name</label>
                        <asp:TextBox ID="txtHospitalName" runat="server" CssClass="form-control" placeholder="Name of hospital or health post" />
                    </div>
                </div>
            </div>

            <!-- Father's Details -->
            <div class="custom-card">
                <div class="card-header-custom"><h5>Parents' Details &nbsp;/&nbsp; आमाबुबाको विवरण</h5></div>
                <div class="card-body-custom">
                    <p class="sub-section-title">Father / बुबा</p>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label">Father's Full Name (Nepali) <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtFatherNameNep" runat="server" CssClass="form-control" placeholder="बुबाको पूरा नाम" />
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Father's Full Name (English) <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtFatherNameEng" runat="server" CssClass="form-control" placeholder="Father's Full Name" />
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Father's Citizenship No. <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtFatherCitizenshipNo" runat="server" CssClass="form-control" placeholder="e.g. 12-01-75-12345" />
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Father's Mobile</label>
                            <asp:TextBox ID="txtFatherMobile" runat="server" CssClass="form-control" placeholder="98XXXXXXXX" />
                        </div>
                    </div>

                    <hr class="section-divider" />
                    <p class="sub-section-title">Mother / आमा</p>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label">Mother's Full Name (Nepali) <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtMotherNameNep" runat="server" CssClass="form-control" placeholder="आमाको पूरा नाम" />
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Mother's Full Name (English) <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtMotherNameEng" runat="server" CssClass="form-control" placeholder="Mother's Full Name" />
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Mother's Citizenship No. <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtMotherCitizenshipNo" runat="server" CssClass="form-control" placeholder="e.g. 12-01-75-67890" />
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Mother's Mobile</label>
                            <asp:TextBox ID="txtMotherMobile" runat="server" CssClass="form-control" placeholder="98XXXXXXXX" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- Permanent Address -->
            <div class="custom-card">
                <div class="card-header-custom"><h5>Permanent Address &nbsp;/&nbsp; स्थायी ठेगाना</h5></div>
                <div class="card-body-custom row g-3">
                    <div class="col-md-6">
                        <label class="form-label">District / जिल्ला <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtDistrict" runat="server" CssClass="form-control" placeholder="District" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Municipality / VDC <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtMunicipality" runat="server" CssClass="form-control" placeholder="Municipality" />
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Ward No. <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtWardNo" runat="server" CssClass="form-control" placeholder="No." TextMode="Number" />
                    </div>
                    <div class="col-md-8">
                        <label class="form-label">Tole / Street <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtTole" runat="server" CssClass="form-control" placeholder="Tole name" />
                    </div>
                </div>
            </div>

            <!-- Required Documents -->
            <div class="custom-card">
                <div class="card-header-custom"><h5>Required Documents &nbsp;/&nbsp; आवश्यक कागजातहरू</h5></div>
                <div class="card-body-custom d-flex flex-column gap-3">
                    <div class="upload-box" onclick="document.getElementById('<%=fileHospitalDoc.ClientID%>').click();">
                        <i class="bi bi-file-earmark-medical fs-2"></i>
                        <div class="fw-bold mt-2">Hospital / Health Post Certificate <span class="text-danger">*</span></div>
                        <small class="text-muted">अस्पताल वा स्वास्थ्य चौकीको प्रमाणपत्र (PDF/JPG)</small>
                        <asp:FileUpload ID="fileHospitalDoc" runat="server" CssClass="d-none" />
                    </div>
                    <div class="upload-box" onclick="document.getElementById('<%=fileFatherCitizenship.ClientID%>').click();">
                        <i class="bi bi-card-heading fs-2"></i>
                        <div class="fw-bold mt-2">Father's Citizenship Certificate <span class="text-danger">*</span></div>
                        <small class="text-muted">बुबाको नागरिकता प्रमाणपत्र (PDF/JPG)</small>
                        <asp:FileUpload ID="fileFatherCitizenship" runat="server" CssClass="d-none" />
                    </div>
                    <div class="upload-box" onclick="document.getElementById('<%=fileMotherCitizenship.ClientID%>').click();">
                        <i class="bi bi-card-heading fs-2"></i>
                        <div class="fw-bold mt-2">Mother's Citizenship Certificate <span class="text-danger">*</span></div>
                        <small class="text-muted">आमाको नागरिकता प्रमाणपत्र (PDF/JPG)</small>
                        <asp:FileUpload ID="fileMotherCitizenship" runat="server" CssClass="d-none" />
                    </div>
                    <div class="upload-box" onclick="document.getElementById('<%=fileMarriageCert.ClientID%>').click();">
                        <i class="bi bi-file-earmark-text fs-2"></i>
                        <div class="fw-bold mt-2">Marriage Certificate of Parents <span class="text-danger">*</span></div>
                        <small class="text-muted">आमाबुबाको विवाह दर्ता प्रमाणपत्र (PDF/JPG)</small>
                        <asp:FileUpload ID="fileMarriageCert" runat="server" CssClass="d-none" />
                    </div>
                </div>
            </div>

            <!-- Declaration -->
            <div class="custom-card">
                <div class="card-header-custom"><h5>Declaration &nbsp;/&nbsp; घोषणा</h5></div>
                <div class="card-body-custom">
                    <div class="declaration-box">
                        <div class="form-check">
                            <asp:CheckBox ID="chkDeclaration" runat="server" CssClass="form-check-input" />
                            <label class="form-check-label small fw-medium" for="<%=chkDeclaration.ClientID%>">
                                I hereby declare that all information provided is true and correct to the best of my knowledge.<br />
                                <span class="text-muted">म घोषणा गर्दछु कि यस निवेदनमा दिइएका सबै जानकारी सत्य र यथार्थ छन्।</span>
                            </label>
                        </div>
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
                <p class="small mb-0">Birth must be registered within 35 days. After 35 days it is considered a late registration and additional documents are required.</p></div>
            </div>
            <div class="custom-card">
                <div class="card-header-custom"><h5>Document Checklist</h5></div>
                <div class="card-body-custom">
                    <ul class="list-unstyled small mb-0">
                        <li class="mb-2"><i class="bi bi-check-circle-fill me-2" style="color:var(--crimson);"></i>Hospital / Health Post Certificate</li>
                        <li class="mb-2"><i class="bi bi-check-circle-fill me-2" style="color:var(--crimson);"></i>Father's Citizenship Certificate</li>
                        <li class="mb-2"><i class="bi bi-check-circle-fill me-2" style="color:var(--crimson);"></i>Mother's Citizenship Certificate</li>
                        <li class="mb-2"><i class="bi bi-check-circle-fill me-2" style="color:var(--crimson);"></i>Parents' Marriage Certificate</li>
                    </ul>
                </div>
            </div>
            <div class="custom-card mt-3">
                <div class="card-header-custom"><h5>Application Fee &nbsp;/&nbsp; दस्तुर</h5></div>
                <div class="card-body-custom">
                    <div class="d-flex justify-content-between mb-2 small"><span class="text-muted">Registration Fee</span><span class="fw-bold">Free (within 35 days)</span></div>
                    <div class="d-flex justify-content-between mb-3 small"><span class="text-muted">Ticket Fee</span><span class="fw-bold">Rs. 10</span></div>
                    <div class="fee-total d-flex justify-content-between align-items-center">
                        <span class="fw-bold" style="color:var(--navy);">Total</span>
                        <span class="fw-bold fs-5" style="color:var(--crimson);">Rs. 10</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
