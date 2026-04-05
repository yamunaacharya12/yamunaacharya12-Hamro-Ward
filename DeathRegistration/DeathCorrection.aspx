<%@ Page Title="Correction of Details" Language="C#" MasterPageFile="~/home.Master"
    AutoEventWireup="true" CodeBehind="DeathCorrection.aspx.cs" Inherits="HamroWard.DeathRegistration.DeathCorrection" %>

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

    /* Before / After Correction table style */
    .correction-table { width:100%; border-collapse:collapse; margin-top:8px; }
    .correction-table th { background:var(--navy-light); color:var(--navy); font-size:0.8rem; font-weight:700; padding:10px 14px; text-align:left; }
    .correction-table td { padding:10px 14px; border-bottom:1px solid #f1f3f8; vertical-align:top; }
    .correction-table td input, .correction-table td select {
        width:100%; padding:8px 12px; border:1.5px solid #d1d5db; border-radius:8px;
        font-size:0.88rem; font-family:inherit; color:#1e2937; background:#fafafa; outline:none;
    }
    .correction-table td input:focus, .correction-table td select:focus {
        border-color:var(--crimson); box-shadow:0 0 0 3px rgba(220,20,60,0.1); background:white;
    }
    .correction-table .field-name { font-size:0.85rem; font-weight:600; color:#374151; }
    .add-row-btn { margin-top:10px; background:none; border:1.5px dashed #d1d5db; border-radius:8px; padding:8px 18px; color:#6b7280; font-size:0.85rem; cursor:pointer; font-family:inherit; transition:all 0.2s; }
    .add-row-btn:hover { border-color:var(--crimson); color:var(--crimson); }

    .warning-box { background:#fefce8; border-left:4px solid #f59e0b; border-radius:8px; padding:14px 18px; font-size:0.85rem; color:#374151; margin-bottom:20px; }
    .form-footer { padding:24px 36px; background:#f8fafc; display:flex; justify-content:flex-end; gap:12px; }
    .btn { padding:11px 28px; border-radius:10px; font-size:0.93rem; font-weight:600; font-family:inherit; cursor:pointer; border:none; transition:all 0.2s; }
    .btn-outline { background:white; border:1.5px solid #d1d5db; color:#374151; }
    .btn-outline:hover { border-color:var(--crimson); color:var(--crimson); }
    .btn-primary { background:linear-gradient(135deg,var(--crimson),var(--navy)); color:white; box-shadow:0 4px 14px rgba(220,20,60,0.28); }
    .btn-primary:hover { transform:translateY(-1px); box-shadow:0 6px 20px rgba(220,20,60,0.35); }
    @media(max-width:600px){ .form-grid { grid-template-columns:1fr; } .field-group.span-2 { grid-column:span 1; } .form-section { padding:20px 18px; } .form-footer { padding:18px; } }
</style>

<div class="flag-bar"></div>
<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">✏️</div>
        <div class="hero-text">
            <h1>Correction of Details &nbsp;/&nbsp; विवरण सच्याउनुहोस्</h1>
            <p>Ward Office — Digital Services Portal &nbsp;|&nbsp; वडा कार्यालय — डिजिटल सेवा</p>
        </div>
    </div>
</div>

<main style="max-width:1200px; margin:0 auto; padding:0 16px;">
    <nav class="breadcrumb-wrap">
        <a href="/Default.aspx">Home</a> &rsaquo;
        <a href="/Service.aspx">Vital Registration</a> &rsaquo;
        <a href="/Deathregistration/Death.aspx">Death Registration</a> &rsaquo;
        <span>Correction of Details</span>
    </nav>

    <div class="form-wrapper">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <div class="form-card">

            <!-- Section 1: Identify Record -->
            <div class="form-section">
                <div class="section-label"><span class="icon">🔎</span> Identify Registration Record / दर्ता अभिलेख</div>
                <div class="warning-box">
                    ⚠️ Corrections require supporting documents. Minor corrections (spelling) are processed at ward level. Major corrections (date, name) may require court order.
                </div>
                <div class="form-grid">
                    <div class="field-group">
                        <label>Death Registration No. <span class="req">*</span></label>
                        <asp:TextBox ID="txtRegNo" runat="server" placeholder="e.g. DR-2081-00123" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>Deceased Full Name (as registered) <span class="req">*</span></label>
                        <asp:TextBox ID="txtDeceasedName" runat="server" placeholder="Exact name on record" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>Date of Death (as registered) <span class="req">*</span></label>
                        <asp:TextBox ID="txtDOD" runat="server" TextMode="Date" CssClass="form-control" />
                    </div>
                    <div class="field-group">
                        <label>Ward of Registration <span class="req">*</span></label>
                        <asp:TextBox ID="txtWardNo" runat="server" placeholder="e.g. Ward No. 5" CssClass="form-control" />
                    </div>
                </div>
            </div>

            <!-- Section 2: Correction Details -->
            <div class="form-section">
                <div class="section-label"><span class="icon">✏️</span> Correction Details / सच्याउनु पर्ने विवरण</div>
                <table class="correction-table">
                    <thead>
                        <tr>
                            <th style="width:25%">Field / क्षेत्र</th>
                            <th style="width:35%">Current (Incorrect) Value / हालको गलत विवरण</th>
                            <th style="width:35%">Correct Value / सही विवरण</th>
                        </tr>
                    </thead>
                    <tbody id="correctionBody">
                        <tr>
                            <td>
                                <select name="corrField1" class="form-control">
                                    <option value="">-- Select Field --</option>
                                    <option>Full Name (English)</option>
                                    <option>Full Name (Nepali)</option>
                                    <option>Date of Birth</option>
                                    <option>Date of Death</option>
                                    <option>Age at Death</option>
                                    <option>Gender</option>
                                    <option>Cause of Death</option>
                                    <option>Father's Name</option>
                                    <option>Mother's Name</option>
                                    <option>Spouse Name</option>
                                    <option>Address / Ward No.</option>
                                    <option>Other</option>
                                </select>
                            </td>
                            <td><input type="text" placeholder="Current incorrect value" /></td>
                            <td><input type="text" placeholder="Correct value" /></td>
                        </tr>
                        <tr>
                            <td>
                                <select name="corrField2" class="form-control">
                                    <option value="">-- Select Field --</option>
                                    <option>Full Name (English)</option>
                                    <option>Full Name (Nepali)</option>
                                    <option>Date of Birth</option>
                                    <option>Date of Death</option>
                                    <option>Age at Death</option>
                                    <option>Gender</option>
                                    <option>Cause of Death</option>
                                    <option>Father's Name</option>
                                    <option>Mother's Name</option>
                                    <option>Spouse Name</option>
                                    <option>Address / Ward No.</option>
                                    <option>Other</option>
                                </select>
                            </td>
                            <td><input type="text" placeholder="Current incorrect value" /></td>
                            <td><input type="text" placeholder="Correct value" /></td>
                        </tr>
                    </tbody>
                </table>

                <div class="field-group" style="margin-top:18px;">
                    <label>Reason for Correction <span class="nep">(सच्याउनु पर्नाको कारण)</span> <span class="req">*</span></label>
                    <asp:TextBox ID="txtReason" runat="server" TextMode="MultiLine" placeholder="Explain why this correction is needed..." CssClass="form-control" />
                </div>
            </div>

            <!-- Section 3: Applicant -->
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
                </div>
            </div>

            <!-- Section 4: Documents -->
            <div class="form-section">
                <div class="section-label"><span class="icon">📎</span> Supporting Documents / संलग्न कागजात</div>
                <div class="form-grid">
                    <div class="field-group">
                        <label>Applicant Citizenship <span class="req">*</span></label>
                        <asp:FileUpload ID="fuCitizenship" runat="server" CssClass="form-control" accept=".pdf,.jpg,.jpeg,.png" />
                        <span class="hint">PDF or image, max 2MB</span>
                    </div>
                    <div class="field-group">
                        <label>Original Death Registration Certificate</label>
                        <asp:FileUpload ID="fuOrigCert" runat="server" CssClass="form-control" accept=".pdf,.jpg,.jpeg,.png" />
                        <span class="hint">PDF or image, max 2MB</span>
                    </div>
                    <div class="field-group">
                        <label>Proof of Correct Information <span class="req">*</span></label>
                        <asp:FileUpload ID="fuProof" runat="server" CssClass="form-control" accept=".pdf,.jpg,.jpeg,.png" />
                        <span class="hint">Hospital record, citizenship, school certificate, etc.</span>
                    </div>
                    <div class="field-group">
                        <label>Court Order (if required for major correction)</label>
                        <asp:FileUpload ID="fuCourtOrder" runat="server" CssClass="form-control" accept=".pdf,.jpg,.jpeg,.png" />
                        <span class="hint">PDF or image, max 2MB</span>
                    </div>
                </div>
            </div>

            <div class="form-footer">
                <asp:Button ID="btnReset" runat="server" Text="Reset / मेटाउनुहोस्" CssClass="btn btn-outline" OnClientClick="return confirm('Reset all fields?');" />
                <asp:Button ID="btnSubmit" runat="server" Text="Submit Correction / सच्याउने अनुरोध पेश गर्नुहोस्" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
            </div>

        </div>
        </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
