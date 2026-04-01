<%@ Page Title="Death Registration" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="deathregistration.aspx.cs" Inherits="HamroWard.deathregistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%-- Move Styles to the top of the content block --%>
    <style>
        body { background-color: #f1f5f9; font-family: 'Inter', 'Segoe UI', sans-serif; }
        
        .hero-gradient { 
            background: linear-gradient(135deg, #1e293b 0%, #334155 100%); 
            color: white; 
            padding: 80px 0; 
            border-radius: 0 0 40px 40px;
            margin-bottom: -50px;
        }

        .notice-pill {
            background: #fffbeb;
            border: 1px solid #fef3c7;
            color: #92400e;
            border-radius: 50px;
            padding: 10px 25px;
            display: inline-flex;
            align-items: center;
            box-shadow: 0 4px 6px -1px rgba(0,0,0,0.05);
        }

        .service-card-modern { 
            border: 1px solid rgba(255, 255, 255, 0.7);
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            border-radius: 24px;
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        .service-card-modern:hover { 
            transform: translateY(-12px); 
            box-shadow: 0 20px 25px -5px rgba(0,0,0,0.1);
        }

        .icon-box {
            width: 55px;
            height: 55px;
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
            margin-bottom: 20px;
        }

        .tracking-glass {
            background: white;
            border-radius: 30px;
            padding: 40px;
            border: 1px solid #e2e8f0;
            box-shadow: 0 10px 15px -3px rgba(0,0,0,0.05);
        }

        .btn-action {
            border-radius: 12px;
            padding: 12px;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.8rem;
            letter-spacing: 0.5px;
        }
    </style>

    <header class="hero-gradient text-center">
        <div class="container">
            <span class="badge bg-danger rounded-pill px-3 py-2 mb-3">Government of Nepal</span>
            <h1 class="display-5 fw-bold">मृत्यु दर्ता अनलाइन प्रणाली</h1>
            <p class="opacity-75 fs-5">Civil Registration & Vital Statistics (CRVS) Portal</p>
        </div>
    </header>

    <div class="container text-center" style="position: relative; z-index: 10;">
        <div class="notice-pill mb-5">
            <span class="me-2">📢</span>
            <strong>Important:</strong> Death registration must be completed within <span class="text-danger mx-1">35 days</span> of the event.
        </div>
    </div>

    <main class="container mb-5">
        <div class="row g-4">
            <%-- New Registration --%>
            <div class="col-lg-3 col-md-6">
                <div class="card service-card-modern p-4">
                    <div class="icon-box bg-primary bg-opacity-10 text-primary">✚</div>
                    <h5 class="fw-bold">नयाँ दर्ता</h5>
                    <p class="text-muted small flex-grow-1">Apply for a new death certificate for the first time.</p>
                    <asp:Button ID="BtnDeath1" runat="server" CssClass="btn btn-primary btn-action w-100" Text="Apply Now" OnClick="BtnDeath1_Click" />
                </div>
            </div>

            <%-- Correction --%>
            <div class="col-lg-3 col-md-6">
                <div class="card service-card-modern p-4">
                    <div class="icon-box bg-info bg-opacity-10 text-info">✎</div>
                    <h5 class="fw-bold">विवरण संशोधन</h5>
                    <p class="text-muted small flex-grow-1">Correct spelling mistakes or dates on existing records.</p>
                    <asp:Button ID="BtnDeath2" runat="server" CssClass="btn btn-outline-info btn-action w-100" Text="Edit Record" OnClick="BtnDeath2_Click" />
                </div>
            </div>

            <%-- Duplicate --%>
            <div class="col-lg-3 col-md-6">
                <div class="card service-card-modern p-4">
                    <div class="icon-box bg-success bg-opacity-10 text-success">❑</div>
                    <h5 class="fw-bold">प्रतिलिपि</h5>
                    <p class="text-muted small flex-grow-1">Request a duplicate copy of a lost or damaged certificate.</p>
                    <asp:Button ID="BtnDeath4" runat="server" CssClass="btn btn-outline-success btn-action w-100" Text="Get Copy" OnClick="BtnDeath4_Click" />
                </div>
            </div>

            <%-- Cancellation --%>
            <div class="col-lg-3 col-md-6">
                <div class="card service-card-modern p-4">
                    <div class="icon-box bg-danger bg-opacity-10 text-danger">✕</div>
                    <h5 class="fw-bold">रद्द गर्ने</h5>
                    <p class="text-muted small flex-grow-1">Legal process to cancel a registration (Court order required).</p>
                    <asp:Button ID="BtnDeath3" runat="server" CssClass="btn btn-outline-danger btn-action w-100" Text="Cancel" OnClick="BtnDeath3_Click" />
                </div>
            </div>
        </div>
    </main>

    <section class="container mb-5 pb-5">
        <div class="tracking-glass">
            <div class="row align-items-center">
                <div class="col-lg-4 mb-4 mb-lg-0">
                    <h3 class="fw-bold mb-1">अवस्था जाँच गर्नुहोस्</h3>
                    <p class="text-muted mb-0">Track your application status in real-time.</p>
                </div>
                <div class="col-lg-8">
                    <div class="row g-3">
                        <div class="col-md-5">
                            <label class="small fw-bold text-secondary">Application Number</label>
                            <asp:TextBox ID="txtAppNoDeath" runat="server" CssClass="form-control form-control-lg bg-light border-0" placeholder="e.g. 2080-XXXX" />
                        </div>
                        <div class="col-md-5">
                            <label class="small fw-bold text-secondary">Citizen ID / Passport</label>
                            <asp:TextBox ID="txtDeceasedID" runat="server" CssClass="form-control form-control-lg bg-light border-0" placeholder="ID Number" />
                        </div>
                        <div class="col-md-2 d-flex align-items-end">
                            <asp:Button ID="BtnSearchDeath" runat="server" Text="Track" CssClass="btn btn-dark btn-lg w-100 rounded-3" OnClick="BtnSearchDeath_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>