<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="Birth.aspx.cs" Inherits="xyz.Birth1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<!-- Top Bar -->
<div class="w-100 bg-primary text-white py-1 topbar">
    <div class="container d-flex justify-content-end align-items-center small">
        <span class="me-2" style="cursor:pointer;">English</span>
        <span class="mx-2">|</span>
        <span class="fw-bold" style="cursor:pointer;">नेपाली</span>
    </div>
</div>

<!-- Breadcrumb -->
<div class="bg-light w-100">
    <div class="container py-2">
        <p class="mb-0 small text-secondary">
            Home &gt; Citizen Services &gt; Birth Certificate
        </p>
    </div>
</div>

<!-- Info Alert -->
<div class="container mb-4">
    <div class="alert alert-primary d-flex align-items-start shadow-sm" role="alert"
         style="border-left: 5px solid #0d6efd; background-color: #e7f1ff;">
        <div class="me-3 d-flex align-items-center justify-content-center"
             style="width:30px; height:30px; border:2px solid #0d6efd; border-radius:50%; font-weight:bold;">
            i
        </div>
        <div class="small text-primary">
            <strong>Important Notice:</strong>
            Please ensure all uploaded documents are in PDF
            format and do not exceed 2MB. Applications with missing signatures or
            blurred identification cards will be automatically rejected.
        </div>
    </div>
</div>

<!-- Page Title -->
<div class="container text-center py-4">
    <h2 class="fw-bold text-dark mb-2">
        जन्मदर्ता र नागरिक सेवाहरू
    </h2>
    <div class="mx-auto" style="width:64px; height:4px; background-color:#dc3545;"></div>
</div>
<%--<!-- Dipesh Mantri Section -->
<section style="background: linear-gradient(to right, #fef2f2, #ffffff, #eff6ff);" class="py-5">
    <div class="container">
        <div class="bg-white border-top border-4 border-danger shadow-lg rounded-4 overflow-hidden">
            <div class="row align-items-center g-0">

                <!-- Image -->
                <div class="col-md-4 bg-danger d-flex align-items-center justify-content-center p-4">
                    <img src="/image.png"
                         alt="नेपालका प्रधानमन्त्री"
                         class="img-fluid rounded-4 shadow border border-4 border-white"
                         style="max-height:320px;" />
                </div>

                <!-- Info -->
                <div class="col-md-8 p-5">
                    <h2 class="fw-bold text-dark mb-2">माननीय दिपेश ढकाल</h2>
                    <p class="fs-5 fw-semibold text-danger mb-4">सम्माननीय प्रधानमन्त्री</p>
                    <div class="row text-secondary fs-6 g-3">
                        <div class="col-sm-6"><strong>उमेर:</strong> 22 वर्ष</div>
                        <div class="col-sm-6"><strong>निवास:</strong> काठमाडौं, नेपाल, Baluwatar-6</div>
                        <div class="col-sm-6"><strong>कार्यालय:</strong> प्रधानमन्त्री तथा मन्त्रिपरिषद्को कार्यालय</div>
                        <div class="col-sm-6"><strong>कार्यकाल प्रारम्भ:</strong> २०२४</div>
                    </div>
                    <p class="mt-4 text-muted lh-lg text-justify">
                        माननीय दिपेश ढकाल नेपाल सरकारको नेतृत्व गर्दै संघीय शासन
                        प्रणालीअन्तर्गत नीति निर्माण, सुशासन प्रवर्द्धन तथा राष्ट्रिय
                        विकासका कार्यक्रमहरू प्रभावकारी रूपमा कार्यान्वयन गरिरहनुभएको छ।
                        उहाँको नेतृत्वमा डिजिटल रूपान्तरण, सार्वजनिक सेवा आधुनिकीकरण तथा
                        नागरिक केन्द्रित प्रशासनलाई प्राथमिकता दिइएको छ।
                    </p>
                </div>

            </div>
        </div>
    </div>
</section>--%>

<!-- Services Section -->
<section class="min-vh-100 bg-light py-5">
    <div class="container">
        <div class="row g-4">

            <!-- Card 1 -->
            <div class="col-md-6">
                <div class="card shadow h-100">
                    <div class="card-header text-white" style="background-color:#0d6efd;">
                        १. नयाँ जन्मदर्ता प्रमाणपत्र दर्ता
                    </div>
                    <div class="card-body d-flex flex-column justify-content-between bg-light">
                        <p class="text-secondary mb-3">
                            सेवा सम्बन्धी आवश्यक विवरणहरू निम्नानुसार छन्।
                        </p>
                        <div class="border rounded p-3 mb-3 bg-white">
                            <ul class="mb-0 small text-secondary">
                                <li>• बच्चाको जन्म मिति र स्थान</li>
                                <li>• बाबु / आमाको नागरिकता विवरण</li>
                                <li>• स्वास्थ्य संस्था वा साक्षीको प्रमाण</li>
                                <li>• स्थानीय वडा कार्यालय सिफारिस</li>
                            </ul>
                        </div>
                        <asp:Button ID="BtnService1" runat="server" CssClass="btn btn-primary w-100" Text="आवेदन गर्नुहोस्" OnClick="BtnService1_Click" />
                    </div>
                </div>
            </div>

            <!-- Card 2 -->
            <div class="col-md-6">
                <div class="card shadow h-100">
                    <div class="card-header text-white" style="background-color:#6c757d;">
                        २. जन्मदर्ता विवरण संशोधन
                    </div>
                    <div class="card-body d-flex flex-column justify-content-between bg-light">
                        <p class="text-secondary mb-3">
                            सेवा सम्बन्धी आवश्यक विवरणहरू निम्नानुसार छन्।
                        </p>
                        <div class="border rounded p-3 mb-3 bg-white">
                            <ul class="mb-0 small text-secondary">
                                <li>• नामको हिज्जे</li>
                                <li>• जन्म मिति</li>
                                <li>• बाबु / आमाको नाम</li>
                            </ul>
                        </div>
                        <asp:Button ID="BtnService2" runat="server" CssClass="btn btn-outline-dark w-100" Text="आवेदन गर्नुहोस्" OnClick="BtnService2_Click" />
                    </div>
                </div>
            </div>

            <!-- Card 3 -->
            <div class="col-md-6">
                <div class="card shadow h-100">
                    <div class="card-header text-white" style="background-color:#dc3545;">
                        ३. जन्मदर्ता रद्द / हटाउने आवेदन
                    </div>
                    <div class="card-body d-flex flex-column justify-content-between bg-light">
                        <p class="text-secondary mb-3">
                            सेवा सम्बन्धी आवश्यक विवरणहरू निम्नानुसार छन्।
                        </p>
                        <div class="alert alert-danger small mb-3">
                            यो सेवा कानुनी प्रक्रिया र छानबिन पछि मात्र स्वीकृत हुनेछ।
                        </div>
                        <div class="border rounded p-3 mb-3 bg-white">
                            <ul class="mb-0 small text-secondary">
                                <li>• जन्मदर्ता प्रमाणपत्र नम्बर</li>
                                <li>• रद्द गर्नुपर्ने कारण</li>
                                <li>• सम्बन्धित वडा कार्यालयको सिफारिस</li>
                            </ul>
                        </div>
                        <asp:Button ID="BtnService3" runat="server" CssClass="btn btn-outline-danger w-100" Text="आवेदन गर्नुहोस्" OnClick="BtnService3_Click" />
                    </div>
                </div>
            </div>

            <!-- Card 4 -->
            <div class="col-md-6">
                <div class="card shadow h-100">
                    <div class="card-header text-white" style="background-color:#20c997;">
                        ४. जन्मदर्ता प्रमाणपत्र प्रतिलिपि
                    </div>
                    <div class="card-body d-flex flex-column justify-content-between bg-light">
                        <p class="text-secondary mb-3">
                            सेवा सम्बन्धी आवश्यक विवरणहरू निम्नानुसार छन्।
                        </p>
                        <div class="bg-info border border-info rounded d-flex align-items-center justify-content-center mb-3" style="height:70px;">
                            <div class="border border-info rounded" style="width:40px; height:40px;"></div>
                        </div>
                        <asp:Button ID="BtnService4" runat="server" CssClass="btn btn-outline-info w-100" Text="आवेदन गर्नुहोस्" OnClick="BtnService4_Click" />
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>

<!-- Application Status -->
<div class="container py-5">
    <div class="card shadow p-4">
        <h3 class="text-center fw-bold mb-4">Track Application Status</h3>
        <div class="row g-3">
            <div class="col-md">
                <label class="form-label fw-medium">Application Number</label>
                <asp:TextBox ID="txtApplicationNumber" runat="server" CssClass="form-control" placeholder="Enter your application number" />
            </div>
            <div class="col-md">
                <label class="form-label fw-medium">Citizenship Number</label>
                <asp:TextBox ID="txtCitizenshipNumber" runat="server" CssClass="form-control" placeholder="Enter your citizenship number" />
            </div>
            <div class="col-md-auto">
                <asp:Button ID="BtnSearch" runat="server" Text="Search" CssClass="btn btn-dark w-100" OnClick="BtnSearch_Click" />
            </div>
        </div>
    </div>
</div>

</asp:Content>
