<%@ Page Title="Passport Services" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="Passport.aspx.cs" Inherits="HamroWard.Passport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<style>
    :root {
        --primary-indigo: #4f46e5;
        --success-emerald: #10b981;
        --soft-slate: #f1f5f9;
        --dark-glass: rgba(15, 23, 42, 0.03);
    }

    body { 
        background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
        font-family: 'Inter', system-ui, sans-serif;
        color: #1e293b;
    }

    /* Modern Container */
    .app-container { max-width: 1100px; margin: 40px auto; padding: 0 20px; }

    /* Glass Card Design */
    .glass-card {
        background: rgba(255, 255, 255, 0.9);
        backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 255, 255, 0.7);
        border-radius: 24px;
        box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.05);
        padding: 40px;
        margin-bottom: 30px;
    }

    /* Section Headers */
    .section-title {
        font-size: 0.85rem;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 1px;
        color: var(--primary-indigo);
        margin-bottom: 25px;
        display: flex;
        align-items: center;
    }
    .section-title::after { content: ""; flex: 1; height: 1px; background: #e2e8f0; margin-left: 15px; }

    /* Animated Radio Buttons for Application Type */
    .type-selector {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 20px;
        margin-bottom: 30px;
    }
    .type-option {
        border: 2px solid #e2e8f0;
        border-radius: 16px;
        padding: 20px;
        cursor: pointer;
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        display: flex;
        align-items: center;
        gap: 15px;
    }
    .type-option:hover { border-color: var(--primary-indigo); background: #f5f3ff; }
    .type-option.active { border-color: var(--primary-indigo); background: #eef2ff; box-shadow: 0 0 0 4px rgba(79, 70, 229, 0.1); }

    /* Input Styling */
    .custom-input {
        background: var(--soft-slate);
        border: 1px solid #e2e8f0;
        border-radius: 12px;
        padding: 12px 16px;
        width: 100%;
        transition: all 0.2s;
    }
    .custom-input:focus {
        background: #fff;
        border-color: var(--primary-indigo);
        outline: none;
        box-shadow: 0 0 0 4px rgba(79, 70, 229, 0.1);
    }

    /* Renewal Box */
    .renewal-panel {
        background: #fff9f2;
        border: 1px dashed #fdba74;
        border-radius: 16px;
        padding: 25px;
        margin-top: 20px;
        display: none; /* Controlled by JS or Server Side */
    }

    /* Sticky Summary Side */
    .summary-box {
        position: sticky;
        top: 40px;
        background: #1e293b;
        color: white;
        border-radius: 24px;
        padding: 30px;
    }

    .btn-submit {
        background: var(--primary-indigo);
        color: white;
        border: none;
        padding: 16px 32px;
        border-radius: 14px;
        font-weight: 600;
        width: 100%;
        transition: transform 0.2s, background 0.2s;
        cursor: pointer;
    }
    .btn-submit:hover { background: #4338ca; transform: translateY(-2px); }
</style>

<div class="app-container">
    <div class="row">
        <div class="col-lg-8">
            <header class="mb-5">
                <span class="badge bg-indigo-100 text-primary mb-2 px-3 py-2 rounded-pill">Official Portal</span>
                <h1 class="display-5 fw-bold text-slate-900">Passport Issuance</h1>
                <p class="text-muted fs-5">Select your application type and fill in your details.</p>
            </header>

            <div class="glass-card">
                <div class="section-title">Application Selection</div>
                <div class="type-selector">
                    <div class="type-option" onclick="toggleRenewal(false)">
                        <div class="icon-circle bg-primary text-white p-2 rounded-circle"><i class="bi bi-plus-lg"></i></div>
                        <div>
                            <div class="fw-bold">New Issue</div>
                            <div class="small text-muted">First time applicant</div>
                        </div>
                    </div>
                    <div class="type-option" onclick="toggleRenewal(true)">
                        <div class="icon-circle bg-success text-white p-2 rounded-circle"><i class="bi bi-arrow-repeat"></i></div>
                        <div>
                            <div class="fw-bold">Renewal</div>
                            <div class="small text-muted">Renew expired passport</div>
                        </div>
                    </div>
                </div>

                <div id="renewalSection" class="renewal-panel mb-4">
                    <h6 class="fw-bold text-warning-emphasis mb-3"><i class="bi bi-info-circle-fill me-2"></i>Previous Passport Details</h6>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="small fw-bold mb-1">Old Passport Number</label>
                            <asp:TextBox ID="txtOldPassport" runat="server" CssClass="custom-input" placeholder="e.g. 12345678" />
                        </div>
                        <div class="col-md-6">
                            <label class="small fw-bold mb-1">Expiry Date</label>
                            <asp:TextBox ID="txtOldExpiry" runat="server" CssClass="custom-input" TextMode="Date" />
                        </div>
                    </div>
                </div>

                <div class="section-title">Personal Credentials</div>
                <div class="row g-4">
                    <div class="col-md-6">
                        <label class="small fw-bold mb-1">National ID Number (NID)</label>
                        <asp:TextBox ID="txtNID" runat="server" CssClass="custom-input" placeholder="10-digit NID number" />
                    </div>
                    <div class="col-md-6">
                        <label class="small fw-bold mb-1">Citizenship Number</label>
                        <asp:TextBox ID="txtCit" runat="server" CssClass="custom-input" placeholder="District-XX-XXXX" />
                    </div>
                    <div class="col-md-12">
                        <label class="small fw-bold mb-1">Full Name (as per ID)</label>
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="custom-input" />
                    </div>
                </div>
            </div>

            <div class="glass-card">
                <div class="section-title">Biometric Appointment</div>
                <div class="row g-4">
                    <div class="col-md-7">
                        <label class="small fw-bold mb-1">District Post</label>
                        <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="custom-input form-select">
                            <asp:ListItem Text="Kathmandu DAO" Value="KTM" />
                            <asp:ListItem Text="Lalitpur DAO" Value="LAL" />
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-5">
                        <label class="small fw-bold mb-1">Preferred Date</label>
                        <asp:TextBox ID="txtDate" runat="server" CssClass="custom-input" TextMode="Date" />
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-4">
            <div class="summary-box shadow-lg">
                <h4 class="fw-bold mb-4">Summary</h4>
                <div class="d-flex justify-content-between mb-3 opacity-75">
                    <span>Base Fee</span>
                    <span>Rs. 5,000</span>
                </div>
                <div class="d-flex justify-content-between mb-3 opacity-75">
                    <span>Express Charge</span>
                    <span>Rs. 7,000</span>
                </div>
                <div class="d-flex justify-content-between mb-4 border-top pt-3">
                    <span class="h5 fw-bold">Total Amount</span>
                    <span class="h5 fw-bold">Rs. 12,000</span>
                </div>

                <div class="alert bg-white bg-opacity-10 border-0 text-white small mb-4">
                    <i class="bi bi-shield-check me-2"></i>
                    Your data is encrypted and sent directly to the Department of Passport.
                </div>

                <asp:Button ID="btnProcess" runat="server" Text="Confirm and Pay" CssClass="btn-submit" />
                
                <p class="text-center mt-4 mb-0 small opacity-50">
                    Terms & Conditions apply.
                </p>
            </div>
        </div>
    </div>
</div>

<script>
    function toggleRenewal(isRenewal) {
        const panel = document.getElementById('renewalSection');
        const options = document.querySelectorAll('.type-option');
        
        // Toggle Panel
        panel.style.display = isRenewal ? 'block' : 'none';
        
        // Toggle active classes for UI
        options.forEach(opt => opt.classList.remove('active'));
        event.currentTarget.classList.add('active');
    }
</script>
</asp:Content>