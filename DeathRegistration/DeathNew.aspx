<%@ Page Title="New Death Registration" Language="C#" MasterPageFile="~/home.Master"
    AutoEventWireup="true" CodeBehind="DeathNew.aspx.cs" Inherits="HamroWard.DeathRegistration.DeathNew" %>

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

    /* Form Layout */
    .form-wrapper { max-width:860px; margin:0 auto 60px; padding:0 16px; }
    .form-card { background:white; border-radius:20px; box-shadow:0 4px 24px rgba(0,0,0,0.07); overflow:hidden; }
    .form-section { padding:28px 36px; border-bottom:1px solid #f1f3f8; }
    .form-section:last-of-type { border-bottom:none; }
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
    .radio-group { display:flex; gap:20px; flex-wrap:wrap; padding-top:4px; }
    .radio-group label { display:flex; align-items:center; gap:6px; font-size:0.9rem; font-weight:400; color:#374151; cursor:pointer; }
    .radio-group input[type=radio] { accent-color:var(--crimson); width:16px; height:16px; }
    .form-footer { padding:24px 36px; background:#f8fafc; display:flex; justify-content:flex-end; gap:12px; }
    .btn { padding:11px 28px; border-radius:10px; font-size:0.93rem; font-weight:600; font-family:inherit; cursor:pointer; border:none; transition:all 0.2s; }
    .btn-outline { background:white; border:1.5px solid #d1d5db; color:#374151; }
    .btn-outline:hover { border-color:var(--crimson); color:var(--crimson); }
    .btn-primary { background:linear-gradient(135deg,var(--crimson),var(--navy)); color:white; box-shadow:0 4px 14px rgba(220,20,60,0.28); }
    .btn-primary:hover { transform:translateY(-1px); box-shadow:0 6px 20px rgba(220,20,60,0.35); }
    .hint { font-size:0.76rem; color:#9ca3af; margin-top:2px; }
    @media(max-width:600px){ .form-grid, .form-grid.cols-3 { grid-template-columns:1fr; } .field-group.span-2 { grid-column:span 1; } .form-section { padding:20px 18px; } .form-footer { padding:18px; } }
</style>

<div class="flag-bar"></div>
<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">📋</div>
        <div class="hero-text">
            <h1>New Death Registration &nbsp;/&nbsp; नयाँ मृत्युदर्ता दर्ता</h1>
            <p>Ward Office — Digital Services Portal &nbsp;|&nbsp; वडा कार्यालय — डिजिटल सेवा</p>
        </div>
    </div>
</div>

<main style="max-width:1200px; margin:0 auto; padding:0 16px;">
    <nav class="breadcrumb-wrap">
        <a href="/Default.aspx">Home</a> &rsaquo;
        <a href="/Service.aspx">Vital Registration</a> &rsaquo;
        <a href="/Deathregistration/Death.aspx">Death Registration</a> &rsaquo;
        <span>New Registration</span>
    </nav>

    <div class="form-wrapper">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <div class="form-card">

            <!-- Section 1: Deceased Information -->
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
                        <label>Date of Birth <span class="nep">(जन्म मिति)</span> <span class="req">*</span></label>
                        <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>Date of Death <span class="nep">(मृत्यु मिति)</span> <span class="req">*</span></label>
                        <asp:TextBox ID="txtDOD" runat="server" TextMode="Date" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>Age at Death <span class="nep">(मृत्युको उमेर)</span> <span class="req">*</span></label>
                        <asp:TextBox ID="txtAge" runat="server" placeholder="e.g. 72" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>Gender <span class="nep">(लिङ्ग)</span> <span class="req">*</span></label>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                            <asp:ListItem Value="">-- Select / छान्नुहोस् --</asp:ListItem>
                            <asp:ListItem Value="Male">Male / पुरुष</asp:ListItem>
                            <asp:ListItem Value="Female">Female / महिला</asp:ListItem>
                            <asp:ListItem Value="Other">Other / अन्य</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="field-group">
                        <label>Nationality <span class="nep">(नागरिकता)</span></label>
                        <asp:DropDownList ID="ddlNationality" runat="server" CssClass="form-control">
                            <asp:ListItem Value="Nepali" Selected="True">Nepali / नेपाली</asp:ListItem>
                            <asp:ListItem Value="Foreign">Foreign / विदेशी</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="field-group">
                        <label>Citizenship No. <span class="nep">(नागरिकता नं.)</span></label>
                        <asp:TextBox ID="txtCitizenshipNo" runat="server" placeholder="e.g. 12-34-56-78901" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>Cause of Death <span class="nep">(मृत्युको कारण)</span> <span class="req">*</span></label>
                        <asp:DropDownList ID="ddlCauseOfDeath" runat="server" CssClass="form-control">
                            <asp:ListItem Value="">-- Select / छान्नुहोस् --</asp:ListItem>
                            <asp:ListItem Value="Natural">Natural / स्वाभाविक</asp:ListItem>
                            <asp:ListItem Value="Accident">Accident / दुर्घटना</asp:ListItem>
                            <asp:ListItem Value="Illness">Illness / बिमारी</asp:ListItem>
                            <asp:ListItem Value="Other">Other / अन्य</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="field-group">
                        <label>Place of Death <span class="nep">(मृत्यु भएको स्थान)</span> <span class="req">*</span></label>
                        <asp:DropDownList ID="ddlPlaceOfDeath" runat="server" CssClass="form-control">
                            <asp:ListItem Value="">-- Select / छान्नुहोस् --</asp:ListItem>
                            <asp:ListItem Value="Home">Home / घर</asp:ListItem>
                            <asp:ListItem Value="Hospital">Hospital / अस्पताल</asp:ListItem>
                            <asp:ListItem Value="Road">Road / सडक</asp:ListItem>
                            <asp:ListItem Value="Other">Other / अन्य</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="field-group span-2">
                        <label>Death Location Address <span class="nep">(मृत्यु ठेगाना)</span> <span class="req">*</span></label>
                        <asp:TextBox ID="txtDeathAddress" runat="server" placeholder="Ward No., Tole, Municipality/VDC, District" CssClass="form-control" />
                    </div>
                </div>
            </div>

            <!-- Section 2: Permanent Address -->
            <div class="form-section">
                <div class="section-label"><span class="icon">🏠</span> Permanent Address / स्थायी ठेगाना</div>
                <div class="form-grid cols-3">
                    <div class="field-group">
                        <label>Province <span class="nep">(प्रदेश)</span> <span class="req">*</span></label>
                        <asp:DropDownList ID="ddlProvince" runat="server" CssClass="form-control">
                            <asp:ListItem Value="">-- Select --</asp:ListItem>
                            <asp:ListItem Value="1">Koshi Province / कोशी</asp:ListItem>
                            <asp:ListItem Value="2">Madhesh Province / मधेश</asp:ListItem>
                            <asp:ListItem Value="3">Bagmati Province / बागमती</asp:ListItem>
                            <asp:ListItem Value="4">Gandaki Province / गण्डकी</asp:ListItem>
                            <asp:ListItem Value="5">Lumbini Province / लुम्बिनी</asp:ListItem>
                            <asp:ListItem Value="6">Karnali Province / कर्णाली</asp:ListItem>
                            <asp:ListItem Value="7">Sudurpashchim Province / सुदूरपश्चिम</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="field-group">
                        <label>District <span class="nep">(जिल्ला)</span> <span class="req">*</span></label>
                        <asp:TextBox ID="txtDistrict" runat="server" placeholder="e.g. Kathmandu" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>Municipality / VDC <span class="nep">(नगरपालिका/गाउँपालिका)</span> <span class="req">*</span></label>
                        <asp:TextBox ID="txtMunicipality" runat="server" placeholder="e.g. Kathmandu Metropolitan" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>Ward No. <span class="nep">(वडा नं.)</span> <span class="req">*</span></label>
                        <asp:TextBox ID="txtWardNo" runat="server" placeholder="e.g. 5" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>Tole / Street <span class="nep">(टोल)</span></label>
                        <asp:TextBox ID="txtTole" runat="server" placeholder="e.g. Bagbazar" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>House No. <span class="nep">(घर नं.)</span></label>
                        <asp:TextBox ID="txtHouseNo" runat="server" placeholder="e.g. 34" CssClass="form-control" />
                    </div>
                </div>
            </div>

            <!-- Section 3: Family / Informant -->
            <div class="form-section">
                <div class="section-label"><span class="icon">👥</span> Informant / Applicant Details / सूचकको विवरण</div>
                <div class="form-grid">
                    <div class="field-group">
                        <label>Informant Full Name <span class="req">*</span></label>
                        <asp:TextBox ID="txtInformantName" runat="server" placeholder="Full name of informant" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>Relationship to Deceased <span class="nep">(मृतकसँग नाता)</span> <span class="req">*</span></label>
                        <asp:DropDownList ID="ddlRelationship" runat="server" CssClass="form-control">
                            <asp:ListItem Value="">-- Select / छान्नुहोस् --</asp:ListItem>
                            <asp:ListItem Value="Spouse">Spouse / पति/पत्नी</asp:ListItem>
                            <asp:ListItem Value="Son">Son / छोरा</asp:ListItem>
                            <asp:ListItem Value="Daughter">Daughter / छोरी</asp:ListItem>
                            <asp:ListItem Value="Father">Father / बाबु</asp:ListItem>
                            <asp:ListItem Value="Mother">Mother / आमा</asp:ListItem>
                            <asp:ListItem Value="Sibling">Sibling / दाजुभाइ/दिदीबहिनी</asp:ListItem>
                            <asp:ListItem Value="Other">Other / अन्य</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="field-group">
                        <label>Contact Number <span class="nep">(सम्पर्क नं.)</span> <span class="req">*</span></label>
                        <asp:TextBox ID="txtContact" runat="server" placeholder="e.g. 9841XXXXXX" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>Citizenship / ID No. <span class="nep">(नागरिकता नं.)</span></label>
                        <asp:TextBox ID="txtInformantCitNo" runat="server" placeholder="Informant's citizenship number" CssClass="form-control" />
                    </div>
                    <div class="field-group span-2">
                        <label>Informant Address <span class="nep">(सूचकको ठेगाना)</span></label>
                        <asp:TextBox ID="txtInformantAddress" runat="server" placeholder="Ward No., Tole, Municipality, District" CssClass="form-control" />
                    </div>
                </div>
            </div>

            <!-- Section 4: Supporting Documents -->
            <div class="form-section">
                <div class="section-label"><span class="icon">📎</span> Supporting Documents / संलग्न कागजातहरू</div>
                <div class="form-grid">
                    <div class="field-group">
                        <label>Medical Certificate / Death Certificate from Hospital</label>
                        <asp:FileUpload ID="fuMedical" runat="server" CssClass="form-control" accept=".pdf,.jpg,.jpeg,.png" />
                        <span class="hint">PDF or image, max 2MB</span>
                    </div>
                    <div class="field-group">
                        <label>Citizenship of Deceased <span class="nep">(मृतकको नागरिकता)</span></label>
                        <asp:FileUpload ID="fuCitizenship" runat="server" CssClass="form-control" accept=".pdf,.jpg,.jpeg,.png" />
                        <span class="hint">PDF or image, max 2MB</span>
                    </div>
                    <div class="field-group">
                        <label>Informant's Citizenship Copy <span class="nep">(सूचकको नागरिकता)</span> <span class="req">*</span></label>
                        <asp:FileUpload ID="fuInformantCit" runat="server" CssClass="form-control" accept=".pdf,.jpg,.jpeg,.png" />
                        <span class="hint">PDF or image, max 2MB</span>
                    </div>
                    <div class="field-group">
                        <label>Ward Recommendation Letter <span class="nep">(वडाको सिफारिस)</span></label>
                        <asp:FileUpload ID="fuWardLetter" runat="server" CssClass="form-control" accept=".pdf,.jpg,.jpeg,.png" />
                        <span class="hint">PDF or image, max 2MB</span>
                    </div>
                </div>
            </div>

            <!-- Section 5: Remarks -->
            <div class="form-section">
                <div class="section-label"><span class="icon">📝</span> Additional Remarks / थप टिप्पणी</div>
                <div class="form-grid cols-1">
                    <div class="field-group">
                        <label>Remarks <span class="nep">(कैफियत)</span></label>
                        <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" placeholder="Any additional information relevant to this registration..." CssClass="form-control" />
                    </div>
                </div>
            </div>

            <!-- Footer Buttons -->
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
