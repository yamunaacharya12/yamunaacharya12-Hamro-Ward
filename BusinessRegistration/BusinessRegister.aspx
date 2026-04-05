<%@ Page Title="Business Registration" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="BusinessRegister.aspx.cs" Inherits="HamroWard.BusinessRegistration.BusinessRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    :root { --crimson: #DC143C; --navy: #002B7F; --navy-light: rgba(0, 43, 127, 0.07); }
    .page-hero { background: linear-gradient(135deg, var(--crimson) 0%, var(--navy) 100%); padding: 36px 0 28px; margin-bottom: 36px; position: relative; overflow: hidden; color: white; }
    .hero-inner { max-width: 1200px; margin: 0 auto; padding: 0 24px; display: flex; align-items: center; gap: 20px; }
    .hero-emblem { width: 72px; height: 72px; background: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 40px; box-shadow: 0 8px 24px rgba(0,0,0,0.2); }
    .flag-bar { height: 10px; background: repeating-linear-gradient(90deg, var(--crimson) 0, var(--crimson) 24px, var(--navy) 24px, var(--navy) 48px); }
    .form-container { max-width: 1000px; margin: 0 auto 60px; background: white; border-radius: 24px; padding: 45px; box-shadow: 0 10px 40px rgba(0,0,0,0.06); border: 1px solid #e8eaf0; }
    .section-title { font-weight: 700; margin: 30px 0 20px; color: var(--navy); border-left: 5px solid var(--crimson); padding-left: 15px; background: var(--navy-light); padding-top: 8px; padding-bottom: 8px; }
    .form-control { border-radius: 10px; padding: 12px 16px; border: 1px solid #d1d5db; background-color: #f9fafb; }
    .btn-submit { background: linear-gradient(135deg, var(--crimson) 0%, var(--navy) 100%); color: white; border: none; padding: 18px; font-weight: 700; border-radius: 12px; width: 100%; margin-top: 40px; }
</style>

<div class="flag-bar"></div>
<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">🏢</div>
        <div class="hero-text">
            <h1>Business Registration &nbsp;/&nbsp; व्यवसाय दर्ता</h1>
            <p>New Business Application &nbsp;|&nbsp; नयाँ व्यवसाय इजाजतपत्र आवेदन</p>
        </div>
    </div>
</div>

<main class="container">
    <div class="form-container">
        <h5 class="section-title">1. Business Identity &nbsp;/&nbsp; व्यवसायको पहिचान</h5>
        <div class="row g-4">
            <div class="col-md-6">
                <label class="form-label fw-bold">Business Name (In English)</label>
                <asp:TextBox ID="txtBizNameEng" runat="server" CssClass="form-control" placeholder="E.g. Himalayan Coffee Hub" />
            </div>
            <div class="col-md-6">
                <label class="form-label fw-bold">व्यवसायको नाम (नेपालीमा)</label>
                <asp:TextBox ID="txtBizNameNep" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-6">
                <label class="form-label fw-bold">Type of Business</label>
                <asp:DropDownList ID="ddlBizType" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Retail/Wholesale" Value="RW" />
                    <asp:ListItem Text="Service Provider" Value="SP" />
                    <asp:ListItem Text="Manufacturing" Value="MF" />
                    <asp:ListItem Text="Hotel/Tourism" Value="HT" />
                </asp:DropDownList>
            </div>
            <div class="col-md-6">
                <label class="form-label fw-bold">Estimated Capital (Rs.)</label>
                <asp:TextBox ID="txtCapital" runat="server" CssClass="form-control" placeholder="E.g. 500,000" />
            </div>
        </div>

        <h5 class="section-title">2. Location & Contact &nbsp;/&nbsp; स्थान र सम्पर्क</h5>
        <div class="row g-4">
            <div class="col-md-4">
                <label class="form-label fw-bold">Ward No.</label>
                <asp:TextBox ID="txtWard" runat="server" CssClass="form-control" Text="01" ReadOnly="true" />
            </div>
            <div class="col-md-8">
                <label class="form-label fw-bold">Tole / Street Name</label>
                <asp:TextBox ID="txtTole" runat="server" CssClass="form-control" />
            </div>
        </div>

        <h5 class="section-title">3. Document Upload &nbsp;/&nbsp; प्रमाणिकरण कागजातहरू</h5>
        <div class="row g-4">
            <div class="col-md-6">
                <div class="p-3 border rounded bg-light">
                    <p class="small fw-bold mb-2">Citizenship of Proprietor</p>
                    <asp:FileUpload ID="fuPropCit" runat="server" CssClass="form-control" />
                </div>
            </div>
            <div class="col-md-6">
                <div class="p-3 border rounded bg-light">
                    <p class="small fw-bold mb-2">Rent Agreement (if applicable)</p>
                    <asp:FileUpload ID="fuRent" runat="server" CssClass="form-control" />
                </div>
            </div>
        </div>

        <asp:Button ID="btnRegisterBiz" runat="server" Text="Register Business & Apply for License" CssClass="btn-submit" />
    </div>
</main>
</asp:Content>