<%@ Page Title="Business Fee Calculator" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="BusinessCalculator.aspx.cs" Inherits="HamroWard.BusinessRegistration.BusinessCalculator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="flag-bar"></div>
<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">🧮</div>
        <div class="hero-text">
            <h1>Business Fee Calculator &nbsp;/&nbsp; व्यवसाय शुल्क गणना</h1>
            <p>Estimate Registration & License Fees &nbsp;|&nbsp; दर्ता र इजाजतपत्र शुल्क अनुमान गर्नुहोस्</p>
        </div>
    </div>
</div>

<main class="container">
    <div class="form-container">
        <div class="row g-4">
            <div class="col-md-6">
                <label class="form-label fw-bold">Authorized Capital (Rs.)</label>
                <asp:TextBox ID="txtCapCalc" runat="server" CssClass="form-control" placeholder="E.g. 100000" />
            </div>
            <div class="col-md-6">
                <label class="form-label fw-bold">Business Category</label>
                <asp:DropDownList ID="ddlCatCalc" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Small Scale (Sana Udhyog)" Value="S" />
                    <asp:ListItem Text="Medium Scale (Majhaula)" Value="M" />
                    <asp:ListItem Text="Large Scale (Thulo)" Value="L" />
                </asp:DropDownList>
            </div>
        </div>

        <div class="summary-card text-center mt-5" style="background: var(--navy-light); border: 2px dashed var(--navy); border-radius: 15px; padding: 30px;">
            <h6 class="fw-bold text-uppercase" style="color: var(--navy);">Estimated Registration Fee</h6>
            <h2 class="fw-bold" style="color: var(--crimson);">Rs. <asp:Label ID="lblBizFee" runat="server" Text="0.00" /></h2>
            <p class="small text-muted mb-0">* Fees are subject to change based on the latest Municipal Finance Act.</p>
        </div>

        <div class="text-center mt-4">
             <asp:Button ID="btnCalcBiz" runat="server" Text="Calculate Now" CssClass="btn-submit" style="max-width: 250px;" />
        </div>
    </div>
</main>
</asp:Content>