<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RequestCopy.aspx.cs" Inherits="xyz.Deathregistration.RequestCopy" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Request Duplicate Certificate | प्रतिलिपि अनुरोध</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body { background-color: #f4f7f6; }
        .top-back-nav { padding: 20px 0 0 20px; }
        .btn-back-link { text-decoration: none; color: #1a237e; font-weight: 600; display: inline-flex; align-items: center; }
        .form-container { max-width: 800px; margin: 20px auto 50px auto; background: white; padding: 40px; border-radius: 15px; box-shadow: 0 10px 40px rgba(0,0,0,0.08); }
        .section-title { border-left: 5px solid #20c997; padding-left: 15px; margin-bottom: 25px; color: #1a237e; font-weight: bold; background: #f8f9fa; padding-top: 8px; padding-bottom: 8px; }
        .form-label { font-weight: 600; font-size: 0.85rem; color: #444; }
        .verification-box { background: #f0fdf4; border-radius: 10px; padding: 25px; margin-bottom: 30px; border: 1px solid #bbf7d0; }
        .custom-radio label { margin-left: 10px; margin-right: 20px; font-weight: 500; }
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
                    <h2 class="fw-bold text-dark">मृत्यु दर्ता प्रमाणपत्रको प्रतिलिपि</h2>
                    <p class="text-muted">Request for Duplicate Death Certificate</p>
                </div>

                <div class="verification-box">
                    <label class="form-label text-success">मूल दर्ता नम्बर (Original Registration Number)</label>
                    <div class="input-group">
                        <asp:TextBox ID="txtRegNum" runat="server" CssClass="form-control form-control-lg" placeholder="D-20XX-XXXX" />
                        <asp:Button ID="BtnVerify" runat="server" Text="Check Record" CssClass="btn btn-success px-4" OnClick="BtnVerify_Click" />
                    </div>
                    <asp:Label ID="lblRecordStatus" runat="server" CssClass="small mt-2 d-block fw-bold"></asp:Label>
                </div>

                <div class="section-title">प्रतिलिपि चाहिनुको कारण (Reason for Duplicate)</div>
                <div class="mb-4 p-2">
                    <asp:RadioButtonList ID="rblReason" runat="server" CssClass="custom-radio">
                        <asp:ListItem Text="Lost (हराएको)" Value="Lost" />
                        <asp:ListItem Text="Damaged (झुत्रो भएको वा कोरिएको)" Value="Damaged" />
                        <asp:ListItem Text="Update (नयाँ विवरणसहितको प्रतिलिपि)" Value="Updated" />
                    </asp:RadioButtonList>
                </div>

                <div class="mb-4">
                    <label class="form-label">Additional Remarks / अन्य विवरण (If any)</label>
                    <asp:TextBox ID="txtRemarks" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Explain briefly..." />
                </div>

                <div class="section-title">सूचकको परिचय (Applicant's Identity)</div>
                <div class="row g-3 mb-5">
                    <div class="col-md-12">
                        <label class="form-label">Upload Applicant ID / परिचयपत्र अपलोड गर्नुहोस्</label>
                        <asp:FileUpload ID="fileApplicantId" runat="server" CssClass="form-control" />
                        <small class="text-muted">Submit a clear scan of your Citizenship or National ID (PDF/JPG).</small>
                    </div>
                </div>

                <div class="d-flex justify-content-between align-items-center border-top pt-4">
                    <a href="deathregistration.aspx" class="text-secondary text-decoration-none">✕ Cancel</a>
                    <asp:Button ID="BtnSubmitRequest" runat="server" Text="Submit Request" 
                                CssClass="btn btn-success btn-lg px-5 shadow-sm" OnClick="BtnSubmitRequest_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
