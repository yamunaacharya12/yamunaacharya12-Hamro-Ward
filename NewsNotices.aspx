<%@ Page Language="C#" 
    MasterPageFile="~/home.Master"
    AutoEventWireup="true" 
    CodeBehind="NewsNotices.aspx.cs" 
    Inherits="HamroWard.NewsNotices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    body {
        background-color: #f5f5f5;
        font-family: 'Segoe UI', system-ui, sans-serif;
    }

    .section-title {
        font-size: 2rem;
        font-weight: 700;
        color: #1e293b;
    }

    .section-title .english-title {
        color: #64748b;
        font-weight: 600;
    }

    .section-subtitle {
        font-size: 1rem;
        color: #64748b;
    }

    .btn-view-toggle {
        background: transparent;
        color: #2563eb;
        border: 2px solid #2563eb;
        padding: .6rem 1.5rem;
        border-radius: .5rem;
        font-weight: 600;
        transition: all .2s;
    }

    .btn-view-toggle:hover {
        background: #2563eb;
        color: #fff;
    }

    .notice-card {
        background: #fff;
        border-radius: .75rem;
        overflow: hidden;
        box-shadow: 0 2px 8px rgba(0,0,0,.08);
        transition: all .3s;
        display: flex;
        flex-direction: column;
        border-left: 4px solid #2563eb;
        position: relative;
        height: 100%;
    }

    .notice-card:hover {
        transform: translateY(-4px);
        box-shadow: 0 12px 24px rgba(37,99,235,.15);
    }

    .notice-date-badge {
        position: absolute;
        top: 1rem;
        right: 1rem;
        background: #2563eb;
        color: #fff;
        padding: .4rem .9rem;
        border-radius: .5rem;
        font-size: .8rem;
        font-weight: 600;
    }

    .notice-content {
        padding: 1.5rem;
        padding-top: 3.5rem;
        flex: 1;
    }

    .notice-title {
        font-size: 1.1rem;
        font-weight: 700;
        color: #1e293b;
        margin-bottom: 1rem;
    }

    .notice-description {
        font-size: .95rem;
        color: #64748b;
    }

    .notice-footer {
        padding: 1rem 1.5rem;
        border-top: 1px solid #e2e8f0;
        background-color: #f8fafc;
    }

    .btn-read-more {
        background: none;
        border: none;
        color: #2563eb;
        font-weight: 600;
        cursor: pointer;
    }

    .notice-col.d-none-extra {
        display: none !important;
    }
</style>

<main class="py-5 px-3 px-md-4">
<div class="container-xxl">

<div class="d-flex justify-content-between align-items-start mb-5">
<div>
<h2 class="section-title">
सूचना तथा समाचार /
<span class="english-title">News & Notices</span>
</h2>
<p class="section-subtitle">
वडा कार्यालयका नवीनतम गतिविधिहरू / Latest activities from the ward office
</p>
</div>

<button type="button" class="btn btn-view-toggle" id="btnViewToggle" onclick="toggleView()">
सबै हेर्नुहोस् / View All
</button>
</div>

<div class="row row-cols-1 row-cols-md-2 row-cols-xl-3 g-4">

<!-- CARD 1 -->
<div class="col notice-col" data-index="1">
<div class="notice-card">
<div class="notice-date-badge">2080-10-13</div>
<div class="notice-content">
<h3 class="notice-title">वडा स्तरीय स्वास्थ्य शिविर संचालन सम्बन्धी सूचना</h3>
<p class="notice-description">यस वडा कार्यालयको आयोजनामा मिति २०८०/१०/१५ गते निःशुल्क स्वास्थ्य शिविर सञ्चालन गरिनेछ।</p>
</div>
<div class="notice-footer">
<button class="btn-read-more">Read More</button>
</div>
</div>
</div>

<!-- CARD 2 -->
<div class="col notice-col" data-index="2">
<div class="notice-card">
<div class="notice-date-badge">2080-10-12</div>
<div class="notice-content">
<h3 class="notice-title">स्वास्थ्य शिविर सम्बन्धी सूचना</h3>
<p class="notice-description">स्वास्थ्य सेवा सम्बन्धी आवश्यक जानकारीका लागि वडा कार्यालयमा सम्पर्क गर्नुहोस्।</p>
</div>
<div class="notice-footer">
<button class="btn-read-more">Read More</button>
</div>
</div>
</div>

<!-- CARD 3 -->
<div class="col notice-col" data-index="3">
<div class="notice-card">
<div class="notice-date-badge">2080-10-11</div>
<div class="notice-content">
<h3 class="notice-title">स्वास्थ्य शिविर कार्यक्रम</h3>
<p class="notice-description">निःशुल्क स्वास्थ्य परीक्षण सेवा उपलब्ध हुनेछ। सबैलाई उपस्थित हुन अनुरोध।</p>
</div>
<div class="notice-footer">
<button class="btn-read-more">Read More</button>
</div>
</div>
</div>

<!-- CARD 4 -->
<div class="col notice-col" data-index="4">
<div class="notice-card">
<div class="notice-date-badge">2080-10-10</div>
<div class="notice-content">
<h3 class="notice-title">नागरिकता सिफारिस सम्बन्धी सूचना</h3>
<p class="notice-description">नागरिकता सिफारिसका लागि आवश्यक कागजात साथमा ल्याउनुहोस्।</p>
</div>
<div class="notice-footer">
<button class="btn-read-more">Read More</button>
</div>
</div>
</div>

<!-- CARD 5 -->
<div class="col notice-col" data-index="5">
<div class="notice-card">
<div class="notice-date-badge">2080-10-09</div>
<div class="notice-content">
<h3 class="notice-title">सामाजिक सुरक्षा भत्ता वितरण</h3>
<p class="notice-description">सामाजिक सुरक्षा भत्ता वितरण मिति २०८०/१०/१२ गते हुनेछ।</p>
</div>
<div class="notice-footer">
<button class="btn-read-more">Read More</button>
</div>
</div>
</div>

<!-- CARD 6 -->
<div class="col notice-col" data-index="6">
<div class="notice-card">
<div class="notice-date-badge">2080-10-08</div>
<div class="notice-content">
<h3 class="notice-title">कर तिर्न बाँकी रहेका नागरिकहरुलाई सूचना</h3>
<p class="notice-description">घर जग्गा सम्बन्धी कर समयमै तिर्नुहोस्।</p>
</div>
<div class="notice-footer">
<button class="btn-read-more">Read More</button>
</div>
</div>
</div>

<!-- CARD 7 (Hidden Initially) -->
<div class="col notice-col d-none-extra" data-index="7">
<div class="notice-card">
<div class="notice-date-badge">2080-10-07</div>
<div class="notice-content">
<h3 class="notice-title">जेष्ठ नागरिक परिचयपत्र वितरण</h3>
<p class="notice-description">परिचयपत्र वितरण कार्यक्रम वडा कार्यालयमा हुनेछ।</p>
</div>
<div class="notice-footer">
<button class="btn-read-more">Read More</button>
</div>
</div>
</div>

<!-- CARD 8 -->
<div class="col notice-col d-none-extra" data-index="8">
<div class="notice-card">
<div class="notice-date-badge">2080-10-06</div>
<div class="notice-content">
<h3 class="notice-title">खानेपानी महसुल सम्बन्धी सूचना</h3>
<p class="notice-description">खानेपानी सेवा सम्बन्धी महसुल समयमै तिर्न अनुरोध।</p>
</div>
<div class="notice-footer">
<button class="btn-read-more">Read More</button>
</div>
</div>
</div>

<!-- CARD 9 -->
<div class="col notice-col d-none-extra" data-index="9">
<div class="notice-card">
<div class="notice-date-badge">2080-10-05</div>
<div class="notice-content">
<h3 class="notice-title">वडा सभा आयोजना सम्बन्धी सूचना</h3>
<p class="notice-description">वडा सभा मिति २०८०/१०/०८ गते बस्नेछ।</p>
</div>
<div class="notice-footer">
<button class="btn-read-more">Read More</button>
</div>
</div>
</div>

</div>
</div>
</main>

<script>
    var expanded = false;
    function toggleView() {
        expanded = !expanded;
        var hiddenCards = document.querySelectorAll('[data-index]');
        var btn = document.getElementById('btnViewToggle');

        hiddenCards.forEach(function (col) {
            var idx = parseInt(col.getAttribute('data-index'), 10);
            if (idx > 6) {
                if (expanded) {
                    col.classList.remove('d-none-extra');
                } else {
                    col.classList.add('d-none-extra');
                }
            }
        });

        btn.textContent = expanded
            ? 'कम देखाउनुहोस् / View Less'
            : 'सबै हेर्नुहोस् / View All';
    }
</script>

</asp:Content>
