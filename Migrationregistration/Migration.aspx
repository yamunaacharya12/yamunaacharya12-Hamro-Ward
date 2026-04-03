<%@ Page Title="Migration Services" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="Migration.aspx.cs" Inherits="HamroWard.Migrationregistration.Migration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="w-100 bg-primary text-white py-1 topbar">
        <div class="container d-flex justify-content-end align-items-center small">
            <span class="me-2" style="cursor:pointer;">English</span>
            <span class="mx-2">|</span>
            <span class="fw-bold" style="cursor:pointer;">नेपाली</span>
        </div>
    </div>

    <div class="bg-light w-100">
        <div class="container py-2">
            <p class="mb-0 small text-secondary">
                Home &gt; Citizen Services &gt; Migration (बसाइँसराई)
            </p>
        </div>
    </div>

    <div class="container mb-4">
        <div class="alert alert-primary d-flex align-items-start shadow-sm" role="alert"
             style="border-left: 5px solid #0d6efd; background-color: #e7f1ff;">
            <div class="me-3 d-flex align-items-center justify-content-center"
                 style="width:30px; height:30px; border:2px solid #0d6efd; border-radius:50%; font-weight:bold;">
                i
            </div>
            <div class="small text-primary">
                <strong>Important Notice:</strong> 
                Migration applications must be submitted within 35 days of moving. Please ensure all family members' identification documents are attached in PDF format (max 2MB).
            </div>
        </div>
    </div>

    <div class="container text-center py-4">
        <h2 class="fw-bold text-dark mb-2">
            बसाइँसराई दर्ता र नागरिक सेवाहरू
        </h2>
        <div class="mx-auto" style="width:64px; height:4px; background-color:#dc3545;"></div>
    </div>

    <section class="min-vh-100 bg-light py-5">
        <div class="container">
            <div class="row g-4">

                <div class="col-md-6">
                    <div class="card shadow h-100">
                        <div class="card-header text-white" style="background-color:#0d6efd;">
                            १. नयाँ बसाइँसराई दर्ता (Internal Migration)
                        </div>
                        <div class="card-body d-flex flex-column justify-content-between bg-light">
                            <p class="text-secondary mb-3">
                                सेवा सम्बन्धी आवश्यक विवरणहरू निम्नानुसार छन्।
                            </p>
                            <div class="border rounded p-3 mb-3 bg-white">
                                <ul class="mb-0 small text-secondary">
                                    <li>• साविकको ठेगाना र हालको ठेगाना</li>
                                    <li>• परिवारका सदस्यहरूको विवरण र नागरिकता</li>
                                    <li>• घर जग्गाधनी प्रमाणपूर्जा वा घरभाडा सम्झौता</li>
                                    <li>• बसाँइसराई आएको वडाको सिफारिस</li>
                                </ul>
                            </div>
                            <asp:Button ID="BtnMigrate1" runat="server" CssClass="btn btn-primary w-100" Text="आवेदन गर्नुहोस्" OnClick="BtnMigrate1_Click" />
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card shadow h-100">
                        <div class="card-header text-white" style="background-color:#6c757d;">
                            २. बसाइँसराई विवरण संशोधन
                        </div>
                        <div class="card-body d-flex flex-column justify-content-between bg-light">
                            <p class="text-secondary mb-3">
                                सेवा सम्बन्धी आवश्यक विवरणहरू निम्नानुसार छन्।
                            </p>
                            <div class="border rounded p-3 mb-3 bg-white">
                                <ul class="mb-0 small text-secondary">
                                    <li>• सदस्यको नाम थपघट</li>
                                    <li>• ठेगाना त्रुटि सच्याउने</li>
                                    <li>• मिति सच्याउने</li>
                                </ul>
                            </div>
                            <asp:Button ID="BtnMigrate2" runat="server" CssClass="btn btn-outline-dark w-100" Text="आवेदन गर्नुहोस्" OnClick="BtnMigrate2_Click" />
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card shadow h-100">
                        <div class="card-header text-white" style="background-color:#dc3545;">
                            ३. बसाइँसराई दर्ता रद्द / खारेजी
                        </div>
                        <div class="card-body d-flex flex-column justify-content-between bg-light">
                            <p class="text-secondary mb-3">
                                सेवा सम्बन्धी आवश्यक विवरणहरू निम्नानुसार छन्।
                            </p>
                            <div class="alert alert-danger small mb-3">
                                दोहोरो दर्ता भएको खण्डमा वा गलत सूचना दिएको पाइएमा मात्र यो सेवा उपलब्ध हुनेछ।
                            </div>
                            <div class="border rounded p-3 mb-3 bg-white">
                                <ul class="mb-0 small text-secondary">
                                    <li>• सक्कल बसाइँसराई प्रमाणपत्र</li>
                                    <li>• रद्द गर्नु पर्ने स्पष्ट कारण</li>
                                    <li>• वडा कार्यालयको मुचुल्का</li>
                                </ul>
                            </div>
                            <asp:Button ID="BtnMigrate3" runat="server" CssClass="btn btn-outline-danger w-100" Text="आवेदन गर्नुहोस्" OnClick="BtnMigrate3_Click" />
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card shadow h-100">
                        <div class="card-header text-white" style="background-color:#20c997;">
                            ४. बसाइँसराई प्रमाणपत्रको प्रतिलिपि
                        </div>
                        <div class="card-body d-flex flex-column justify-content-between bg-light">
                            <p class="text-secondary mb-3">
                                प्रमाणपत्र हराएको वा च्यातिएको अवस्थामा प्रतिलिपि लिन सकिन्छ।
                            </p>
                            <div class="bg-info border border-info rounded d-flex align-items-center justify-content-center mb-3" style="height:70px;">
                                <div class="text-white fw-bold">Duplicate Copy</div>
                            </div>
                            <asp:Button ID="BtnMigrate4" runat="server" CssClass="btn btn-outline-info w-100" Text="आवेदन गर्नुहोस्" OnClick="BtnMigrate4_Click" />
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <div class="container py-5">
        <div class="card shadow p-4">
            <h3 class="text-center fw-bold mb-4">Track Migration Application</h3>
            <div class="row g-3">
                <div class="col-md">
                    <label class="form-label fw-medium">Application Number</label>
                    <asp:TextBox ID="txtMigApplicationNumber" runat="server" CssClass="form-control" placeholder="Enter tracking ID" />
                </div>
                <div class="col-md">
                    <label class="form-label fw-medium">Head of Family Citizenship</label>
                    <asp:TextBox ID="txtFamilyHeadCitizenship" runat="server" CssClass="form-control" placeholder="Enter citizenship number" />
                </div>
                <div class="col-md-auto">
                    <asp:Button ID="BtnMigSearch" runat="server" Text="Track Status" CssClass="btn btn-dark w-100" OnClick="BtnMigSearch_Click" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>