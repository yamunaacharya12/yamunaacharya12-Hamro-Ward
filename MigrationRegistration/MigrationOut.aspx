<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="MigrationOut.aspx.cs" Inherits="HamroWard.MigrationRegistration.MigrationOut" %>
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

    .flag-bar {
        height: 10px;
        background: repeating-linear-gradient(90deg, var(--crimson) 0, var(--crimson) 24px, var(--navy) 24px, var(--navy) 48px);
    }

    .page-hero {
        background: linear-gradient(135deg, #92400e 0%, var(--navy) 100%);
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

    .breadcrumb-wrap { font-size: 0.82rem; color: #6b7280; margin-bottom: 28px; }
    .breadcrumb-wrap a { color: var(--crimson); text-decoration: none; }
    .breadcrumb-wrap a:hover { text-decoration: underline; }

    .form-card {
        background: white;
        border-radius: 20px;
        border: 2px solid #e8eaf0;
        box-shadow: 0 4px 24px rgba(0,0,0,0.07);
        margin-bottom: 28px;
        overflow: hidden;
    }
    .form-card-header {
        background: linear-gradient(90deg, #fefce8, var(--navy-light));
        border-bottom: 2px solid #e8eaf0;
        padding: 18px 28px;
        display: flex;
        align-items: center;
        gap: 12px;
    }
    .form-card-header .section-icon { font-size: 1.5rem; }
    .form-card-header h3 { font-size: 1.05rem; font-weight: 700; color: #92400e; margin: 0; }
    .form-card-header p { font-size: 0.78rem; color: #6b7280; margin: 0; }
    .form-card-body { padding: 28px; }

    .form-row {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
        gap: 20px;
        margin-bottom: 20px;
    }
    .form-group { display: flex; flex-direction: column; gap: 6px; }
    .form-group label { font-size: 0.85rem; font-weight: 600; color: #374151; }
    .form-group label .nep { font-weight: 400; color: var(--navy); opacity: 0.7; font-size: 0.78rem; display: block; }
    .form-group label .req { color: var(--crimson); margin-left: 2px; }
    .form-control {
        border: 1.5px solid #d1d5db;
        border-radius: 10px;
        padding: 10px 14px;
        font-size: 0.92rem;
        font-family: 'Inter', 'Noto Sans Devanagari', sans-serif;
        color: #1e2937;
        background: #f9fafb;
        transition: all 0.2s ease;
        width: 100%;
        box-sizing: border-box;
    }
    .form-control:focus {
        outline: none;
        border-color: #92400e;
        background: white;
        box-shadow: 0 0 0 3px rgba(146,64,14,0.1);
    }
    select.form-control {
        cursor: pointer; appearance: none;
        background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='%236b7280' viewBox='0 0 16 16'%3E%3Cpath d='M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z'/%3E%3C/svg%3E");
        background-repeat: no-repeat;
        background-position: right 12px center;
        padding-right: 36px;
    }
    textarea.form-control { resize: vertical; min-height: 90px; }

    .section-divider { border: none; border-top: 2px dashed #e8eaf0; margin: 8px 0 24px; }

    .info-box {
        background: #fefce8;
        border-left: 4px solid #92400e;
        border-radius: 0 10px 10px 0;
        padding: 14px 18px;
        font-size: 0.84rem;
        color: #78350f;
        margin-bottom: 20px;
    }
    .info-box strong { display: block; margin-bottom: 4px; }

    .warning-box {
        background: rgba(220,20,60,0.06);
        border-left: 4px solid var(--crimson);
        border-radius: 0 10px 10px 0;
        padding: 14px 18px;
        font-size: 0.84rem;
        color: #7f1d1d;
        margin-bottom: 20px;
    }

    .upload-zone {
        border: 2px dashed #d1d5db;
        border-radius: 12px;
        padding: 20px;
        text-align: center;
        background: #f9fafb;
        transition: border-color 0.2s;
        cursor: pointer;
    }
    .upload-zone:hover { border-color: #92400e; background: #fefce8; }
    .upload-zone .upload-icon { font-size: 2rem; margin-bottom: 6px; }
    .upload-zone p { margin: 0; font-size: 0.83rem; color: #6b7280; }

    .btn-primary-custom {
        background: linear-gradient(135deg, #92400e, #78350f);
        color: white;
        border: none;
        border-radius: 12px;
        padding: 13px 36px;
        font-size: 1rem;
        font-weight: 700;
        cursor: pointer;
        transition: all 0.2s ease;
        font-family: 'Inter', 'Noto Sans Devanagari', sans-serif;
    }
    .btn-primary-custom:hover { transform: translateY(-2px); box-shadow: 0 8px 24px rgba(146,64,14,0.35); }
    .btn-secondary-custom {
        background: white; color: var(--navy); border: 2px solid var(--navy);
        border-radius: 12px; padding: 11px 28px; font-size: 0.95rem; font-weight: 600;
        cursor: pointer; transition: all 0.2s ease; font-family: 'Inter', sans-serif;
        text-decoration: none; display: inline-block;
    }
    .btn-secondary-custom:hover { background: var(--navy); color: white; }
    .form-actions { display: flex; gap: 14px; align-items: center; flex-wrap: wrap; margin-top: 10px; }
    .step-badge {
        display: inline-flex; align-items: center; gap: 6px;
        background: #fef3c7; color: #92400e; font-size: 0.75rem; font-weight: 700;
        padding: 4px 12px; border-radius: 999px; margin-bottom: 6px;
    }
</style>

<div class="flag-bar"></div>

<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">📦</div>
        <div class="hero-text">
            <h1>Migration Out Registration &nbsp;/&nbsp; बसाइसराइ गएको दर्ता</h1>
            <p>Ward Office — Digital Services Portal &nbsp;|&nbsp; वडा कार्यालय — डिजिटल सेवा</p>
        </div>
    </div>
</div>

<main style="max-width:1000px; margin:0 auto; padding:0 16px 60px;">

    <nav class="breadcrumb-wrap">
        <a href="~/Default.aspx" runat="server">Home</a> &rsaquo;
        <a href="/Service.aspx" runat="server">Vital Registration</a> &rsaquo;
        <a href="~/MigrationRegistration/Migration.aspx" runat="server">Migration Registration</a> &rsaquo;
        <span>Migration Out</span>
    </nav>

    <div class="warning-box">
        ⚠️ <strong>Notice / सूचना:</strong> This form is for individuals <strong>leaving</strong> this ward/municipality. After submission, your household registration will be updated and a Migration Approval Letter will be issued for use at your new ward. / यो फारम यो वडा छोड्नेहरूको लागि हो।
    </div>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>

    <!-- SECTION 1: Applicant Details -->
    <div class="form-card">
        <div class="form-card-header">
            <span class="section-icon">👤</span>
            <div>
                <h3>Section 1: Applicant Personal Details</h3>
                <p>आवेदकको व्यक्तिगत विवरण</p>
            </div>
        </div>
        <div class="form-card-body">
            <span class="step-badge">📋 Personal Info</span>

            <div class="form-row">
                <div class="form-group">
                    <label>Full Name (English) <span class="req">*</span><span class="nep">पूरा नाम (अंग्रेजी)</span></label>
                    <asp:TextBox ID="txtFullNameEng" runat="server" CssClass="form-control" placeholder="e.g. Ram Bahadur Thapa" MaxLength="100" />
                    <asp:RequiredFieldValidator ControlToValidate="txtFullNameEng" runat="server" ErrorMessage="Full name is required." ForeColor="Crimson" Display="Dynamic" Font-Size="Small" />
                </div>
                <div class="form-group">
                    <label>Full Name (Nepali) <span class="req">*</span><span class="nep">पूरा नाम (नेपाली)</span></label>
                    <asp:TextBox ID="txtFullNameNep" runat="server" CssClass="form-control" placeholder="जस्तै: राम बहादुर थापा" MaxLength="100" />
                    <asp:RequiredFieldValidator ControlToValidate="txtFullNameNep" runat="server" ErrorMessage="Nepali name is required." ForeColor="Crimson" Display="Dynamic" Font-Size="Small" />
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Date of Birth <span class="req">*</span><span class="nep">जन्म मिति</span></label>
                    <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" TextMode="Date" />
                    <asp:RequiredFieldValidator ControlToValidate="txtDOB" runat="server" ErrorMessage="Date of birth is required." ForeColor="Crimson" Display="Dynamic" Font-Size="Small" />
                </div>
                <div class="form-group">
                    <label>Gender <span class="req">*</span><span class="nep">लिङ्ग</span></label>
                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">-- Select / छान्नुहोस् --</asp:ListItem>
                        <asp:ListItem Value="Male">Male / पुरुष</asp:ListItem>
                        <asp:ListItem Value="Female">Female / महिला</asp:ListItem>
                        <asp:ListItem Value="Other">Other / अन्य</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ControlToValidate="ddlGender" runat="server" InitialValue="" ErrorMessage="Gender is required." ForeColor="Crimson" Display="Dynamic" Font-Size="Small" />
                </div>
                <div class="form-group">
                    <label>Household Registration No. <span class="req">*</span><span class="nep">घरधुरी दर्ता नं.</span></label>
                    <asp:TextBox ID="txtHouseholdRegNo" runat="server" CssClass="form-control" placeholder="e.g. W5-2078-001" MaxLength="30" />
                    <asp:RequiredFieldValidator ControlToValidate="txtHouseholdRegNo" runat="server" ErrorMessage="Household registration number is required." ForeColor="Crimson" Display="Dynamic" Font-Size="Small" />
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Citizenship Number <span class="req">*</span><span class="nep">नागरिकता नम्बर</span></label>
                    <asp:TextBox ID="txtCitizenshipNo" runat="server" CssClass="form-control" placeholder="e.g. 12-01-78-12345" MaxLength="30" />
                    <asp:RequiredFieldValidator ControlToValidate="txtCitizenshipNo" runat="server" ErrorMessage="Citizenship number is required." ForeColor="Crimson" Display="Dynamic" Font-Size="Small" />
                </div>
                <div class="form-group">
                    <label>Citizenship Issued District <span class="req">*</span><span class="nep">जारी जिल्ला</span></label>
                    <asp:TextBox ID="txtCitizenshipDistrict" runat="server" CssClass="form-control" placeholder="e.g. Kathmandu" MaxLength="60" />
                    <asp:RequiredFieldValidator ControlToValidate="txtCitizenshipDistrict" runat="server" ErrorMessage="Issued district is required." ForeColor="Crimson" Display="Dynamic" Font-Size="Small" />
                </div>
                <div class="form-group">
                    <label>Mobile Number <span class="req">*</span><span class="nep">मोबाइल नम्बर</span></label>
                    <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="98XXXXXXXX" MaxLength="15" />
                    <asp:RequiredFieldValidator ControlToValidate="txtMobile" runat="server" ErrorMessage="Mobile number is required." ForeColor="Crimson" Display="Dynamic" Font-Size="Small" />
                </div>
            </div>

            <hr class="section-divider" />

            <p style="font-weight:700; color:#92400e; margin-bottom:14px;">Family Members / परिवारका सदस्यहरू</p>
            <div class="form-row">
                <div class="form-group">
                    <label>Father's Name <span class="req">*</span><span class="nep">बुबाको नाम</span></label>
                    <asp:TextBox ID="txtFatherName" runat="server" CssClass="form-control" placeholder="Father's full name" MaxLength="100" />
                    <asp:RequiredFieldValidator ControlToValidate="txtFatherName" runat="server" ErrorMessage="Father's name is required." ForeColor="Crimson" Display="Dynamic" Font-Size="Small" />
                </div>
                <div class="form-group">
                    <label>Mother's Name <span class="req">*</span><span class="nep">आमाको नाम</span></label>
                    <asp:TextBox ID="txtMotherName" runat="server" CssClass="form-control" placeholder="Mother's full name" MaxLength="100" />
                    <asp:RequiredFieldValidator ControlToValidate="txtMotherName" runat="server" ErrorMessage="Mother's name is required." ForeColor="Crimson" Display="Dynamic" Font-Size="Small" />
                </div>
                <div class="form-group">
                    <label>Number of Family Members Leaving <span class="req">*</span><span class="nep">जाने परिवार सदस्य संख्या</span></label>
                    <asp:TextBox ID="txtFamilyCount" runat="server" CssClass="form-control" TextMode="Number" placeholder="e.g. 4" />
                    <asp:RequiredFieldValidator ControlToValidate="txtFamilyCount" runat="server" ErrorMessage="Family member count is required." ForeColor="Crimson" Display="Dynamic" Font-Size="Small" />
                </div>
            </div>
        </div>
    </div>

    <!-- SECTION 2: Current Address -->
    <div class="form-card">
        <div class="form-card-header">
            <span class="section-icon">📍</span>
            <div>
                <h3>Section 2: Current Address (This Ward)</h3>
                <p>हालको ठेगाना — यो वडाको</p>
            </div>
        </div>
        <div class="form-card-body">
            <div class="form-row">
                <div class="form-group">
                    <label>Ward No. <span class="req">*</span><span class="nep">वडा नं.</span></label>
                    <asp:DropDownList ID="ddlCurrentWard" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">-- Select Ward --</asp:ListItem>
                        <asp:ListItem Value="1">Ward 1</asp:ListItem>
                        <asp:ListItem Value="2">Ward 2</asp:ListItem>
                        <asp:ListItem Value="3">Ward 3</asp:ListItem>
                        <asp:ListItem Value="4">Ward 4</asp:ListItem>
                        <asp:ListItem Value="5">Ward 5</asp:ListItem>
                        <asp:ListItem Value="6">Ward 6</asp:ListItem>
                        <asp:ListItem Value="7">Ward 7</asp:ListItem>
                        <asp:ListItem Value="8">Ward 8</asp:ListItem>
                        <asp:ListItem Value="9">Ward 9</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ControlToValidate="ddlCurrentWard" runat="server" InitialValue="" ErrorMessage="Ward is required." ForeColor="Crimson" Display="Dynamic" Font-Size="Small" />
                </div>
                <div class="form-group">
                    <label>Tole / Street <span class="req">*</span><span class="nep">टोल / सडक</span></label>
                    <asp:TextBox ID="txtCurrentTole" runat="server" CssClass="form-control" placeholder="Current tole" MaxLength="100" />
                    <asp:RequiredFieldValidator ControlToValidate="txtCurrentTole" runat="server" ErrorMessage="Tole is required." ForeColor="Crimson" Display="Dynamic" Font-Size="Small" />
                </div>
                <div class="form-group">
                    <label>House No. <span class="nep">घर नं.</span></label>
                    <asp:TextBox ID="txtCurrentHouseNo" runat="server" CssClass="form-control" placeholder="Current house no." MaxLength="20" />
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>Duration of Stay <span class="req">*</span><span class="nep">बसेको अवधि</span></label>
                    <asp:TextBox ID="txtDurationOfStay" runat="server" CssClass="form-control" placeholder="e.g. 5 years / ५ वर्ष" MaxLength="50" />
                    <asp:RequiredFieldValidator ControlToValidate="txtDurationOfStay" runat="server" ErrorMessage="Duration of stay is required." ForeColor="Crimson" Display="Dynamic" Font-Size="Small" />
                </div>
                <div class="form-group">
                    <label>Date of Departure <span class="req">*</span><span class="nep">जाने मिति</span></label>
                    <asp:TextBox ID="txtDepartureDate" runat="server" CssClass="form-control" TextMode="Date" />
                    <asp:RequiredFieldValidator ControlToValidate="txtDepartureDate" runat="server" ErrorMessage="Departure date is required." ForeColor="Crimson" Display="Dynamic" Font-Size="Small" />
                </div>
            </div>
        </div>
    </div>

    <!-- SECTION 3: Destination Address -->
    <div class="form-card">
        <div class="form-card-header">
            <span class="section-icon">🗺️</span>
            <div>
                <h3>Section 3: Destination Address</h3>
                <p>जाने ठेगाना</p>
            </div>
        </div>
        <div class="form-card-body">
            <div class="form-row">
                <div class="form-group">
                    <label>Province <span class="req">*</span><span class="nep">प्रदेश</span></label>
                    <asp:DropDownList ID="ddlDestProvince" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">-- Select Province --</asp:ListItem>
                        <asp:ListItem Value="Koshi">Koshi Province (१)</asp:ListItem>
                        <asp:ListItem Value="Madhesh">Madhesh Province (२)</asp:ListItem>
                        <asp:ListItem Value="Bagmati">Bagmati Province (३)</asp:ListItem>
                        <asp:ListItem Value="Gandaki">Gandaki Province (४)</asp:ListItem>
                        <asp:ListItem Value="Lumbini">Lumbini Province (५)</asp:ListItem>
                        <asp:ListItem Value="Karnali">Karnali Province (६)</asp:ListItem>
                        <asp:ListItem Value="Sudurpashchim">Sudurpashchim Province (७)</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ControlToValidate="ddlDestProvince" runat="server" InitialValue="" ErrorMessage="Province is required." ForeColor="Crimson" Display="Dynamic" Font-Size="Small" />
                </div>
                <div class="form-group">
                    <label>District <span class="req">*</span><span class="nep">जिल्ला</span></label>
                    <asp:TextBox ID="txtDestDistrict" runat="server" CssClass="form-control" placeholder="Destination district" MaxLength="60" />
                    <asp:RequiredFieldValidator ControlToValidate="txtDestDistrict" runat="server" ErrorMessage="District is required." ForeColor="Crimson" Display="Dynamic" Font-Size="Small" />
                </div>
                <div class="form-group">
                    <label>Municipality / Rural Municipality <span class="req">*</span><span class="nep">नगरपालिका / गाउँपालिका</span></label>
                    <asp:TextBox ID="txtDestMunicipality" runat="server" CssClass="form-control" placeholder="Destination municipality" MaxLength="80" />
                    <asp:RequiredFieldValidator ControlToValidate="txtDestMunicipality" runat="server" ErrorMessage="Municipality is required." ForeColor="Crimson" Display="Dynamic" Font-Size="Small" />
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>Ward No. <span class="req">*</span><span class="nep">वडा नं.</span></label>
                    <asp:TextBox ID="txtDestWard" runat="server" CssClass="form-control" TextMode="Number" placeholder="e.g. 3" />
                    <asp:RequiredFieldValidator ControlToValidate="txtDestWard" runat="server" ErrorMessage="Ward number is required." ForeColor="Crimson" Display="Dynamic" Font-Size="Small" />
                </div>
                <div class="form-group">
                    <label>Tole / Street <span class="nep">टोल / सडक</span></label>
                    <asp:TextBox ID="txtDestTole" runat="server" CssClass="form-control" placeholder="Destination tole" MaxLength="100" />
                </div>
                <div class="form-group">
                    <label>Reason for Migration <span class="req">*</span><span class="nep">बसाइ सर्नुको कारण</span></label>
                    <asp:DropDownList ID="ddlMigrationReason" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">-- Select Reason --</asp:ListItem>
                        <asp:ListItem Value="Employment">Employment / रोजगारी</asp:ListItem>
                        <asp:ListItem Value="Education">Education / शिक्षा</asp:ListItem>
                        <asp:ListItem Value="Marriage">Marriage / विवाह</asp:ListItem>
                        <asp:ListItem Value="Family">Family / पारिवारिक</asp:ListItem>
                        <asp:ListItem Value="Natural Disaster">Natural Disaster / प्राकृतिक विपद</asp:ListItem>
                        <asp:ListItem Value="Health">Health / स्वास्थ्य</asp:ListItem>
                        <asp:ListItem Value="Business">Business / व्यापार</asp:ListItem>
                        <asp:ListItem Value="Other">Other / अन्य</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ControlToValidate="ddlMigrationReason" runat="server" InitialValue="" ErrorMessage="Reason is required." ForeColor="Crimson" Display="Dynamic" Font-Size="Small" />
                </div>
            </div>
        </div>
    </div>

    <!-- SECTION 4: Documents -->
    <div class="form-card">
        <div class="form-card-header">
            <span class="section-icon">📎</span>
            <div>
                <h3>Section 4: Required Documents</h3>
                <p>आवश्यक कागजातहरू</p>
            </div>
        </div>
        <div class="form-card-body">
            <div class="info-box">
                <strong>📋 Required Documents / आवश्यक कागजातहरू:</strong>
                1. Citizenship Certificate / नागरिकता &nbsp;|&nbsp; 2. Household Registration Book / घरधुरी कार्ड &nbsp;|&nbsp; 3. Tax Clearance Certificate / कर चुक्ता प्रमाण &nbsp;|&nbsp; 4. Application letter / निवेदन पत्र
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Citizenship Certificate <span class="req">*</span><span class="nep">नागरिकता प्रमाणपत्र</span></label>
                    <div class="upload-zone" onclick="document.getElementById('fileCitizenship').click()">
                        <div class="upload-icon">🪪</div>
                        <p>Click to upload<br><small>JPG, PNG or PDF – Max 2MB</small></p>
                        <asp:FileUpload ID="fileCitizenship" runat="server" style="display:none" accept=".jpg,.jpeg,.png,.pdf" />
                    </div>
                </div>
                <div class="form-group">
                    <label>Household Registration Book <span class="req">*</span><span class="nep">घरधुरी कार्ड</span></label>
                    <div class="upload-zone" onclick="document.getElementById('fileHousehold').click()">
                        <div class="upload-icon">📗</div>
                        <p>Click to upload<br><small>JPG, PNG or PDF – Max 2MB</small></p>
                        <asp:FileUpload ID="fileHousehold" runat="server" style="display:none" accept=".jpg,.jpeg,.png,.pdf" />
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>Tax Clearance Certificate <span class="nep">कर चुक्ता प्रमाण</span></label>
                    <div class="upload-zone" onclick="document.getElementById('fileTaxClearance').click()">
                        <div class="upload-icon">🧾</div>
                        <p>Click to upload<br><small>PDF – Max 5MB</small></p>
                        <asp:FileUpload ID="fileTaxClearance" runat="server" style="display:none" accept=".jpg,.jpeg,.png,.pdf" />
                    </div>
                </div>
                <div class="form-group">
                    <label>Application Letter / Passport Photo <span class="nep">निवेदन / फोटो</span></label>
                    <div class="upload-zone" onclick="document.getElementById('fileApplication').click()">
                        <div class="upload-icon">📄</div>
                        <p>Click to upload<br><small>PDF or JPG – Max 5MB</small></p>
                        <asp:FileUpload ID="fileApplication" runat="server" style="display:none" accept=".jpg,.jpeg,.png,.pdf" />
                    </div>
                </div>
            </div>

            <div class="form-group" style="margin-top:16px;">s
                <label>Remarks / Additional Info <span class="nep">थप जानकारी</span></label>
                <asp:TextBox ID="txtRemarks" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Any additional information..." />
            </div>

            <!-- Declaration -->
            <div style="background:#f9fafb; border:1.5px solid #e8eaf0; border-radius:12px; padding:18px; margin-top:20px;">
                <label style="display:flex; gap:12px; align-items:flex-start; font-size:0.85rem; cursor:pointer;">
                    <asp:CheckBox ID="chkDeclaration" runat="server" style="margin-top:2px;" />
                    <span>I hereby declare that all information provided above is true and correct to the best of my knowledge. I understand that providing false information is a punishable offence. / <span style="color:var(--navy);">माथि उल्लिखित सबै विवरण सत्य र सही छन् भनी म घोषणा गर्दछु।</span></span>
                </label>
                <asp:CustomValidator ID="cvDeclaration" runat="server" 
        ControlToValidate="" 
        OnServerValidate="cvDeclaration_ServerValidate"
        ErrorMessage="You must accept the declaration." 
        ForeColor="Crimson" 
        Display="Dynamic" 
        Font-Size="Small" />
            </div>
        </div>
    </div>

    <div class="form-actions">
        <asp:Button ID="btnSubmit" runat="server" Text="Submit Application / दर्ता गर्नुहोस्" CssClass="btn-primary-custom" OnClick="btnSubmit_Click" />
        <a href="~/MigrationRegistration/Migration.aspx" runat="server" class="btn-secondary-custom">← Back / फिर्ता</a>
        <asp:Label ID="lblMessage" runat="server" style="font-size:0.88rem; color:green; font-weight:600;" />
    </div>

    </ContentTemplate>
    </asp:UpdatePanel>

</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</asp:Content>
