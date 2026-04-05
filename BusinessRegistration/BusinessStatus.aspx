<%@ Page Title="Track Business Application" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="BusinessStatus.aspx.cs" Inherits="HamroWard.BusinessRegistration.BusinessStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="flag-bar"></div>
<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">🔍</div>
        <div class="hero-text">
            <h1>Application Tracker &nbsp;/&nbsp; आवेदनको अवस्था</h1>
            <p>Monitor your Business License Progress &nbsp;|&nbsp; व्यवसाय इजाजतपत्र ट्र्याक गर्नुहोस्</p>
        </div>
    </div>
</div>

<main class="container">
    <div class="form-container">
        <div class="text-center mb-5">
            <h4 class="fw-bold" style="color: var(--navy);">Track your Application</h4>
            <div class="row justify-content-center mt-3">
                <div class="col-md-8 d-flex gap-2">
                    <asp:TextBox ID="txtBizToken" runat="server" CssClass="form-control" placeholder="Enter Application ID / Token" />
                    <asp:Button ID="btnTrackBiz" runat="server" Text="Track" CssClass="btn-submit m-0" style="width: 120px; padding: 0;" />
                </div>
            </div>
        </div>

        <div class="d-flex justify-content-around mt-5 opacity-50">
            <div class="text-center">
                <div style="width:40px; height:40px; border-radius:50%; background:var(--navy); color:white; display:flex; align-items:center; justify-content:center; margin:0 auto 10px;">1</div>
                <span class="small fw-bold">Submitted</span>
            </div>
            <div class="text-center">
                <div style="width:40px; height:40px; border-radius:50%; background:#ddd; color:white; display:flex; align-items:center; justify-content:center; margin:0 auto 10px;">2</div>
                <span class="small fw-bold">Verification</span>
            </div>
            <div class="text-center">
                <div style="width:40px; height:40px; border-radius:50%; background:#ddd; color:white; display:flex; align-items:center; justify-content:center; margin:0 auto 10px;">3</div>
                <span class="small fw-bold">Approved</span>
            </div>
        </div>
    </div>
</main>
</asp:Content>