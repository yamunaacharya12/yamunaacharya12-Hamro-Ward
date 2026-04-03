using System;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;

namespace xyz.Birthregistration
{
    public partial class NewBirthRegistration : System.Web.UI.Page
    {
        // Fixed method name: PascalCase (to remove naming violation warning)
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                // Validation - using correct control IDs from .aspx
                if (string.IsNullOrWhiteSpace(ChildFullNameNepali.Value) ||
                    string.IsNullOrWhiteSpace(FatherName.Value) ||
                    string.IsNullOrWhiteSpace(MotherName.Value))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                        "alert('कृपया बालकको नाम, बुवा र आमाको नाम अनिवार्य रूपमा भर्नुहोस्!');", true);
                    return;
                }

                // Birth Proof Document
                string birthProofPath = "";
                if (BirthProofDoc.HasFile)
                {
                    string ext = Path.GetExtension(BirthProofDoc.FileName).ToLower();
                    if (ext != ".pdf" && ext != ".jpg" && ext != ".jpeg" && ext != ".png")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                            "alert('कागजात PDF, JPG, JPEG वा PNG मात्र स्वीकार गरिन्छ!');", true);
                        return;
                    }

                    string folder = Server.MapPath("~/Uploads/NewBirthRegistration/");
                    if (!Directory.Exists(folder)) Directory.CreateDirectory(folder);

                    string fileName = "NEWBIRTH_" + Guid.NewGuid().ToString() + ext;
                    BirthProofDoc.SaveAs(folder + fileName);
                    birthProofPath = "Uploads/NewBirthRegistration/" + fileName;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                        "alert('कृपया जन्म प्रमाण कागजात अपलोड गर्नुहोस्!');", true);
                    return;
                }

                // Optional Photo
                string photoPath = "";
                if (photoInput.HasFile)
                {
                    string ext = Path.GetExtension(photoInput.FileName).ToLower();
                    if (ext == ".jpg" || ext == ".jpeg" || ext == ".png")
                    {
                        string folder = Server.MapPath("~/Uploads/NewBirthRegistration/Photos/");
                        if (!Directory.Exists(folder)) Directory.CreateDirectory(folder);
                        string fileName = "PHOTO_" + Guid.NewGuid().ToString() + ext;
                        photoInput.SaveAs(folder + fileName);
                        photoPath = "Uploads/NewBirthRegistration/Photos/" + fileName;
                    }
                }

                // Database Save
                string connString = "Your_Connection_String_Here";   // ← Update this

                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string query = @"INSERT INTO NewBirthRegistrations 
                        (ChildFullNameNepali, ChildNameEnglish, Gender, DOB_BS, DOB_AD, 
                         BirthDistrict, BirthMunicipality, FatherName, FatherCitizenshipNo, 
                         MotherName, MotherCitizenshipNo, HospitalName, BirthProofPath, 
                         PhotoPath, SubmittedDate, Status)
                        VALUES 
                        (@ChildFullNameNepali, @ChildNameEnglish, @Gender, @DOB_BS, @DOB_AD, 
                         @BirthDistrict, @BirthMunicipality, @FatherName, @FatherCitizenshipNo, 
                         @MotherName, @MotherCitizenshipNo, @HospitalName, @BirthProofPath, 
                         @PhotoPath, GETDATE(), 'Pending')";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@ChildFullNameNepali", ChildFullNameNepali.Value.Trim());
                        cmd.Parameters.AddWithValue("@ChildNameEnglish", ChildNameEnglish.Value ?? "");
                        cmd.Parameters.AddWithValue("@Gender", Gender.Value ?? "");
                        cmd.Parameters.AddWithValue("@DOB_BS", DOB_BS.Value ?? "");
                        cmd.Parameters.AddWithValue("@DOB_AD", DOB_AD.Value);
                        cmd.Parameters.AddWithValue("@BirthDistrict", BirthDistrict.Value ?? "");
                        cmd.Parameters.AddWithValue("@BirthMunicipality", BirthMunicipality.Value ?? "");
                        cmd.Parameters.AddWithValue("@FatherName", FatherName.Value.Trim());
                        cmd.Parameters.AddWithValue("@FatherCitizenshipNo", FatherCitizenshipNo.Value ?? "");
                        cmd.Parameters.AddWithValue("@MotherName", MotherName.Value.Trim());
                        cmd.Parameters.AddWithValue("@MotherCitizenshipNo", MotherCitizenshipNo.Value ?? "");
                        cmd.Parameters.AddWithValue("@HospitalName", HospitalName.Value ?? "");
                        cmd.Parameters.AddWithValue("@BirthProofPath", birthProofPath);
                        cmd.Parameters.AddWithValue("@PhotoPath", string.IsNullOrEmpty(photoPath) ? (object)DBNull.Value : photoPath);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                ScriptManager.RegisterStartupScript(this, GetType(), "success",
                    "alert('नयाँ जन्मदर्ता सफलतापूर्वक दर्ता गरियो!'); window.location='NewBirthRegistration.aspx';", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "error",
                    $"alert('Error: {HttpUtility.JavaScriptStringEncode(ex.Message)}');", true);
            }
        }
    }
}