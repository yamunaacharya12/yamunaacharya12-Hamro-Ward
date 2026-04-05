<%@ Page Title="Tax Clearance Certificate" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="TaxClearance.aspx.cs" Inherits="HamroWard.PropertyTax.TaxClearance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="flag-bar"></div>
<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">📜</div>
        <div class="hero-text">
            <h1>Tax Clearance &nbsp;/&nbsp; कर चुक्ता प्रमाणपत्र</h1>
            <p>Request Official Clearance Letter &nbsp;|&nbsp; कर चुक्ता सिफारिस लिनुहोस्</p>
        </div>
    </div>
</div>

<main class="container">
    <div class="tax-container">
        <div class="alert alert-info border-0 shadow-sm mb-4" style="border-left: 5px solid var(--navy) !important;">
            <i class="fas fa-info-circle"></i> Clearance is only issued if all dues up to the current Fiscal Year are paid.
        </div>

        <h5 class="section-title">Verify Payment History</h5>
        <div class="row g-4 align-items-end">
            <div class="col-md-8">
                <label class="form-label">Payment Receipt Number / Transaction ID</label>
                <asp:TextBox ID="txtReceipt" runat="server" CssClass="form-control" placeholder="E.g. HW-PAY-2080-XYZ" />
            </div>
            <div class="col-md-4">
                <asp:Button ID="btnVerify" runat="server" Text="Check Records" CssClass="btn-pay m-0" style="padding: 12px !important;" />
            </div>
        </div>

        <div class="mt-5 p-5 text-center bg-light border-rounded" style="border-radius: 20px;">
            <i class="fas fa-file-invoice-dollar fa-3x mb-3 text-muted opacity-50"></i>
            <p class="text-muted">Enter your last payment ID to generate the digital clearance certificate.</p>
        </div>
    </div>
</main>
</asp:Content>