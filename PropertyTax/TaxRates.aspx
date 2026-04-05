<%@ Page Title="Tax Rates" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="TaxRates.aspx.cs" Inherits="HamroWard.PropertyTax.TaxRates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="flag-bar"></div>
<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">📊</div>
        <div class="hero-text">
            <h1>Tax Rates & Slabs &nbsp;/&nbsp; करको दर र स्ल्याब</h1>
            <p>Current Fiscal Year Rates &nbsp;|&nbsp; चालू आर्थिक वर्षको करको दरहरू</p>
        </div>
    </div>
</div>

<main class="container">
    <div class="tax-container">
        <h5 class="section-title">Residential Property Rates</h5>
        <table class="table table-hover border">
            <thead style="background: var(--navy); color: white;">
                <tr>
                    <th>Property Valuation (Range)</th>
                    <th>Tax Rate (%)</th>
                    <th>Fixed Charge</th>
                </tr>
            </thead>
            <tbody>
                <tr><td>Up to 10 Lakhs</td><td>0.01%</td><td>Rs. 100</td></tr>
                <tr><td>10 Lakhs - 50 Lakhs</td><td>0.05%</td><td>Rs. 500</td></tr>
                <tr><td>Above 50 Lakhs</td><td>0.10%</td><td>Rs. 1,000</td></tr>
            </tbody>
        </table>

        <div class="alert alert-warning mt-4">
            <i class="fas fa-exclamation-circle"></i> <strong>Commercial Note:</strong> Business properties and rental buildings attract a 15% additional surcharge on the base rate.
        </div>
    </div>
</main>
</asp:Content>