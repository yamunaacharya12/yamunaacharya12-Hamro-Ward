<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplyNew.aspx.cs" Inherits="xyz.Birthregistration.ApplyNew" %>

<!DOCTYPE html>
<html lang="ne">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>नागरिकता प्रमाणपत्रको लागि नयाँ निवेदन - Government of Nepal</title>
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

            .header-bg::before {
                content: '';
                position: absolute;
                top: -50%;
                right: -20%;
                width: 400px;
                height: 400px;
                background: rgba(255,255,255,0.1);
                border-radius: 50%;
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
        }

        .logo-section {
            display: flex;
            align-items: center;
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

        .title-section h1 {
            font-size: 2.1rem;
            font-weight: 700;
            margin: 0;
            line-height: 1.1;
        }

        .title-section p {
            margin: 4px 0 0;
            opacity: 0.95;
            font-size: 1.05rem;
        }

        .application-title {
            text-align: right;
        }

            .application-title h2 {
                font-size: 2.4rem;
                font-weight: 700;
                margin: 0;
                line-height: 1.15;
            }

            .application-title p {
                font-size: 1.35rem;
                margin: 6px 0 0;
                opacity: 0.9;
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
            padding: 55px 60px;
        }

        .section-title {
            font-size: 1.85rem;
            font-weight: 700;
            color: #1e2937;
            border-bottom: 5px solid #DC143C;
            padding-bottom: 12px;
            margin-bottom: 32px;
            display: flex;
            align-items: center;
            gap: 14px;
        }

            .section-title span {
                color: #DC143C;
                font-size: 2rem;
            }

        .input-group {
            margin-bottom: 26px;
        }

        label {
            display: block;
            font-weight: 600;
            margin-bottom: 9px;
            color: #374151;
        }

        .required::after {
            content: " *";
            color: #DC143C;
        }

        input, select {
            width: 100%;
            padding: 16px 22px;
            border: 2px solid #e5e7eb;
            border-radius: 16px;
            font-size: 1.08rem;
            transition: all 0.3s ease;
        }

            input:focus, select:focus {
                border-color: #DC143C;
                box-shadow: 0 0 0 4px rgba(220, 20, 60, 0.15);
                outline: none;
            }

        .grid-2 {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 28px;
        }

        .grid-3 {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 24px;
        }

        .parents-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 32px;
        }

        .parent-card {
            padding: 32px;
            border-radius: 20px;
            border: 1px solid #f1f5f9;
        }

        .father-card {
            background: #eff6ff;
            border-color: #bfdbfe;
        }

        .mother-card {
            background: #fff1f2;
            border-color: #fecaca;
        }

        .photo-upload {
            border: 3px dashed #DC143C;
            border-radius: 24px;
            padding: 50px 30px;
            text-align: center;
            background: #fdf4f4;
            max-width: 460px;
            margin: 0 auto;
        }

        .photo-placeholder {
            width: 170px;
            height: 210px;
            margin: 0 auto 24px;
            background: white;
            border: 6px solid #e5e7eb;
            border-radius: 18px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 5rem;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
        }

        .btn-submit {
            background: linear-gradient(to right, #DC143C, #002B7F);
            color: white;
            padding: 18px 60px;
            font-size: 1.35rem;
            font-weight: 700;
            border: none;
            border-radius: 9999px;
            cursor: pointer;
            box-shadow: 0 12px 30px rgba(220, 20, 60, 0.35);
            transition: all 0.3s;
        }

            .btn-submit:hover {
                transform: translateY(-4px);
                box-shadow: 0 18px 40px rgba(220, 20, 60, 0.45);
            }

        .declaration-box {
            background: #fefce8;
            border: 2px solid #facc15;
            border-radius: 20px;
            padding: 32px;
        }
    </style>
</head>
<body>

    <!-- Improved Header -->
    <header class="header-bg text-white">
        <div class="main-header">
            <div class="logo-section">
                <div class="nepal-flag">🇳🇵</div>
                <div class="title-section">
                    <h1>Government of Nepal</h1>
                    <p>Department of National ID and Civil Registration</p>
                </div>
            </div>

            <div class="application-title">
                <h2>नागरिकता प्रमाणपत्रको लागि निवेदन</h2>
                <p>New Citizenship Certificate Application</p>
            </div>
        </div>
        <div class="flag-bar"></div>
    </header>

    <div class="form-container">
        <div class="main-card">
            <div class="content">

                <!-- Personal Information -->
                <div class="section-title">
                    <span>१.</span> Personal Information — व्यक्तिगत विवरण
                </div>
                <div class="grid-3">
                    <div class="input-group">
                        <label class="required">First Name (English)</label>
                        <input type="text" placeholder="First name" />
                    </div>
                    <div class="input-group">
                        <label>Middle Name</label>
                        <input type="text" placeholder="Middle name (if any)" />
                    </div>
                    <div class="input-group">
                        <label class="required">Last Name / Surname (थर)</label>
                        <input type="text" placeholder="Surname" />
                    </div>
                </div>

                <div class="input-group">
                    <label class="required">पूरा नाम (नेपालीमा)</label>
                    <input type="text" class="text-2xl" placeholder="पूर्ण नाम नेपालीमा लेख्नुहोस्" />
                </div>

                <div class="grid-3">
                    <div class="input-group">
                        <label class="required">Date of Birth (AD)</label>
                        <input type="date" />
                    </div>
                    <div class="input-group">
                        <label class="required">Date of Birth (BS)</label>
                        <input type="text" placeholder="२०५८-०४-१५" />
                    </div>
                    <div class="input-group">
                        <label class="required">Gender (लिंग)</label>
                        <select>
                            <option value="">Select Gender</option>
                            <option value="Male">पुरुष (Male)</option>
                            <option value="Female">महिला (Female)</option>
                            <option value="Other">अन्य (Other)</option>
                        </select>
                    </div>
                </div>

                <!-- Place of Birth & Permanent Address - Side by Side -->
                <div class="grid-2 mt-16">
                    <!-- Place of Birth -->
                    <div>
                        <div class="section-title">
                            <span>२.</span> Place of Birth — जन्मस्थान
                        </div>
                        <div class="grid-2">
                            <div class="input-group">
                                <label class="required">Province</label>
                                <select>
                                    <option value="">Select Province</option>
                                    <option>Koshi</option>
                                    <option>Madhesh</option>
                                    <option>Bagmati</option>
                                    <option>Gandaki</option>
                                    <option>Lumbini</option>
                                    <option>Karnali</option>
                                    <option>Sudurpashchim</option>
                                </select>
                            </div>
                            <div class="input-group">
                                <label class="required">District</label>
                                <input type="text" />
                            </div>
                        </div>
                        <div class="grid-2">
                            <div class="input-group">
                                <label class="required">Municipality / Gaunpalika</label>
                                <input type="text" />
                            </div>
                            <div class="input-group">
                                <label class="required">Ward No.</label>
                                <input type="number" placeholder="वडा नं." />
                            </div>
                        </div>
                    </div>

                    <!-- Permanent Address -->
                    <div>
                        <div class="section-title">
                            <span>३.</span> Permanent Address — स्थायी ठेगाना
                        </div>
                        <div class="grid-2">
                            <div class="input-group">
                                <label class="required">Province</label>
                                <select>
                                    <option value="">Select Province</option>

                                    <option>Koshi</option>
                                    <option>Madhesh</option>
                                    <option>Bagmati</option>
                                    <option>Gandaki</option>
                                    <option>Lumbini</option>
                                    <option>Karnali</option>
                                    <option>Sudurpashchim</option>
                                </select>
                            </div>
                            <div class="input-group">
                                <label class="required">District</label>
                                <input type="text" />
                            </div>
                        </div>
                        <div class="grid-2">
                            <div class="input-group">
                                <label class="required">Municipality</label>
                                <input type="text" />
                            </div>
                            <div class="input-group">
                                <label class="required">Ward No.</label>
                                <input type="number" placeholder="वडा नं." />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Parents Information -->
            <div class="section-title mt-20">
                <span>४.</span> Parents' Information — बाबु आमाको विवरण
            </div>
            <div class="parents-grid">
                <div class="parent-card father-card">
                    <h5 class="font-bold text-blue-900 text-2xl mb-6 flex items-center gap-3">
                        <i class="fas fa-male"></i>Father's Information
                    </h5>
                    <div class="input-group">
                        <label class="required">Full Name (नेपालीमा)</label>
                        <input type="text" />
                    </div>
                    <div class="input-group">
                        <label>Citizenship Number</label>
                        <input type="text" />
                    </div>
                </div>

                <div class="parent-card mother-card">
                    <h5 class="font-bold text-rose-900 text-2xl mb-6 flex items-center gap-3">
                        <i class="fas fa-female"></i>Mother's Information
                    </h5>
                    <div class="input-group">
                        <label class="required">Full Name (नेपालीमा)</label>
                        <input type="text" />
                    </div>
                    <div class="input-group">
                        <label>Citizenship Number</label>
                        <input type="text" />
                    </div>
                </div>
            </div>

            <!-- Grandparents & Spouse (Optional) -->
            <div class="section-title mt-20">
                <span>५.</span> Additional Information — थप विवरण
            </div>
            <div class="grid-2">
                <div>
                    <label>Paternal Grandfather's Name</label>
                    <input type="text" placeholder="(वंश प्रमाणको लागि)" />
                </div>
                <div>
                    <label>Spouse Name (if married)</label>
                    <input type="text" />
                </div>
            </div>

           <!-- Photo Upload Section - Replace your old photo section with this -->
<div class="section-title mt-20">
    <span>६.</span> Photograph — फोटो
</div>

<div class="photo-upload-area">
    <div class="photo-container">
        <!-- Photo Preview Area -->
        <div id="photoPreview" class="photo-preview">
            <div class="photo-placeholder">
                📸
            </div>
            <p class="preview-text">No photo uploaded yet</p>
        </div>

        <!-- Upload Controls -->
        <div class="upload-controls">
            <input type="file" 
                   id="photoInput" 
                   accept="image/*" 
                   style="display: none;" 
                   onchange="handlePhotoUpload(event)" />
            
            <button type="button" 
                    onclick="document.getElementById('photoInput').click()" 
                    class="upload-btn">
                <i class="fas fa-upload"></i> 
                Upload Passport Size Photo
            </button>

            <div class="photo-info">
                <p><strong>Requirements:</strong></p>
                <ul>
                    <li>Size: 3.5 × 4.5 cm (Passport Size)</li>
                    <li>Background: White only</li>
                    <li>Recent photo (within last 3 months)</li>
                    <li>Maximum file size: 2 MB</li>
                    <li>Format: JPG, JPEG or PNG</li>
                </ul>
            </div>
        </div>
    </div>
</div>

<!-- Add this CSS for responsive photo upload (add inside <style> tag) -->
<style>
    .photo-upload-area {
        max-width: 520px;
        margin: 0 auto;
        padding: 20px;
    }

    .photo-container {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 28px;
        background: #fdf4f4;
        border: 3px dashed #DC143C;
        border-radius: 24px;
        padding: 45px 35px;
        transition: all 0.3s ease;
    }

    .photo-container:hover {
        background: #fee2e2;
        border-color: #b91c1c;
    }

    .photo-preview {
        text-align: center;
    }

    .photo-placeholder {
        width: 160px;
        height: 200px;
        margin: 0 auto 15px;
        background: white;
        border: 6px solid #e5e7eb;
        border-radius: 16px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 4.5rem;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.12);
        transition: all 0.3s;
    }

    .photo-preview img {
        width: 160px;
        height: 200px;
        object-fit: cover;
        border-radius: 16px;
        border: 6px solid #e5e7eb;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.12);
    }

    .preview-text {
        color: #6b7280;
        font-size: 0.95rem;
        margin: 0;
    }

    .upload-btn {
        background: linear-gradient(to right, #DC143C, #002B7F);
        color: white;
        border: none;
        padding: 16px 32px;
        font-size: 1.1rem;
        font-weight: 600;
        border-radius: 50px;
        cursor: pointer;
        display: flex;
        align-items: center;
        gap: 10px;
        transition: all 0.3s;
        box-shadow: 0 8px 20px rgba(220, 20, 60, 0.3);
    }

    .upload-btn:hover {
        transform: translateY(-3px);
        box-shadow: 0 12px 28px rgba(220, 20, 60, 0.4);
    }

    .photo-info {
        text-align: left;
        background: white;
        padding: 18px 22px;
        border-radius: 14px;
        border: 1px solid #f3e8e8;
        font-size: 0.92rem;
        width: 100%;
    }

    .photo-info ul {
        margin: 10px 0 0 18px;
        padding: 0;
        color: #4b5563;
    }

    .photo-info li {
        margin-bottom: 4px;
    }

    /* Responsive adjustments */
    @media (max-width: 768px) {
        .photo-container {
            padding: 35px 25px;
        }
        
        .photo-placeholder,
        .photo-preview img {
            width: 140px;
            height: 175px;
        }
        
        .upload-btn {
            padding: 14px 28px;
            font-size: 1rem;
        }
    }
</style>

<!-- Add this JavaScript (place before </body> or in your script section) -->
<script>
    function handlePhotoUpload(event) {
        const file = event.target.files[0];
        if (!file) return;

        // Basic validation
        if (file.size > 2 * 1024 * 1024) {
            alert("File size must be less than 2 MB");
            return;
        }

        const allowedTypes = ['image/jpeg', 'image/jpg', 'image/png'];
        if (!allowedTypes.includes(file.type)) {
            alert("Only JPG, JPEG and PNG files are allowed");
            return;
        }

        const reader = new FileReader();
        reader.onload = function (e) {
            const previewContainer = document.getElementById('photoPreview');

            // Replace placeholder with actual image
            previewContainer.innerHTML = `
                <img src="${e.target.result}" alt="Passport Photo Preview" />
                <p class="preview-text" style="margin-top: 12px; color: #10b981; font-weight: 500;">
                    ✓ Photo uploaded successfully
                </p>
            `;
        };
        reader.readAsDataURL(file);
    }

    // Optional: Reset photo function (you can call this if needed)
    function resetPhoto() {
        document.getElementById('photoInput').value = '';
        document.getElementById('photoPreview').innerHTML = `
            <div class="photo-placeholder">📸</div>
            <p class="preview-text">No photo uploaded yet</p>
        `;
    }
</script>

            <!-- Declaration -->
            <div class="declaration-box mt-16">
                <label class="flex items-start gap-6 cursor-pointer">
                    <input type="checkbox" class="mt-2 w-8 h-8 accent-red-600" required />
                    <span class="text-lg text-gray-700">I hereby declare that all the information provided in this application is true and correct to the best of my knowledge and belief.<br>
                        <span class="block mt-4 text-base italic">म घोषणा गर्दछु कि यस निवेदनमा दिइएका सबै जानकारी मेरो ज्ञान र विश्वास अनुसार सत्य र यथार्थ छन् ।</span>
                    </span>
                </label>
            </div>

            <!-- Submit Button -->
            <div class="flex justify-center mt-16">
                <button type="submit" class="btn-submit">
                    Submit Application &nbsp; <i class="fas fa-arrow-right"></i>
                </button>
            </div>

        </div>
    </div>

    <p class="text-center text-gray-500 mt-10 text-sm">
        Fields marked with <span class="text-red-600">*</span> are mandatory.
    </p>

</body>
</html>
