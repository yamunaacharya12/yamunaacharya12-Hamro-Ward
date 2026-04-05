<%@ Page Title="Business Closure" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="BusinessClosure.aspx.cs" Inherits="HamroWard.BusinessRegistration.BusinessClosure" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="flag-bar"></div>
<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">🛑</div>
        <div class="hero-text">
            <h1>Business Closure &nbsp;/&nbsp; व्यवसाय खारेजी</h1>
            <p>Close Business Records Permanently &nbsp;|&nbsp; व्यवसाय सञ्चालन लगत खारेजी</p>
        </div>
    </div>
</div>

<main class="container">
    <div class="form-container">
        <h5 class="section-title">Reason for Closure</h5>
        <asp:TextBox ID="txtReason" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="Explain the reason for closing the business..." />
        
        <h5 class="section-title">No-Dues Verification</h5>
        <div class="p-4 rounded border text-center bg-light">
            <i class="fas fa-check-circle text-success mb-2"></i>
            <p class="mb-0">Please ensure all pending taxes are cleared before applying for closure.</p>
        </div>
        
        <asp:Button ID="btnCloseBiz" runat="server" Text="Request Closure Recommendation" CssClass="btn-submit" />
    </div>
</main>
</asp:Content>