<%@ Page Title="Pay Property Tax" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="PropertyTax.aspx.cs" Inherits="HamroWard.PropertyTax.PropertyTax" %>

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
        font-family: 'Inter', 'Noto Sans Devanagari', sans-serif;
        background: linear-gradient(160deg, #f1f5f9 0%, #e0e7ff 100%);
        margin-top: 50px;
    }

    /* ── Page Hero ── */
    .page-hero {
        background: linear-gradient(135deg, var(--crimson) 0%, var(--navy) 100%);
        padding: 36px 0 28px;
        margin-bottom: 36px;
        position: relative;
        overflow: hidden;
    }
    .flag-bar { height: 10px; background: repeating-linear-gradient(90deg, var(--crimson) 0, var(--crimson) 24px, var(--navy) 24px, var(--navy) 48px); }
    .hero-inner { max-width: 1200px; margin: 0 auto; padding: 0 24px; display: flex; align-items: center; gap: 20px; color: white; position: relative; }
    .hero-emblem { width: 72px; height: 72px; background: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 40px; box-shadow: 0 8px 24px rgba(0,0,0,0.22); }

    /* ── Tax Form Container ── */
    .tax-container {
        max-width: 1000px;
        margin: 0 auto 60px;
        background: white;
        border-radius: 24px;
        padding: 40px;
        box-shadow: 0 10px 40px rgba(0,0,0,0.06);
        border: 1px solid #e8eaf0;
    }

    .section-title {
        font-weight: 700;
        margin: 25px 0 20px;
        color: var(--navy);
        border-left: 5px solid var(--crimson);
        padding-left: 15px;
        font-size: 1.1rem;
        background: var(--navy-light);
        padding-top: 8px; padding-bottom: 8px;
    }

    .form-label { font-weight: 600; color: #374151; font-size: 0.9rem; margin-bottom: 8px; }
    .form-control { border-radius: 10px; padding: 12px 16px; border: 1px solid #d1d5db; background-color: #f9fafb; transition: 0.3s; }
    .form-control:focus { border-color: var(--crimson); box-shadow: 0 0 0 4px var(--crimson-light); background-color: #fff; outline: none; }

    /* ── Calculation Summary ── */
    .summary-card {
        background: #f8fafc;
        border: 2px solid var(--navy);
        border-radius: 16px;
        padding: 25px;
        margin-top: 30px;
    }
    .total-amount { font-size: 2rem; font-weight: 800; color: var(--crimson); }

    .btn-pay {
        background: linear-gradient(135deg, #2ecc71 0%, #27ae60 100%);
        color: white;
        border: none;
        padding: 18px;
        font-weight: 700;
        border-radius: 12px;
        width: 100%;
        margin-top: 30px;
        font-size: 1.1rem;
        transition: 0.3s;
        cursor: pointer;
    }
    .btn-pay:hover { transform: translateY(-3px); box-shadow: 0 8px 20px rgba(46, 204, 113, 0.3); }
</style>

<div class="flag-bar"></div>

<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">🏠</div>
        <div class="hero-text">
            <h1>Property Tax Payment &nbsp;/&nbsp; सम्पत्ति कर भुक्तानी</h1>
            <p>Integrated Revenue System &nbsp;|&nbsp; एकीकृत राजस्व प्रणाली</p>
        </div>
    </div>
</div>

<main class="container">
    <div class="tax-container">
        
        <h5 class="section-title">1. Property Search &nbsp;/&nbsp; जग्गाधनी विवरण खोज्नुहोस्</h5>
        <div class="row g-4">
            <div class="col-md-6">
                <label class="form-label">Property Owner ID (Kitta No.)</label>
                <asp:TextBox ID="txtKittaNo" runat="server" CssClass="form-control" placeholder="E.g. 402" />
            </div>
            <div class="col-md-6">
                <label class="form-label">Owner Name (नेपालीमा)</label>
                <asp:TextBox ID="txtOwnerName" runat="server" CssClass="form-control" />
            </div>
        </div>

        <h5 class="section-title">2. Valuation Details &nbsp;/&nbsp; मुल्यांकन विवरण</h5>
        <div class="row g-4">
            <div class="col-md-4">
                <label class="form-label">Total Area (Ropani/Aana)</label>
                <asp:TextBox ID="txtArea" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-4">
                <label class="form-label">Fiscal Year</label>
                <asp:DropDownList ID="ddlFiscalYear" runat="server" CssClass="form-control">
                    <asp:ListItem Text="2080/81" Value="2080" />
                    <asp:ListItem Text="2079/80" Value="2079" />
                </asp:DropDownList>
            </div>
            <div class="col-md-4">
                <label class="form-label">Property Category</label>
                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Residential" Value="R" />
                    <asp:ListItem Text="Commercial" Value="C" />
                    <asp:ListItem Text="Agricultural" Value="A" />
                </asp:DropDownList>
            </div>
        </div>

        <div class="summary-card text-center">
            <h6 class="fw-bold text-uppercase" style="letter-spacing: 1px;">Total Tax Payable</h6>
            <div class="total-amount">Rs. <asp:Label ID="lblTotalTax" runat="server" Text="0.00" /></div>
            <p class="small text-muted mt-2">Includes Fine and Arrears (if any)</p>
            
            <div class="row mt-4 justify-content-center">
                <div class="col-md-4">
                    <label class="form-label d-block">Select Gateway</label>
                    <div class="d-flex gap-2 justify-content-center">
                        <img src="https://upload.wikimedia.org/wikipedia/commons/f/ff/Esewa_logo.webp" alt="eSewa" style="height: 35px; border: 1px solid #ddd; padding: 5px; border-radius: 5px;" />
                        <img src="https://khalti.com/static/img/logo1.png" alt="Khalti" style="height: 35px; border: 1px solid #ddd; padding: 5px; border-radius: 5px;" />
                    </div>
                </div>
            </div>

            <asp:Button ID="btnPayTax" runat="server" Text="Proceed to Secure Payment" CssClass="btn-pay" />
        </div>

        <p class="text-center mt-4 small text-muted">
            <i class="fas fa-shield-alt"></i> Payments are processed through the Municipal Revenue Gateway (Sutra System).
        </p>

    </div>
</main>

</asp:Content>