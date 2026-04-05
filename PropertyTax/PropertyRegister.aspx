<%@ Page Title="New Property Registration" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="PropertyRegister.aspx.cs" Inherits="HamroWard.PropertyTax.PropertyRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="flag-bar"></div>
<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">📝</div>
        <div class="hero-text">
            <h1>Property Registration &nbsp;/&nbsp; नयाँ सम्पत्ति दर्ता</h1>
            <p>Register Land or Building Records &nbsp;|&nbsp; जग्गा वा भवनको लगत दर्ता</p>
        </div>
    </div>
</div>

<main class="container">
    <div class="tax-container">
        <h5 class="section-title">1. Ownership Details &nbsp;/&nbsp; जग्गाधनी विवरण</h5>
        <div class="row g-4">
            <div class="col-md-6">
                <label class="form-label">Owner Full Name</label>
                <asp:TextBox ID="txtOwner" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-6">
                <label class="form-label">Citizenship Number</label>
                <asp:TextBox ID="txtCit" runat="server" CssClass="form-control" />
            </div>
        </div>

        <h5 class="section-title">2. Land Specifications &nbsp;/&nbsp; जग्गाको विवरण</h5>
        <div class="row g-4">
            <div class="col-md-4">
                <label class="form-label">Ward No.</label>
                <asp:DropDownList ID="ddlWard" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select Ward" Value="" />
                    <asp:ListItem Text="Ward 1" Value="1" />
                </asp:DropDownList>
            </div>
            <div class="col-md-4">
                <label class="form-label">Map Sheet No. (नक्सा सिट नं.)</label>
                <asp:TextBox ID="txtSheet" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-4">
                <label class="form-label">Kitta Number (कित्ता नं.)</label>
                <asp:TextBox ID="txtKitta" runat="server" CssClass="form-control" />
            </div>
        </div>

        <h5 class="section-title">3. Document Upload &nbsp;/&nbsp; कागजातहरू</h5>
        <div class="row g-4">
            <div class="col-md-6">
                <div class="p-4 border rounded bg-light text-center">
                    <p class="form-label">Land Ownership Certificate (Lalpurja)</p>
                    <asp:FileUpload ID="fuLalpurja" runat="server" CssClass="form-control" />
                </div>
            </div>
            <div class="col-md-6">
                <div class="p-4 border rounded bg-light text-center">
                    <p class="form-label">Citizenship of Owner</p>
                    <asp:FileUpload ID="fuOwnerCit" runat="server" CssClass="form-control" />
                </div>
            </div>
        </div>

        <asp:Button ID="btnRegister" runat="server" Text="Submit for Verification" CssClass="btn-pay" style="background: var(--navy) !important;" />
    </div>
</main>
</asp:Content>