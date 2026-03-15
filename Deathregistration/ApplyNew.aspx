<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplyNew.aspx.cs" Inherits="xyz.Deathregistration.ApplyNew" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>New Death Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body { background-color: #f4f7f6; }
        
        /* Top Navigation Button */
        .top-back-nav {
            padding: 20px 0 0 20px;
        }
        .btn-back-link {
            text-decoration: none;
            color: #1a237e;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            transition: color 0.2s;
        }
        .btn-back-link:hover {
            color: #d32f2f;
        }

        /* Form Container */
        .form-container { 
            max-width: 850px; 
            margin: 20px auto 50px auto; 
            background: white; 
            padding: 40px; 
            border-radius: 15px; 
            box-shadow: 0 10px 40px rgba(0,0,0,0.08); 
        }
        
        .section-title { 
            border-left: 5px solid #d32f2f; 
            padding-left: 15px; 
            margin-bottom: 25px; 
            color: #1a237e; 
            font-weight: bold;
            font-size: 1.1rem;
            background: #f8f9fa;
            padding-top: 8px;
            padding-bottom: 8px;
        }
        
        .form-label { font-weight: 600; font-size: 0.85rem; color: #444; margin-bottom: 5px; }
        .form-control:focus { border-color: #1a237e; box-shadow: 0 0 0 0.25rem rgba(26, 35, 126, 0.1); }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <div class="top-back-nav">
            <a href="deathregistration.aspx" class="btn-back-link">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-left-circle-fill me-2" viewBox="0 0 16 16">
                  <path d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0m3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5z"/>
                </svg>
                मुख्य पृष्ठमा फर्कनुहोस् (Back to Dashboard)
            </a>
        </div>

        <div class="container">
            <div class="form-container">
                <div class="text-center mb-5">
                    <h2 class="fw-bold text-dark">नयाँ मृत्यु दर्ता आवेदन</h2>
                    <p class="text-muted">New Death Registration Application Form</p>
                    <hr class="w-25 mx-auto" style="height: 3px; color: #d32f2f; opacity: 1;">
                </div>

                <div class="section-title">१. मृतकको विवरण (Deceased Details)</div>
                <div class="row g-3 mb-4">
                    <div class="col-md-6">
                        <label class="form-label">Full Name (English) *</label>
                        <asp:TextBox ID="txtNameEng" runat="server" CssClass="form-control" placeholder="e.g. Ram Bahadur Thapa" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">पूरा नाम (नेपाली) *</label>
                        <asp:TextBox ID="txtNameNep" runat="server" CssClass="form-control" placeholder="उदा. राम बहादुर थापा" />
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Gender</label>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-select">
                            <asp:ListItem Text="Select" Value="" />
                            <asp:ListItem Text="Male / पुरुष" Value="M" />
                            <asp:ListItem Text="Female / महिला" Value="F" />
                            <asp:ListItem Text="Other / अन्य" Value="O" />
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Date of Death (BS/AD)</label>
                        <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="Date" />
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Citizenship No. / नागरिकता नं.</label>
                        <asp:TextBox ID="txtCitizenship" runat="server" CssClass="form-control" />
                    </div>
                </div>

                <div class="section-title">२. स्थायी ठेगाना (Permanent Address)</div>
                <div class="row g-3 mb-4">
                    <div class="col-md-4">
                        <label class="form-label">District / जिल्ला</label>
                        <asp:TextBox ID="txtDistrict" runat="server" CssClass="form-control" />
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Municipality / गाउँपालिका</label>
                        <asp:TextBox ID="txtMunicipality" runat="server" CssClass="form-control" />
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Ward No. / वडा नं.</label>
                        <asp:TextBox ID="txtWard" runat="server" CssClass="form-control" TextMode="Number" />
                    </div>
                </div>

                <div class="section-title">३. आवश्यक कागजातहरू (Required Documents)</div>
                <div class="row g-3 mb-5">
                    <div class="col-md-6">
                        <div class="p-3 border rounded bg-light">
                            <label class="form-label">Death Report / अस्पतालको रिपोर्ट</label>
                            <asp:FileUpload ID="fileDeathDoc" runat="server" CssClass="form-control" />
                            <small class="text-muted">PDF format, max 2MB</small>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="p-3 border rounded bg-light">
                            <label class="form-label">Applicant's ID / सूचकको परिचयपत्र</label>
                            <asp:FileUpload ID="fileApplicantId" runat="server" CssClass="form-control" />
                            <small class="text-muted">PDF format, max 2MB</small>
                        </div>
                    </div>
                </div>

                <div class="d-flex justify-content-between align-items-center border-top pt-4">
                    <a href="deathregistration.aspx" class="text-danger fw-bold text-decoration-none">
                        ✕ Cancel and Go Back
                    </a>
                    <asp:Button ID="BtnSubmit" runat="server" Text="Submit Application / पेश गर्नुहोस्" 
                                CssClass="btn btn-primary btn-lg px-5 shadow-sm" OnClick="BtnSubmit_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
