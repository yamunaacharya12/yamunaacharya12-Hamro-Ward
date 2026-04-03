<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MigrationRegistrationCopy.aspx.cs" Inherits="HamroWard.Migrationregistration.MigrationRegistrationCopy" %>

<!DOCTYPE html>
<html lang="ne">
<head runat="server">
    <meta charset="utf-8" />
    <title>प्रवास दर्ता प्रतिलिपि</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Noto+Sans+Devanagari:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter','Noto Sans Devanagari', sans-serif;
            background: linear-gradient(to bottom,#f1f5f9,#e0e7ff);
            margin: 0;
            padding: 0;
        }

        /* HEADER */
        .header {
            background: linear-gradient(135deg,#DC143C,#002B7F);
            color: white;
            padding: 40px 20px;
            text-align: center;
        }

        .header h1 { margin: 0; font-size: 1.2rem; text-transform: uppercase; letter-spacing: 2px; }
        .header h2 { margin-top: 10px; font-size: 2rem; }

        /* CARD */
        .card {
            max-width: 1000px;
            margin: -30px auto 50px; /* Pulls card slightly into header */
            background: white;
            border-radius: 20px;
            padding: 50px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.1);
        }

        /* TITLES */
        .section-title {
            font-size: 1.4rem;
            font-weight: bold;
            color: #002B7F;
            border-bottom: 3px solid #DC143C;
            padding-bottom: 8px;
            margin-top: 30px;
            margin-bottom: 25px;
        }

        /* FORM SPACING */
        form {
            display: flex;
            flex-direction: column;
            gap: 15px; /* Adds consistent gap between all rows */
        }

        /* INPUT GROUP */
        .input-group {
            display: flex;
            flex-direction: column;
            gap: 8px; /* Adds gap between Label and Input */
            margin-bottom: 5px;
        }

        label {
            font-weight: 600;
            color: #374151;
            font-size: 0.95rem;
        }

        input, select {
            width: 100%;
            padding: 12px 15px;
            border-radius: 10px;
            border: 2px solid #e5e7eb;
            font-size: 1rem;
            transition: all 0.3s ease;
            box-sizing: border-box; /* Crucial for padding */
        }

        input:focus, select:focus {
            outline: none;
            border-color: #002B7F;
            box-shadow: 0 0 0 4px rgba(0, 43, 127, 0.1);
        }

        /* FILE UPLOAD CUSTOM */
        .file-upload-wrapper {
            background: #f9fafb;
            padding: 15px;
            border: 2px dashed #d1d5db;
            border-radius: 10px;
        }

        /* GRID */
        .grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 25px; /* Consistent gap between columns */
        }

        /* BUTTON */
        .btn-submit {
            background: linear-gradient(to right,#DC143C,#002B7F);
            color: white;
            padding: 16px;
            border: none;
            border-radius: 12px;
            font-size: 18px;
            font-weight: 600;
            width: 100%;
            margin-top: 30px;
            cursor: pointer;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(220, 20, 60, 0.3);
        }

        /* MOBILE */
        @media(max-width:768px) {
            .grid { grid-template-columns: 1fr; gap: 15px; }
            .card { padding: 25px; margin: 20px; }
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Government of Nepal</h1>
        <h2>प्रवास दर्ता प्रतिलिपि (Migration Copy)</h2>
    </div>

    <div class="card">
        <form runat="server">
            
            <div class="section-title" style="margin-top:0;">Applicant Details</div>
            <div class="grid">
                <div class="input-group">
                    <label>Full Name</label>
                    <input type="text" runat="server" id="FullName" placeholder="Enter full name" />
                </div>

                <div class="input-group">
                    <label>Citizenship No</label>
                    <input type="text" runat="server" id="CitizenshipNo" placeholder="XX-XX-XX-XXXXX" />
                </div>

                <div class="input-group">
                    <label>Migration Certificate No</label>
                    <input type="text" runat="server" id="MigrationCertNo" placeholder="Enter certificate number" />
                </div>

                <div class="input-group">
                    <label>Phone Number</label>
                    <input type="text" runat="server" id="Phone" placeholder="98XXXXXXXX" />
                </div>
            </div>

            <div class="section-title">Migration Details</div>
            <div class="grid">
                <div class="input-group">
                    <label>From Address</label>
                    <input type="text" runat="server" id="FromAddress" placeholder="Previous address" />
                </div>

                <div class="input-group">
                    <label>To Address</label>
                    <input type="text" runat="server" id="ToAddress" placeholder="Current address" />
                </div>
            </div>

            <div class="grid">
                <div class="input-group">
                    <label>Reason for Duplicate Copy</label>
                    <select runat="server" id="CopyReason">
                        <option value="Lost">Lost</option>
                        <option value="Damaged">Damaged</option>
                        <option value="Other">Other</option>
                    </select>
                </div>

                <div class="input-group">
                    <label>Upload Identification Document (PDF)</label>
                    <div class="file-upload-wrapper">
                        <asp:FileUpload ID="DocumentUpload" runat="server" />
                    </div>
                </div>
            </div>

            <asp:Button ID="btnSubmit" runat="server" Text="Submit Application"
                CssClass="btn-submit" OnClick="BtnSubmit_Click" />
        </form>
    </div>
</body>
</html>