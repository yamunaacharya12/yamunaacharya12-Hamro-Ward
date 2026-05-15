<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="xyz.AdminPanel" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Panel — Hamro Ward</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+Devanagari:wght@400;600;700&family=DM+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <style>
        :root {
            --gov-crimson:   #B8001F;
            --gov-dark-red:  #8B0015;
            --gov-blue:      #003893;
            --gov-light-blue:#1a4db5;
            --gov-gold:      #D4A017;
            --gov-bg:        #F4F6F9;
            --gov-white:     #FFFFFF;
            --gov-text:      #1C2340;
            --gov-muted:     #6B7280;
            --sidebar-w:     260px;
            --header-h:      64px;
            --radius:        10px;
            --shadow:        0 2px 12px rgba(0,0,0,.09);
        }
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: 'DM Sans', sans-serif; background: var(--gov-bg); color: var(--gov-text); display: flex; min-height: 100vh; }

        /* ── SIDEBAR ── */
        #sidebar {
            width: var(--sidebar-w); background: var(--gov-blue);
            position: fixed; top: 0; left: 0; height: 100vh;
            display: flex; flex-direction: column;
            box-shadow: 3px 0 20px rgba(0,0,0,.18); z-index: 100;
        }
        .sidebar-brand {
            padding: 18px 20px; border-bottom: 1px solid rgba(255,255,255,.12);
            display: flex; align-items: center; gap: 12px;
        }
        .brand-emblem {
            width: 44px; height: 44px; background: var(--gov-crimson);
            border-radius: 8px; display: flex; align-items: center; justify-content: center;
            font-size: 22px; flex-shrink: 0;
        }
        .brand-text { color: #fff; }
        .brand-text strong { display: block; font-size: 15px; font-weight: 700; }
        .brand-text span { font-size: 11px; opacity: .7; }

        .nav-section { padding: 10px 0; }
        .nav-label { color: rgba(255,255,255,.45); font-size: 10px; font-weight: 600; letter-spacing: 1.2px; text-transform: uppercase; padding: 8px 20px 4px; }
        .nav-item {
            display: flex; align-items: center; gap: 12px;
            padding: 11px 20px; color: rgba(255,255,255,.75);
            font-size: 14px; font-weight: 500; cursor: pointer;
            border-left: 3px solid transparent; transition: all .2s;
            text-decoration: none;
        }
        .nav-item:hover { background: rgba(255,255,255,.08); color: #fff; border-left-color: rgba(255,255,255,.4); }
        .nav-item.active { background: rgba(255,255,255,.13); color: #fff; border-left-color: var(--gov-gold); }
        .nav-item .icon { width: 20px; text-align: center; font-size: 16px; }
        .nav-badge { margin-left: auto; background: var(--gov-crimson); color: #fff; font-size: 11px; font-weight: 700; padding: 2px 8px; border-radius: 20px; }

        .sidebar-footer { margin-top: auto; padding: 16px 20px; border-top: 1px solid rgba(255,255,255,.1); }
        .admin-user { display: flex; align-items: center; gap: 10px; color: rgba(255,255,255,.8); font-size: 13px; }
        .avatar { width: 34px; height: 34px; border-radius: 50%; background: var(--gov-crimson); display: flex; align-items: center; justify-content: center; color: #fff; font-weight: 700; font-size: 14px; flex-shrink: 0; }

        /* ── MAIN ── */
        #main { margin-left: var(--sidebar-w); flex: 1; display: flex; flex-direction: column; }

        /* ── HEADER ── */
        #header {
            height: var(--header-h); background: var(--gov-white);
            border-bottom: 1px solid #E2E8F0;
            display: flex; align-items: center; justify-content: space-between;
            padding: 0 28px; position: sticky; top: 0; z-index: 50;
            box-shadow: 0 1px 6px rgba(0,0,0,.06);
        }
        .page-title { font-size: 17px; font-weight: 700; color: var(--gov-text); display: flex; align-items: center; gap: 8px; }
        .header-right { display: flex; align-items: center; gap: 14px; }
        .header-badge { background: #FEF3C7; color: #92400E; font-size: 12px; font-weight: 600; padding: 4px 12px; border-radius: 20px; border: 1px solid #FDE68A; }
        .notif-btn { position: relative; width: 36px; height: 36px; border-radius: 50%; background: #F3F4F6; border: none; cursor: pointer; display: flex; align-items: center; justify-content: center; font-size: 16px; }
        .notif-dot { position: absolute; top: 6px; right: 7px; width: 8px; height: 8px; background: var(--gov-crimson); border-radius: 50%; border: 2px solid #fff; }
        .logout-btn { background: var(--gov-crimson); color: #fff; border: none; padding: 8px 18px; border-radius: 8px; font-size: 13px; font-weight: 600; cursor: pointer; transition: background .2s; }
        .logout-btn:hover { background: var(--gov-dark-red); }

        /* ── CONTENT ── */
        #content { padding: 28px; flex: 1; }

        /* ── STAT CARDS ── */
        .stats-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 18px; margin-bottom: 28px; }
        .stat-card {
            background: var(--gov-white); border-radius: var(--radius);
            padding: 20px 22px; box-shadow: var(--shadow);
            border-top: 4px solid var(--accent, #003893);
            display: flex; justify-content: space-between; align-items: flex-start;
        }
        .stat-card:nth-child(1) { --accent: var(--gov-crimson); }
        .stat-card:nth-child(2) { --accent: var(--gov-blue); }
        .stat-card:nth-child(3) { --accent: #0F9D58; }
        .stat-card:nth-child(4) { --accent: var(--gov-gold); }
        .stat-label { font-size: 12px; color: var(--gov-muted); font-weight: 600; text-transform: uppercase; letter-spacing: .5px; margin-bottom: 8px; }
        .stat-value { font-size: 30px; font-weight: 700; color: var(--gov-text); }
        .stat-change { font-size: 12px; margin-top: 4px; color: #0F9D58; font-weight: 500; }
        .stat-icon { font-size: 28px; opacity: .2; }

        /* ── SECTION TITLE ── */
        .section-header { display: flex; align-items: center; justify-content: space-between; margin-bottom: 14px; }
        .section-title { font-size: 16px; font-weight: 700; color: var(--gov-text); }
        .view-all { font-size: 13px; color: var(--gov-blue); font-weight: 600; text-decoration: none; cursor: pointer; }

        /* ── TABLE ── */
        .table-card { background: var(--gov-white); border-radius: var(--radius); box-shadow: var(--shadow); overflow: hidden; margin-bottom: 28px; }
        .table-toolbar { padding: 16px 20px; border-bottom: 1px solid #E2E8F0; display: flex; gap: 10px; align-items: center; }
        .search-box { flex: 1; max-width: 280px; position: relative; }
        .search-box input { width: 100%; padding: 8px 12px 8px 34px; border: 1px solid #E2E8F0; border-radius: 8px; font-size: 13px; background: #F9FAFB; outline: none; }
        .search-box::before { content: "🔍"; position: absolute; left: 10px; top: 50%; transform: translateY(-50%); font-size: 13px; }
        .filter-select { padding: 8px 12px; border: 1px solid #E2E8F0; border-radius: 8px; font-size: 13px; background: #F9FAFB; cursor: pointer; }
        .export-btn { margin-left: auto; padding: 8px 16px; border: 1px solid var(--gov-blue); color: var(--gov-blue); background: #fff; border-radius: 8px; font-size: 13px; font-weight: 600; cursor: pointer; transition: all .2s; }
        .export-btn:hover { background: var(--gov-blue); color: #fff; }

        table { width: 100%; border-collapse: collapse; font-size: 13.5px; }
        thead tr { background: #F8FAFC; }
        thead th { padding: 12px 16px; text-align: left; font-size: 11px; font-weight: 700; text-transform: uppercase; letter-spacing: .6px; color: var(--gov-muted); border-bottom: 1px solid #E2E8F0; white-space: nowrap; }
        tbody tr { border-bottom: 1px solid #F1F5F9; transition: background .15s; }
        tbody tr:hover { background: #F8FAFC; }
        tbody td { padding: 13px 16px; color: var(--gov-text); vertical-align: middle; }

        .status-badge { display: inline-block; padding: 3px 10px; border-radius: 20px; font-size: 11px; font-weight: 700; }
        .status-pending   { background: #FEF3C7; color: #92400E; }
        .status-approved  { background: #D1FAE5; color: #065F46; }
        .status-rejected  { background: #FEE2E2; color: #991B1B; }
        .status-review    { background: #DBEAFE; color: #1E40AF; }

        .action-btn { padding: 5px 12px; border-radius: 6px; font-size: 12px; font-weight: 600; cursor: pointer; border: none; margin-right: 4px; transition: opacity .2s; }
        .btn-approve { background: #D1FAE5; color: #065F46; }
        .btn-reject  { background: #FEE2E2; color: #991B1B; }
        .btn-view    { background: #DBEAFE; color: #1E40AF; }
        .action-btn:hover { opacity: .8; }

        /* ── TWO COL GRID ── */
        .two-col { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 28px; }
        .mini-card { background: var(--gov-white); border-radius: var(--radius); box-shadow: var(--shadow); padding: 20px; }
        .mini-card h3 { font-size: 14px; font-weight: 700; margin-bottom: 14px; color: var(--gov-text); }
        .notice-item { padding: 10px 0; border-bottom: 1px solid #F1F5F9; display: flex; gap: 12px; align-items: flex-start; }
        .notice-item:last-child { border-bottom: none; }
        .notice-dot { width: 8px; height: 8px; border-radius: 50%; background: var(--gov-crimson); margin-top: 6px; flex-shrink: 0; }
        .notice-text { font-size: 13px; color: var(--gov-text); }
        .notice-date { font-size: 11px; color: var(--gov-muted); margin-top: 2px; }

        .service-stat { display: flex; justify-content: space-between; align-items: center; padding: 10px 0; border-bottom: 1px solid #F1F5F9; }
        .service-stat:last-child { border-bottom: none; }
        .service-name { font-size: 13px; font-weight: 500; }
        .service-bar-wrap { flex: 1; margin: 0 14px; height: 6px; background: #E2E8F0; border-radius: 4px; overflow: hidden; }
        .service-bar { height: 100%; background: var(--gov-blue); border-radius: 4px; }
        .service-count { font-size: 12px; font-weight: 700; color: var(--gov-muted); }

        /* ── GOV BANNER ── */
        .gov-banner {
            background: linear-gradient(135deg, var(--gov-blue) 0%, var(--gov-crimson) 100%);
            color: #fff; border-radius: var(--radius); padding: 20px 24px;
            display: flex; align-items: center; justify-content: space-between;
            margin-bottom: 28px;
        }
        .gov-banner-text h2 { font-size: 18px; font-weight: 700; }
        .gov-banner-text p { font-size: 13px; opacity: .8; margin-top: 4px; }
        .gov-banner-meta { text-align: right; font-size: 12px; opacity: .75; }

        /* ── PAGINATION ── */
        .pagination { display: flex; gap: 6px; align-items: center; justify-content: flex-end; padding: 14px 20px; border-top: 1px solid #E2E8F0; }
        .pg-btn { width: 32px; height: 32px; border-radius: 6px; border: 1px solid #E2E8F0; background: #fff; cursor: pointer; font-size: 13px; display: flex; align-items: center; justify-content: center; }
        .pg-btn.active { background: var(--gov-blue); color: #fff; border-color: var(--gov-blue); font-weight: 700; }

        /* ── MODAL ── */
        .modal-overlay { display: none; position: fixed; inset: 0; background: rgba(0,0,0,.45); z-index: 200; align-items: center; justify-content: center; }
        .modal-overlay.open { display: flex; }
        .modal { background: #fff; border-radius: 14px; width: 520px; max-width: 95vw; box-shadow: 0 20px 60px rgba(0,0,0,.2); animation: slideUp .25s ease; }
        @keyframes slideUp { from { transform: translateY(30px); opacity: 0; } to { transform: translateY(0); opacity: 1; } }
        .modal-header { padding: 20px 24px; border-bottom: 1px solid #E2E8F0; display: flex; justify-content: space-between; align-items: center; }
        .modal-header h3 { font-size: 16px; font-weight: 700; }
        .modal-close { background: none; border: none; font-size: 20px; cursor: pointer; color: var(--gov-muted); }
        .modal-body { padding: 24px; }
        .form-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 14px; }
        .form-group { display: flex; flex-direction: column; gap: 5px; }
        .form-group.full { grid-column: 1/-1; }
        .form-group label { font-size: 12px; font-weight: 600; color: var(--gov-muted); text-transform: uppercase; letter-spacing: .4px; }
        .form-group input, .form-group select, .form-group textarea {
            padding: 9px 12px; border: 1px solid #E2E8F0; border-radius: 8px;
            font-size: 14px; font-family: inherit; outline: none;
            transition: border-color .2s;
        }
        .form-group input:focus, .form-group select:focus, .form-group textarea:focus { border-color: var(--gov-blue); }
        .modal-footer { padding: 16px 24px; border-top: 1px solid #E2E8F0; display: flex; gap: 10px; justify-content: flex-end; }
        .btn-primary { background: var(--gov-blue); color: #fff; border: none; padding: 10px 22px; border-radius: 8px; font-size: 14px; font-weight: 600; cursor: pointer; }
        .btn-secondary { background: #F3F4F6; color: var(--gov-text); border: none; padding: 10px 22px; border-radius: 8px; font-size: 14px; font-weight: 600; cursor: pointer; }

        /* ── ALERT ── */
        .alert { padding: 12px 18px; border-radius: 8px; font-size: 13px; font-weight: 500; margin-bottom: 16px; display: none; }
        .alert.success { background: #D1FAE5; color: #065F46; border: 1px solid #6EE7B7; display: block; }
        .alert.error   { background: #FEE2E2; color: #991B1B; border: 1px solid #FCA5A5; display: block; }
    </style>
</head>
<body>

<!-- ══ SIDEBAR ══ -->
<nav id="sidebar">
    <div class="sidebar-brand">
        <div class="brand-emblem">🏛️</div>
        <div class="brand-text">
            <strong>Hamro Ward</strong>
            <span>Admin Portal</span>
        </div>
    </div>

    <div class="nav-section">
        <div class="nav-label">Main</div>
        <a class="nav-item active" href="AdminPanel.aspx"><span class="icon">📊</span> Dashboard</a>
        <a class="nav-item" href="Applications.aspx"><span class="icon">📋</span> Applications <span class="nav-badge" id="pendingCount">0</span></a>
        <a class="nav-item" href="CitizenManage.aspx"><span class="icon">👥</span> Citizens</a>
    </div>

    <div class="nav-section">
        <div class="nav-label">Services</div>
        <a class="nav-item" href="BirthRegistration.aspx"><span class="icon">👶</span> Birth Registration</a>
        <a class="nav-item" href="DeathRegistration.aspx"><span class="icon">📜</span> Death Registration</a>
        <a class="nav-item" href="CitizenshipNew.aspx"><span class="icon">🪪</span> Citizenship</a>
        <a class="nav-item" href="MigrationRegistration.aspx"><span class="icon">🚚</span> Migration</a>
        <a class="nav-item" href="Complaint.aspx"><span class="icon">📣</span> Complaints</a>
    </div>

    <div class="nav-section">
        <div class="nav-label">Administration</div>
        <a class="nav-item" href="NoticeBoard.aspx"><span class="icon">📌</span> Notice Board</a>
        <a class="nav-item" href="Reports.aspx"><span class="icon">📈</span> Reports</a>
        <a class="nav-item" href="UserManagement.aspx"><span class="icon">🔐</span> User Roles</a>
        <a class="nav-item" href="Settings.aspx"><span class="icon">⚙️</span> Settings</a>
    </div>

    <div class="sidebar-footer">
        <div class="admin-user">
            <div class="avatar">A</div>
            <div>
                <div style="font-weight:600; font-size:13px;">Admin User</div>
                <div style="font-size:11px; opacity:.6;">Ward No. 4</div>
            </div>
        </div>
    </div>
</nav>

<!-- ══ MAIN ══ -->
<div id="main">

    <!-- HEADER -->
    <header id="header">
        <div class="page-title">
            🏛️ &nbsp;Ward No. 4 — Admin Dashboard
        </div>
        <div class="header-right">
            <span class="header-badge">🇳🇵 Hamro Ward</span>
            <button class="notif-btn" onclick="toggleModal('notifModal')">
                🔔 <span class="notif-dot"></span>
            </button>
            <asp:Label ID="lblAdminName" runat="server" style="font-size:13px;font-weight:600;"></asp:Label>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="logout-btn" OnClick="BtnLogout_Click" />
        </div>
    </header>

    <!-- CONTENT -->
    <div id="content">

        <asp:Label ID="lblAlert" runat="server" CssClass="alert" Visible="false"></asp:Label>

        <!-- GOV BANNER -->
        <div class="gov-banner">
            <div class="gov-banner-text">
                <h2>नमस्ते, Admin 🙏 — Welcome to Hamro Ward Admin Portal</h2>
                <p>Ward No. 4, Kathmandu Metropolitan City | Digital Governance Portal</p>
            </div>
            <div class="gov-banner-meta">
                <div>📅 <asp:Label ID="lblDate" runat="server"></asp:Label></div>
                <div style="margin-top:4px;">🕐 <asp:Label ID="lblTime" runat="server"></asp:Label></div>
            </div>
        </div>

        <!-- STAT CARDS -->
        <div class="stats-grid">
            <div class="stat-card">
                <div>
                    <div class="stat-label">Total Applications</div>
                    <div class="stat-value"><asp:Label ID="lblTotalApps" runat="server">0</asp:Label></div>
                    <div class="stat-change">↑ This Month</div>
                </div>
                <div class="stat-icon">📋</div>
            </div>
            <div class="stat-card">
                <div>
                    <div class="stat-label">Pending Review</div>
                    <div class="stat-value"><asp:Label ID="lblPendingApps" runat="server">0</asp:Label></div>
                    <div class="stat-change" style="color:#D97706;">⏳ Needs Action</div>
                </div>
                <div class="stat-icon">⏳</div>
            </div>
            <div class="stat-card">
                <div>
                    <div class="stat-label">Approved Today</div>
                    <div class="stat-value"><asp:Label ID="lblApprovedToday" runat="server">0</asp:Label></div>
                    <div class="stat-change">✅ Today</div>
                </div>
                <div class="stat-icon">✅</div>
            </div>
            <div class="stat-card">
                <div>
                    <div class="stat-label">Registered Citizens</div>
                    <div class="stat-value"><asp:Label ID="lblCitizens" runat="server">0</asp:Label></div>
                    <div class="stat-change">👥 Total</div>
                </div>
                <div class="stat-icon">👥</div>
            </div>
        </div>

        <!-- RECENT APPLICATIONS TABLE -->
        <div class="table-card">
            <div class="section-header" style="padding:16px 20px 0;">
                <span class="section-title">📋 Recent Applications</span>
                <a class="view-all" href="Applications.aspx">View All →</a>
            </div>
            <div class="table-toolbar">
                <div class="search-box">
                    <asp:TextBox ID="txtSearch" runat="server" placeholder="Search by name or ID..." AutoPostBack="true" OnTextChanged="TxtSearch_TextChanged"></asp:TextBox>
                </div>
                <asp:DropDownList ID="ddlStatusFilter" runat="server" CssClass="filter-select" AutoPostBack="true" OnSelectedIndexChanged="DdlStatus_Changed">
                    <asp:ListItem Value="">All Status</asp:ListItem>
                    <asp:ListItem Value="Pending">Pending</asp:ListItem>
                    <asp:ListItem Value="Approved">Approved</asp:ListItem>
                    <asp:ListItem Value="Rejected">Rejected</asp:ListItem>
                    <asp:ListItem Value="Under Review">Under Review</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlServiceFilter" runat="server" CssClass="filter-select" AutoPostBack="true" OnSelectedIndexChanged="DdlService_Changed">
                    <asp:ListItem Value="">All Services</asp:ListItem>
                    <asp:ListItem Value="Birth Registration">Birth Registration</asp:ListItem>
                    <asp:ListItem Value="Death Registration">Death Registration</asp:ListItem>
                    <asp:ListItem Value="Citizenship">Citizenship</asp:ListItem>
                    <asp:ListItem Value="Migration">Migration</asp:ListItem>
                    <asp:ListItem Value="Property Tax">Property Tax</asp:ListItem>
                </asp:DropDownList>
                <button class="export-btn" onclick="exportCSV()">⬇ Export CSV</button>
            </div>

            <asp:GridView ID="gvApplications" runat="server"
                AutoGenerateColumns="false"
                CssClass="admin-grid"
                OnRowCommand="GvApplications_RowCommand"
                EmptyDataText="No applications found."
                Width="100%">
                <Columns>
                    <asp:BoundField DataField="ApplicationID" HeaderText="App ID" />
                    <asp:BoundField DataField="CitizenName" HeaderText="Citizen Name" />
                    <asp:BoundField DataField="ServiceType" HeaderText="Service" />
                    <asp:BoundField DataField="SubmittedDate" HeaderText="Submitted" DataFormatString="{0:dd MMM yyyy}" />
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <span class='status-badge <%# GetStatusClass(Eval("Status").ToString()) %>'>
                                <%# Eval("Status") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="WardNo" HeaderText="Ward" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" CommandName="ApproveApp" CommandArgument='<%# Eval("ApplicationID") %>' CssClass="action-btn btn-approve">✓ Approve</asp:LinkButton>
                            <asp:LinkButton runat="server" CommandName="RejectApp"  CommandArgument='<%# Eval("ApplicationID") %>' CssClass="action-btn btn-reject">✗ Reject</asp:LinkButton>
                            <asp:LinkButton runat="server" CommandName="ViewApp"    CommandArgument='<%# Eval("ApplicationID") %>' CssClass="action-btn btn-view">👁 View</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <div class="pagination">
                <asp:Button ID="btnPrev" runat="server" Text="‹" CssClass="pg-btn" OnClick="BtnPrev_Click" />
                <asp:Label ID="lblPageInfo" runat="server" style="font-size:13px; color:#6B7280;"></asp:Label>
                <asp:Button ID="btnNext" runat="server" Text="›" CssClass="pg-btn" OnClick="BtnNext_Click" />
            </div>
        </div>

        <!-- BOTTOM TWO COL -->
        <div class="two-col">
            <!-- Notice Board -->
            <div class="mini-card">
                <h3>📌 Recent Notices</h3>
                <asp:Repeater ID="rptNotices" runat="server">
                    <ItemTemplate>
                        <div class="notice-item">
                            <div class="notice-dot"></div>
                            <div>
                                <div class="notice-text"><%# Eval("Title") %></div>
                                <div class="notice-date"><%# Eval("PublishedDate", "{0:dd MMM yyyy}") %> • <%# Eval("Category") %></div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <a href="NoticeBoard.aspx" style="display:block;margin-top:12px;font-size:13px;color:var(--gov-blue);font-weight:600;">Manage Notices →</a>
            </div>

            <!-- Service Stats -->
            <div class="mini-card">
                <h3>📊 Service Volume This Month</h3>
                <asp:Repeater ID="rptServiceStats" runat="server">
                    <ItemTemplate>
                        <div class="service-stat">
                            <span class="service-name"><%# Eval("ServiceName") %></span>
                            <div class="service-bar-wrap">
                                <div class="service-bar" style="width:<%# Eval("Percentage") %>%"></div>
                            </div>
                            <span class="service-count"><%# Eval("Count") %></span>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

    </div><!-- /content -->
</div><!-- /main -->

<!-- ══ VIEW APPLICATION MODAL ══ -->
<div class="modal-overlay" id="viewModal">
    <div class="modal">
        <div class="modal-header">
            <h3>📋 Application Details</h3>
            <button class="modal-close" onclick="closeModal('viewModal')">✕</button>
        </div>
        <div class="modal-body">
            <div class="form-grid">
                <div class="form-group"><label>Application ID</label><input type="text" id="modalAppID" readonly /></div>
                <div class="form-group"><label>Service Type</label><input type="text" id="modalService" readonly /></div>
                <div class="form-group"><label>Citizen Name</label><input type="text" id="modalName" readonly /></div>
                <div class="form-group"><label>Phone</label><input type="text" id="modalPhone" readonly /></div>
                <div class="form-group"><label>Submitted Date</label><input type="text" id="modalDate" readonly /></div>
                <div class="form-group"><label>Status</label><input type="text" id="modalStatus" readonly /></div>
                <div class="form-group full"><label>Remarks</label><textarea id="modalRemarks" rows="3" readonly></textarea></div>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn-secondary" onclick="closeModal('viewModal')">Close</button>
        </div>
    </div>
</div>

<!-- ══ HIDDEN FIELDS FOR POSTBACK ══ -->
<asp:HiddenField ID="hfActionAppID" runat="server" />
<asp:HiddenField ID="hfCurrentPage" runat="server" Value="1" />

<script>
    function toggleModal(id) {
        document.getElementById(id).classList.toggle('open');
    }
    function closeModal(id) {
        document.getElementById(id).classList.remove('open');
    }
    function exportCSV() {
        var rows = document.querySelectorAll('table tr');
        var csv = [];
        rows.forEach(r => {
            var cells = r.querySelectorAll('th,td');
            var row = Array.from(cells).map(c => '"' + c.innerText.replace(/"/g, '""') + '"');
            csv.push(row.join(','));
        });
        var blob = new Blob([csv.join('\n')], { type: 'text/csv' });
        var a = document.createElement('a');
        a.href = URL.createObjectURL(blob);
        a.download = 'applications_' + new Date().toISOString().slice(0,10) + '.csv';
        a.click();
    }
</script>

</body>
</html>
