<%@ Page Title="Transfer / Migration" Language="C#" MasterPageFile="~/home.Master"
    AutoEventWireup="true" CodeBehind="DeathTransfer.aspx.cs" Inherits="HamroWard.DeathRegistration.DeathTransfer" %>

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
    .info-box { background:var(--navy-light); border-left:4px solid var(--navy); border-radius:8px; padding:14px 18px; font-size:0.85rem; color:#374151; margin-bottom:20px; }

    /* Transfer flow visual */
    .transfer-flow { display:flex; align-items:center; gap:12px; margin-bottom:24px; flex-wrap:wrap; }
    .transfer-node { flex:1; min-width:160px; background:var(--crimson-light); border:1.5px solid rgba(220,20,60,0.2); border-radius:12px; padding:14px 16px; text-align:center; }
    .transfer-node .node-label { font-size:0.75rem; color:#6b7280; font-weight:500; }
    .transfer-node .node-name { font-size:0.9rem; font-weight:700; color:var(--crimson); margin-top:2px; }
    .transfer-arrow { font-size:1.5rem; color:#9ca3af; flex-shrink:0; }
    .transfer-node.dest { background:var(--navy-light); border-color:rgba(0,43,127,0.2); }
    .transfer-node.dest .node-name { color:var(--navy); }

    .form-footer { padding:24px 36px; background:#f8fafc; display:flex; justify-content:flex-end; gap:12px; }
    .btn { padding:11px 28px; border-radius:10px; font-size:0.93rem; font-weight:600; font-family:inherit; cursor:pointer; border:none; transition:all 0.2s; }
    .btn-outline { background:white; border:1.5px solid #d1d5db; color:#374151; }
    .btn-outline:hover { border-color:var(--crimson); color:var(--crimson); }
    .btn-primary { background:linear-gradient(135deg,var(--crimson),var(--navy)); color:white; box-shadow:0 4px 14px rgba(220,20,60,0.28); }
    .btn-primary:hover { transform:translateY(-1px); box-shadow:0 6px 20px rgba(220,20,60,0.35); }
    @media(max-width:600px){ .form-grid, .form-grid.cols-3 { grid-template-columns:1fr; } .field-group.span-2 { grid-column:span 1; } .form-section { padding:20px 18px; } .form-footer { padding:18px; } .transfer-flow { flex-direction:column; } .transfer-arrow { transform:rotate(90deg); } }
</style>

<div class="flag-bar"></div>
<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">🏘️</div>
        <div class="hero-text">
            <h1>Transfer / Migration &nbsp;/&nbsp; बसाइसराइ स्थानान्तरण</h1>
            <p>Ward Office — Digital Services Portal &nbsp;|&nbsp; वडा कार्यालय — डिजिटल सेवा</p>
        </div>
    </div>
</div>

<main style="max-width:1200px; margin:0 auto; padding:0 16px;">
    <nav class="breadcrumb-wrap">
        <a href="/Default.aspx">Home</a> &rsaquo;
        <a href="/Service.aspx">Vital Registration</a> &rsaquo;
        <a href="/Deathregistration/Death.aspx">Death Registration</a> &rsaquo;
        <span>Transfer / Migration</span>
    </nav>

    <div class="form-wrapper">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <div class="form-card">

            <!-- Section 1: About Transfer -->
            <div class="form-section">
                <div class="section-label"><span class="icon">ℹ️</span> About This Service / सेवा बारे</div>
                <div class="info-box">
                    ℹ️ This service is for transferring a death registration record from one ward/municipality to another — for example, when the deceased's family has migrated. Both origin and destination ward details are required.
                </div>
                <div class="transfer-flow">
                    <div class="transfer-node">
                        <div class="node-label">Origin / मूल स्थान</div>
                        <div class="node-name">Previous Ward</div>
                    </div>
                    <div class="transfer-arrow">→</div>
                    <div class="transfer-node dest">
                        <div class="node-label">Destination / गन्तव्य</div>
                        <div class="node-name">This Ward Office</div>
                    </div>
                </div>
            </div>

            <!-- Section 2: Registration Record -->
            <div class="form-section">
                <div class="section-label"><span class="icon">🔎</span> Existing Registration Details / हालको दर्ता विवरण</div>
                <div class="form-grid">
                    <div class="field-group">
                        <label>Death Registration No. <span class="req">*</span></label>
                        <asp:TextBox ID="txtRegNo" runat="server" placeholder="e.g. DR-2081-00123" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>Deceased Full Name (English) <span class="req">*</span></label>
                        <asp:TextBox ID="txtDeceasedName" runat="server" placeholder="As registered" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>Date of Death <span class="req">*</span></label>
                        <asp:TextBox ID="txtDOD" runat="server" TextMode="Date" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>Year of Original Registration <span class="req">*</span></label>
                        <asp:DropDownList ID="ddlYear" runat="server" CssClass="form-control">
                            <asp:ListItem Value="">-- Select Year --</asp:ListItem>
                            <asp:ListItem Value="2081">2081 (BS)</asp:ListItem>
                            <asp:ListItem Value="2080">2080 (BS)</asp:ListItem>
                            <asp:ListItem Value="2079">2079 (BS)</asp:ListItem>
                            <asp:ListItem Value="2078">2078 (BS)</asp:ListItem>
                            <asp:ListItem Value="2077">2077 (BS)</asp:ListItem>
                            <asp:ListItem Value="older">Before 2077</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>

            <!-- Section 3: Origin Ward -->
            <div class="form-section">
                <div class="section-label"><span class="icon">📍</span> Origin Ward (Previous Registration) / मूल वडा</div>
                <div class="form-grid cols-3">
                    <div class="field-group">
                        <label>Province <span class="req">*</span></label>
                        <asp:DropDownList ID="ddlOriginProvince" runat="server" CssClass="form-control">
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
                        <asp:TextBox ID="txtOriginDistrict" runat="server" placeholder="e.g. Lalitpur" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>Municipality / VDC <span class="req">*</span></label>
                        <asp:TextBox ID="txtOriginMunicipality" runat="server" placeholder="e.g. Lalitpur Metropolitan" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>Ward No. <span class="req">*</span></label>
                        <asp:TextBox ID="txtOriginWard" runat="server" placeholder="e.g. 3" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>Ward Office Contact</label>
                        <asp:TextBox ID="txtOriginContact" runat="server" placeholder="Phone of origin ward" CssClass="form-control" />
                    </div>
                </div>
            </div>

            <!-- Section 4: Destination Ward -->
            <div class="form-section">
                <div class="section-label"><span class="icon">🏠</span> Destination / New Registration Ward / गन्तव्य वडा</div>
                <div class="form-grid cols-3">
                    <div class="field-group">
                        <label>Province <span class="req">*</span></label>
                        <asp:DropDownList ID="ddlDestProvince" runat="server" CssClass="form-control">
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
                        <asp:TextBox ID="txtDestDistrict" runat="server" placeholder="e.g. Kathmandu" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>Municipality / VDC <span class="req">*</span></label>
                        <asp:TextBox ID="txtDestMunicipality" runat="server" placeholder="e.g. Kathmandu Metropolitan" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>Ward No. <span class="req">*</span></label>
                        <asp:TextBox ID="txtDestWard" runat="server" placeholder="e.g. 5" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>Tole / Street</label>
                        <asp:TextBox ID="txtDestTole" runat="server" placeholder="e.g. Bagbazar" CssClass="form-control" />
                    </div>
                </div>
            </div>

            <!-- Section 5: Applicant -->
            <div class="form-section">
                <div class="section-label"><span class="icon">👤</span> Applicant Information / आवेदकको विवरण</div>
                <div class="form-grid">
                    <div class="field-group">
                        <label>Applicant Full Name <span class="req">*</span></label>
                        <asp:TextBox ID="txtApplicantName" runat="server" placeholder="Your full name" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>Relationship to Deceased <span class="req">*</span></label>
                        <asp:DropDownList ID="ddlRelationship" runat="server" CssClass="form-control">
                            <asp:ListItem Value="">-- Select --</asp:ListItem>
                            <asp:ListItem Value="Spouse">Spouse / पति/पत्नी</asp:ListItem>
                            <asp:ListItem Value="Son">Son / छोरा</asp:ListItem>
                            <asp:ListItem Value="Daughter">Daughter / छोरी</asp:ListItem>
                            <asp:ListItem Value="Father">Father / बाबु</asp:ListItem>
                            <asp:ListItem Value="Mother">Mother / आमा</asp:ListItem>
                            <asp:ListItem Value="Legal">Legal Representative</asp:ListItem>
                            <asp:ListItem Value="Other">Other / अन्य</asp:ListItem>
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
                    <div class="field-group span-2">
                        <label>Reason for Transfer <span class="req">*</span></label>
                        <asp:TextBox ID="txtTransferReason" runat="server" TextMode="MultiLine" placeholder="Explain the reason for transferring the death record..." CssClass="form-control" />
                    </div>
                </div>
            </div>

            <!-- Section 6: Documents -->
            <div class="form-section">
                <div class="section-label"><span class="icon">📎</span> Supporting Documents / संलग्न कागजात</div>
                <div class="form-grid">
                    <div class="field-group">
                        <label>Original Death Certificate (from origin ward) <span class="req">*</span></label>
                        <asp:FileUpload ID="fuOrigCert" runat="server" CssClass="form-control" accept=".pdf,.jpg,.jpeg,.png" />
                        <span class="hint">PDF or image, max 2MB</span>
                    </div>
                    <div class="field-group">
                        <label>Migration Certificate / Bosaai Sarai <span class="req">*</span></label>
                        <asp:FileUpload ID="fuMigration" runat="server" CssClass="form-control" accept=".pdf,.jpg,.jpeg,.png" />
                        <span class="hint">बसाइसराइ प्रमाणपत्र</span>
                    </div>
                    <div class="field-group">
                        <label>Applicant's Citizenship <span class="req">*</span></label>
                        <asp:FileUpload ID="fuCitizenship" runat="server" CssClass="form-control" accept=".pdf,.jpg,.jpeg,.png" />
                        <span class="hint">PDF or image, max 2MB</span>
                    </div>
                    <div class="field-group">
                        <label>NOC from Origin Ward (if available)</label>
                        <asp:FileUpload ID="fuNOC" runat="server" CssClass="form-control" accept=".pdf,.jpg,.jpeg,.png" />
                        <span class="hint">No Objection Certificate from previous ward</span>
                    </div>
                </div>
            </div>

            <div class="form-footer">
                <asp:Button ID="btnReset" runat="server" Text="Reset / मेटाउनुहोस्" CssClass="btn btn-outline" OnClientClick="return confirm('Reset all fields?');" />
                <asp:Button ID="btnSubmit" runat="server" Text="Submit Transfer Request / स्थानान्तरण अनुरोध पेश गर्नुहोस्" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
            </div>

        </div>
        </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
