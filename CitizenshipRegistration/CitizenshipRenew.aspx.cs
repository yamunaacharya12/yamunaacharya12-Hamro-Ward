using System;
using System.Data.SqlClient;
using System.Configuration;

namespace HamroWard.CitizenshipRegistration
{
    public partial class CitizenshipRenew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string renewType      = rbLost.Checked ? "Lost" : rbDamaged.Checked ? "Damaged" : "Renew";
            string nameNep        = txtNameNep.Text.Trim();
            string nameEng        = txtNameEng.Text.Trim();
            string oldCitizenNo   = txtOldCitizenshipNo.Text.Trim();
            string dobAD          = txtDOBAD.Text.Trim();
            string mobile         = txtMobile.Text.Trim();
            string reason         = txtReason.Text.Trim();
            string policeReport   = txtPoliceReport.Text.Trim();

            string uploadsPath = Server.MapPath("~/Uploads/");
            if (filePhoto.HasFile)          filePhoto.SaveAs(uploadsPath + filePhoto.FileName);
            if (fileOldCitizenship.HasFile) fileOldCitizenship.SaveAs(uploadsPath + fileOldCitizenship.FileName);
            if (filePoliceReport.HasFile)   filePoliceReport.SaveAs(uploadsPath + filePoliceReport.FileName);
            if (fileBirth.HasFile)          fileBirth.SaveAs(uploadsPath + fileBirth.FileName);

            string token = "CIT-RNW-" + DateTime.Now.ToString("yyyyMMddHHmmss");

            string connStr = ConfigurationManager.ConnectionStrings["HamroWardDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = @"INSERT INTO CitizenshipApplications
                                (TokenNumber, ApplicantNameNep, ApplicantNameEng, CitizenshipNo, DOBAD,
                                 Mobile, RenewType, Reason, PoliceReportNo, ServiceType, Status, SubmittedDate, LastUpdatedDate)
                               VALUES
                                (@Token, @NameNep, @NameEng, @OldCitizenNo, @DOB,
                                 @Mobile, @RenewType, @Reason, @PoliceReport, 'Renew/Replace', 'Pending', GETDATE(), GETDATE())";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@Token",        token);
                    cmd.Parameters.AddWithValue("@NameNep",      nameNep);
                    cmd.Parameters.AddWithValue("@NameEng",      nameEng);
                    cmd.Parameters.AddWithValue("@OldCitizenNo", oldCitizenNo);
                    cmd.Parameters.AddWithValue("@DOB",          dobAD);
                    cmd.Parameters.AddWithValue("@Mobile",       mobile);
                    cmd.Parameters.AddWithValue("@RenewType",    renewType);
                    cmd.Parameters.AddWithValue("@Reason",       reason);
                    cmd.Parameters.AddWithValue("@PoliceReport", string.IsNullOrEmpty(policeReport) ? (object)DBNull.Value : policeReport);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            Response.Redirect("~/CitizenshipConfirmation.aspx?token=" + token);
        }
    }
}
