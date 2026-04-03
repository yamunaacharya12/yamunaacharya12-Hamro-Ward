using System;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;

namespace xyz.Birthregistration
{
    public partial class AmendmentBirthRegistration : System.Web.UI.Page
    {
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(BirthRegNo.Value) || string.IsNullOrWhiteSpace(CorrectFullName.Value))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                        "alert('Please fill Birth Registration Number and Correct Name!');", true);
                    return;
                }

                // Supporting Document
                string supportDocPath = "";
                if (SupportDoc.HasFile)
                {
                    string ext = Path.GetExtension(SupportDoc.FileName).ToLower();
                    if (ext != ".pdf" && ext != ".jpg" && ext != ".jpeg" && ext != ".png")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                            "alert('Only PDF, JPG, JPEG, PNG allowed!');", true);
                        return;
                    }

                    string folder = Server.MapPath("~/Uploads/BirthAmendment/");
                    if (!Directory.Exists(folder)) Directory.CreateDirectory(folder);

                    string fileName = "AMEND_" + Guid.NewGuid() + ext;
                    SupportDoc.SaveAs(folder + fileName);
                    supportDocPath = "Uploads/BirthAmendment/" + fileName;
                }

                // Optional Photo
                string photoPath = "";
                if (photoInput.HasFile)
                {
                    string ext = Path.GetExtension(photoInput.FileName).ToLower();
                    if (ext == ".jpg" || ext == ".jpeg" || ext == ".png")
                    {
                        string folder = Server.MapPath("~/Uploads/BirthAmendment/Photos/");
                        if (!Directory.Exists(folder)) Directory.CreateDirectory(folder);
                        string fileName = "PHOTO_" + Guid.NewGuid() + ext;
                        photoInput.SaveAs(folder + fileName);
                        photoPath = "Uploads/BirthAmendment/Photos/" + fileName;
                    }
                }

                // Save to Database (Update your connection string)
                string connString = "Your_Connection_String_Here";

                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string sql = @"INSERT INTO BirthRegistrationAmendments 
                        (BirthRegNo, CorrectionReason, CurrentFullName, CurrentDOB_BS, CorrectFullName, 
                         CorrectDOB_BS, CorrectGender, SupportDocumentPath, PhotoPath, SubmittedDate, Status)
                        VALUES 
                        (@BirthRegNo, @CorrectionReason, @CurrentFullName, @CurrentDOB_BS, @CorrectFullName, 
                         @CorrectDOB_BS, @CorrectGender, @SupportDocumentPath, @PhotoPath, GETDATE(), 'Pending')";

                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@BirthRegNo", BirthRegNo.Value);
                        cmd.Parameters.AddWithValue("@CorrectionReason", CorrectionReason.Value);
                        cmd.Parameters.AddWithValue("@CurrentFullName", CurrentFullName.Value ?? "");
                        cmd.Parameters.AddWithValue("@CurrentDOB_BS", CurrentDOB_BS.Value ?? "");
                        cmd.Parameters.AddWithValue("@CorrectFullName", CorrectFullName.Value);
                        cmd.Parameters.AddWithValue("@CorrectDOB_BS", CorrectDOB_BS.Value);
                        cmd.Parameters.AddWithValue("@CorrectGender", CorrectGender.Value ?? "");
                        cmd.Parameters.AddWithValue("@SupportDocumentPath", supportDocPath);
                        cmd.Parameters.AddWithValue("@PhotoPath", string.IsNullOrEmpty(photoPath) ? (object)DBNull.Value : photoPath);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                ScriptManager.RegisterStartupScript(this, GetType(), "success",
                    "alert('Application submitted successfully!'); window.location='AmendmentBirthRegistration.aspx';", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "error",
                    $"alert('Error: {HttpUtility.JavaScriptStringEncode(ex.Message)}');", true);
            }
        }
    }
}