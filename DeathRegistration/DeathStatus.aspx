<%@ Page Title="Check Application Status" Language="C#" MasterPageFile="~/home.Master"
    AutoEventWireup="true" CodeBehind="DeathStatus.aspx.cs" Inherits="HamroWard.DeathRegistration.DeathStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Noto+Sans+Devanagari:wght@400;500;700&display=swap');
    :root { --crimson:#DC143C; --navy:#002B7F; --crimson-light:rgba(220,20,60,0.08); --navy-light:rgba(0,43,127,0.07); }
    body { font-family:'Inter','Noto Sans Devanagari',system-ui,sans-serif; background:linear-gradient(160deg,#f1f5f9 0%,#e0e7ff 100%); color:#1e2937; line-height:1.6; margin-top:50px; }
    .flag-bar { height:10px; background:repeating-linear-gradient(90deg,var(--crimson) 0,var(--crimson) 24px,var(--navy) 24px,var(--navy) 48px); }
    .page-hero { background:linear-gradient(135deg,var(--crimson) 0%,var(--navy) 100%); padding:36px 0 28px; margin-bottom:36px; position:relative; overflow:hidden; }
    .page-hero::before { content:''; position:absolute; inset:0; background:url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='0.04'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E"); }
    .hero-inner { max-width:1200px; margin:0 auto; padding:0 24px; display:flex; align-items:center; gap:20px; color:white; flex-wrap:wrap; }
    .hero-emblem { width:72px; height:72px; background:white; border-radius:50%; display:flex; align-items:center; justify-content:center; font-size:40px; box-shadow:0 8px 24px rgba(0,0,0,0.22); flex-shrink:0; }
    .hero-text h1 { font-size:1.55rem; font-weight:700; margin:0 0 2px; }
    .hero-text p { font-size:1rem; margin:0; opacity:0.88; }
    .breadcrumb-wrap { font-size:0.82rem; color:#6b7280; margin-bottom:28px; }
    .breadcrumb-wrap a { color:var(--crimson); text-decoration:none; }
    .breadcrumb-wrap a:hover { text-decoration:underline; }

    .form-wrapper { max-width:680px; margin:0 auto 60px; padding:0 16px; }
    .search-card { background:white; border-radius:20px; box-shadow:0 4px 24px rgba(0,0,0,0.07); overflow:hidden; }
    .search-body { padding:36px; }
    .search-body h2 { font-size:1.1rem; font-weight:700; color:var(--navy); margin-bottom:6px; }
    .search-body p { font-size:0.88rem; color:#6b7280; margin-bottom:28px; }
    .field-group { display:flex; flex-direction:column; gap:5px; margin-bottom:18px; }
    .field-group label { font-size:0.82rem; font-weight:600; color:#374151; }
    .field-group label .req { color:var(--crimson); margin-left:2px; }
    .field-group input, .field-group select {
        padding:10px 14px; border:1.5px solid #d1d5db; border-radius:10px;
        font-size:0.92rem; font-family:inherit; color:#1e2937;
        background:#fafafa; transition:border-color 0.2s, box-shadow 0.2s; outline:none;
    }
    .field-group input:focus, .field-group select:focus {
        border-color:var(--crimson); box-shadow:0 0 0 3px rgba(220,20,60,0.1); background:white;
    }
    .divider { text-align:center; color:#9ca3af; font-size:0.82rem; margin:14px 0; position:relative; }
    .divider::before, .divider::after { content:''; position:absolute; top:50%; width:42%; height:1px; background:#e5e7eb; }
    .divider::before { left:0; } .divider::after { right:0; }
    .search-footer { padding:20px 36px; background:#f8fafc; display:flex; justify-content:flex-end; }
    .btn { padding:11px 28px; border-radius:10px; font-size:0.93rem; font-weight:600; font-family:inherit; cursor:pointer; border:none; transition:all 0.2s; }
    .btn-primary { background:linear-gradient(135deg,var(--crimson),var(--navy)); color:white; box-shadow:0 4px 14px rgba(220,20,60,0.28); width:100%; text-align:center; }
    .btn-primary:hover { transform:translateY(-1px); box-shadow:0 6px 20px rgba(220,20,60,0.35); }

    /* Status Result Panel */
    .result-panel { margin-top:28px; border:2px solid #e8eaf0; border-radius:16px; overflow:hidden; display:none; }
    .result-header { padding:16px 24px; background:var(--navy-light); border-bottom:1px solid #e8eaf0; display:flex; align-items:center; gap:10px; }
    .result-header h3 { font-size:0.95rem; font-weight:700; color:var(--navy); margin:0; }
    .result-body { padding:20px 24px; }
    .status-row { display:flex; justify-content:space-between; padding:9px 0; border-bottom:1px solid #f1f3f8; font-size:0.88rem; }
    .status-row:last-child { border-bottom:none; }
    .status-row .key { color:#6b7280; font-weight:500; }
    .status-row .val { font-weight:600; color:#1e2937; }
    .badge-pending { background:#fefce8; color:#92400e; padding:3px 12px; border-radius:999px; font-size:0.75rem; font-weight:600; }
    .badge-approved { background:#f0fdf4; color:#166534; padding:3px 12px; border-radius:999px; font-size:0.75rem; font-weight:600; }
    .badge-rejected { background:#fef2f2; color:#991b1b; padding:3px 12px; border-radius:999px; font-size:0.75rem; font-weight:600; }

    .info-note { background:var(--navy-light); border-left:4px solid var(--navy); border-radius:8px; padding:14px 18px; font-size:0.85rem; color:#374151; margin-top:24px; }
    @media(max-width:600px){ .search-body, .search-footer { padding:20px 18px; } }
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

<main style="max-width:1200px; margin:0 auto; padding:0 16px;">
    <nav class="breadcrumb-wrap">
        <a href="/Default.aspx">Home</a> &rsaquo;
        <a href="/Service.aspx">Vital Registration</a> &rsaquo;
        <a href="/Deathregistration/Death.aspx">Death Registration</a> &rsaquo;
        <span>Check Status</span>
    </nav>

    <div class="form-wrapper">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <div class="search-card">
            <div class="search-body">
                <h2>Track Your Application / आफ्नो आवेदन ट्र्याक गर्नुहोस्</h2>
                <p>Enter your Application Reference Number or the Deceased's Citizenship Number to check the current status.</p>

                <div class="field-group">
                    <label>Application Reference Number <span class="req">*</span></label>
                    <asp:TextBox ID="txtRefNo" runat="server" placeholder="e.g. DR-2081-00123" CssClass="form-control" />
                </div>

                <div class="divider">OR / वा</div>

                <div class="field-group">
                    <label>Deceased's Citizenship Number <span class="req">*</span></label>
                    <asp:TextBox ID="txtCitizenshipNo" runat="server" placeholder="e.g. 12-34-56-78901" CssClass="form-control" />
                </div>

                <div class="field-group">
                    <label>Informant's Contact Number <span class="req">*</span></label>
                    <asp:TextBox ID="txtContactNo" runat="server" placeholder="Registered mobile number" CssClass="form-control" />
                </div>

                <!-- Status Result (shown after search) -->
                <asp:Panel ID="pnlResult" runat="server" CssClass="result-panel" style="display:none;">
                    <div class="result-header">
                        <span>📄</span>
                        <h3>Application Details / आवेदन विवरण</h3>
                    </div>
                    <div class="result-body">
                        <div class="status-row"><span class="key">Reference No.</span><span class="val"><asp:Label ID="lblRefNo" runat="server" /></span></div>
                        <div class="status-row"><span class="key">Deceased Name</span><span class="val"><asp:Label ID="lblDeceasedName" runat="server" /></span></div>
                        <div class="status-row"><span class="key">Date of Death</span><span class="val"><asp:Label ID="lblDOD" runat="server" /></span></div>
                        <div class="status-row"><span class="key">Submitted On</span><span class="val"><asp:Label ID="lblSubmitted" runat="server" /></span></div>
                        <div class="status-row"><span class="key">Current Status</span><span class="val"><asp:Label ID="lblStatus" runat="server" CssClass="badge-pending" /></span></div>
                        <div class="status-row"><span class="key">Remarks</span><span class="val"><asp:Label ID="lblRemarks" runat="server" /></span></div>
                    </div>
                </asp:Panel>

                <div class="info-note">
                    ℹ️ Processing typically takes <strong>3–7 working days</strong> after document verification. For urgent requests, please visit the Ward Office directly.
                </div>
            </div>
            <div class="search-footer">
                <asp:Button ID="btnSearch" runat="server" Text="🔍 Search Status / स्थिति खोज्नुहोस्" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
            </div>
        </div>
        </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
