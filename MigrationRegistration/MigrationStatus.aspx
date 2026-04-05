<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="MigrationStatus.aspx.cs" Inherits="HamroWard.MigrationRegistration.MigrationStatus" %>
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
        background: linear-gradient(135deg, var(--navy) 0%, #1e3a8a 100%);
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

    /* ── Search Card ── */
    .search-card {
        background: white;
        border-radius: 20px;
        border: 2px solid #e8eaf0;
        box-shadow: 0 4px 24px rgba(0,0,0,0.07);
        overflow: hidden;
        margin-bottom: 28px;
    }
    .search-card-header {
        background: linear-gradient(90deg, var(--navy-light), rgba(0,43,127,0.12));
        border-bottom: 2px solid #e8eaf0;
        padding: 18px 28px;
        display: flex; align-items: center; gap: 12px;
    }
    .search-card-header h3 { font-size: 1.05rem; font-weight: 700; color: var(--navy); margin: 0; }
    .search-card-header p { font-size: 0.78rem; color: #6b7280; margin: 0; }
    .search-card-body { padding: 32px 28px; }

    .search-group {
        display: flex; gap: 12px; align-items: flex-end; flex-wrap: wrap;
        margin-bottom: 20px;
    }
    .search-group .form-group { flex: 1; min-width: 200px; }
    .form-group { display: flex; flex-direction: column; gap: 6px; }
    .form-group label { font-size: 0.85rem; font-weight: 600; color: #374151; }
    .form-group label .nep { font-weight: 400; color: var(--navy); opacity: 0.7; font-size: 0.78rem; display: block; }
    .form-control {
        border: 1.5px solid #d1d5db; border-radius: 10px; padding: 10px 14px;
        font-size: 0.92rem; font-family: 'Inter', 'Noto Sans Devanagari', sans-serif;
        color: #1e2937; background: #f9fafb; transition: all 0.2s; width: 100%; box-sizing: border-box;
    }
    .form-control:focus {
        outline: none; border-color: var(--navy); background: white;
        box-shadow: 0 0 0 3px rgba(0,43,127,0.1);
    }

    .btn-search {
        background: linear-gradient(135deg, var(--navy), #1e3a8a);
        color: white; border: none; border-radius: 12px;
        padding: 12px 28px; font-size: 0.95rem; font-weight: 700;
        cursor: pointer; transition: all 0.2s; white-space: nowrap;
        font-family: 'Inter', sans-serif;
    }
    .btn-search:hover { transform: translateY(-2px); box-shadow: 0 8px 24px rgba(0,43,127,0.3); }

    .divider-or {
        text-align: center; position: relative; margin: 24px 0;
        font-size: 0.82rem; color: #9ca3af; font-weight: 600;
    }
    .divider-or::before, .divider-or::after {
        content: ''; position: absolute; top: 50%; width: calc(50% - 24px);
        height: 1px; background: #e8eaf0;
    }
    .divider-or::before { left: 0; }
    .divider-or::after { right: 0; }

    /* ── Status Result ── */
    .status-result {
        background: white; border-radius: 20px; border: 2px solid #e8eaf0;
        box-shadow: 0 4px 24px rgba(0,0,0,0.07); overflow: hidden; margin-bottom: 28px;
    }
    .status-result-header {
        padding: 20px 28px;
        display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 12px;
    }
    .status-result-header h3 { font-size: 1rem; font-weight: 700; color: #1e2937; margin: 0; }
    .status-pill {
        padding: 6px 18px; border-radius: 999px; font-size: 0.8rem; font-weight: 700;
    }
    .status-pill.pending { background: #fef3c7; color: #92400e; }
    .status-pill.approved { background: #d1fae5; color: #065f46; }
    .status-pill.rejected { background: #fee2e2; color: #991b1b; }
    .status-pill.processing { background: var(--navy-light); color: var(--navy); }

    /* ── Progress Tracker ── */
    .progress-tracker {
        padding: 24px 28px;
        border-top: 2px solid #e8eaf0;
    }
    .progress-track {
        display: flex; align-items: flex-start; gap: 0; position: relative;
        overflow-x: auto; padding-bottom: 8px;
    }
    .progress-step {
        display: flex; flex-direction: column; align-items: center; flex: 1; min-width: 100px;
        position: relative; text-align: center;
    }
    .progress-step:not(:last-child)::after {
        content: ''; position: absolute;
        top: 18px; left: calc(50% + 18px);
        width: calc(100% - 36px); height: 3px;
        background: #e8eaf0; z-index: 0;
    }
    .progress-step.done:not(:last-child)::after { background: #10b981; }
    .step-dot {
        width: 36px; height: 36px; border-radius: 50%; z-index: 1;
        display: flex; align-items: center; justify-content: center;
        font-size: 1rem; font-weight: 700; border: 3px solid #e8eaf0;
        background: white; margin-bottom: 8px;
    }
    .progress-step.done .step-dot { background: #10b981; border-color: #10b981; color: white; }
    .progress-step.active .step-dot { background: var(--navy); border-color: var(--navy); color: white; }
    .progress-step.pending .step-dot { background: #f9fafb; border-color: #d1d5db; color: #9ca3af; }
    .step-label { font-size: 0.74rem; color: #6b7280; font-weight: 500; line-height: 1.3; }
    .progress-step.done .step-label { color: #065f46; font-weight: 600; }
    .progress-step.active .step-label { color: var(--navy); font-weight: 700; }

    .detail-table { width: 100%; border-collapse: collapse; margin-top: 12px; }
    .detail-table td { padding: 10px 14px; font-size: 0.86rem; border-bottom: 1px solid #f1f5f9; }
    .detail-table td:first-child { font-weight: 600; color: #6b7280; width: 40%; }
    .detail-table td:last-child { color: #1e2937; }

    .btn-secondary-custom {
        background: white; color: var(--navy); border: 2px solid var(--navy);
        border-radius: 12px; padding: 11px 28px; font-size: 0.95rem; font-weight: 600;
        cursor: pointer; transition: all 0.2s; font-family: 'Inter', sans-serif;
        text-decoration: none; display: inline-block;
    }
    .btn-secondary-custom:hover { background: var(--navy); color: white; }
    .form-actions { display: flex; gap: 14px; align-items: center; flex-wrap: wrap; margin-top: 10px; }
    select.form-control {
        cursor: pointer; appearance: none;
        background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='%236b7280' viewBox='0 0 16 16'%3E%3Cpath d='M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z'/%3E%3C/svg%3E");
        background-repeat: no-repeat; background-position: right 12px center; padding-right: 36px;
    }
</style>

<div class="flag-bar"></div>

<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">🔍</div>
        <div class="hero-text">
            <h1>Check Application Status &nbsp;/&nbsp; आवेदन स्थिति जाँच्नुहोस्</h1>
            <p>Ward Office — Digital Services Portal &nbsp;|&nbsp; वडा कार्यालय — डिजिटल सेवा</p>
        </div>
    </div>
</div>

<main style="max-width:900px; margin:0 auto; padding:0 16px 60px;">

    <nav class="breadcrumb-wrap">
        <a href="~/Default.aspx" runat="server">Home</a> &rsaquo;
        <a href="/Service.aspx" runat="server">Vital Registration</a> &rsaquo;
        <a href="~/MigrationRegistration/Migration.aspx" runat="server">Migration Registration</a> &rsaquo;
        <span>Check Status</span>
    </nav>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>

    <!-- Search by Token -->
    <div class="search-card">
        <div class="search-card-header">
            <span style="font-size:1.5rem">🔎</span>
            <div>
                <h3>Search by Application Token Number</h3>
                <p>आवेदन टोकन नम्बरद्वारा खोज्नुहोस्</p>
            </div>
        </div>
        <div class="search-card-body">
            <div class="search-group">
                <div class="form-group">
                    <label>Token / Application Number <span style="font-weight:400;color:var(--navy);opacity:0.7;font-size:0.78rem;display:block;">टोकन / आवेदन नम्बर</span></label>
                    <asp:TextBox ID="txtTokenNo" runat="server" CssClass="form-control" placeholder="e.g. MIG-2081-00123" MaxLength="30" />
                </div>
                <asp:Button ID="btnSearchToken" runat="server" Text="🔍 Search" CssClass="btn-search" OnClick="btnSearchToken_Click" style="margin-top:0;" />
            </div>

            <div class="divider-or">OR / वा</div>

            <p style="font-weight:700; color:var(--navy); margin-bottom:16px; font-size:0.92rem;">Search by Personal Details &nbsp;<span style="font-weight:400; font-size:0.78rem; color:#6b7280">व्यक्तिगत विवरणद्वारा खोज्नुहोस्</span></p>

            <div style="display:grid; grid-template-columns: repeat(auto-fit, minmax(200px,1fr)); gap:20px; margin-bottom:20px;">
                <div class="form-group">
                    <label>Full Name (English) <span class="nep" style="font-weight:400;color:var(--navy);opacity:0.7;font-size:0.78rem;display:block;">पूरा नाम</span></label>
                    <asp:TextBox ID="txtSearchName" runat="server" CssClass="form-control" placeholder="Applicant's full name" MaxLength="100" />
                </div>
                <div class="form-group">
                    <label>Citizenship Number <span style="font-weight:400;color:var(--navy);opacity:0.7;font-size:0.78rem;display:block;">नागरिकता नम्बर</span></label>
                    <asp:TextBox ID="txtSearchCitizenshipNo" runat="server" CssClass="form-control" placeholder="Citizenship number" MaxLength="30" />
                </div>
                <div class="form-group">
                    <label>Application Type <span style="font-weight:400;color:var(--navy);opacity:0.7;font-size:0.78rem;display:block;">आवेदन प्रकार</span></label>
                    <asp:DropDownList ID="ddlApplicationType" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">-- All Types --</asp:ListItem>
                        <asp:ListItem Value="MigrationIn">Migration In / बसाइसराइ आएको</asp:ListItem>
                        <asp:ListItem Value="MigrationOut">Migration Out / बसाइसराइ गएको</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="form-actions">
                <asp:Button ID="btnSearchDetails" runat="server" Text="🔍 Search Application" CssClass="btn-search" OnClick="btnSearchDetails_Click" />
                <asp:Button ID="btnReset" runat="server" Text="↺ Reset" CssClass="btn-secondary-custom" OnClick="btnReset_Click" />
            </div>
        </div>
    </div>

    <!-- Status Result Panel (shown after search) -->
    <asp:Panel ID="pnlResult" runat="server" Visible="false">
        <div class="status-result">
            <div class="status-result-header" style="background: linear-gradient(90deg, #f0fdf4, #f0f9ff);">
                <div>
                    <div style="font-size:0.75rem; font-weight:600; color:#6b7280; margin-bottom:4px;">APPLICATION RESULT / आवेदन नतिजा</div>
                    <h3>
                        <asp:Label ID="lblResultName" runat="server" Text="Ram Bahadur Thapa" /> &nbsp;—&nbsp;
                        <asp:Label ID="lblResultToken" runat="server" Text="MIG-2081-00123" style="color:var(--navy);" />
                    </h3>
                </div>
                <asp:Label ID="lblStatusPill" runat="server" CssClass="status-pill processing" Text="⏳ Under Review" />
            </div>

            <!-- Progress Tracker -->
            <div class="progress-tracker">
                <p style="font-weight:700; color:var(--navy); margin:0 0 20px; font-size:0.9rem;">Application Progress / आवेदन प्रगति</p>
                <div class="progress-track">
                    <div class="progress-step done">
                        <div class="step-dot">✓</div>
                        <div class="step-label">Submitted<br>दर्ता भयो</div>
                    </div>
                    <div class="progress-step done">
                        <div class="step-dot">✓</div>
                        <div class="step-label">Document<br>Verified<br>कागजात जाँच</div>
                    </div>
                    <div class="progress-step active">
                        <div class="step-dot">3</div>
                        <div class="step-label">Under<br>Review<br>समीक्षामा</div>
                    </div>
                    <div class="progress-step pending">
                        <div class="step-dot">4</div>
                        <div class="step-label">Approved<br>स्वीकृत</div>
                    </div>
                    <div class="progress-step pending">
                        <div class="step-dot">5</div>
                        <div class="step-label">Certificate<br>Ready<br>प्रमाणपत्र</div>
                    </div>
                </div>
            </div>

            <!-- Details -->
            <div style="padding: 0 28px 28px;">
                <table class="detail-table">
                    <tr><td>Application Type / प्रकार</td><td><asp:Label ID="lblResultType" runat="server" Text="Migration In" /></td></tr>
                    <tr><td>Submitted Date / दर्ता मिति</td><td><asp:Label ID="lblResultDate" runat="server" Text="2081-07-15" /></td></tr>
                    <tr><td>Ward / वडा</td><td><asp:Label ID="lblResultWard" runat="server" Text="Ward 5" /></td></tr>
                    <tr><td>Applicant Mobile / फोन</td><td><asp:Label ID="lblResultMobile" runat="server" Text="98XXXXXXXX" /></td></tr>
                    <tr><td>Current Status / हालको स्थिति</td><td><asp:Label ID="lblResultStatus" runat="server" Text="Under Review by Ward Secretary" style="color:var(--navy); font-weight:700;" /></td></tr>
                    <tr><td>Expected Completion / अपेक्षित मिति</td><td><asp:Label ID="lblResultExpected" runat="server" Text="2081-07-22 (within 7 working days)" style="color:#065f46; font-weight:600;" /></td></tr>
                    <tr><td>Remarks / टिप्पणी</td><td><asp:Label ID="lblResultRemarks" runat="server" Text="Documents under review. Please visit ward office if contacted." /></td></tr>
                </table>
            </div>
        </div>

        <div class="form-actions">
            <a href="~/MigrationRegistration/MigrationCertificate.aspx" runat="server" class="btn-secondary-custom">📜 Get Certificate</a>
            <a href="~/MigrationRegistration/Migration.aspx" runat="server" class="btn-secondary-custom">← Back</a>
        </div>
    </asp:Panel>

    <!-- No result message -->
    <asp:Panel ID="pnlNoResult" runat="server" Visible="false">
        <div style="background:white; border-radius:20px; border:2px solid #e8eaf0; padding:48px 28px; text-align:center; box-shadow:0 4px 24px rgba(0,0,0,0.07);">
            <div style="font-size:3rem; margin-bottom:16px;">😕</div>
            <h3 style="color:var(--navy); margin-bottom:8px;">No Application Found / आवेदन फेला परेन</h3>
            <p style="color:#6b7280; font-size:0.9rem; margin-bottom:24px;">Please check the token number or personal details and try again. / टोकन नम्बर वा विवरण जाँच गरेर पुनः प्रयास गर्नुहोस्।</p>
            <a href="~/MigrationRegistration/MigrationIn.aspx" runat="server" style="color:var(--crimson); font-weight:700; text-decoration:none; font-size:0.9rem;">→ Register New Application</a>
        </div>
    </asp:Panel>

    </ContentTemplate>
    </asp:UpdatePanel>

    <div style="margin-top:20px;">
        <a href="~/MigrationRegistration/Migration.aspx" runat="server" class="btn-secondary-custom">← Back to Migration Services</a>
    </div>

</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</asp:Content>
