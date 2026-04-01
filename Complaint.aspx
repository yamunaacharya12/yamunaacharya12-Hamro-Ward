<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="Complaint.aspx.cs" Inherits="HamroWard.Complaint" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
   

    <!-- Font Awesome Icons -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />

    <style>
        body {
            margin-top: 60px;
            background-color: #f3f6fb;
        }

        .complaint-card {
            max-width: 950px;
            margin: 40px auto;
            border-radius: 14px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
            background: #ffffff;
        }

        /* HEADER */
        .complaint-header {
            background: linear-gradient(90deg, #0d6efd, #198754, #dc3545);
            color: white;
            padding: 30px;
            text-align: center;
        }

        .complaint-body {
            padding: 30px;
        }

        .section-title {
            font-weight: 700;
            margin: 28px 0 14px;
            color: #dc3545;
            border-left: 5px solid #198754;
            padding-left: 10px;
        }

        label {
            font-weight: 600;
            color: #333;
        }

        /* CATEGORY CARDS */
        .category-card {
            background: #f8f9fd;
            border-radius: 14px;
            padding: 26px 10px;
            text-align: center;
            cursor: pointer;
            border: 1px solid #e1e6f0;
            transition: all 0.3s ease;
        }

        .category-card:hover {
            transform: translateY(-6px);
            background: #eef3ff;
        }

        .icon-circle {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto;
            font-size: 30px;
            color: white;
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
            transition: transform 0.3s ease;
        }

        .category-card:hover .icon-circle {
            transform: scale(1.15);
        }

        .electricity { background: linear-gradient(135deg, #ffc107, #fd7e14); }
        .water       { background: linear-gradient(135deg, #0dcaf0, #0d6efd); }
        .road        { background: linear-gradient(135deg, #6c757d, #343a40); }
        .dispute     { background: linear-gradient(135deg, #dc3545, #b02a37); }
        .others      { background: linear-gradient(135deg, #198754, #0d6efd); }

        .category-card h6 {
            margin-top: 14px;
            font-weight: 600;
            color: #333;
        }

        .category-card.active {
            background: linear-gradient(135deg, #0d6efd, #198754);
            border-color: #198754;
        }

        .category-card.active h6 {
            color: white;
        }

        /* UPLOAD */
        .upload-box {
            border: 2px dashed #dc3545;
            border-radius: 10px;
            padding: 18px;
            background: #fff5f5;
            text-align: center;
        }

        /* BUTTON */
        .btn-submit {
            background: linear-gradient(135deg, #198754, #0d6efd);
            border: none;
            padding: 15px;
            font-size: 18px;
            border-radius: 10px;
        }

        .btn-submit:hover {
            background: linear-gradient(135deg, #dc3545, #198754);
        }

        .message-label {
            font-weight: bold;
            text-align: center;
            margin-bottom: 15px;
            color: #198754;
        }
    </style>





    <div class="complaint-card">

        <!-- HEADER -->
        <div class="complaint-header">
            <h3>Citizen Complaint Form</h3>
            <p>Submit your complaint to your ward office</p>
        </div>

        <div class="complaint-body">

            <asp:Label ID="lblMessage" runat="server" CssClass="message-label"></asp:Label>

            <!-- CATEGORY -->
            <h5 class="section-title">1. Select Complaint Category</h5>
            <asp:HiddenField ID="hfCategory" runat="server" />

            <div class="row g-3 mb-4 text-center">

                <div class="col-md-3 col-6">
                    <div class="category-card" onclick="selectCategory(this,'Electricity')">
                        <div class="icon-circle electricity">
                            <i class="fas fa-bolt"></i>
                        </div>
                        <h6>Electricity</h6>
                    </div>
                </div>

                <div class="col-md-3 col-6">
                    <div class="category-card" onclick="selectCategory(this,'Water')">
                        <div class="icon-circle water">
                            <i class="fas fa-tint"></i>
                        </div>
                        <h6>Water</h6>
                    </div>
                </div>

                <div class="col-md-3 col-6">
                    <div class="category-card" onclick="selectCategory(this,'Road')">
                        <div class="icon-circle road">
                            <i class="fas fa-road"></i>
                        </div>
                        <h6>Road</h6>
                    </div>
                </div>

                <div class="col-md-3 col-6">
                    <div class="category-card" onclick="selectCategory(this,'Dispute')">
                        <div class="icon-circle dispute">
                            <i class="fas fa-handshake-slash"></i>
                        </div>
                        <h6>Dispute</h6>
                    </div>
                </div>

                <div class="col-md-3 col-6">
                    <div class="category-card" onclick="selectCategory(this,'Others')">
                        <div class="icon-circle others">
                            <i class="fas fa-ellipsis-h"></i>
                        </div>
                        <h6>Others</h6>
                    </div>
                </div>

            </div>

            <!-- PERSONAL INFO -->
            <h5 class="section-title">2. Personal Information</h5>

            <div class="row g-3">
                <div class="col-md-6">
                    <label>Full Name</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                </div>

                <div class="col-md-6">
                    <label>Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" />
                </div>

                <div class="col-md-4">
                    <label>Ward Number</label>
                    <asp:TextBox ID="txtWardNumber" runat="server" CssClass="form-control" />
                </div>
            </div>

            <!-- COMPLAINT DETAILS -->
            <h5 class="section-title">3. Complaint Details</h5>

            <div class="row g-3">
                <div class="col-md-12">
                    <label>Subject</label>
                    <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" />
                </div>

                <div class="col-md-12">
                    <label>Description</label>
                    <asp:TextBox ID="txtDescription" runat="server"
                        CssClass="form-control" TextMode="MultiLine" Rows="5" />
                </div>
            </div>

            <!-- UPLOAD -->
            <h5 class="section-title">4. Upload Evidence (Optional)</h5>

            <div class="upload-box my-3">
                <i class="fas fa-camera fa-2x mb-2 text-danger"></i>
                <p class="fw-bold mb-2">Upload Photo</p>
                <asp:FileUpload ID="fuPhoto" runat="server" CssClass="form-control" />
                <small class="text-muted">JPG / PNG • Max 2MB</small>
            </div>

            
<h5 class="section-title">5. Submit Complaint</h5>

<button type="button" class="btn btn-submit text-white w-100">
    Submit Complaint
</button>




        </div>
    </div>

    <script>
      function selectCategory(el, value) {
        document.getElementById('<%= hfCategory.ClientID %>').value = value;
        document.querySelectorAll('.category-card')
          .forEach(c => c.classList.remove('active'));
        el.classList.add('active');
      }
    </script>






</asp:Content>



