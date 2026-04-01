﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CancelRecord.aspx.cs" Inherits="HamroWard.Deathregistration.CancelRecord" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Cancel Death Record | मृत्यु दर्ता रद्द</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body { background-color: #f4f7f6; }
        .top-back-nav { padding: 20px 0 0 20px; }
        .btn-back-link { text-decoration: none; color: #1a237e; font-weight: 600; display: inline-flex; align-items: center; }
        .form-container { max-width: 800px; margin: 20px auto 50px auto; background: white; padding: 40px; border-radius: 15px; box-shadow: 0 10px 40px rgba(0,0,0,0.08); }
        .section-title { border-left: 5px solid #dc3545; padding-left: 15px; margin-bottom: 25px; color: #1a237e; font-weight: bold; background: #fff5f5; padding-top: 8px; padding-bottom: 8px; }
        .form-label { font-weight: 600; font-size: 0.85rem; color: #444; }
        .warning-box { background: #fff5f5; border: 1px solid #feb2b2; border-radius: 10px; padding: 20px; margin-bottom: 30px; color: #c53030; }
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
                    <h2 class="fw-bold text-danger">मृत्यु दर्ता रद्द गर्ने आवेदन</h2>
                    <p class="text-muted">Application for Cancellation of Death Record</p>
                </div>

                <div class="warning-box">
                    <h6 class="fw-bold">⚠️ ध्यानाकर्षण (Attention):</h6>
                    <p class="small mb-0">Cancellation of a vital record is a legal process. This request requires a valid court order or a formal recommendation from the local ward office. Fraudulent requests are subject to legal action.</p>
                </div>

                <div class="section-title">१. दर्ता विवरण (Registration Details)</div>
                <div class="row g-3 mb-4">
                    <div class="col-md-8">
                        <label class="form-label">Certificate Number to Cancel / रद्द गर्नुपर्ने प्रमाणपत्र नं.</label>
                        <asp:TextBox ID="txtCancelCert" runat="server" CssClass="form-control" placeholder="Ex: 2080-05-XXXX" />
                    </div>
                    <div class="col-md-4 d-flex align-items-end">
                        <asp:Button ID="BtnVerify" runat="server" Text="Verify Record" CssClass="btn btn-outline-danger w-100" OnClick="BtnVerify_Click" />
                    </div>
                </div>

                <div class="section-title">२. रद्द गर्नुको कारण (Reason for Cancellation)</div>
                <div class="mb-4">
                    <label class="form-label">Detailed Justification / विस्तृत विवरण</label>
                    <asp:TextBox ID="txtCancelReason" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="Please explain why this record should be cancelled..." />
                </div>

                <div class="section-title">३. कानुनी प्रमाण (Legal Evidence)</div>
                <div class="mb-5">
                    <label class="form-label">Upload Legal Document (Court Order/Ward Letter) *</label>
                    <asp:FileUpload ID="fileLegalDoc" runat="server" CssClass="form-control" />
                    <small class="text-muted d-block mt-1">Please upload the official document proving the necessity of cancellation (PDF only, max 2MB).</small>
                </div>

                <div class="d-flex justify-content-between align-items-center border-top pt-4">
                    <a href="deathregistration.aspx" class="text-secondary text-decoration-none">✕ Cancel and Exit</a>
                    <asp:Button ID="BtnSubmitCancellation" runat="server" Text="Submit Cancellation Request" 
                                CssClass="btn btn-danger btn-lg px-5" OnClick="BtnSubmitCancellation_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>