<%@ Page Title="Tax Rebate Application" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="TaxDiscount.aspx.cs" Inherits="HamroWard.PropertyTax.TaxDiscount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="flag-bar"></div>
<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">🎁</div>
        <div class="hero-text">
            <h1>Tax Rebate / Discount &nbsp;/&nbsp; कर छुट आवेदन</h1>
            <p>Apply for Special Exemptions &nbsp;|&nbsp; विशेष कर छुटका लागि आवेदन</p>
        </div>
    </div>
</div>

<main class="container">
    <div class="tax-container">
        <h5 class="section-title">Discount Eligibility</h5>
        <div class="row g-4">
            <div class="col-md-6">
                <label class="form-label">Discount Category</label>
                <asp:DropDownList ID="ddlRebate" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Early Bird (Paid before Ashad)" Value="EB" />
                    <asp:ListItem Text="Senior Citizen (Above 65)" Value="SC" />
                    <asp:ListItem Text="Disability Category" Value="DC" />
                    <asp:ListItem Text="Martyr's Family" Value="MF" />
                </asp:DropDownList>
            </div>
            <div class="col-md-6">
                <label class="form-label">Supporting Document (Identity/Card)</label>
                <asp:FileUpload ID="fuProof" runat="server" CssClass="form-control" />
            </div>
        </div>

        <div class="mt-4 p-4 border-crimson" style="background: var(--navy-light); border-radius: 12px;">
            <p class="small mb-0"><strong>Note:</strong> Discounts will be automatically calculated in your final bill after ward verification of uploaded documents.</p>
        </div>

        <asp:Button ID="btnApplyRebate" runat="server" Text="Submit Rebate Request" CssClass="btn-pay" />
    </div>
</main>
</asp:Content>