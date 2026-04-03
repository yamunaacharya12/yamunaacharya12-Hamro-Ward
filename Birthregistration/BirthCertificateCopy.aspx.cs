using System;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;

namespace xyz.Birthregistration
{
    public partial class BirthCertificateCopy : System.Web.UI.Page
    {
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(BirthRegNo.Value) ||
                    string.IsNullOrWhiteSpace(PersonFullName.Value))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                        "alert('जन्म दर्ता नं. र व्यक्तिको नाम अनिवार्य छ!');", true);
                    return;
                }

                // Identity Document (Mandatory)
                string identityDocPath = "";
                if (IdentityDoc.HasFile)
                {
                    string ext = Path.GetExtension(IdentityDoc.FileName).ToLower();
                    if (ext != ".pdf" && ext != ".jpg" && ext != ".jpeg" && ext != ".png")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                            "alert('कागजात PDF, JPG, JPEG वा PNG मात्र हुनुपर्छ!');", true);
                        return;
                    }

                    if (IdentityDoc.PostedFile.ContentLength > 5 * 1024 * 1024)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                            "alert('कागजात ५ MB भन्दा कम हुनुपर्छ!');", true);
                        return;
                    }

                    string folder = Server.MapPath("~/Uploads/BirthCertificateCopy/");
                    if (!Directory.Exists(folder)) Directory.CreateDirectory(folder);

                    string fileName = "COPY_" + Guid.NewGuid().ToString() + ext;
                    IdentityDoc.SaveAs(folder + fileName);
                    identityDocPath = "Uploads/BirthCertificateCopy/" + fileName;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                        "alert('कृपया पहिचान प्रमाण कागजात अपलोड गर्नुहोस्!');", true);
                    return;
                }

                // Optional Photo
                string photoPath = "";
                if (photoInput.HasFile)
                {
                    string ext = Path.GetExtension(photoInput.FileName).ToLower();
                    if (ext == ".jpg" || ext == ".jpeg" || ext == ".png")
                    {
                        string folder = Server.MapPath("~/Uploads/BirthCertificateCopy/Photos/");
                        if (!Directory.Exists(folder)) Directory.CreateDirectory(folder);
                        string fileName = "PHOTO_" + Guid.NewGuid().ToString() + ext;
                        photoInput.SaveAs(folder + fileName);
                        photoPath = "Uploads/BirthCertificateCopy/Photos/" + fileName;
                    }
                }

                // Save to Database
                string connString = @"Data Source=YOUR_SERVER;Initial Catalog=YourDatabase;Integrated Security=True;";

                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string query = @"INSERT INTO BirthCertificateCopyRequests 
                        (ApplicantName, Relationship, BirthRegNo, PersonFullName, DOB_BS, BirthDistrict, 
                         Purpose, IdentityDocPath, PhotoPath, SubmittedDate, Status)
                        VALUES 
                        (@ApplicantName, @Relationship, @BirthRegNo, @PersonFullName, @DOB_BS, @BirthDistrict, 
                         @Purpose, @IdentityDocPath, @PhotoPath, GETDATE(), 'Pending')";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@ApplicantName", ApplicantName.Value.Trim());
                        cmd.Parameters.AddWithValue("@Relationship", Relationship.Value);
                        cmd.Parameters.AddWithValue("@BirthRegNo", BirthRegNo.Value.Trim());
                        cmd.Parameters.AddWithValue("@PersonFullName", PersonFullName.Value.Trim());
                        cmd.Parameters.AddWithValue("@DOB_BS", DOB_BS.Value ?? "");
                        cmd.Parameters.AddWithValue("@BirthDistrict", BirthDistrict.Value ?? "");
                        cmd.Parameters.AddWithValue("@Purpose", Purpose.Value);

                        cmd.Parameters.AddWithValue("@IdentityDocPath", identityDocPath);
                        cmd.Parameters.AddWithValue("@PhotoPath", string.IsNullOrEmpty(photoPath) ? (object)DBNull.Value : photoPath);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                ScriptManager.RegisterStartupScript(this, GetType(), "success",
                    "alert('जन्मदर्ता प्रमाणपत्र प्रतिलिपिको निवेदन सफलतापूर्वक पेश गरियो!\\nYour application for copy of birth certificate has been submitted successfully.'); " +
                    "window.location='BirthCertificateCopy.aspx';", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "error",
                    $"alert('Error: {HttpUtility.JavaScriptStringEncode(ex.Message)}');", true);
            }
        }
    }
}