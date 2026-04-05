<%@ Page Title="Check Citizenship Status" Language="C#" MasterPageFile="~/home.Master"
    AutoEventWireup="true" CodeBehind="CitizenshipStatus.aspx.cs" Inherits="HamroWard.CitizenshipRegistration.CitizenshipStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Noto+Sans+Devanagari:wght@400;500;700&display=swap');
    :root { --crimson: #DC143C; --navy: #002B7F; --crimson-light: rgba(220,20,60,0.08); --navy-light: rgba(0,43,127,0.07); }
    body { font-family: 'Inter','Noto Sans Devanagari',system-ui,sans-serif; background: linear-gradient(160deg,#f1f5f9 0%,#e0e7ff 100%); color: #1e2937; line-height: 1.6; margin-top: 50px; }
    .page-hero { background: linear-gradient(135deg,var(--crimson) 0%,var(--navy) 100%); padding: 36px 0 28px; margin-bottom: 36px; position: relative; overflow: hidden; }
    .page-hero::before { content:''; position:absolute; inset:0; background:url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='0.04'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E"); }
    .flag-bar { height:10px; background:repeating-linear-gradient(90deg,var(--crimson) 0,var(--crimson) 24px,var(--navy) 24px,var(--navy) 48px); }
    .hero-inner { max-width:1200px; margin:0 auto; padding:0 24px; display:flex; align-items:center; gap:20px; color:white; flex-wrap:wrap; }
    .hero-emblem { width:72px; height:72px; background:white; border-radius:50%; display:flex; align-items:center; justify-content:center; font-size:40px; box-shadow:0 8px 24px rgba(0,0,0,0.22); flex-shrink:0; }
    .hero-text h1 { font-size:1.55rem; font-weight:700; margin:0 0 2px; }
    .hero-text p  { font-size:1rem; margin:0; opacity:0.88; }
    .breadcrumb-wrap { font-size:0.82rem; color:#6b7280; margin-bottom:22px; }
    .breadcrumb-wrap a { color:var(--crimson); text-decoration:none; }
    .breadcrumb-wrap a:hover { text-decoration:underline; }
    .custom-card { background:white; border:1.5px solid #e8eaf0; border-radius:20px; box-shadow:0 8px 32px rgba(0,0,0,0.07); margin-bottom:1.5rem; overflow:hidden; }
    .card-header-custom { padding:1.2rem 1.6rem; border-bottom:2px solid #f3f4f6; background:linear-gradient(90deg,var(--crimson-light),var(--navy-light)); display:flex; align-items:center; gap:12px; }
    .card-header-custom h5 { margin:0; font-size:1.05rem; font-weight:700; color:#1e2937; display:flex; align-items:center; gap:10px; }
    .card-header-custom h5::before { content:''; display:inline-block; width:5px; height:22px; background:linear-gradient(to bottom,var(--crimson),var(--navy)); border-radius:4px; }
    .card-body-custom { padding:1.5rem 1.6rem; }
    .form-control { border:2px solid #e5e7eb !important; border-radius:12px !important; padding:11px 15px !important; font-size:0.97rem !important; transition:border-color 0.2s,box-shadow 0.2s !important; background-color:#fafafa !important; }
    .form-control:focus { border-color:var(--crimson) !important; box-shadow:0 0 0 4px rgba(220,20,60,0.13) !important; background-color:white !important; }
    .form-label { font-weight:600 !important; color:#374151 !important; font-size:0.84rem !important; margin-bottom:6px !important; }
    .btn-submit-main { background:linear-gradient(to right,var(--crimson),var(--navy)); color:white !important; border:none; border-radius:50px; padding:13px 40px; font-size:1.05rem; font-weight:700; box-shadow:0 8px 22px rgba(220,20,60,0.30); transition:all 0.25s; cursor:pointer; }
    .btn-submit-main:hover { transform:translateY(-2px); box-shadow:0 12px 30px rgba(220,20,60,0.38); color:white !important; }
    .status-badge { display:inline-block; padding:6px 18px; border-radius:999px; font-weight:700; font-size:0.9rem; }
    .status-pending   { background:#fefce8; color:#92400e; border:2px solid #facc15; }
    .status-approved  { background:#f0fdf4; color:#166534; border:2px solid #86efac; }
    .status-rejected  { background:#fef2f2; color:#991b1b; border:2px solid #fca5a5; }
    .status-processing{ background:#eff6ff; color:#1e40af; border:2px solid #93c5fd; }
    .timeline { position:relative; padding-left:28px; }
    .timeline::before { content:''; position:absolute; left:8px; top:0; bottom:0; width:2px; background:#e5e7eb; }
    .timeline-item { position:relative; margin-bottom:18px; }
    .timeline-dot { position:absolute; left:-24px; top:4px; width:14px; height:14px; border-radius:50%; background:var(--crimson); border:2px solid white; box-shadow:0 0 0 2px var(--crimson); }
    .timeline-dot.inactive { background:#d1d5db; box-shadow:0 0 0 2px #d1d5db; }
    .result-panel { display:none; }
</style>

<div class="flag-bar"></div>
<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">🔍</div>
        <div class="hero-text">
            <h1>Check Application Status &nbsp;/&nbsp; आवेदन स्थिति जाँच्नुहोस्</h1>
            <p>HamroWard Digital Services &nbsp;·&nbsp; Department of Civil Registration</p>
        </div>
    </div>
</div>

<main class="container-xl py-4">
    <nav class="breadcrumb-wrap mb-4">
        <a href="/Default.aspx">Home</a>
        <i class="bi bi-chevron-right mx-2" style="font-size:0.7rem;"></i>
        <a href="/CitizenshipRegistration/Citizenship.aspx">Citizenship Registration</a>
        <i class="bi bi-chevron-right mx-2" style="font-size:0.7rem;"></i>
        <span class="text-dark fw-medium">Check Status</span>
    </nav>

    <div class="row g-4 justify-content-center">
        <div class="col-lg-7">

            <!-- Search Card -->
            <div class="custom-card">
                <div class="card-header-custom">
                    <h5>Enter Application Details &nbsp;/&nbsp; आवेदन विवरण दिनुहोस्</h5>
                </div>
                <div class="card-body-custom">
                    <div class="mb-3">
                        <label class="form-label">Token / Application Number <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtTokenNo" runat="server" CssClass="form-control" placeholder="e.g. CIT-2081-00123" />
                    </div>
                    <div class="mb-4">
                        <label class="form-label">Applicant's Date of Birth (A.D.) <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" TextMode="Date" />
                        <div class="form-text" style="font-size:0.78rem;color:#9ca3af;">Used to verify your identity</div>
                    </div>
                    <asp:Label ID="lblError" runat="server" CssClass="text-danger small d-block mb-3" Visible="false" />
                    <div class="d-flex justify-content-end">
                        <asp:Button ID="btnCheck" runat="server" Text="Check Status →"
                            CssClass="btn btn-submit-main" OnClick="btnCheck_Click" />
                    </div>
                </div>
            </div>

            <!-- Result Panel -->
            <asp:Panel ID="pnlResult" runat="server" Visible="false">
                <div class="custom-card">
                    <div class="card-header-custom">
                        <h5>Application Status &nbsp;/&nbsp; आवेदनको स्थिति</h5>
                    </div>
                    <div class="card-body-custom">
                        <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-3">
                            <div>
                                <div class="text-muted small">Token Number</div>
                                <div class="fw-bold fs-5"><asp:Label ID="lblTokenDisplay" runat="server" /></div>
                            </div>
                            <asp:Label ID="lblStatusBadge" runat="server" />
                        </div>

                        <div class="row g-3 mb-4">
                            <div class="col-md-6">
                                <div class="text-muted small">Applicant Name</div>
                                <div class="fw-semibold"><asp:Label ID="lblApplicantName" runat="server" /></div>
                            </div>
                            <div class="col-md-6">
                                <div class="text-muted small">Service Type</div>
                                <div class="fw-semibold"><asp:Label ID="lblServiceType" runat="server" /></div>
                            </div>
                            <div class="col-md-6">
                                <div class="text-muted small">Submitted Date</div>
                                <div class="fw-semibold"><asp:Label ID="lblSubmittedDate" runat="server" /></div>
                            </div>
                            <div class="col-md-6">
                                <div class="text-muted small">Last Updated</div>
                                <div class="fw-semibold"><asp:Label ID="lblLastUpdated" runat="server" /></div>
                            </div>
                        </div>

                        <div class="timeline">
                            <div class="timeline-item">
                                <div class="timeline-dot" id="dot1"></div>
                                <div class="fw-semibold small">Application Submitted</div>
                                <div class="text-muted" style="font-size:0.8rem;"><asp:Label ID="lblStep1Date" runat="server" /></div>
                            </div>
                            <div class="timeline-item">
                                <asp:Label ID="lblDot2" runat="server" CssClass="timeline-dot" />
                                <div class="fw-semibold small">Under Review by Ward Office</div>
                                <div class="text-muted" style="font-size:0.8rem;"><asp:Label ID="lblStep2Date" runat="server" /></div>
                            </div>
                            <div class="timeline-item">
                                <asp:Label ID="lblDot3" runat="server" CssClass="timeline-dot inactive" />
                                <div class="fw-semibold small">Forwarded to CDO</div>
                                <div class="text-muted" style="font-size:0.8rem;"><asp:Label ID="lblStep3Date" runat="server" /></div>
                            </div>
                            <div class="timeline-item">
                                <asp:Label ID="lblDot4" runat="server" CssClass="timeline-dot inactive" />
                                <div class="fw-semibold small">Ready for Collection</div>
                                <div class="text-muted" style="font-size:0.8rem;"><asp:Label ID="lblStep4Date" runat="server" /></div>
                            </div>
                        </div>

                        <div class="mt-3 p-3" style="background:#f9fafb;border-radius:12px;border:1.5px solid #e5e7eb;">
                            <div class="text-muted small">Remarks</div>
                            <div class="fw-medium"><asp:Label ID="lblRemarks" runat="server" /></div>
                        </div>
                    </div>
                </div>
            </asp:Panel>

        </div>

        <!-- Sidebar -->
        <div class="col-lg-4">
            <div class="alert border-0 d-flex gap-3 p-4 mb-4"
                 style="background:rgba(220,20,60,0.07);color:#7f1d1d;border-radius:16px;">
                <i class="bi bi-info-circle-fill h4 mb-0" style="color:var(--crimson);"></i>
                <div>
                    <h6 class="fw-bold">How to Check</h6>
                    <p class="small mb-0">Enter the token number from your application receipt and your date of birth to track your application.</p>
                </div>
            </div>
            <div class="custom-card">
                <div class="card-header-custom"><h5>Status Guide</h5></div>
                <div class="card-body-custom d-flex flex-column gap-2">
                    <div><span class="status-badge status-pending">Pending</span> <span class="small ms-2 text-muted">Awaiting review</span></div>
                    <div><span class="status-badge status-processing">Processing</span> <span class="small ms-2 text-muted">Under review</span></div>
                    <div><span class="status-badge status-approved">Approved</span> <span class="small ms-2 text-muted">Ready to collect</span></div>
                    <div><span class="status-badge status-rejected">Rejected</span> <span class="small ms-2 text-muted">See remarks</span></div>
                </div>
            </div>
        </div>
    </div>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
