<%@ Page Title="Citizenship Recommendation" Language="C#" MasterPageFile="~/home.Master" 
    AutoEventWireup="true" CodeBehind="Citizenship.aspx.cs" Inherits="HamroWard.Citizenship" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    :root {
        --brand-blue: #0d1b3e;
        --brand-green: #16a34a;
    }

    body { background-color: #f8f9fa; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }

    /* Header */
    .custom-header { background: white; border-bottom: 1px solid #dee2e6; position: sticky; top: 0; z-index: 1020; }
    .nav-link-custom { display: flex; flex-direction: column; align-items: center; padding: 0.5rem 1rem; color: #6c757d; text-decoration: none; font-size: 0.875rem; transition: color 0.2s; }
    .nav-link-custom:hover { color: #0d6efd; }
    .nav-link-custom.active { color: #0d6efd; position: relative; }
    .nav-link-custom.active::after { content: ""; position: absolute; bottom: -10px; height: 3px; width: 100%; background: #fd7e14; }

    /* Cards */
    .custom-card { background: white; border: 1px solid #e5e7eb; border-radius: 0.5rem; box-shadow: 0 1px 2px rgb(0 0 0 / 5%); margin-bottom: 1.5rem; }
    .card-header-custom { padding: 1.5rem; border-bottom: 1px solid #f3f4f6; }
    .card-body-custom { padding: 1.5rem; }

    /* Upload Box */
    .upload-box { border: 2px dashed #d1d5db; border-radius: 0.5rem; padding: 1.5rem; text-align: center; cursor: pointer; transition: background 0.2s; }
    .upload-box:hover { background-color: #f9fafb; }
</style>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Gender Dropdown
            ddlGender.Items.Clear();
            ddlGender.Items.Add(new ListItem("Select an option / छान्नुहोस्", ""));
            ddlGender.Items.Add(new ListItem("Male / पुरुष", "male"));
            ddlGender.Items.Add(new ListItem("Female / महिला", "female"));
            ddlGender.Items.Add(new ListItem("Other / अन्य", "other"));

            // District Dropdown
            ddlDistrict.Items.Clear();
            ddlDistrict.Items.Add(new ListItem("Kathmandu / काठमाडौँ", "kathmandu"));
            ddlDistrict.Items.Add(new ListItem("Bhaktapur / भक्तपुर", "bhaktapur"));
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        // Here you can add your logic to save the form data
        // Example: Save to database or redirect to confirmation page
        Response.Redirect("CitizenshipConfirmation.aspx");
    }
</script>

<main class="container-xl py-5">
    <nav class="mb-4 small text-muted">
        Home <i class="bi bi-chevron-right mx-2" style="font-size: 0.7rem;"></i> 
        Services <i class="bi bi-chevron-right mx-2" style="font-size: 0.7rem;"></i> 
        <span class="text-dark fw-medium">Citizenship Recommendation</span>
    </nav>

    <div class="mb-5">
        <h1 class="fw-bold text-dark h2">Citizenship Recommendation</h1>
        <p class="h5 text-primary">नागरिकता सिफारिस</p>
        <p class="text-muted col-lg-8 ps-0">Fill out the form below to apply for a citizenship recommendation letter. Ensure all details match your birth certificate.</p>
    </div>

    <div class="row g-4">
        <div class="col-lg-8">
            <!-- Applicant Details -->
            <div class="custom-card">
                <div class="card-header-custom">
                    <h5 class="mb-0 fw-bold">Applicant Details / निवेदकको विवरण</h5>
                </div>
                <div class="card-body-custom row g-3">
                    <div class="col-md-6">
                        <label class="form-label mb-1 fw-medium small text-secondary">Full Name (Nepali)</label>
                        <asp:TextBox ID="txtNameNep" runat="server" CssClass="form-control" placeholder="राम बहादुर थापा" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label mb-1 fw-medium small text-secondary">Full Name (English)</label>
                        <asp:TextBox ID="txtNameEng" runat="server" CssClass="form-control" placeholder="Ram Bahadur Thapa" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label mb-1 fw-medium small text-secondary">Date of Birth (B.S.)</label>
                        <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" TextMode="Date" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label mb-1 fw-medium small text-secondary">Gender</label>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-select" />
                    </div>
                </div>
            </div>

            <!-- Permanent Address -->
            <div class="custom-card">
                <div class="card-header-custom">
                    <h5 class="mb-0 fw-bold">Permanent Address / स्थायी ठेगाना</h5>
                </div>
                <div class="card-body-custom row g-3">
                    <div class="col-md-6">
                        <label class="form-label mb-1 fw-medium small text-secondary">District</label>
                        <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-select" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label mb-1 fw-medium small text-secondary">Tole / Street</label>
                        <asp:TextBox ID="txtTole" runat="server" CssClass="form-control" placeholder="Tole Name" />
                    </div>
                </div>
            </div>

            <!-- Required Documents -->
            <div class="custom-card">
                <div class="card-header-custom">
                    <h5 class="mb-0 fw-bold">Required Documents / आवश्यक कागजातहरू</h5>
                </div>
                <div class="card-body-custom d-flex flex-column gap-3">
                    <div class="upload-box" onclick="document.getElementById('<%=filePhoto.ClientID%>').click();">
                        <i class="bi bi-cloud-arrow-up fs-2 text-muted"></i>
                        <div class="fw-bold mt-2">Upload Passport Size Photo</div>
                        <small class="text-muted">पासपोर्ट साइजको फोटो (Max 2MB)</small>
                        <asp:FileUpload ID="filePhoto" runat="server" CssClass="d-none" />
                    </div>
                    <div class="upload-box" onclick="document.getElementById('<%=fileBirth.ClientID%>').click();">
                        <i class="bi bi-file-earmark-pdf fs-2 text-muted"></i>
                        <div class="fw-bold mt-2">Upload Birth Certificate</div>
                        <small class="text-muted">जन्म दर्ता प्रमाणपत्र (PDF/JPG)</small>
                        <asp:FileUpload ID="fileBirth" runat="server" CssClass="d-none" />
                    </div>
                </div>
            </div>

            <!-- Buttons -->
            <div class="d-flex justify-content-end gap-3 mt-4">
                <asp:Button ID="btnDraft" runat="server" Text="Save as Draft" CssClass="btn btn-outline-secondary px-4 py-2" />
                <asp:Button ID="btnSubmit" runat="server" Text="Submit Application" CssClass="btn text-white px-5 py-2" style="background: var(--brand-green);" OnClick="btnSubmit_Click" />
            </div>
        </div>

        <!-- Sidebar -->
        <div class="col-lg-4">
            <div class="alert border-0 bg-info bg-opacity-10 text-info-emphasis d-flex gap-3 p-4">
                <i class="bi bi-info-circle-fill h4 mb-0"></i>
                <div>
                    <h6 class="fw-bold">Important Note</h6>
                    <p class="small mb-0">Please verify all details before submitting. Incorrect information may lead to rejection.</p>
                </div>
            </div>

            <div class="custom-card">
                <div class="card-header-custom">
                    <h5 class="mb-0 fw-bold">Application Fee / दस्तुर</h5>
                </div>
                <div class="card-body-custom">
                    <div class="d-flex justify-content-between mb-2 small"><span>Service Fee</span><span class="fw-bold">Rs. 500</span></div>
                    <div class="d-flex justify-content-between mb-2 small"><span>Ticket Fee</span><span class="fw-bold">Rs. 10</span></div>
                    <hr />
                    <div class="d-flex justify-content-between h5 fw-bold text-dark"><span>Total</span><span>Rs. 510</span></div>
                </div>
            </div>
        </div>
    </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</asp:Content>
