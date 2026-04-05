<%@ Page Language="C#"
    MasterPageFile="~/home.Master"
    AutoEventWireup="true"
    CodeBehind="NewsNotices.aspx.cs"
    Inherits="HamroWard.NewsNotices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Noto+Sans+Devanagari:wght@400;500;700&display=swap');

    :root {
        --crimson: #DC143C;
        --navy: #002B7F;
        --crimson-light: rgba(220, 20, 60, 0.08);
        --navy-light: rgba(0, 43, 127, 0.07);
    }

    body {
        font-family: 'Inter', 'Noto Sans Devanagari', system-ui, sans-serif;
        background: linear-gradient(160deg, #f1f5f9 0%, #e0e7ff 100%);
        color: #1e2937;
    }

    /* ── Flag Bar ── */
    .flag-bar {
        height: 5px;
        background: linear-gradient(90deg, var(--crimson) 0%, var(--navy) 50%, var(--crimson) 100%);
    }

    /* ── Page Hero ── */
    .page-hero {
        background: linear-gradient(135deg, var(--crimson) 0%, var(--navy) 100%);
        padding: 36px 0 28px;
        margin-bottom: 36px;
        position: relative;
        overflow: hidden;
    }

    .page-hero::before {
        content: '';
        position: absolute;
        inset: 0;
        background: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='0.04'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
    }

    .hero-inner {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 24px;
        display: flex;
        align-items: center;
        gap: 20px;
        color: white;
        flex-wrap: wrap;
        position: relative;
        z-index: 1;
    }

    .hero-emblem {
        width: 72px; height: 72px;
        background: white;
        border-radius: 50%;
        display: flex; align-items: center; justify-content: center;
        font-size: 38px;
        box-shadow: 0 8px 24px rgba(0,0,0,0.22);
        flex-shrink: 0;
    }

    .hero-text h1 { font-size: 1.55rem; font-weight: 700; margin: 0 0 4px; }
    .hero-text p  { font-size: 0.97rem; margin: 0; opacity: 0.88; }

    /* ── Filter Bar ── */
    .filter-bar {
        background: white;
        border-radius: 16px;
        padding: 18px 24px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.07);
        border: 1.5px solid #e8eaf0;
        display: flex;
        align-items: center;
        gap: 12px;
        flex-wrap: wrap;
        margin-bottom: 32px;
    }

    .filter-btn {
        padding: 8px 20px;
        border-radius: 50px;
        border: 2px solid #e8eaf0;
        background: #fafafa;
        font-size: 0.85rem;
        font-weight: 600;
        color: #6b7280;
        cursor: pointer;
        transition: all 0.2s ease;
        font-family: 'Inter', system-ui, sans-serif;
    }

    .filter-btn:hover,
    .filter-btn.active {
        background: linear-gradient(135deg, var(--crimson), var(--navy));
        color: white;
        border-color: transparent;
        box-shadow: 0 4px 14px rgba(220,20,60,0.25);
    }

    .filter-label {
        font-size: 0.82rem;
        font-weight: 700;
        color: #9ca3af;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        margin-right: 4px;
    }

    /* ── Notice Cards ── */
    .notice-card {
        background: white;
        border-radius: 20px;
        border: 2px solid #e8eaf0;
        box-shadow: 0 4px 16px rgba(0,0,0,0.06);
        overflow: hidden;
        transition: all 0.25s ease;
        display: flex;
        flex-direction: column;
        height: 100%;
        position: relative;
    }

    .notice-card::after {
        content: '';
        position: absolute;
        bottom: 0; left: 0; right: 0;
        height: 4px;
        background: linear-gradient(90deg, var(--crimson), var(--navy));
        transform: scaleX(0);
        transition: transform 0.25s ease;
    }

    .notice-card:hover {
        transform: translateY(-6px);
        border-color: var(--crimson);
        box-shadow: 0 16px 40px rgba(220,20,60,0.13);
    }

    .notice-card:hover::after { transform: scaleX(1); }

    .notice-type-bar {
        height: 5px;
        width: 100%;
    }

    .type-news   { background: linear-gradient(90deg, var(--crimson), #f43f5e); }
    .type-notice { background: linear-gradient(90deg, var(--navy), #3b82f6); }
    .type-event  { background: linear-gradient(90deg, #10b981, #059669); }

    .notice-content {
        padding: 22px 22px 14px;
        flex: 1;
    }

    .notice-meta {
        display: flex;
        align-items: center;
        gap: 10px;
        margin-bottom: 12px;
        flex-wrap: wrap;
    }

    .type-badge {
        font-size: 0.72rem;
        font-weight: 700;
        padding: 3px 12px;
        border-radius: 50px;
        text-transform: uppercase;
        letter-spacing: 0.4px;
    }

    .badge-news   { background: var(--crimson-light); color: var(--crimson); }
    .badge-notice { background: var(--navy-light);    color: var(--navy);    }
    .badge-event  { background: rgba(16,185,129,0.1); color: #059669;        }

    .notice-date {
        font-size: 0.78rem;
        color: #9ca3af;
        font-weight: 500;
    }

    .notice-title {
        font-size: 1rem;
        font-weight: 700;
        color: #1e2937;
        margin-bottom: 8px;
        line-height: 1.45;
    }

    .notice-description {
        font-size: 0.85rem;
        color: #6b7280;
        line-height: 1.6;
        margin: 0;
    }

    .notice-footer {
        padding: 14px 22px;
        border-top: 1px solid #f1f5f9;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .btn-read-more {
        background: none;
        border: none;
        color: var(--crimson);
        font-weight: 700;
        font-size: 0.85rem;
        cursor: pointer;
        padding: 0;
        font-family: 'Inter', system-ui, sans-serif;
        transition: gap 0.2s;
        display: flex;
        align-items: center;
        gap: 4px;
    }

    .btn-read-more:hover { gap: 8px; }

    /* ── Empty State ── */
    .empty-state {
        text-align: center;
        padding: 60px 20px;
        color: #9ca3af;
    }

    .empty-state .empty-icon {
        font-size: 48px;
        margin-bottom: 16px;
    }

    /* ── View All button ── */
    .btn-view-all {
        background: linear-gradient(135deg, var(--crimson), var(--navy));
        color: white;
        border: none;
        padding: 12px 32px;
        border-radius: 50px;
        font-weight: 700;
        font-size: 0.92rem;
        cursor: pointer;
        box-shadow: 0 6px 18px rgba(220,20,60,0.28);
        transition: all 0.25s ease;
        font-family: 'Inter', system-ui, sans-serif;
    }

    .btn-view-all:hover {
        transform: translateY(-2px);
        box-shadow: 0 10px 26px rgba(220,20,60,0.38);
    }

    /* ── Container ── */
    .container-inner {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 16px 60px;
    }

    /* ── Breadcrumb ── */
    .breadcrumb-wrap {
        font-size: 0.82rem;
        color: #6b7280;
        margin-bottom: 24px;
    }
    .breadcrumb-wrap a {
        color: var(--crimson);
        text-decoration: none;
    }
    .breadcrumb-wrap a:hover { text-decoration: underline; }
</style>

<!-- Flag Bar -->
<div class="flag-bar"></div>

<!-- Hero -->
<div class="page-hero">
    <div class="hero-inner">
        <div class="hero-emblem">📋</div>
        <div class="hero-text">
            <h1>News &amp; Notices &nbsp;/&nbsp; सूचना तथा समाचार</h1>
            <p>Ward Office — Digital Services Portal &nbsp;|&nbsp; वडा कार्यालयका नवीनतम गतिविधिहरू</p>
        </div>
    </div>
</div>

<div class="container-inner">

    <!-- Breadcrumb -->
    <nav class="breadcrumb-wrap">
        <a href="/Default.aspx">Home</a> &rsaquo;
        <span>News &amp; Notices</span>
    </nav>

    <!-- Filter Bar -->
    <div class="filter-bar">
        <span class="filter-label">Filter:</span>
        <button class="filter-btn active" onclick="filterCards('All', this)">All / सबै</button>
        <button class="filter-btn" onclick="filterCards('News', this)">News / समाचार</button>
        <button class="filter-btn" onclick="filterCards('Notice', this)">Notice / सूचना</button>
        <button class="filter-btn" onclick="filterCards('Event', this)">Event / कार्यक्रम</button>
    </div>

    <!-- Cards Grid -->
    <div class="row row-cols-1 row-cols-md-2 row-cols-xl-3 g-4" id="noticesGrid">
        <asp:Repeater ID="rptNotices" runat="server" OnItemDataBound="rptNotices_ItemDataBound">
            <ItemTemplate>
                <div class="col notice-col" data-type='<%# Eval("Category") %>'>
                    <div class="notice-card">
                        <div class="notice-type-bar <%# GetTypeBarClass(Eval("Category").ToString()) %>"></div>
                        <div class="notice-content">
                            <div class="notice-meta">
                                <span class="type-badge <%# GetBadgeClass(Eval("Category").ToString()) %>">
                                    <%# Eval("Category") %>
                                </span>
                                <span class="notice-date">
                                    <%# Convert.ToDateTime(Eval("PublishedDate")).ToString("MMM dd, yyyy") %>
                                </span>
                            </div>
                            <h3 class="notice-title"><%# Eval("Title") %></h3>
                            <p class="notice-description"><%# Eval("ShortDescription") %></p>
                        </div>
                        <div class="notice-footer">
                            <button class="btn-read-more"
                                onclick="openDetail(<%# Eval("Id") %>)">
                                Read More →
                            </button>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <!-- Empty state (shown when no records) -->
    <asp:Panel ID="pnlEmpty" runat="server" Visible="false">
        <div class="empty-state">
            <div class="empty-icon">📭</div>
            <h5>No notices found / कुनै सूचना भेटिएन</h5>
            <p>Check back later for updates from the ward office.</p>
        </div>
    </asp:Panel>

    <!-- View All / View Less -->
    <asp:Panel ID="pnlViewToggle" runat="server" Visible="false">
        <div class="text-center mt-5">
            <button class="btn-view-all" id="btnViewToggle" onclick="toggleView()">
                सबै हेर्नुहोस् / View All
            </button>
        </div>
    </asp:Panel>

</div>

<script>
    // ── Filter by category ──
    function filterCards(type, btn) {
        document.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));
        btn.classList.add('active');

        document.querySelectorAll('.notice-col').forEach(function (col) {
            var colType = col.getAttribute('data-type');
            col.style.display = (type === 'All' || colType === type) ? '' : 'none';
        });
    }

    // ── View All / View Less toggle ──
    var expanded = false;
    var INITIAL_SHOW = 6;

    function initCards() {
        var cols = document.querySelectorAll('.notice-col');
        if (cols.length <= INITIAL_SHOW) {
            var toggle = document.getElementById('btnViewToggle');
            if (toggle) toggle.parentElement.style.display = 'none';
            return;
        }
        cols.forEach(function (col, i) {
            if (i >= INITIAL_SHOW) col.style.display = 'none';
        });
    }

    function toggleView() {
        expanded = !expanded;
        var cols = document.querySelectorAll('.notice-col');
        var btn  = document.getElementById('btnViewToggle');

        cols.forEach(function (col, i) {
            if (i >= INITIAL_SHOW) col.style.display = expanded ? '' : 'none';
        });

        btn.textContent = expanded
            ? 'कम देखाउनुहोस् / View Less'
            : 'सबै हेर्नुहोस् / View All';
    }

    // ── Open detail (placeholder — extend as needed) ──
    function openDetail(id) {
        window.location.href = '/NewsNoticeDetail.aspx?id=' + id;
    }

    window.addEventListener('DOMContentLoaded', initCards);
</script>

</asp:Content>
