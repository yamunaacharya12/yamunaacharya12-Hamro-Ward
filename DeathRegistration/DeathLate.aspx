<%@ Page Title="Late Death Registration" Language="C#" MasterPageFile="~/home.Master"
    AutoEventWireup="true" CodeBehind="DeathLate.aspx.cs" Inherits="HamroWard.DeathRegistration.DeathLate" %>
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

    .form-wrapper { max-width:860px; margin:0 auto 60px; padding:0 16px; }
    .form-card { background:white; border-radius:20px; box-shadow:0 4px 24px rgba(0,0,0,0.07); overflow:hidden; }
    .form-section { padding:28px 36px; border-bottom:1px solid #f1f3f8; }
    .section-label { display:flex; align-items:center; gap:10px; font-size:0.95rem; font-weight:700; color:var(--navy); margin-bottom:20px; text-transform:uppercase; letter-spacing:0.04em; }
    .section-label span.icon { width:32px; height:32px; background:var(--navy-light); border-radius:8px; display:flex; align-items:center; justify-content:center; font-size:1rem; }
    .form-grid { display:grid; grid-template-columns:1fr 1fr; gap:18px; }
    .form-grid.cols-3 { grid-template-columns:1fr 1fr 1fr; }
    .form-grid.cols-1 { grid-template-columns:1fr; }
    .field-group { display:flex; flex-direction:column; gap:5px; }
    .field-group.span-2 { grid-column:span 2; }
    .field-group label { font-size:0.82rem; font-weight:600; color:#374151; }
    .field-group label .nep { font-weight:400; color:#6b7280; margin-left:4px; }
    .field-group label .req { color:var(--crimson); margin-left:2px; }
    .field-group input, .field-group select, .field-group textarea {
        padding:10px 14px; border:1.5px solid #d1d5db; border-radius:10px;
        font-size:0.92rem; font-family:inherit; color:#1e2937;
        background:#fafafa; transition:border-color 0.2s, box-shadow 0.2s; outline:none;
    }
    .field-group input:focus, .field-group select:focus, .field-group textarea:focus {
        border-color:var(--crimson); box-shadow:0 0 0 3px rgba(220,20,60,0.1); background:white;
    }
    .field-group textarea { resize:vertical; min-height:80px; }
    .hint { font-size:0.76rem; color:#9ca3af; margin-top:2px; }

    .warning-box { background:#fef2f2; border-left:4px solid var(--crimson); border-radius:8px; padding:14px 18px; font-size:0.85rem; color:#374151; margin-bottom:20px; }
    .info-box { background:var(--navy-light); border-left:4px solid var(--navy); border-radius:8px; padding:14px 18px; font-size:0.85rem; color:#374151; margin-bottom:20px; }

    /* Penalty tier table */
    .penalty-table { width:100%; border-collapse:collapse; border-radius:10px; overflow:hidden; font-size:0.85rem; margin-top:4px; }
    .penalty-table th { background:var(--navy); color:white; padding:10px 14px; text-align:left; font-weight:600; }
    .penalty-table td { padding:10px 14px; border-bottom:1px solid #f1f3f8; }
    .penalty-table tr:last-child td { border-bottom:none; }
    .penalty-table tr:nth-child(even) td { background:#f8fafc; }
    .penalty-amount { font-weight:700; color:var(--crimson); }

    .form-footer { padding:24px 36px; background:#f8fafc; display:flex; justify-content:flex-end; gap:12px; }
    .btn { padding:11px 28px; border-radius:10px; font-size:0.93rem; font-weight:600; font-family:inherit; cursor:pointer; border:none; transition:all 0.2s; }
    .btn-outline { background:white; border:1.5px solid #d1d5db; color:#374151; }
    .btn-outline:hover { border-color:var(--crimson); color:var(--crimson); }
    .btn-primary { background:linear-gradient(135deg,var(--crimson),var(--navy)); color:white; box-shadow:0 4px 14px rgba(220,20,60,0.28); }
    .btn-primary:hover { transform:translateY(-1px); box-shadow:0 6px 20px rgba(220,20,60,0.35); }
    @media(max-width:600px){ .form-grid, .form-grid.cols-3 { grid-template-columns:1fr; } .field-group.span-2 { grid-column:span 1; } .form-section { padding:20px 18px; } .form-footer { padding:18px; } }
</style>

<div class="flag-bar"></div>
<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">⏰</div>
        <div class="hero-text">
            <h1>Late Death Registration &nbsp;/&nbsp; ढिलो मृत्युदर्ता</h1>
            <p>Ward Office — Digital Services Portal &nbsp;|&nbsp; वडा कार्यालय — डिजिटल सेवा</p>
        </div>
    </div>
</div>

<main style="max-width:1200px; margin:0 auto; padding:0 16px;">
    <nav class="breadcrumb-wrap">
        <a href="/Default.aspx">Home</a> &rsaquo;
        <a href="/Service.aspx">Vital Registration</a> &rsaquo;
        <a href="/Deathregistration/Death.aspx">Death Registration</a> &rsaquo;
        <span>Late Registration</span>
    </nav>

    <div class="form-wrapper">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <div class="form-card">

            <!-- Section 1: Notice & Penalty -->
            <div class="form-section">
                <div class="section-label"><span class="icon">⚠️</span> Late Registration Notice / ढिलो दर्ताको सूचना</div>
                <div class="warning-box">
                    ⚠️ Death must be registered within <strong>35 days</strong>. Registration after this period attracts a penalty fee as per the Vital Registration Act.
                </div>
                <table class="penalty-table">
                    <thead>
                        <tr><th>Delay Period / ढिलाइ</th><th>Penalty / जरिवाना</th><th>Authority / अधिकार</th></tr>
                    </thead>
                    <tbody>
                        <tr><td>35 days – 6 months</td><td class="penalty-amount">NPR 500</td><td>Ward Office</td></tr>
                        <tr><td>6 months – 1 year</td><td class="penalty-amount">NPR 1,000</td><td>Ward Office</td></tr>
                        <tr><td>1 year – 3 years</td><td class="penalty-amount">NPR 2,500</td><td>Municipality</td></tr>
                        <tr><td>Above 3 years</td><td class="penalty-amount">NPR 5,000+</td><td>District Court</td></tr>
                    </tbody>
                </table>
                <div class="info-box" style="margin-top:16px; margin-bottom:0;">
                    ℹ️ Delays exceeding 3 years require a <strong>court order</strong> before registration can be processed at this office.
                </div>
            </div>

            <!-- Section 2: Deceased Info -->
            <div class="form-section">
                <div class="section-label"><span class="icon">🕊️</span> Deceased Person's Information / मृतकको विवरण</div>
                <div class="form-grid">
                    <div class="field-group">
                        <label>Full Name (English) <span class="req">*</span></label>
                        <asp:TextBox ID="txtFullNameEng" runat="server" placeholder="e.g. Ram Bahadur Thapa" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>पूरा नाम (नेपाली) <span class="req">*</span></label>
                        <asp:TextBox ID="txtFullNameNep" runat="server" placeholder="जस्तै: राम बहादुर थापा" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>Date of Birth <span class="req">*</span></label>
                        <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>Actual Date of Death <span class="req">*</span></label>
                        <asp:TextBox ID="txtDOD" runat="server" TextMode="Date" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>Age at Death <span class="req">*</span></label>
                        <asp:TextBox ID="txtAge" runat="server" placeholder="e.g. 65" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>Gender <span class="req">*</span></label>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                            <asp:ListItem Value="">-- Select --</asp:ListItem>
                            <asp:ListItem Value="Male">Male / पुरुष</asp:ListItem>
                            <asp:ListItem Value="Female">Female / महिला</asp:ListItem>
                            <asp:ListItem Value="Other">Other / अन्य</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="field-group">
                        <label>Cause of Death <span class="req">*</span></label>
                        <asp:DropDownList ID="ddlCause" runat="server" CssClass="form-control">
                            <asp:ListItem Value="">-- Select --</asp:ListItem>
                            <asp:ListItem Value="Natural">Natural / स्वाभाविक</asp:ListItem>
                            <asp:ListItem Value="Accident">Accident / दुर्घटना</asp:ListItem>
                            <asp:ListItem Value="Illness">Illness / बिमारी</asp:ListItem>
                            <asp:ListItem Value="Other">Other / अन्य</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="field-group">
                        <label>Place of Death <span class="req">*</span></label>
                        <asp:DropDownList ID="ddlPlace" runat="server" CssClass="form-control">
                            <asp:ListItem Value="">-- Select --</asp:ListItem>
                            <asp:ListItem Value="Home">Home / घर</asp:ListItem>
                            <asp:ListItem Value="Hospital">Hospital / अस्पताल</asp:ListItem>
                            <asp:ListItem Value="Road">Road / सडक</asp:ListItem>
                            <asp:ListItem Value="Other">Other / अन्य</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="field-group span-2">
                        <label>Death Location Address <span class="req">*</span></label>
                        <asp:TextBox ID="txtDeathAddress" runat="server" placeholder="Ward No., Tole, Municipality/VDC, District" CssClass="form-control" />
                    </div>
                    <div class="field-group span-2">
                        <label>Reason for Late Registration <span class="req">*</span></label>
                        <asp:TextBox ID="txtLateReason" runat="server" TextMode="MultiLine" placeholder="Explain why registration was not done within 35 days..." CssClass="form-control" />
                    </div>
                </div>
            </div>

            <!-- Section 3: Permanent Address -->
            <div class="form-section">
                <div class="section-label"><span class="icon">🏠</span> Permanent Address / स्थायी ठेगाना</div>
                <div class="form-grid cols-3">
                    <div class="field-group">
                        <label>Province <span class="req">*</span></label>
                        <asp:DropDownList ID="ddlProvince" runat="server" CssClass="form-control">
                            <asp:ListItem Value="">-- Select --</asp:ListItem>
                            <asp:ListItem Value="1">Koshi Province</asp:ListItem>
                            <asp:ListItem Value="2">Madhesh Province</asp:ListItem>
                            <asp:ListItem Value="3">Bagmati Province</asp:ListItem>
                            <asp:ListItem Value="4">Gandaki Province</asp:ListItem>
                            <asp:ListItem Value="5">Lumbini Province</asp:ListItem>
                            <asp:ListItem Value="6">Karnali Province</asp:ListItem>
                            <asp:ListItem Value="7">Sudurpashchim Province</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="field-group">
                        <label>District <span class="req">*</span></label>
                        <asp:TextBox ID="txtDistrict" runat="server" placeholder="e.g. Kathmandu" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>Municipality / VDC <span class="req">*</span></label>
                        <asp:TextBox ID="txtMunicipality" runat="server" placeholder="e.g. Kathmandu Metropolitan" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>Ward No. <span class="req">*</span></label>
                        <asp:TextBox ID="txtWardNo" runat="server" placeholder="e.g. 5" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>Tole / Street</label>
                        <asp:TextBox ID="txtTole" runat="server" placeholder="e.g. Bagbazar" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>House No.</label>
                        <asp:TextBox ID="txtHouseNo" runat="server" placeholder="e.g. 34" CssClass="form-control" />
                    </div>
                </div>
            </div>

            <!-- Section 4: Informant -->
            <div class="form-section">
                <div class="section-label"><span class="icon">👥</span> Informant Details / सूचकको विवरण</div>
                <div class="form-grid">
                    <div class="field-group">
                        <label>Informant Full Name <span class="req">*</span></label>
                        <asp:TextBox ID="txtInformantName" runat="server" placeholder="Full name" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>Relationship to Deceased <span class="req">*</span></label>
                        <asp:DropDownList ID="ddlRelationship" runat="server" CssClass="form-control">
                            <asp:ListItem Value="">-- Select --</asp:ListItem>
                            <asp:ListItem Value="Spouse">Spouse</asp:ListItem>
                            <asp:ListItem Value="Son">Son</asp:ListItem>
                            <asp:ListItem Value="Daughter">Daughter</asp:ListItem>
                            <asp:ListItem Value="Father">Father</asp:ListItem>
                            <asp:ListItem Value="Mother">Mother</asp:ListItem>
                            <asp:ListItem Value="Other">Other</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="field-group">
                        <label>Citizenship No. <span class="req">*</span></label>
                        <asp:TextBox ID="txtCitizenshipNo" runat="server" placeholder="e.g. 12-34-56-78901" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>Contact Number <span class="req">*</span></label>
                        <asp:TextBox ID="txtContact" runat="server" placeholder="e.g. 9841XXXXXX" CssClass="form-control" />
                    </div>
                </div>
            </div>

            <!-- Section 5: Documents -->
            <div class="form-section">
                <div class="section-label"><span class="icon">📎</span> Supporting Documents / संलग्न कागजात</div>
                <div class="form-grid">
                    <div class="field-group">
                        <label>Medical / Hospital Death Record <span class="req">*</span></label>
                        <asp:FileUpload ID="fuMedical" runat="server" CssClass="form-control" accept=".pdf,.jpg,.jpeg,.png" />
                        <span class="hint">Hospital death certificate or doctor's letter</span>
                    </div>
                    <div class="field-group">
                        <label>Deceased's Citizenship (if available)</label>
                        <asp:FileUpload ID="fuCitizenship" runat="server" CssClass="form-control" accept=".pdf,.jpg,.jpeg,.png" />
                        <span class="hint">PDF or image, max 2MB</span>
                    </div>
                    <div class="field-group">
                        <label>Informant's Citizenship <span class="req">*</span></label>
                        <asp:FileUpload ID="fuInformantCit" runat="server" CssClass="form-control" accept=".pdf,.jpg,.jpeg,.png" />
                        <span class="hint">PDF or image, max 2MB</span>
                    </div>
                    <div class="field-group">
                        <label>Court Order (required if delay > 3 years)</label>
                        <asp:FileUpload ID="fuCourtOrder" runat="server" CssClass="form-control" accept=".pdf,.jpg,.jpeg,.png" />
                        <span class="hint">PDF or image, max 2MB</span>
                    </div>
                    <div class="field-group">
                        <label>Ward Recommendation Letter</label>
                        <asp:FileUpload ID="fuWardLetter" runat="server" CssClass="form-control" accept=".pdf,.jpg,.jpeg,.png" />
                        <span class="hint">PDF or image, max 2MB</span>
                    </div>
                    <div class="field-group">
                        <label>Penalty Payment Receipt <span class="req">*</span></label>
                        <asp:FileUpload ID="fuPenaltyReceipt" runat="server" CssClass="form-control" accept=".pdf,.jpg,.jpeg,.png" />
                        <span class="hint">Receipt of penalty paid at ward office</span>
                    </div>
                </div>
            </div>

            <div class="form-footer">
                <asp:Button ID="btnReset" runat="server" Text="Reset / मेटाउनुहोस्" CssClass="btn btn-outline" OnClientClick="return confirm('Reset all fields?');" />
                <asp:Button ID="btnSubmit" runat="server" Text="Submit Application / आवेदन पेश गर्नुहोस्" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
            </div>

        </div>
        </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
