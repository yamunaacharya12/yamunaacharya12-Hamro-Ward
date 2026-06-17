<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/AdminMaster.master" AutoEventWireup="true" CodeBehind="BirthList.aspx.cs" Inherits="HamroWard.AdminPanel.BirthList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">




    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI';
        }

        body {
            background: #f5f7fb;
        }

        /* Layout */
        .main-wrapper {
            display: flex;
            min-height: 100vh;
        }

        /* Main Content */
        .content-area {
            flex: 1;
            padding: 30px;
        }

        /* Top Header */
        .top-header {
            background: white;
            border-radius: 14px;
            padding: 18px 24px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 28px;
        }

        .search-box {
            width: 380px;
            padding: 13px 16px;
            border: 1px solid #dbe2ea;
            border-radius: 10px;
            outline: none;
        }

        .top-right {
            display: flex;
            align-items: center;
            gap: 18px;
        }

        .lang-btn {
            border: 1px solid #dbe2ea;
            padding: 10px 14px;
            border-radius: 10px;
            background: white;
            cursor: pointer;
        }

        /* Page Header */
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 28px;
        }

        .page-title h1 {
            font-size: 42px;
            color: #1e293b;
            margin-bottom: 6px;
        }

        .page-title p {
            color: #64748b;
            font-size: 16px;
        }

       

        /* Cards */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(4,1fr);
            gap: 22px;
            margin-bottom: 28px;
        }

        .stat-card {
            background: white;
            border-radius: 14px;
            padding: 24px;
            border-top: 4px solid #f59e0b;
            position: relative;
        }

        .stat-card.blue {
            border-top-color: #1d4ed8;
        }

        .stat-card.red {
            border-top-color: #dc2626;
        }

        .stat-card.yellow {
            border-top-color: #eab308;
        }

        .stat-card h4 {
            color: #64748b;
            margin-bottom: 14px;
            font-size: 15px;
        }

        .stat-card h2 {
            font-size: 48px;
            color: #111827;
        }

        .icon-box {
            width: 55px;
            height: 55px;
            border-radius: 14px;
            position: absolute;
            top: 24px;
            right: 24px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 22px;
        }

        .orange-box {
            background: #fff4db;
        }

        .blue-box {
            background: #e8efff;
        }

        .red-box {
            background: #ffe8e8;
        }

        .yellow-box {
            background: #fff8db;
        }

        /* Table Card */
        .table-card {
            background: white;
            border-radius: 14px;
            overflow: hidden;
            border: 1px solid #e2e8f0;
        }

        .table-tabs {
            display: flex;
            gap: 35px;
            padding: 24px 28px 16px;
            border-bottom: 1px solid #edf2f7;
            font-weight: 600;
        }

        .table-tabs div {
            color: #64748b;
            position: relative;
        }

        .table-tabs .active {
            color: #0f2b6b;
        }

        .table-tabs .active::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: -17px;
            width: 100%;
            height: 3px;
            background: #0f2b6b;
            border-radius: 10px;
        }

        .badge {
            background: #e2e8f0;
            color: #475569;
            padding: 2px 8px;
            border-radius: 30px;
            font-size: 12px;
            margin-left: 6px;
        }

        .toolbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 18px 28px;
            border-bottom: 1px solid #edf2f7;
        }

        .toolbar-left {
            display: flex;
            gap: 12px;
        }

        .filter-btn,
        .export-btn {
            padding: 12px 18px;
            border: 1px solid #dbe2ea;
            border-radius: 10px;
            background: white;
            cursor: pointer;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        thead {
            background: #f8fafc;
        }

        th {
            text-align: left;
            padding: 18px 26px;
            font-size: 13px;
            color: #64748b;
        }

        .empty-state {
            text-align: center;
            padding: 80px 20px;
            color: #94a3b8;
        }

        .empty-state h3 {
            margin-top: 14px;
            margin-bottom: 8px;
            color: #475569;
        }

    </style>

    <div class="main-wrapper">

        <!-- CONTENT -->
        <div class="content-area">

            <!-- TOP HEADER -->
            <div class="top-header">

                <input type="text"
                    class="search-box"
                    placeholder="Search citizens, application ID, or services..." />

                <div class="top-right">

                </div>

            </div>

            <!-- PAGE HEADER -->
            <div class="page-header">

                <div class="page-title">
                    <h1>Birth Registration</h1>
                    <p>Manage new applications, certificate requests, and corrections.</p>
                </div>


            </div>

            <!-- CARDS -->
            <div class="stats-grid">

                <div class="stat-card">
                    <div class="icon-box orange-box">⏰</div>
                    <h4>Total Pending</h4>
                    <h2>0</h2>
                </div>

                <div class="stat-card blue">
                    <div class="icon-box blue-box">📄</div>
                    <h4>New Applications</h4>
                    <h2>0</h2>
                </div>

                <div class="stat-card red">
                    <div class="icon-box red-box">📋</div>
                    <h4>Certificate Requests</h4>
                    <h2>0</h2>
                </div>

                <div class="stat-card yellow">
                    <div class="icon-box yellow-box">✏</div>
                    <h4>Corrections</h4>
                    <h2>0</h2>
                </div>

            </div>

            <!-- TABLE -->
            <div class="table-card">

                <div class="table-tabs">

                    <div class="active">
                        New Application
                        <span class="badge">0</span>
                    </div>

                    <div>
                        Certificate Copy
                        <span class="badge">0</span>
                    </div>

                    <div>
                        Correction
                        <span class="badge">0</span>
                    </div>

                </div>

                <div class="toolbar">

                    <div class="toolbar-left">

                        <input type="text"
                            class="search-box"
                            placeholder="Search by App ID or Name..." />

                        <button class="filter-btn">
                            More Filters
                        </button>

                    </div>

                    

                </div>

                <table>

                    <thead>
                        <tr>
                            <th>APP ID</th>
                            <th>APPLICANT NAME</th>
                            <th>Child NAME</th>
                            <th>DATE APPLIED</th>
                            <th>STATUS</th>
                            <th>ACTION</th>
                        </tr>
                    </thead>

                </table>

                <div class="empty-state">

                    <div style="font-size:60px;">📂</div>

                    <h3>No Death Registration Records Found</h3>

                    <p>
                        Data will appear here after connecting your database.
                    </p>

                </div>

            </div>


        </div>

    </div>






</asp:Content>

