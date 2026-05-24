<%@ Page Title="Dashboard" Language="C#"
    MasterPageFile="~/AdminPanel/AdminMaster.master"
    AutoEventWireup="true"
    CodeBehind="Dashboard.aspx.cs"
    Inherits="HamroWard.AdminPanel.Dashboard" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <style>
        .stats-grid { display:flex; gap:20px; flex-wrap:wrap; margin-bottom:30px; }
        .stat-card {
            background:#fff; border:1px solid #dde1e7;
            border-radius:8px; padding:24px 28px;
            min-width:180px; flex:1; text-align:center; }
        .stat-card h3 { font-size:13px; color:#888; margin-bottom:10px; }
        .stat-card .number { font-size:36px; font-weight:bold; }
        .birth  .number { color:#2ecc71; }
        .death  .number { color:#e74c3c; }
        .migration   .number { color:#3498db; }
        .citizenship .number { color:#9b59b6; }
    </style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2 style="margin-bottom:20px; color:#1e2a3a;">Dashboard Overview</h2>
    <div class="stats-grid">
        <div class="stat-card birth">
            <h3>Birth Registrations</h3>
            <div class="number">
                <asp:Label ID="lblBirth" runat="server" Text="0" />
            </div>
        </div>
        <div class="stat-card death">
            <h3>Death Registrations</h3>
            <div class="number">
                <asp:Label ID="lblDeath" runat="server" Text="0" />
            </div>
        </div>
        <div class="stat-card migration">
            <h3>Migration Records</h3>
            <div class="number">
                <asp:Label ID="lblMigration" runat="server" Text="0" />
            </div>
        </div>
        <div class="stat-card citizenship">
            <h3>Citizenship Records</h3>
            <div class="number">
                <asp:Label ID="lblCitizenship" runat="server" Text="0" />
            </div>
        </div>
    </div>
</asp:Content>