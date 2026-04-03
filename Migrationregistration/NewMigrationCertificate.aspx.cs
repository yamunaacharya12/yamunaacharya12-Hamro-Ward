using System;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;

namespace xyz.Birthregistration
{
    public partial class NewMigrationCertificate : System.Web.UI.Page
    {
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(ApplicantName.Value) ||
                    string.IsNullOrWhiteSpace(CitizenshipNo.Value) ||
                    string.IsNullOrWhiteSpace(PermanentAddress.Value))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                        "alert('निवेदकको नाम, नागरिकता नं. र पुरानो ठेगाना भर्नुहोस्!');", true);
                    return;
                }

                // Proof Document Upload
                string proofDocPath = "";
                if (ProofDoc.HasFile)
                {
                    string ext = Path.GetExtension(ProofDoc.FileName).ToLower();
                    if (ext != ".pdf" && ext != ".jpg" && ext != ".jpeg" && ext != ".png")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                            "alert('कागजात PDF, JPG, JPEG वा PNG मात्र हुनुपर्छ!');", true);
                        return;
                    }

                    string folder = Server.MapPath("~/Uploads/MigrationCertificate/");
                    if (!Directory.Exists(folder)) Directory.CreateDirectory(folder);

                    string fileName = "MIGRATION_" + Guid.NewGuid().ToString() + ext;
                    ProofDoc.SaveAs(folder + fileName);
                    proofDocPath = "Uploads/MigrationCertificate/" + fileName;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                        "alert('कृपया बसोबास प्रमाण कागजात अपलोड गर्नुहोस्!');", true);
                    return;
                }

                // Optional Photo
                string photoPath = "";
                if (photoInput.HasFile)
                {
                    string ext = Path.GetExtension(photoInput.FileName).ToLower();
                    if (ext == ".jpg" || ext == ".jpeg" || ext == ".png")
                    {
                        string folder = Server.MapPath("~/Uploads/MigrationCertificate/Photos/");
                        if (!Directory.Exists(folder)) Directory.CreateDirectory(folder);

                        string fileName = "PHOTO_" + Guid.NewGuid().ToString() + ext;
                        photoInput.SaveAs(folder + fileName);
                        photoPath = "Uploads/MigrationCertificate/Photos/" + fileName;
                    }
                }

                // Database Save
                string connString = @"Data Source=YOUR_SERVER_NAME;Initial Catalog=YourDatabaseName;Integrated Security=True;";

                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string query = @"INSERT INTO MigrationCertificateRequests 
                        (ApplicantName, CitizenshipNo, PermanentAddress, CurrentAddress, 
                         MigrationDateBS, MigrationReason, Remarks, ProofDocPath, PhotoPath, 
                         SubmittedDate, Status)
                        VALUES 
                        (@ApplicantName, @CitizenshipNo, @PermanentAddress, @CurrentAddress, 
                         @MigrationDateBS, @MigrationReason, @Remarks, @ProofDocPath, @PhotoPath, 
                         GETDATE(), 'Pending')";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@ApplicantName", ApplicantName.Value.Trim());
                        cmd.Parameters.AddWithValue("@CitizenshipNo", CitizenshipNo.Value.Trim());
                        cmd.Parameters.AddWithValue("@PermanentAddress", PermanentAddress.Value.Trim());
                        cmd.Parameters.AddWithValue("@CurrentAddress", CurrentAddress.Value.Trim());
                        cmd.Parameters.AddWithValue("@MigrationDateBS", MigrationDateBS.Value ?? "");
                        cmd.Parameters.AddWithValue("@MigrationReason", MigrationReason.Value);
                        cmd.Parameters.AddWithValue("@Remarks", Remarks.Value ?? "");

                        cmd.Parameters.AddWithValue("@ProofDocPath", proofDocPath);
                        cmd.Parameters.AddWithValue("@PhotoPath", string.IsNullOrEmpty(photoPath) ? (object)DBNull.Value : photoPath);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                ScriptManager.RegisterStartupScript(this, GetType(), "success",
                    "alert('प्रवास प्रमाणपत्रको निवेदन सफलतापूर्वक पेश गरियो!'); window.location='NewMigrationCertificate.aspx';", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "error",
                    $"alert('Error: {HttpUtility.JavaScriptStringEncode(ex.Message)}');", true);
            }
        }
    }
}