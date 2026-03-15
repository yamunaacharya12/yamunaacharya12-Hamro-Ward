<%@ Page Title="Home" Language="C#" MasterPageFile="home.master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="HamroWard._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

  <%--  <!-- HERO -->
    <div>
       <img src="slider/ward.jpeg" 
     class="img-fluid w-100" 
     style="height:80vh; object-fit:cover;">
    </div>
    <section class="hero">
        <h1>डिजिटल वडा सेवा - Hamro Ward</h1>
        <p>आफ्नो वडा सेवाहरु छिटो र सजिलो / Your ward services made simple and accessible</p>

        <div class="mt-4">
            <a href="Service.aspx" class="hero-btn green">
                <i class="bi bi-file-earmark-text"></i>
                <br />
                सेवा आवेदन
                <br />
                <small>Apply for Service</small>
            </a>
            <a href="Complaint.aspx" class="hero-btn orange">
                <i class="bi bi-exclamation-circle"></i>
                <br />
                गुनासो दर्ता
                <br />
                <small>Register Complaint</small>
            </a>
            <a href="#" class="hero-btn blue">
                <i class="bi bi-search"></i>
                <br />
                आवेदन बेनी
                <br />
                <small>Track Application</small>
            </a>
        </div>
    </section>
   <!-- HERO -->--%>
<div class="position-relative">

    <!-- Image -->
    <img src="slider/ward.jpeg"
     class="img-fluid w-100"
         style="height:70vh; object-fit:cover; object-position:center;">


    <!-- Hero Content -->
    <section class="hero text-center text-white position-absolute top-50 start-50 translate-middle w-100"
        style="z-index:2;">
        
        <h1>डिजिटल वडा सेवा - Hamro Ward</h1>
        <p>आफ्नो वडा सेवाहरु छिटो र सजिलो / Your ward services made simple and accessible</p>

        <div class="mt-4">
            <a href="Service.aspx" class="hero-btn green">
                <i class="bi bi-file-earmark-text"></i><br />
                सेवा आवेदन<br />
                <small>Apply for Service</small>
            </a>

            <a href="Complaint.aspx" class="hero-btn orange">
                <i class="bi bi-exclamation-circle"></i><br />
                गुनासो दर्ता<br />
                <small>Register Complaint</small>
            </a>

            <a href="#" class="hero-btn blue">
                <i class="bi bi-search"></i><br />
                आवेदन बेनी<br />
                <small>Track Application</small>
            </a>
        </div>
    </section>

</div>

    <!-- POPULAR SERVICES -->
    <section class="container service-section" style="margin-top:-100px; position:relative; z-index:3;">
        <div class="bg-white p-4 rounded-4 shadow">
            <div class="d-flex justify-content-between mb-4">
                <h4 class="fw-bold">लोकप्रिय सेवाहरु / Popular Services</h4>
                <a href="#">View All →</a>
            </div>
            <div class="row">
                <div class="col-md-2 col-6 mb-4">
                     <a href="Service.aspx" class="text-decoration-none text-dark">
                    <div class="service-box h-100">
                        <i class="bi bi-card-text"></i>
                        <h6 class="mt-3 fw-bold">पञ्जीकरण सेवा</h6>
                         <p class="text-muted">Vital Registration</p>
                    </div>
                         </a>
                </div>
                <div class="col-md-2 col-6 mb-4">
                     <a href="Service.aspx" class="text-decoration-none text-dark">
                    <div class="service-box h-100">
                        <i class="bi bi-people"></i>
                        <h6 class="mt-3 fw-bold">सिफारिस तथा प्रमाणपत्र</h6>
                        <p class="text-muted">Recommendation & Certification</p>
                    </div>
                         </a>
                </div>

                <div class="col-md-2 col-6 mb-4">
                    <a href="Service.aspx" class="text-decoration-none text-dark">
                    <div class="service-box h-100">
                        <i class="bi bi-people"></i>
                        <h6 class="mt-3 fw-bold">पूर्वाधार तथा विकास</h6>
                        <p class="text-muted">Infrastructure & Development</p>
                    </div>
                        </a>
                </div>


                <div class="col-md-2 col-6 mb-4">
                     <a href="Service.aspx" class="text-decoration-none text-dark">
                    <div class="service-box h-100">
                        <i class="bi bi-file-earmark"></i>
                        <h6 class="mt-3 fw-bold">स्थानीय कर संकलन</h6>
                        <p class="text-muted">Local Tax Collection</p>
                    </div>
                         </a>
                </div>


                <div class="col-md-2 col-6 mb-4">
                    <a href="Service.aspx" class="text-decoration-none text-dark">
                    <div class="service-box h-100">
                        <i class="bi bi-building"></i>
                        <h6 class="mt-3 fw-bold">सामाजिक सुरक्षा</h6>
                        <p class="text-muted">Social Security</p>
                    </div>
                        </a>
                </div>


                <div class="col-md-2 col-6 mb-4">
                    <a href="Service.aspx" class="text-decoration-none text-dark">
                    <div class="service-box h-100">
                        <i class="bi bi-chat-dots"></i>
                        <h6 class="mt-3 fw-bold">बजार अनुगमन</h6>
                        <p class="text-muted">Market Monitoring</p>
                    </div>
                        </a>
                </div>


                <div class="col-md-2 col-6 mb-4">
                    <a href="Service.aspx" class="text-decoration-none text-dark">
                    <div class="service-box h-100">
                        <i class="bi bi-grid"></i>
                        <h5>अन्य सेवा</h5>
                        <p>वडाबाट प्रदान गरिने अन्य विभिन्न सेवाहरू</p>
                    </div>
                        </a>
                </div>
            </div>
        </div>
    </section>

    <!-- NEWS & NOTICES -->
    <section class="container my-5">
        <div class="news-wrapper">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <div>
                    <h4 class="fw-bold">सूचना तथा समाचार / News & Notices</h4>
                    <p class="text-muted mb-0">वडा कार्यालयका नवीनतम गतिविधिहरु / Latest activities from the ward office</p>
                </div>
                <a href="notices.aspx" class="btn btn-outline-primary">सबै हेर्नुहोस् / View All</a>
            </div>

            <div class="row mt-4">
                <div class="col-md-4">
                    <div class="news-item">
                        <div class="news-line"></div>
                        <small class="text-muted">2080-10-11</small>
                        <h6 class="fw-bold mt-2">वडा स्तरीय स्वास्थ्य शिविर संचालन सम्बन्धी सूचना</h6>
                        <p>यस वडा कार्यालयको आयोजनामा मिति २०८०/१०/१५ गते निःशुल्क स्वास्थ्य शिविर...</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="news-item">
                        <div class="news-line"></div>
                        <small class="text-muted">2080-10-12</small>
                        <h6 class="fw-bold mt-2">वडा स्तरीय स्वास्थ्य शिविर संचालन सम्बन्धी सूचना</h6>
                        <p>यस वडा कार्यालयको आयोजनामा मिति २०८०/१०/१५ गते निःशुल्क स्वास्थ्य शिविर...</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="news-item">
                        <div class="news-line"></div>
                        <small class="text-muted">2080-10-13</small>
                        <h6 class="fw-bold mt-2">वडा स्तरीय स्वास्थ्य शिविर संचालन सम्बन्धी सूचना</h6>
                        <p>यस वडा कार्यालयको आयोजनामा मिति २०८०/१०/१५ गते निःशुल्क स्वास्थ्य शिविर...</p>
                    </div>
                </div>

            </div>
        </div>
    </section>

</asp:Content>
