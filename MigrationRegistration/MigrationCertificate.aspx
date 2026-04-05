<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="MigrationCertificate.aspx.cs" Inherits="HamroWard.MigrationRegistration.MigrationCertificate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Noto+Sans+Devanagari:wght@400;500;700&display=swap');

    :root {
        --crimson: #DC143C;
        --navy: #002B7F;
        --crimson-light: rgba(220, 20, 60, 0.08);
        --navy-light: rgba(0, 43, 127, 0.07);
        --green: #059669;
        --green-light: rgba(5, 150, 105, 0.08);
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
        background: linear-gradient(135deg, #065f46 0%, var(--navy) 100%);
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
        max-width: 1200px; margin: 0 auto; padding: 0 24px;
        display: flex; align-items: center; gap: 20px; color: white; flex-wrap: wrap;
    }
    .hero-emblem {
        width: 72px; height: 72px; background: white; border-radius: 50%;
        display: flex; align-items: center; justify-content: center; font-size: 40px;
        box-shadow: 0 8px 24px rgba(0,0,0,0.22); flex-shrink: 0;
    }
    .hero-text h1 { font-size: 1.55rem; font-weight: 700; margin: 0 0 2px; }
    .hero-text p  { font-size: 1rem; margin: 0; opacity: 0.88; }

    .breadcrumb-wrap { font-size: 0.82rem; color: #6b7280; margin-bottom: 28px; }
    .breadcrumb-wrap a { color: var(--crimson); text-decoration: none; }
    .breadcrumb-wrap a:hover { text-decoration: underline; }

    /* ── Cards ── */
    .form-card {
        background: white; border-radius: 20px; border: 2px solid #e8eaf0;
        box-shadow: 0 4px 24px rgba(0,0,0,0.07); margin-bottom: 28px; overflow: hidden;
    }
    .form-card-header {
        background: linear-gradient(90deg, var(--green-light), var(--navy-light));
        border-bottom: 2px solid #e8eaf0; padding: 18px 28px;
        display: flex; align-items: center; gap: 12px;
    }
    .form-card-header .section-icon { font-size: 1.5rem; }
    .form-card-header h3 { font-size: 1.05rem; font-weight: 700; color: var(--green); margin: 0; }
    .form-card-header p { font-size: 0.78rem; color: #6b7280; margin: 0; }
    .form-card-body { padding: 28px; }

    .form-row { display: grid; grid-template-columns: repeat(auto-fit, minmax(220px, 1fr)); gap: 20px; margin-bottom: 20px; }
    .form-group { display: flex; flex-direction: column; gap: 6px; }
    .form-group label { font-size: 0.85rem; font-weight: 600; color: #374151; }
    .form-group label .nep { font-weight: 400; color: var(--navy); opacity: 0.7; font-size: 0.78rem; display: block; }
    .form-group label .req { color: var(--crimson); margin-left: 2px; }
    .form-control {
        border: 1.5px solid #d1d5db; border-radius: 10px; padding: 10px 14px;
        font-size: 0.92rem; font-family: 'Inter', 'Noto Sans Devanagari', sans-serif;
        color: #1e2937; background: #f9fafb; transition: all 0.2s; width: 100%; box-sizing: border-box;
    }
    .form-control:focus { outline: none; border-color: var(--green); background: white; box-shadow: 0 0 0 3px rgba(5,150,105,0.1); }
    select.form-control {
        cursor: pointer; appearance: none;
        background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='%236b7280' viewBox='0 0 16 16'%3E%3Cpath d='M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z'/%3E%3C/svg%3E");
        background-repeat: no-repeat; background-position: right 12px center; padding-right: 36px;
    }

    .info-box {
        background: var(--green-light); border-left: 4px solid var(--green);
        border-radius: 0 10px 10px 0; padding: 14px 18px;
        font-size: 0.84rem; color: #064e3b; margin-bottom: 20px;
    }
    .info-box strong { display: block; margin-bottom: 4px; }

    /* ── Certificate Preview ── */
    .certificate-preview {
        border: 3px solid #d97706;
        border-radius: 16px;
        padding: 0;
        overflow: hidden;
        background: white;
        position: relative;
    }
    .cert-header {
        background: linear-gradient(135deg, var(--navy), #1e3a8a);
        color: white;
        text-align: center;
        padding: 24px;
    }
    .cert-header .cert-emblem { font-size: 3rem; margin-bottom: 8px; }
    .cert-header h2 { font-size: 1.2rem; font-weight: 700; margin: 0 0 4px; letter-spacing: 0.05em; }
    .cert-header p { font-size: 0.85rem; margin: 0; opacity: 0.85; }
    .cert-body { padding: 28px; }
    .cert-title {
        text-align: center;
        font-size: 1.3rem;
        font-weight: 700;
        color: var(--navy);
        border-bottom: 2px solid #e8eaf0;
        padding-bottom: 16px;
        margin-bottom: 20px;
        letter-spacing: 0.03em;
    }
    .cert-row { display: flex; gap: 12px; padding: 8px 0; border-bottom: 1px dashed #f1f5f9; }
    .cert-row .cert-label { font-size: 0.83rem; font-weight: 600; color: #6b7280; min-width: 200px; }
    .cert-row .cert-value { font-size: 0.88rem; color: #1e2937; font-weight: 500; }
    .cert-footer {
        background: #f9fafb;
        border-top: 2px solid #e8eaf0;
        padding: 20px 28px;
        display: flex;
        justify-content: space-between;
        align-items: flex-end;
        flex-wrap: wrap;
        gap: 20px;
    }
    .cert-footer .signature-block { text-align: center; }
    .cert-footer .sig-line { width: 160px; border-top: 2px solid #374151; margin: 40px auto 6px; }
    .cert-footer .sig-label { font-size: 0.78rem; font-weight: 600; color: #374151; }
    .cert-stamp {
        width: 80px; height: 80px; border-radius: 50%;
        border: 3px solid var(--crimson); display: flex; flex-direction: column;
        align-items: center; justify-content: center; text-align: center;
        color: var(--crimson); font-size: 0.55rem; font-weight: 700; line-height: 1.3;
        opacity: 0.6;
    }

    /* ── Buttons ── */
    .btn-primary-custom {
        background: linear-gradient(135deg, var(--green), #047857);
        color: white; border: none; border-radius: 12px; padding: 13px 36px;
        font-size: 1rem; font-weight: 700; cursor: pointer; transition: all 0.2s;
        font-family: 'Inter', 'Noto Sans Devanagari', sans-serif;
    }
    .btn-primary-custom:hover { transform: translateY(-2px); box-shadow: 0 8px 24px rgba(5,150,105,0.35); }
    .btn-secondary-custom {
        background: white; color: var(--navy); border: 2px solid var(--navy);
        border-radius: 12px; padding: 11px 28px; font-size: 0.95rem; font-weight: 600;
        cursor: pointer; transition: all 0.2s; font-family: 'Inter', sans-serif;
        text-decoration: none; display: inline-block;
    }
    .btn-secondary-custom:hover { background: var(--navy); color: white; }
    .btn-print {
        background: linear-gradient(135deg, #374151, #1f2937);
        color: white; border: none; border-radius: 12px; padding: 13px 28px;
        font-size: 0.95rem; font-weight: 700; cursor: pointer; transition: all 0.2s;
        font-family: 'Inter', sans-serif;
    }
    .btn-print:hover { box-shadow: 0 8px 24px rgba(0,0,0,0.3); transform: translateY(-2px); }
    .form-actions { display: flex; gap: 14px; align-items: center; flex-wrap: wrap; margin-top: 10px; }

    @media print {
        body > *:not(#printArea) { display: none !important; }
        #printArea { display: block !important; }
    }
</style>

<div class="flag-bar"></div>

<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">📜</div>
        <div class="hero-text">
            <h1>Migration Certificate &nbsp;/&nbsp; बसाइसराइ प्रमाणपत्र</h1>
            <p>Ward Office — Digital Services Portal &nbsp;|&nbsp; वडा कार्यालय — डिजिटल सेवा</p>
        </div>
    </div>
</div>

<main style="max-width:1000px; margin:0 auto; padding:0 16px 60px;">

    <nav class="breadcrumb-wrap">
        <a href="~/Default.aspx" runat="server">Home</a> &rsaquo;
        <a href="/Service.aspx" runat="server">Vital Registration</a> &rsaquo;
        <a href="~/MigrationRegistration/Migration.aspx" runat="server">Migration Registration</a> &rsaquo;
        <span>Migration Certificate</span>
    </nav>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>

    <!-- Certificate Search / Request -->
    <div class="form-card">
        <div class="form-card-header">
            <span class="section-icon">🔍</span>
            <div>
                <h3>Retrieve Your Certificate</h3>
                <p>प्रमाणपत्र प्राप्त गर्नुहोस्</p>
            </div>
        </div>
        <div class="form-card-body">
            <div class="info-box">
                <strong>📌 Note / सूचना:</strong>
                Certificate can only be downloaded after your application is <strong>approved</strong> by the ward office. Enter your token number or details below to check and download your certificate. / प्रमाणपत्र वडा कार्यालयबाट <strong>स्वीकृत</strong> भएपछि मात्र डाउनलोड गर्न सकिन्छ।
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Token / Application Number <span class="req">*</span><span class="nep">टोकन / आवेदन नम्बर</span></label>
                    <asp:TextBox ID="txtTokenNo" runat="server" CssClass="form-control" placeholder="e.g. MIG-2081-00123" MaxLength="30" />
                    <asp:RequiredFieldValidator ControlToValidate="txtTokenNo" runat="server" ErrorMessage="Token number is required." ForeColor="Crimson" Display="Dynamic" Font-Size="Small" />
                </div>
                <div class="form-group">
                    <label>Citizenship Number <span class="req">*</span><span class="nep">नागरिकता नम्बर</span></label>
                    <asp:TextBox ID="txtCitizenshipNo" runat="server" CssClass="form-control" placeholder="For identity verification" MaxLength="30" />
                    <asp:RequiredFieldValidator ControlToValidate="txtCitizenshipNo" runat="server" ErrorMessage="Citizenship number is required." ForeColor="Crimson" Display="Dynamic" Font-Size="Small" />
                </div>
                <div class="form-group">
                    <label>Mobile Number <span class="req">*</span><span class="nep">मोबाइल नम्बर</span></label>
                    <asp:TextBox ID="txtMobileNo" runat="server" CssClass="form-control" placeholder="Registered mobile" MaxLength="15" />
                    <asp:RequiredFieldValidator ControlToValidate="txtMobileNo" runat="server" ErrorMessage="Mobile number is required." ForeColor="Crimson" Display="Dynamic" Font-Size="Small" />
                </div>
            </div>

            <div class="form-actions">
                <asp:Button ID="btnFetchCertificate" runat="server" Text="📜 Fetch Certificate" CssClass="btn-primary-custom" OnClick="BtnFetchCertificate_Click" />
            </div>
            <asp:Label ID="lblFetchMessage" runat="server" style="font-size:0.88rem; color:crimson; font-weight:600; margin-top:8px; display:block;" />
        </div>
    </div>

    <!-- Certificate Preview (shown after fetch) -->
    <asp:Panel ID="pnlCertificate" runat="server" Visible="false">
        <div id="printArea">
        <div class="certificate-preview">
            <!-- Cert Header -->
            <div class="cert-header">
                <div class="cert-emblem">🏛️</div>
                <h2>WARD OFFICE / वडा कार्यालय</h2>
                <p>Government of Nepal — Local Government<br>नेपाल सरकार — स्थानीय सरकार</p>
            </div>

            <div class="cert-body">
                <div class="cert-title">
                    MIGRATION CERTIFICATE &nbsp;/&nbsp; बसाइसराइ प्रमाणपत्र
                </div>

                <p style="font-size:0.88rem; color:#374151; margin-bottom:20px; text-align:center;">
                    This is to certify that the following individual has been duly registered for migration as per Local Government Records.<br>
                    <span style="color:var(--navy); font-size:0.82rem;">यो प्रमाणित गरिन्छ कि तल उल्लिखित व्यक्तिको बसाइसराइ स्थानीय सरकारको अभिलेखमा दर्ता गरिएको छ।</span>
                </p>

                <div class="cert-row">
                    <div class="cert-label">Certificate No. / प्रमाणपत्र नं.</div>
                    <div class="cert-value"><asp:Label ID="lblCertNo" runat="server" Text="CERT-2081-MIG-00123" style="font-weight:700; color:var(--navy);" /></div>
                </div>
                <div class="cert-row">
                    <div class="cert-label">Issued Date / जारी मिति</div>
                    <div class="cert-value"><asp:Label ID="lblIssuedDate" runat="server" Text="2081-08-01" /></div>
                </div>
                <div class="cert-row">
                    <div class="cert-label">Full Name / पूरा नाम</div>
                    <div class="cert-value"><asp:Label ID="lblCertName" runat="server" Text="Ram Bahadur Thapa" style="font-weight:700;" /></div>
                </div>
                <div class="cert-row">
                    <div class="cert-label">Citizenship No. / नागरिकता नं.</div>
                    <div class="cert-value"><asp:Label ID="lblCertCitizenshipNo" runat="server" Text="12-01-78-12345" /></div>
                </div>
                <div class="cert-row">
                    <div class="cert-label">Father's Name / बुबाको नाम</div>
                    <div class="cert-value"><asp:Label ID="lblCertFatherName" runat="server" Text="Dhan Bahadur Thapa" /></div>
                </div>
                <div class="cert-row">
                    <div class="cert-label">Migration Type / बसाइसराइ प्रकार</div>
                    <div class="cert-value"><asp:Label ID="lblCertMigrationType" runat="server" Text="Migration In (बसाइसराइ आएको)" style="color:var(--green); font-weight:700;" /></div>
                </div>
                <div class="cert-row">
                    <div class="cert-label">Previous Address / पुरानो ठेगाना</div>
                    <div class="cert-value"><asp:Label ID="lblCertPrevAddress" runat="server" Text="Ward 3, Bhaktapur Municipality, Bagmati Province" /></div>
                </div>
                <div class="cert-row">
                    <div class="cert-label">New Address / नयाँ ठेगाना</div>
                    <div class="cert-value"><asp:Label ID="lblCertNewAddress" runat="server" Text="Ward 5, Kageshwori Manohara, Kathmandu, Bagmati Province" /></div>
                </div>
                <div class="cert-row">
                    <div class="cert-label">Date of Migration / बसाइ सरेको मिति</div>
                    <div class="cert-value"><asp:Label ID="lblCertMigrationDate" runat="server" Text="2081-07-10" /></div>
                </div>
                <div class="cert-row">
                    <div class="cert-label">Family Members / परिवार सदस्य</div>
                    <div class="cert-value"><asp:Label ID="lblCertFamilyCount" runat="server" Text="4 persons" /></div>
                </div>
                <div class="cert-row">
                    <div class="cert-label">Reason / कारण</div>
                    <div class="cert-value"><asp:Label ID="lblCertReason" runat="server" Text="Employment / रोजगारी" /></div>
                </div>

                <div style="background:#f0fdf4; border:1.5px solid #a7f3d0; border-radius:10px; padding:14px 18px; margin-top:20px; font-size:0.83rem; color:#065f46;">
                    ✅ This certificate is digitally generated and is valid for official use.<br>
                    <span style="color:var(--navy);">यो प्रमाणपत्र डिजिटल रूपमा तयार गरिएको हो र सरकारी प्रयोजनका लागि मान्य छ।</span>
                </div>
            </div>

            <div class="cert-footer">
                <div class="signature-block">
                    <div class="sig-line"></div>
                    <div class="sig-label">Ward Secretary / वडा सचिव</div>
                </div>
                <div class="cert-stamp">
                    <div>WARD</div>
                    <div>OFFICE</div>
                    <div>वडा</div>
                    <div>कार्यालय</div>
                    <div style="font-size:0.6rem; margin-top:2px;">OFFICIAL SEAL</div>
                </div>
                <div class="signature-block">
                    <div class="sig-line"></div>
                    <div class="sig-label">Ward Chairperson / वडाध्यक्ष</div>
                </div>
            </div>
        </div>
        </div>

        <div class="form-actions" style="margin-top:20px;">
            <button type="button" class="btn-print" onclick="window.print()">🖨️ Print Certificate</button>
            <asp:Button ID="btnDownloadPDF" runat="server" Text="⬇️ Download PDF" CssClass="btn-primary-custom" OnClick="BtnDownloadPDF_Click" />
            <a href="~/MigrationRegistration/Migration.aspx" runat="server" class="btn-secondary-custom">← Back</a>
        </div>
    </asp:Panel>

    </ContentTemplate>
    </asp:UpdatePanel>

</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</asp:Content>
