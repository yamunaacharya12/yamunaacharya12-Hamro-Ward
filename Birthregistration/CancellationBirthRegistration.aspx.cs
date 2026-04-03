using System;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;

namespace xyz.Birthregistration
{
    public partial class CancellationBirthRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Page load logic if needed
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                // Basic Validation
                if (string.IsNullOrWhiteSpace(BirthRegNo.Value) ||
                    string.IsNullOrWhiteSpace(FullNameNepali.Value) ||
                    string.IsNullOrWhiteSpace(CancellationReason.Value))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                        "alert('कृपया जन्म दर्ता नं., नाम र रद्द गर्ने कारण भर्नुहोस्!\\nPlease fill Birth Registration Number, Name and Reason!');", true);
                    return;
                }

                // Handle Supporting Document Upload (Mandatory)
                string supportDocPath = "";
                if (SupportDoc.HasFile)
                {
                    string fileExt = Path.GetExtension(SupportDoc.FileName).ToLower();
                    if (fileExt != ".pdf" && fileExt != ".jpg" && fileExt != ".jpeg" && fileExt != ".png")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                            "alert('कागजातको लागि PDF, JPG, JPEG वा PNG मात्र स्वीकार गरिन्छ!');", true);
                        return;
                    }

                    if (SupportDoc.PostedFile.ContentLength > 5 * 1024 * 1024) // 5 MB limit
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                            "alert('कागजातको साइज ५ MB भन्दा कम हुनुपर्छ!');", true);
                        return;
                    }

                    string uploadFolder = Server.MapPath("~/Uploads/BirthCancellation/");
                    if (!Directory.Exists(uploadFolder))
                        Directory.CreateDirectory(uploadFolder);

                    string fileName = "CANCEL_" + Guid.NewGuid().ToString() + fileExt;
                    SupportDoc.SaveAs(uploadFolder + fileName);
                    supportDocPath = "Uploads/BirthCancellation/" + fileName;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                        "alert('कृपया प्रमाण कागजात अपलोड गर्नुहोस्! \\nPlease upload supporting document!');", true);
                    return;
                }

                // Handle Optional Photo Upload
                string photoPath = "";
                if (photoInput.HasFile)
                {
                    string photoExt = Path.GetExtension(photoInput.FileName).ToLower();
                    if (photoExt == ".jpg" || photoExt == ".jpeg" || photoExt == ".png")
                    {
                        if (photoInput.PostedFile.ContentLength <= 2 * 1024 * 1024)
                        {
                            string photoFolder = Server.MapPath("~/Uploads/BirthCancellation/Photos/");
                            if (!Directory.Exists(photoFolder))
                                Directory.CreateDirectory(photoFolder);

                            string photoFileName = "PHOTO_" + Guid.NewGuid().ToString() + photoExt;
                            photoInput.SaveAs(photoFolder + photoFileName);
                            photoPath = "Uploads/BirthCancellation/Photos/" + photoFileName;
                        }
                    }
                }

                // Database Connection String (Please update this)
                string connString = @"Data Source=YOUR_SERVER_NAME;Initial Catalog=YourDatabaseName;Integrated Security=True;";

                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string query = @"INSERT INTO BirthRegistrationCancellations 
                        (BirthRegNo, FullNameNepali, DOB_BS, CancellationReason, Remarks, 
                         SupportDocumentPath, PhotoPath, SubmittedDate, Status)
                        VALUES 
                        (@BirthRegNo, @FullNameNepali, @DOB_BS, @CancellationReason, @Remarks, 
                         @SupportDocumentPath, @PhotoPath, GETDATE(), 'Pending')";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@BirthRegNo", BirthRegNo.Value.Trim());
                        cmd.Parameters.AddWithValue("@FullNameNepali", FullNameNepali.Value.Trim());
                        cmd.Parameters.AddWithValue("@DOB_BS", DOB_BS.Value ?? "");
                        cmd.Parameters.AddWithValue("@CancellationReason", CancellationReason.Value);
                        cmd.Parameters.AddWithValue("@Remarks", Remarks.Value ?? "");

                        cmd.Parameters.AddWithValue("@SupportDocumentPath", supportDocPath);
                        cmd.Parameters.AddWithValue("@PhotoPath", string.IsNullOrEmpty(photoPath) ? (object)DBNull.Value : photoPath);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                // Success Message
                ScriptManager.RegisterStartupScript(this, GetType(), "success",
                    "alert('जन्मदर्ता रद्द गर्ने निवेदन सफलतापूर्वक पेश गरियो!\\nYour application for cancellation of birth registration has been submitted successfully.\\nIt is now under review.'); " +
                    "window.location='CancellationBirthRegistration.aspx';", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "error",
                    $"alert('Error: {HttpUtility.JavaScriptStringEncode(ex.Message)}');", true);
            }
        }
    }
}