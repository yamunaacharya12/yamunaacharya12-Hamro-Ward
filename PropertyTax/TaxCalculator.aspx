<%@ Page Title="Tax Calculator" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="TaxCalculator.aspx.cs" Inherits="HamroWard.PropertyTax.TaxCalculator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="flag-bar"></div>
<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">🧮</div>
        <div class="hero-text">
            <h1>Tax Calculator &nbsp;/&nbsp; कर गणना मेसिन</h1>
            <p>Estimate your Property Tax &nbsp;|&nbsp; आफ्नो अनुमानित कर हिसाब गर्नुहोस्</p>
        </div>
    </div>
</div>

<main class="container">
    <div class="tax-container">
        <div class="row g-4">
            <div class="col-md-6">
                <label class="form-label">Land Valuation (Government Rate)</label>
                <asp:TextBox ID="txtValuation" runat="server" CssClass="form-control" placeholder="Per Ropani/Aana" />
            </div>
            <div class="col-md-6">
                <label class="form-label">Built-up Area (Sq. Ft.)</label>
                <asp:TextBox ID="txtBuiltArea" runat="server" CssClass="form-control" placeholder="0 if vacant land" />
            </div>
            <div class="col-md-12">
                <div class="p-4 mt-3 text-center border-crimson" style="border: 2px dashed var(--crimson); border-radius: 15px; background: var(--crimson-light);">
                    <span class="text-uppercase fw-bold small">Estimated Tax Amount</span>
                    <h2 class="fw-bold mt-2" style="color: var(--crimson);">Rs. 0.00</h2>
                </div>
            </div>
        </div>
        
        <div class="text-center mt-4">
            <button type="button" class="btn-pay" style="max-width: 300px;">Calculate Now</button>
        </div>
    </div>
</main>
</asp:Content>