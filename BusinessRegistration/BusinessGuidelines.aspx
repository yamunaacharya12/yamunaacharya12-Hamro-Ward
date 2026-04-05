<%@ Page Title="Business Guidelines" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="BusinessGuidelines.aspx.cs" Inherits="HamroWard.BusinessRegistration.BusinessGuidelines" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="flag-bar"></div>
<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">📋</div>
        <div class="hero-text">
            <h1>Registration Guidelines &nbsp;/&nbsp; दर्ता निर्देशिका</h1>
            <p>Know the rules before you apply &nbsp;|&nbsp; आवेदन गर्नु अघि नियमहरू जान्नुहोस्</p>
        </div>
    </div>
</div>

<main class="container">
    <div class="form-container">
        <h5 class="section-title">Required Documents</h5>
        <div class="row g-3">
            <div class="col-md-6">
                <div class="p-3 border-start border-4 border-crimson bg-light rounded">
                    <h6 class="fw-bold mb-1">Proprietorship (एकल)</h6>
                    <p class="small text-muted mb-0">Citizenship copy, 2 photos, House tax receipt of premises.</p>
                </div>
            </div>
            <div class="col-md-6">
                <div class="p-3 border-start border-4 border-navy bg-light rounded">
                    <h6 class="fw-bold mb-1">Partnership (साझेदारी)</h6>
                    <p class="small text-muted mb-0">Partnership deed, Citizenship of all partners, Rent agreement.</p>
                </div>
            </div>
        </div>

        <div class="alert alert-info mt-4 border-0" style="background: var(--navy-light);">
            <i class="fas fa-info-circle"></i> <strong>Pro Tip:</strong> Businesses involving food or health services require an additional "Health Sanitation Certificate" from the Ward Office.
        </div>
    </div>
</main>
</asp:Content>