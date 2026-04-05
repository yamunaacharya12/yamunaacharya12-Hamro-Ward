<%@ Page Title="Business Renewal" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="BusinessRenewal.aspx.cs" Inherits="HamroWard.BusinessRegistration.BusinessRenewal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="flag-bar"></div>
<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">🔄</div>
        <div class="hero-text">
            <h1>Business Renewal &nbsp;/&nbsp; व्यवसाय नवीकरण</h1>
            <p>Extend your Operating License &nbsp;|&nbsp; व्यवसाय इजाजतपत्र नवीकरण</p>
        </div>
    </div>
</div>

<main class="container">
    <div class="form-container">
        <div class="alert alert-warning border-0" style="background: #fff8e6; border-left: 5px solid #ffa000 !important;">
            <i class="fas fa-clock"></i> Businesses must be renewed within **35 days** of the start of the fiscal year to avoid late fees.
        </div>
        <div class="row g-4 align-items-end">
            <div class="col-md-8">
                <label class="form-label fw-bold">Registration Number (दर्ता नं.)</label>
                <asp:TextBox ID="txtRegNo" runat="server" CssClass="form-control" placeholder="E.g. W01-2080-045" />
            </div>
            <div class="col-md-4">
                <asp:Button ID="btnSearchBiz" runat="server" Text="Fetch Details" CssClass="btn-submit m-0" style="padding: 10px;" />
            </div>
        </div>
    </div>
</main>
</asp:Content>