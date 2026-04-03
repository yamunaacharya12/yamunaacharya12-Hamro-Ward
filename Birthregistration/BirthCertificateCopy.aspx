<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BirthCertificateCopy.aspx.cs" 
         Inherits="xyz.Birthregistration.BirthCertificateCopy" %>

<!DOCTYPE html>
<html lang="ne">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>जन्मदर्ता प्रमाणपत्र प्रतिलिपि - Government of Nepal</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Noto+Sans+Devanagari:wght@400;500;700&display=swap');

        body {
            font-family: 'Inter', 'Noto Sans Devanagari', system-ui, sans-serif;
            background: linear-gradient(to bottom, #f1f5f9, #e0e7ff);
            color: #1e2937;
            line-height: 1.6;
        }

        .header-bg {
            background: linear-gradient(135deg, #DC143C 0%, #002B7F 100%);
            position: relative;
            overflow: hidden;
        }

        .flag-bar {
            height: 12px;
            background: repeating-linear-gradient(90deg, #DC143C 0, #DC143C 25px, #002B7F 25px, #002B7F 50px);
        }

        .main-header {
            max-width: 1200px;
            margin: 0 auto;
            padding: 30px 40px 40px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            color: white;
            flex-wrap: wrap;
            gap: 20px;
        }

        .nepal-flag {
            width: 85px;
            height: 85px;
            background: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 48px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.25);
        }

        .form-container {
            max-width: 1200px;
            margin: 40px auto;
            padding: 0 20px;
        }

        .main-card {
            background: white;
            border-radius: 28px;
            box-shadow: 0 25px 70px rgba(0, 0, 0, 0.13);
            overflow: hidden;
        }

        .content {
            padding: 50px 55px;
        }

        .section-title {
            font-size: 1.8rem;
            font-weight: 700;
            color: #1e2937;
            border-bottom: 5px solid #DC143C;
            padding-bottom: 12px;
            margin-bottom: 26px !important;
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .input-group {
            margin-bottom: 22px;
        }

        label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: #374151;
        }

        .required::after {
            content: " *";
            color: #DC143C;
        }

        input, select, textarea {
            width: 100%;
            padding: 15px 20px;
            border: 2px solid #e5e7eb;
            border-radius: 16px;
            font-size: 1.05rem;
            box-sizing: border-box;
        }

        input:focus, select:focus {
            border-color: #DC143C;
            box-shadow: 0 0 0 4px rgba(220, 20, 60, 0.15);
        }

        .grid-2 {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 24px;
        }

        .photo-section {
            max-width: 340px;
            margin: 30px auto 40px;
        }

        .photo-box {
            background: #fdf4f4;
            border: 3px dashed #DC143C;
            border-radius: 18px;
            padding: 25px 20px;
            text-align: center;
        }

        .photo-placeholder {
            width: 115px;
            height: 145px;
            margin: 0 auto 12px;
            background: white;
            border: 4px solid #e5e7eb;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2.8rem;
        }

        .upload-btn {
            background: linear-gradient(to right, #DC143C, #002B7F);
            color: white;
            border: none;
            padding: 12px 28px;
            font-size: 1.05rem;
            font-weight: 600;
            border-radius: 50px;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .submit-container {
            display: flex;
            justify-content: center;
            margin-top: 40px;
        }

        .btn-submit {
            background: linear-gradient(to right, #DC143C, #002B7F);
            color: white;
            padding: 16px 50px;
            font-size: 1.25rem;
            font-weight: 700;
            border: none;
            border-radius: 9999px;
            cursor: pointer;
            box-shadow: 0 10px 25px rgba(220, 20, 60, 0.35);
            transition: all 0.3s;
            width: 100%;
            max-width: 420px;
        }

        .declaration-box {
            background: #fefce8;
            border: 2px solid #facc15;
            border-radius: 16px;
            padding: 24px;
            margin: 35px 0 40px;
            text-align: left;
        }

        @media (max-width: 768px) {
            .content { padding: 35px 25px; }
            .btn-submit { padding: 14px 40px; font-size: 1.15rem; max-width: 100%; }
        }
    </style>
</head>
<body>

    <!-- Header -->
    <header class="header-bg text-white">
        <div class="main-header">
            <div class="logo-section">
                <div class="nepal-flag">🇳🇵</div>
                <div>
                    <h1>Government of Nepal</h1>
                    <p>Department of National ID and Civil Registration</p>
                </div>
            </div>
            <div>
                <h2 style="margin:0; font-size:2.2rem;">जन्मदर्ता प्रमाणपत्र प्रतिलिपि</h2>
                <p style="margin:5px 0 0; font-size:1.3rem;">Application for Copy of Birth Certificate</p>
            </div>
        </div>
        <div class="flag-bar"></div>
    </header>

    <div class="form-container">
        <div class="main-card">
            <div class="content">

                <form id="copyForm" runat="server" enctype="multipart/form-data">

                    <!-- 1. Applicant Information -->
                    <div class="section-title">
                        <span>१.</span> Applicant Information — निवेदकको विवरण
                    </div>
                    <div class="grid-2">
                        <div class="input-group">
                            <label class="required">Full Name (नेपालीमा)</label>
                            <input type="text" runat="server" id="ApplicantName" required />
                        </div>
                        <div class="input-group">
                            <label class="required">Relationship with the Person (सम्बन्ध)</label>
                            <select runat="server" id="Relationship" required>
                                <option value="">Select Relationship</option>
                                <option value="Self">Self (आफै)</option>
                                <option value="Father">Father (बुवा)</option>
                                <option value="Mother">Mother (आमा)</option>
                                <option value="Grandfather">Grandfather (हजुरबुवा)</option>
                                <option value="Guardian">Legal Guardian (कानुनी संरक्षक)</option>
                                <option value="Other">Other (अन्य)</option>
                            </select>
                        </div>
                    </div>

                    <!-- 2. Birth Certificate Details -->
                    <div class="section-title">
                        <span>२.</span> Birth Registration Details — जन्मदर्ता विवरण
                    </div>
                    <div class="grid-2">
                        <div class="input-group">
                            <label class="required">Birth Registration Number (जन्म दर्ता नं.)</label>
                            <input type="text" runat="server" id="BirthRegNo" placeholder="Existing Birth Registration Number" required />
                        </div>
                        <div class="input-group">
                            <label class="required">Full Name of the Person (as per record)</label>
                            <input type="text" runat="server" id="PersonFullName" required />
                        </div>
                    </div>

                    <div class="grid-2">
                        <div class="input-group">
                            <label>Date of Birth (BS)</label>
                            <input type="text" runat="server" id="DOB_BS" placeholder="२०५८-०४-१५" />
                        </div>
                        <div class="input-group">
                            <label>District of Birth</label>
                            <input type="text" runat="server" id="BirthDistrict" />
                        </div>
                    </div>

                    <!-- 3. Purpose -->
                    <div class="section-title">
                        <span>३.</span> Purpose of Copy — प्रतिलिपि लिने प्रयोजन
                    </div>
                    <div class="input-group">
                        <label class="required">Purpose</label>
                        <select runat="server" id="Purpose" required>
                            <option value="">Select Purpose</option>
                            <option value="SchoolAdmission">School / College Admission</option>
                            <option value="Job">Job Application</option>
                            <option value="Passport">Passport Application</option>
                            <option value="Citizenship">Citizenship Application</option>
                            <option value="Marriage">Marriage Registration</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>

                    <!-- 4. Documents -->
                    <div class="section-title">
                        <span>४.</span> Required Documents — आवश्यक कागजात
                    </div>
                    <div class="input-group">
                        <label class="required">Upload Proof of Identity (Citizen Certificate / Voter ID / Passport etc.)</label>
                        <asp:FileUpload ID="IdentityDoc" runat="server" accept=".pdf,.jpg,.jpeg,.png" />
                        <small>PDF, JPG, JPEG or PNG | Max 5 MB</small>
                    </div>

                    <!-- Optional Photo -->
                    <div class="section-title">
                        <span>५.</span> Recent Photograph (Optional)
                    </div>
                    <div class="photo-section">
                        <div class="photo-box">
                            <div id="photoPreview">
                                <div class="photo-placeholder">📸</div>
                            </div>
                            <asp:FileUpload ID="photoInput" runat="server" accept="image/*" style="display:none;" />
                            <button type="button" onclick="document.getElementById('<%= photoInput.ClientID %>').click()" class="upload-btn">
                                <i class="fas fa-upload"></i> Upload Recent Photo
                            </button>
                        </div>
                    </div>

                    <!-- Declaration -->
                    <div class="declaration-box">
                        <label>
                            <input type="checkbox" class="mt-1 w-6 h-6 accent-red-600" required />
                            <span class="text-lg text-gray-700">
                                I declare that the information provided is true and correct. I am requesting a copy of birth certificate for the above mentioned purpose.<br>
                                <span class="block mt-4 text-base italic">म घोषणा गर्दछु कि दिइएका विवरण सत्य छन् र माथि उल्लेखित प्रयोजनका लागि जन्मदर्ता प्रमाणपत्रको प्रतिलिपि माग गरिएको छ ।</span>
                            </span>
                        </label>
                    </div>

                    <!-- Submit -->
                    <div class="submit-container">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit Application for Copy →" 
                                    CssClass="btn-submit" OnClick="btnSubmit_Click" />
                    </div>

                </form>
            </div>
        </div>
    </div>

    <script>
        // Photo Preview
        document.getElementById('<%= photoInput.ClientID %>').addEventListener('change', function (e) {
            const reader = new FileReader();
            reader.onload = function (ev) {
                document.getElementById('photoPreview').innerHTML = `
                    <img src="${ev.target.result}" style="width:115px;height:145px;border-radius:10px;object-fit:cover;" />
                `;
            };
            reader.readAsDataURL(e.target.files[0]);
        });
    </script>
</body>
</html>