<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master"
    AutoEventWireup="true" CodeBehind="Service.aspx.cs"
    Inherits="HamroWard.Service" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    :root {
        --bg: #cfe2f6;
        --card: #ffffff;
        --text: #0f172a;
        --text-muted: #64748b;
        --primary: #bb1f1f;
        --primary-dark: #0284c8;
    }

    body {
        font-family: 'Segoe UI', sans-serif;
        background: var(--bg);
        color: var(--text);
    }

    /* ================= HERO HEADER ================= */
    header.hero-header {
        width: 100%;
        height: 50vh;
        min-height: 350px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        text-align: center;
        padding: 0 20px;
        color: #fff;
        background: linear-gradient(rgba(0,0,0,0.55), rgba(0,0,0,0.55)),
                    url("slider/service.jpeg") center/cover no-repeat;
    }

    .title-main {
        font-size: 3.5rem;
        font-weight: 800;
        margin-bottom: 15px;
    }

    .subtitle {
        font-size: 1.2rem;
        max-width: 700px;
        margin-bottom: 25px;
        color: #e2e8f0;
    }

    .search-box {
        width: 100%;
        max-width: 500px;
        position: relative;
    }

    .search-input {
        width: 100%;
        padding: 14px 20px 14px 45px;
        border-radius: 50px;
        border: none;
        outline: none;
        font-size: 1rem;
    }

    .search-icon {
        position: absolute;
        left: 18px;
        top: 50%;
        transform: translateY(-50%);
        font-size: 1.2rem;
        color: #555;
    }

    /* ================= SERVICES ================= */
    .container-inner {
        max-width: 1200px;
        margin: auto;
        padding: 40px 20px;
    }

    .section-title {
        text-align: center;
        font-size: 2rem;
        margin-bottom: 30px;
    }

    .popular-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 25px;
    }

    .service-card {
        background: var(--card);
        padding: 25px;
        border-radius: 15px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.08);
        transition: 0.3s ease;
    }

    .service-card:hover {
        transform: translateY(-6px);
        box-shadow: 0 15px 35px rgba(0,0,0,0.12);
    }

    .service-title {
        font-size: 1.2rem;
        margin-bottom: 10px;
        font-weight: 700;
    }

    .service-desc {
        color: var(--text-muted);
        margin-bottom: 15px;
    }

    .btn-start {
        display: inline-block;
        background: var(--primary);
        color: #fff;
        padding: 10px 22px;
        border-radius: 30px;
        text-decoration: none;
        font-weight: 600;
        transition: 0.3s;
    }

    .btn-start:hover {
        background: var(--primary-dark);
    }

    /* Responsive */
    @media(max-width:768px){
        header.hero-header{height:65vh;}
        .title-main{font-size:2.2rem;}
        .subtitle{font-size:1rem;}
    }

    /* Language Toggle */
    [data-lang="np"] { display:none; }
    body.np [data-lang="en"] { display:none; }
    body.np [data-lang="np"] { display:block; }
</style>

<!-- HERO SECTION -->
<header class="hero-header">

    <h1 class="title-main" data-lang="en">Services</h1>
    <h1 class="title-main" data-lang="np">सेवाहरू</h1>

    <p class="subtitle" data-lang="en">
        Access all government services in one place.
    </p>
    <p class="subtitle" data-lang="np">
        सबै सरकारी सेवाहरू एकै ठाउँमा पहुँच गर्नुहोस्।
    </p>

    <div class="search-box">
        <span class="search-icon">🔍</span>

        <asp:TextBox ID="txtSearch"
            runat="server"
            CssClass="search-input"
            placeholder="Search services..." />

        <asp:TextBox ID="txtSearchNp"
            runat="server"
            CssClass="search-input"
            style="display:none;"
            placeholder="सेवाहरू खोज्नुहोस्..." />
    </div>

</header>

<!-- SERVICES SECTION -->
<div class="container-inner">

    <h2 class="section-title" data-lang="en">Popular Services</h2>
    <h2 class="section-title" data-lang="np">लोकप्रिय सेवाहरू</h2>

    <div class="popular-grid">

 <!-- Passport -->
    <div class="service-card">
        <h3 class="service-title">Apply for Passport</h3>
        <p class="service-desc">
            Submit your passport application online with digital document upload and tracking.
        </p>
         <a href="<%= ResolveUrl("~/passport.aspx") %>" class="btn-start">Get Started</a>
    </div>

    <!-- Apply for Birth Certificate -->
    <div class="service-card">
        <h3 class="service-title">Apply for Birth Certificate</h3>
        <p class="service-desc">
            Register birth certificate online with official verification.
        </p>
        <a href="<%= ResolveUrl("/BirthRegistration/Birth.aspx") %>" class="btn-start">Apply Now</a>
    </div>

    <!-- Death Registration -->
    <div class="service-card">
        <h3 class="service-title">Apply for Death Certificate</h3>
        <p class="service-desc">
            Register death certificate records for official documentation.
        </p>
         <a href="<%= ResolveUrl("~/deathregistration/deathregistration.aspx") %>" class="btn-start">Apply Now</a>
    </div>

    <!-- Migration Certificate -->
    <div class="service-card">
        <h3 class="service-title">Apply for Migration Certificate</h3>
        <p class="service-desc">
            Apply for migration certificate for residential record transfer.
        </p>
        <a href="#" class="btn-start">Apply Now</a>
    </div>

    <!-- Citizenship -->
    <div class="service-card">
        <h3 class="service-title">Apply for Citizenship Certificate</h3>
        <p class="service-desc">
            Apply for citizenship certificate online.
        </p>
        <a href="<%= ResolveUrl("~/CitizenshipRegistration/Citizenship.aspx") %>" class="btn-start">Apply Now</a>
    </div>

  <%--  <!-- Driver's License -->
    <div class="service-card">
        <h3 class="service-title">Renew Driver's License</h3>
        <p class="service-desc">
            Renew your driver's license online with instant confirmation.
        </p>
        <a href="https://applydlnew.dotm.gov.np/" target="_blank" class="btn-start">Get Started</a>
    </div>--%>

    <!-- Property Tax -->
    <div class="service-card">
        <h3 class="service-title">Pay Property Tax</h3>
        <p class="service-desc">
            Secure online portal for property tax payment.
        </p>
        <a href="<%= ResolveUrl("~/property.aspx") %>" class="btn-start">Apply Now</a>
    </div>

    <!-- Business Registration -->
    <div class="service-card">
        <h3 class="service-title">Apply for Business Registration</h3>
        <p class="service-desc">
            Register your business with streamlined digital processing.
        </p>
        <a href="https://application.ocr.gov.np/" target="_blank" class="btn-start">Apply Now</a>
    </div>

</div>
</div>

<script>
function filterServices(value){
    value = value.toLowerCase();
    document.querySelectorAll(".service-card").forEach(card=>{
        card.style.display =
            card.innerText.toLowerCase().includes(value)
            ? "block" : "none";
    });
}

document.getElementById('<%= txtSearch.ClientID %>')
    .addEventListener("keyup",function(){
        filterServices(this.value);
});

document.getElementById('<%= txtSearchNp.ClientID %>')
        .addEventListener("keyup", function () {
            filterServices(this.value);
        });
</script>

</asp:Content>