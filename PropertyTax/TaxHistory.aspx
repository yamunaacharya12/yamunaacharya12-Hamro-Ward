<%@ Page Title="Payment History" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="TaxHistory.aspx.cs" Inherits="HamroWard.PropertyTax.TaxHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="flag-bar"></div>
<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">📂</div>
        <div class="hero-text">
            <h1>Payment History &nbsp;/&nbsp; भुक्तानी इतिहास</h1>
            <p>View and Download Receipts &nbsp;|&nbsp; पुराना रसिदहरू डाउनलोड गर्नुहोस्</p>
        </div>
    </div>
</div>

<main class="container">
    <div class="tax-container text-center">
        <div class="row g-3 justify-content-center mb-5">
            <div class="col-md-6">
                <asp:TextBox ID="txtSearchOwner" runat="server" CssClass="form-control" placeholder="Search by Owner ID or Phone" />
            </div>
            <div class="col-md-2">
                <asp:Button ID="btnSearchHistory" runat="server" Text="Search" CssClass="btn-pay m-0" />
            </div>
        </div>

        <div class="p-5 border rounded bg-light">
            <i class="fas fa-folder-open fa-3x text-muted mb-3"></i>
            <h6 class="text-muted">Enter your details above to view past tax transactions.</h6>
        </div>
    </div>
</main>
</asp:Content>