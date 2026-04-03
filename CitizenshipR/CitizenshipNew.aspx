<%@ Page Title="Issue New Citizenship" Language="C#" MasterPageFile="~/home.Master"
    AutoEventWireup="true" CodeBehind="CitizenshipNew.aspx.cs" Inherits="HamroWard.CitizenshipRegistration.CitizenshipNew" %>

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

    /* ── Page Header ── */
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
    .flag-bar {
        height: 10px;
        background: repeating-linear-gradient(90deg, var(--crimson) 0, var(--crimson) 24px, var(--navy) 24px, var(--navy) 48px);
        margin-bottom: 0;
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
    }
    .hero-emblem {
        width: 72px; height: 72px;
        background: white;
        border-radius: 50%;
        display: flex; align-items: center; justify-content: center;
        font-size: 40px;
        box-shadow: 0 8px 24px rgba(0,0,0,0.22);
        flex-shrink: 0;
    }
    .hero-text h1 { font-size: 1.55rem; font-weight: 700; margin: 0 0 2px; }
    .hero-text p  { font-size: 1rem; margin: 0; opacity: 0.88; }

    /* ── Breadcrumb ── */
    .breadcrumb-wrap { font-size: 0.82rem; color: #6b7280; margin-bottom: 22px; }
    .breadcrumb-wrap a { color: var(--crimson); text-decoration: none; }
    .breadcrumb-wrap a:hover { text-decoration: underline; }

    /* ── Cards ── */
    .custom-card {
        background: white;
        border: 1.5px solid #e8eaf0;
        border-radius: 20px;
        box-shadow: 0 8px 32px rgba(0,0,0,0.07);
        margin-bottom: 1.5rem;
        overflow: hidden;
        transition: box-shadow 0.2s;
    }
    .custom-card:hover { box-shadow: 0 12px 40px rgba(220,20,60,0.10); }

    .card-header-custom {
        padding: 1.2rem 1.6rem;
        border-bottom: 2px solid #f3f4f6;
        background: linear-gradient(90deg, var(--crimson-light), var(--navy-light));
        display: flex;
        align-items: center;
        gap: 12px;
    }
    .card-header-custom h5 {
        margin: 0;
        font-size: 1.05rem;
        font-weight: 700;
        color: #1e2937;
        display: flex;
        align-items: center;
        gap: 10px;
    }
    .card-header-custom h5::before {
        content: '';
        display: inline-block;
        width: 5px; height: 22px;
        background: linear-gradient(to bottom, var(--crimson), var(--navy));
        border-radius: 4px;
    }
    .card-body-custom { padding: 1.5rem 1.6rem; }

    /* ── Form Controls ── */
    .form-control, .form-select {
        border: 2px solid #e5e7eb !important;
        border-radius: 12px !important;
        padding: 11px 15px !important;
        font-size: 0.97rem !important;
        transition: border-color 0.2s, box-shadow 0.2s !important;
        background-color: #fafafa !important;
    }
    .form-control:focus, .form-select:focus {
        border-color: var(--crimson) !important;
        box-shadow: 0 0 0 4px rgba(220,20,60,0.13) !important;
        background-color: white !important;
    }
    .form-label {
        font-weight: 600 !important;
        color: #374151 !important;
        font-size: 0.84rem !important;
        margin-bottom: 6px !important;
    }
    .form-text { font-size: 0.78rem; color: #9ca3af; margin-top: 4px; }

    /* ── Upload Box ── */
    .upload-box {
        border: 2.5px dashed var(--crimson);
        border-radius: 16px;
        padding: 1.6rem 1.2rem;
        text-align: center;
        cursor: pointer;
        transition: background 0.2s, border-color 0.2s;
        background: var(--crimson-light);
    }
    .upload-box:hover {
        background: rgba(220,20,60,0.13);
        border-color: var(--navy);
    }
    .upload-box i { color: var(--crimson); }
    .upload-box .fw-bold { color: #1e2937; font-size: 0.97rem; }

    /* ── Dividers & Sub-titles ── */
    .section-divider {
        border: none;
        border-top: 2px solid #f0f0f5;
        margin: 1.4rem 0 1.1rem;
    }
    .sub-section-title {
        font-size: 0.82rem;
        font-weight: 700;
        color: var(--navy);
        text-transform: uppercase;
        letter-spacing: 0.06em;
        margin-bottom: 0.75rem;
        display: flex;
        align-items: center;
        gap: 8px;
    }
    .sub-section-title::after {
        content: '';
        flex: 1;
        height: 2px;
        background: linear-gradient(to right, var(--crimson-light), transparent);
        border-radius: 2px;
    }

    /* ── Conditional Block ── */
    .conditional-block {
        background: #f9fafb;
        border: 1.5px solid #e5e7eb;
        border-radius: 14px;
        padding: 1.1rem;
        margin-top: 0.5rem;
    }

    /* ── Sidebar Alerts ── */
    .alert { border-radius: 16px !important; }

    /* ── Buttons ── */
    .btn-submit-main {
        background: linear-gradient(to right, var(--crimson), var(--navy));
        color: white !important;
        border: none;
        border-radius: 50px;
        padding: 13px 40px;
        font-size: 1.05rem;
        font-weight: 700;
        box-shadow: 0 8px 22px rgba(220,20,60,0.30);
        transition: all 0.25s;
        cursor: pointer;
    }
    .btn-submit-main:hover {
        transform: translateY(-2px);
        box-shadow: 0 12px 30px rgba(220,20,60,0.38);
        color: white !important;
    }
    .btn-draft {
        background: white;
        color: #374151 !important;
        border: 2px solid #d1d5db !important;
        border-radius: 50px !important;
        padding: 12px 32px !important;
        font-weight: 600 !important;
        transition: all 0.2s;
    }
    .btn-draft:hover {
        border-color: var(--navy) !important;
        color: var(--navy) !important;
        background: var(--navy-light);
    }

    /* ── Declaration Box ── */
    .declaration-box {
        background: #fefce8;
        border: 2px solid #facc15;
        border-radius: 14px;
        padding: 18px 20px;
        margin-top: 8px;
    }

    /* ── Fee Card ── */
    .fee-total {
        background: linear-gradient(to right, var(--crimson-light), var(--navy-light));
        border-radius: 10px;
        padding: 10px 14px;
    }
</style>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlGender.Items.Clear();
            ddlGender.Items.Add(new System.Web.UI.WebControls.ListItem("Select an option / छान्नुहोस्", ""));
            ddlGender.Items.Add(new System.Web.UI.WebControls.ListItem("Male / पुरुष", "male"));
            ddlGender.Items.Add(new System.Web.UI.WebControls.ListItem("Female / महिला", "female"));
            ddlGender.Items.Add(new System.Web.UI.WebControls.ListItem("Other / अन्य", "other"));

            ddlBloodGroup.Items.Clear();
            ddlBloodGroup.Items.Add(new System.Web.UI.WebControls.ListItem("Select / छान्नुहोस्", ""));
            foreach (string bg in new[] { "A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-" })
                ddlBloodGroup.Items.Add(new System.Web.UI.WebControls.ListItem(bg, bg));

            ddlDistrict.Items.Clear();
            ddlDistrict.Items.Add(new System.Web.UI.WebControls.ListItem("Kathmandu / काठमाडौँ", "kathmandu"));
            ddlDistrict.Items.Add(new System.Web.UI.WebControls.ListItem("Bhaktapur / भक्तपुर", "bhaktapur"));
        }
    }
</script>

<!-- ── Page Hero Header ── -->
<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">🇳🇵</div>
        <div class="hero-text">
            <h1>Issue New Citizenship — नयाँ नागरिकता सिफारिस</h1>
            <p>HamroWard Digital Services &nbsp;·&nbsp; Department of Civil Registration</p>
        </div>
    </div>
</div>
<div class="flag-bar"></div>

<main class="container-xl py-4">

    <!-- Breadcrumb — updated for subfolder -->
    <nav class="breadcrumb-wrap mb-4">
        <a href="~/Default.aspx" runat="server">Home</a>
        <i class="bi bi-chevron-right mx-2" style="font-size:0.7rem;"></i>
        <a href="~/CitizenshipRegistration/Citizenship.aspx" runat="server">Citizenship Registration</a>
        <i class="bi bi-chevron-right mx-2" style="font-size:0.7rem;"></i>
        <span class="text-dark fw-medium">Issue New Citizenship</span>
    </nav>

    <div class="row g-4">
        <div class="col-lg-8">

            <!-- SECTION 1: APPLICANT DETAILS -->
            <div class="custom-card">
                <div class="card-header-custom">
                    <h5>Applicant Details &nbsp;/&nbsp; निवेदकको विवरण</h5>
                </div>
                <div class="card-body-custom row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Full Name (Nepali) <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtNameNep" runat="server" CssClass="form-control" placeholder="इन्द्र बहादुर तामाङ" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Full Name (English) <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtNameEng" runat="server" CssClass="form-control" placeholder="Indra Bahadur Tamang" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Date of Birth (B.S.) <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtDOBBS" runat="server" CssClass="form-control" placeholder="e.g. 2055-04-15" />
                        <div class="form-text">Bikram Sambat — YYYY-MM-DD</div>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Date of Birth (A.D.) <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtDOBAD" runat="server" CssClass="form-control" TextMode="Date" />
                        <div class="form-text">Anno Domini (English calendar)</div>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Gender / लिङ्ग <span class="text-danger">*</span></label>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-select" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Blood Group / रक्त समूह <span class="text-danger">*</span></label>
                        <asp:DropDownList ID="ddlBloodGroup" runat="server" CssClass="form-select" />
                    </div>
                </div>
            </div>

            <!-- SECTION 2: PERMANENT ADDRESS -->
            <div class="custom-card">
                <div class="card-header-custom">
                    <h5>Permanent Address &nbsp;/&nbsp; स्थायी ठेगाना</h5>
                </div>
                <div class="card-body-custom row g-3">
                    <div class="col-md-6">
                        <label class="form-label">District / जिल्ला <span class="text-danger">*</span></label>
                        <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-select" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Municipality / VDC <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtMunicipality" runat="server" CssClass="form-control" placeholder="e.g. Bhaktapur Municipality" />
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Ward No. / वडा नं. <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtWardNo" runat="server" CssClass="form-control" placeholder="e.g. 5" TextMode="Number" />
                    </div>
                    <div class="col-md-8">
                        <label class="form-label">Tole / Street <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtTole" runat="server" CssClass="form-control" placeholder="Tole Name" />
                    </div>
                </div>
            </div>

            <!-- SECTION 3: THREE-GENERATION DETAILS -->
            <div class="custom-card">
                <div class="card-header-custom">
                    <h5>Three-Generation Details &nbsp;/&nbsp; तीन पुस्ताको विवरण</h5>
                </div>
                <div class="card-body-custom">

                    <p class="sub-section-title">Father / बुबा</p>
                    <div class="row g-3">
                        <div class="col-md-5">
                            <label class="form-label">Father's Full Name (Nepali) <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtFatherNameNep" runat="server" CssClass="form-control" placeholder="बुबाको पूरा नाम" />
                        </div>
                        <div class="col-md-5">
                            <label class="form-label">Father's Full Name (English) <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtFatherNameEng" runat="server" CssClass="form-control" placeholder="Father's Full Name" />
                        </div>
                        <div class="col-md-2">
                            <label class="form-label">Alive?</label>
                            <asp:DropDownList ID="ddlFatherAlive" runat="server" CssClass="form-select" onchange="toggleDeathCert('father', this.value)">
                                <asp:ListItem Text="Yes" Value="yes" />
                                <asp:ListItem Text="No" Value="no" />
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-12">
                            <label class="form-label">Father's Citizenship Number <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtFatherCitizenshipNo" runat="server" CssClass="form-control" placeholder="e.g. 12-01-75-12345" />
                        </div>
                    </div>

                    <div class="conditional-block mt-3" id="selfDeclarationBlock" style="display:none;">
                        <div class="declaration-box">
                            <div class="form-check">
                                <asp:CheckBox ID="chkSelfDeclaration" runat="server" CssClass="form-check-input" />
                                <label class="form-check-label small fw-medium" for="<%=chkSelfDeclaration.ClientID%>">
                                    Self-Declaration (Swaghoshana) — Father's identity is unknown. Applicant and mother declare this under oath.<br />
                                    <span class="text-muted">स्वघोषणा — बुबाको परिचय थाहा छैन।</span>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="mt-2">
                        <a href="#" class="small fw-semibold text-decoration-none" style="color:var(--crimson);"
                           onclick="document.getElementById('selfDeclarationBlock').style.display='block'; return false;">
                            + Father is unidentified? Click here for Self-Declaration
                        </a>
                    </div>

                    <div class="section-divider"></div>

                    <p class="sub-section-title">Mother / आमा</p>
                    <div class="row g-3">
                        <div class="col-md-5">
                            <label class="form-label">Mother's Full Name (Nepali) <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtMotherNameNep" runat="server" CssClass="form-control" placeholder="आमाको पूरा नाम" />
                        </div>
                        <div class="col-md-5">
                            <label class="form-label">Mother's Full Name (English) <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtMotherNameEng" runat="server" CssClass="form-control" placeholder="Mother's Full Name" />
                        </div>
                        <div class="col-md-2">
                            <label class="form-label">Alive?</label>
                            <asp:DropDownList ID="ddlMotherAlive" runat="server" CssClass="form-select" onchange="toggleDeathCert('mother', this.value)">
                                <asp:ListItem Text="Yes" Value="yes" />
                                <asp:ListItem Text="No" Value="no" />
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-12">
                            <label class="form-label">Mother's Citizenship Number <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtMotherCitizenshipNo" runat="server" CssClass="form-control" placeholder="e.g. 12-01-75-67890" />
                        </div>
                    </div>

                    <div class="section-divider"></div>

                    <p class="sub-section-title">Paternal Grandfather / बाजे (बुबाको बुबा)</p>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label">Grandfather's Full Name (Nepali) <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtGrandfatherNameNep" runat="server" CssClass="form-control" placeholder="बाजेको पूरा नाम" />
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Grandfather's Full Name (English) <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtGrandfatherNameEng" runat="server" CssClass="form-control" placeholder="Grandfather's Full Name" />
                        </div>
                    </div>

                    <div class="section-divider"></div>

                    <p class="sub-section-title">Paternal Grandmother / बज्यै (बुबाकी आमा)</p>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label">Grandmother's Full Name (Nepali) <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtGrandmotherNameNep" runat="server" CssClass="form-control" placeholder="बज्यैको पूरा नाम" />
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Grandmother's Full Name (English) <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtGrandmotherNameEng" runat="server" CssClass="form-control" placeholder="Grandmother's Full Name" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- SECTION 4: CASE-SPECIFIC DETAILS -->
            <div class="custom-card">
                <div class="card-header-custom">
                    <h5>Case-Specific Information &nbsp;/&nbsp; विशेष अवस्था</h5>
                </div>
                <div class="card-body-custom">
                    <div class="row g-3 mb-3">
                        <div class="col-md-4">
                            <div class="form-check">
                                <asp:CheckBox ID="chkParentDeceased" runat="server" CssClass="form-check-input"
                                    onclick="toggleSection('deathCertSection', this.checked)" />
                                <label class="form-check-label small" for="<%=chkParentDeceased.ClientID%>">
                                    Parent(s) Deceased / अभिभावक बितेको
                                </label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-check">
                                <asp:CheckBox ID="chkMarried" runat="server" CssClass="form-check-input"
                                    onclick="toggleSection('marriageSection', this.checked)" />
                                <label class="form-check-label small" for="<%=chkMarried.ClientID%>">
                                    Married Female Applicant / विवाहित महिला
                                </label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-check">
                                <asp:CheckBox ID="chkMigrated" runat="server" CssClass="form-check-input"
                                    onclick="toggleSection('migrationSection', this.checked)" />
                                <label class="form-check-label small" for="<%=chkMigrated.ClientID%>">
                                    Migrated from Another Ward/District / बसाइसराइ
                                </label>
                            </div>
                        </div>
                    </div>

                    <div id="deathCertSection" class="conditional-block" style="display:none;">
                        <p class="sub-section-title mb-2">Death Certificate / मृत्यु दर्ता प्रमाणपत्र</p>
                        <div class="upload-box" onclick="document.getElementById('<%=fileDeathCert.ClientID%>').click();">
                            <i class="bi bi-file-earmark-medical fs-2"></i>
                            <div class="fw-bold mt-2">Upload Death Certificate</div>
                            <small class="text-muted">मृत्यु दर्ता प्रमाणपत्र (PDF/JPG, Max 2MB)</small>
                            <asp:FileUpload ID="fileDeathCert" runat="server" CssClass="d-none" />
                        </div>
                        <div class="form-text mt-1">If unavailable, the CDO may accept other local records.</div>
                    </div>

                    <div id="marriageSection" class="conditional-block mt-3" style="display:none;">
                        <p class="sub-section-title mb-2">Marriage Certificate / विवाह दर्ता प्रमाणपत्र</p>
                        <div class="row g-3 mb-3">
                            <div class="col-md-12">
                                <label class="form-label">Husband's Name</label>
                                <asp:TextBox ID="txtHusbandName" runat="server" CssClass="form-control" placeholder="Husband's Full Name" />
                            </div>
                        </div>
                        <div class="upload-box" onclick="document.getElementById('<%=fileMarriageCert.ClientID%>').click();">
                            <i class="bi bi-file-earmark-text fs-2"></i>
                            <div class="fw-bold mt-2">Upload Marriage Certificate</div>
                            <small class="text-muted">विवाह दर्ता प्रमाणपत्र (PDF/JPG, Max 2MB)</small>
                            <asp:FileUpload ID="fileMarriageCert" runat="server" CssClass="d-none" />
                        </div>
                    </div>

                    <div id="migrationSection" class="conditional-block mt-3" style="display:none;">
                        <p class="sub-section-title mb-2">Migration Certificate / बसाइसराइ प्रमाणपत्र</p>
                        <div class="upload-box" onclick="document.getElementById('<%=fileMigration.ClientID%>').click();">
                            <i class="bi bi-geo-alt fs-2"></i>
                            <div class="fw-bold mt-2">Upload Migration Certificate (Basaai Sarai)</div>
                            <small class="text-muted">बसाइसराइ प्रमाणपत्र (PDF/JPG, Max 2MB)</small>
                            <asp:FileUpload ID="fileMigration" runat="server" CssClass="d-none" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- SECTION 5: REQUIRED DOCUMENTS -->
            <div class="custom-card">
                <div class="card-header-custom">
                    <h5>Required Documents &nbsp;/&nbsp; आवश्यक कागजातहरू</h5>
                </div>
                <div class="card-body-custom d-flex flex-column gap-3">
                    <div class="upload-box" onclick="document.getElementById('<%=filePhoto.ClientID%>').click();">
                        <i class="bi bi-person-bounding-box fs-2"></i>
                        <div class="fw-bold mt-2">Passport Size Photo <span class="text-danger">*</span></div>
                        <small class="text-muted">पासपोर्ट साइजको फोटो — 35mm×45mm, white background (Max 2MB)</small>
                        <asp:FileUpload ID="filePhoto" runat="server" CssClass="d-none" />
                    </div>
                    <div class="upload-box" onclick="document.getElementById('<%=fileBirth.ClientID%>').click();">
                        <i class="bi bi-file-earmark-pdf fs-2"></i>
                        <div class="fw-bold mt-2">Birth Registration Certificate <span class="text-danger">*</span></div>
                        <small class="text-muted">जन्म दर्ता प्रमाणपत्र (PDF/JPG)</small>
                        <asp:FileUpload ID="fileBirth" runat="server" CssClass="d-none" />
                    </div>
                    <div class="upload-box" onclick="document.getElementById('<%=fileFatherCitizenship.ClientID%>').click();">
                        <i class="bi bi-card-heading fs-2"></i>
                        <div class="fw-bold mt-2">Father's Citizenship Certificate <span class="text-danger">*</span></div>
                        <small class="text-muted">बुबाको नागरिकता प्रमाणपत्र — Original &amp; Photocopy (PDF/JPG)</small>
                        <asp:FileUpload ID="fileFatherCitizenship" runat="server" CssClass="d-none" />
                    </div>
                    <div class="upload-box" onclick="document.getElementById('<%=fileMotherCitizenship.ClientID%>').click();">
                        <i class="bi bi-card-heading fs-2"></i>
                        <div class="fw-bold mt-2">Mother's Citizenship Certificate <span class="text-danger">*</span></div>
                        <small class="text-muted">आमाको नागरिकता प्रमाणपत्र — Original &amp; Photocopy (PDF/JPG)</small>
                        <asp:FileUpload ID="fileMotherCitizenship" runat="server" CssClass="d-none" />
                    </div>
                    <div class="upload-box" onclick="document.getElementById('<%=fileEducation.ClientID%>').click();">
                        <i class="bi bi-mortarboard fs-2"></i>
                        <div class="fw-bold mt-2">Educational Certificate (SLC/SEE or Equivalent) <span class="text-danger">*</span></div>
                        <small class="text-muted">शैक्षिक प्रमाणपत्र — to verify name spelling &amp; date of birth (PDF/JPG)</small>
                        <asp:FileUpload ID="fileEducation" runat="server" CssClass="d-none" />
                    </div>
                </div>
            </div>

            <!-- Action Buttons -->
            <div class="d-flex justify-content-end gap-3 mt-4 mb-5">
                <asp:Button ID="btnDraft" runat="server" Text="Save as Draft" CssClass="btn btn-draft" />
                <asp:Button ID="btnSubmit" runat="server" Text="Submit Application →"
                    CssClass="btn btn-submit-main" OnClick="btnSubmit_Click" />
            </div>

        </div><!-- /col-lg-8 -->

        <!-- SIDEBAR -->
        <div class="col-lg-4">

            <div class="alert border-0 d-flex gap-3 p-4 mb-4"
                 style="background:rgba(220,20,60,0.07); color:#7f1d1d; border-radius:16px;">
                <i class="bi bi-info-circle-fill h4 mb-0" style="color:var(--crimson);"></i>
                <div>
                    <h6 class="fw-bold">Important Note</h6>
                    <p class="small mb-0">Please verify all details before submitting. Incorrect information may lead to rejection.</p>
                </div>
            </div>

            <div class="custom-card mb-4">
                <div class="card-header-custom">
                    <h5>Document Checklist &nbsp;/&nbsp; कागजात सूची</h5>
                </div>
                <div class="card-body-custom">
                    <ul class="list-unstyled small mb-0">
                        <li class="mb-2"><i class="bi bi-check-circle-fill me-2" style="color:var(--crimson);"></i>Ward Office Recommendation (Sifarish)</li>
                        <li class="mb-2"><i class="bi bi-check-circle-fill me-2" style="color:var(--crimson);"></i>Parents' Citizenship Certificates</li>
                        <li class="mb-2"><i class="bi bi-check-circle-fill me-2" style="color:var(--crimson);"></i>Birth Registration Certificate</li>
                        <li class="mb-2"><i class="bi bi-check-circle-fill me-2" style="color:var(--crimson);"></i>2–4 Passport Size Photos</li>
                        <li class="mb-2"><i class="bi bi-check-circle-fill me-2" style="color:var(--crimson);"></i>Educational Certificate (SLC/SEE)</li>
                        <li class="mb-2 text-muted"><i class="bi bi-circle me-2"></i>Migration Certificate (if relocated)</li>
                        <li class="mb-2 text-muted"><i class="bi bi-circle me-2"></i>Death Certificate (if parent deceased)</li>
                        <li class="text-muted"><i class="bi bi-circle me-2"></i>Marriage Certificate (if married female)</li>
                    </ul>
                </div>
            </div>

            <div class="alert border-0 d-flex gap-3 p-4 mb-4"
                 style="background:#fefce8; color:#713f12; border:2px solid #facc15; border-radius:16px;">
                <i class="bi bi-exclamation-triangle-fill h4 mb-0" style="color:#ca8a04;"></i>
                <div>
                    <h6 class="fw-bold">Do Not Laminate</h6>
                    <p class="small mb-0">Do <strong>not</strong> laminate the citizenship card after receiving it. Lamination makes it invalid.</p>
                </div>
            </div>

            <div class="custom-card">
                <div class="card-header-custom">
                    <h5>Application Fee &nbsp;/&nbsp; दस्तुर</h5>
                </div>
                <div class="card-body-custom">
                    <div class="d-flex justify-content-between mb-2 small"><span class="text-muted">Service Fee</span><span class="fw-bold">Rs. 500</span></div>
                    <div class="d-flex justify-content-between mb-3 small"><span class="text-muted">Ticket Fee</span><span class="fw-bold">Rs. 10</span></div>
                    <div class="fee-total d-flex justify-content-between align-items-center">
                        <span class="fw-bold" style="color:var(--navy);">Total</span>
                        <span class="fw-bold fs-5" style="color:var(--crimson);">Rs. 510</span>
                    </div>
                </div>
            </div>

        </div><!-- /col-lg-4 -->
    </div><!-- /row -->
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function toggleSection(sectionId, show) {
        var el = document.getElementById(sectionId);
        if (el) el.style.display = show ? 'block' : 'none';
    }
    function toggleDeathCert(parent, value) { }
</script>

</asp:Content>
