﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditRecord.aspx.cs" Inherits="HamroWard.Deathregistration.EditRecord" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Edit Death Record | विवरण संशोधन</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body { background-color: #f4f7f6; }
        .top-back-nav { padding: 20px 0 0 20px; }
        .btn-back-link { text-decoration: none; color: #1a237e; font-weight: 600; display: inline-flex; align-items: center; }
        .form-container { max-width: 850px; margin: 20px auto 50px auto; background: white; padding: 40px; border-radius: 15px; box-shadow: 0 10px 40px rgba(0,0,0,0.08); }
        .section-title { border-left: 5px solid #6c757d; padding-left: 15px; margin-bottom: 25px; color: #1a237e; font-weight: bold; background: #f8f9fa; padding-top: 8px; padding-bottom: 8px; }
        .form-label { font-weight: 600; font-size: 0.85rem; color: #444; }
        .search-box { background: #eef2ff; border-radius: 10px; padding: 20px; margin-bottom: 30px; border: 1px solid #c7d2fe; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <div class="top-back-nav">
            <a href="deathregistration.aspx" class="btn-back-link">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-left-circle-fill me-2" viewBox="0 0 16 16">
                  <path d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0m3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5z"/>
                </svg>
                Dashboard मा फर्कनुहोस्
            </a>
        </div>

        <div class="container">
            <div class="form-container">
                <div class="text-center mb-4">
                    <h2 class="fw-bold text-dark">विवरण संशोधन आवेदन</h2>
                    <p class="text-muted">Application for Correction of Death Record</p>
                </div>

                <div class="search-box">
                    <label class="form-label text-primary">प्रमाणपत्र नम्बर प्रविष्ट गर्नुहोस् (Enter Certificate Number)</label>
                    <div class="input-group">
                        <asp:TextBox ID="txtSearchCert" runat="server" CssClass="form-control form-control-lg" placeholder="Ex: 2080-01-0001" />
                        <asp:Button ID="BtnVerify" runat="server" Text="Verify Record" CssClass="btn btn-primary px-4" OnClick="BtnVerify_Click" />
                    </div>
                </div>

                <div class="section-title">संशोधन गर्नुपर्ने विवरण (Details to Correct)</div>
                <div class="row g-3 mb-4">
                    <div class="col-md-6">
                        <label class="form-label">Field to Change / परिवर्तन गर्ने क्षेत्र</label>
                        <asp:DropDownList ID="ddlField" runat="server" CssClass="form-select">
                            <asp:ListItem Text="Select Field" Value="" />
                            <asp:ListItem Text="Name Spelling (नामको हिज्जे)" Value="Name" />
                            <asp:ListItem Text="Date of Death (मृत्यु मिति)" Value="Date" />
                            <asp:ListItem Text="Father/Mother Name (अभिभावकको नाम)" Value="Parents" />
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Reason for Correction / संशोधनको कारण</label>
                        <asp:TextBox ID="txtReason" runat="server" CssClass="form-control" placeholder="उदा. टाइप गर्दा गल्ती भएको" />
                    </div>
                    <div class="col-12">
                        <label class="form-label">Corrected Value / सही विवरण</label>
                        <asp:TextBox ID="txtCorrectValue" runat="server" CssClass="form-control" placeholder="Enter the correct information here" />
                    </div>
                </div>

                <div class="section-title">प्रमाणित गर्ने कागजात (Supporting Documents)</div>
                <div class="row g-3 mb-5">
                    <div class="col-md-12">
                        <div class="p-3 border rounded bg-light text-center">
                            <label class="form-label">Upload Evidence (Original Cert, Citizenship, etc.)</label>
                            <asp:FileUpload ID="fileEvidence" runat="server" CssClass="form-control" />
                            <small class="text-muted">संशोधन पुष्टि गर्ने आधारहरू अपलोड गर्नुहोस् (Max 2MB PDF)</small>
                        </div>
                    </div>
                </div>

                <div class="d-flex justify-content-between align-items-center border-top pt-4">
                    <a href="deathregistration.aspx" class="text-secondary text-decoration-none">✕ Cancel</a>
                    <asp:Button ID="BtnUpdate" runat="server" Text="Apply for Correction" 
                                CssClass="btn btn-secondary btn-lg px-5" OnClick="BtnUpdate_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>