using System;
using System.Data.SqlClient;
using System.Configuration;

namespace HamroWard.CitizenshipRegistration
{
    public partial class CitizenshipTransfer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string nameNep        = txtNameNep.Text.Trim();
            string nameEng        = txtNameEng.Text.Trim();
            string citizenshipNo  = txtCitizenshipNo.Text.Trim();
            string dobAD          = txtDOBAD.Text.Trim();
            string mobile         = txtMobile.Text.Trim();
            string migrationDate  = txtMigrationDate.Text.Trim();

            string oldDistrict    = txtOldDistrict.Text.Trim();
            string oldMunicipality= txtOldMunicipality.Text.Trim();
            string oldWard        = txtOldWard.Text.Trim();
            string oldTole        = txtOldTole.Text.Trim();

            string newDistrict    = txtNewDistrict.Text.Trim();
            string newMunicipality= txtNewMunicipality.Text.Trim();
            string newWard        = txtNewWard.Text.Trim();
            string newTole        = txtNewTole.Text.Trim();

            string uploadsPath = Server.MapPath("~/Uploads/");
            if (fileCitizenship.HasFile)   fileCitizenship.SaveAs(uploadsPath + fileCitizenship.FileName);
            if (fileMigrationCert.HasFile) fileMigrationCert.SaveAs(uploadsPath + fileMigrationCert.FileName);
            if (filePhoto.HasFile)         filePhoto.SaveAs(uploadsPath + filePhoto.FileName);
            if (fileRelationCert.HasFile)  fileRelationCert.SaveAs(uploadsPath + fileRelationCert.FileName);

            string token = "CIT-TRF-" + DateTime.Now.ToString("yyyyMMddHHmmss");

            string connStr = ConfigurationManager.ConnectionStrings["HamroWardDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = @"INSERT INTO CitizenshipApplications
                                (TokenNumber, ApplicantNameNep, ApplicantNameEng, CitizenshipNo, DOBAD, Mobile,
                                 MigrationDate,
                                 OldDistrict, OldMunicipality, OldWardNo, OldTole,
                                 NewDistrict, NewMunicipality, NewWardNo, NewTole,
                                 ServiceType, Status, SubmittedDate, LastUpdatedDate)
                               VALUES
                                (@Token, @NameNep, @NameEng, @CitizenshipNo, @DOB, @Mobile,
                                 @MigrationDate,
                                 @OldDistrict, @OldMunicipality, @OldWard, @OldTole,
                                 @NewDistrict, @NewMunicipality, @NewWard, @NewTole,
                                 'Transfer/Migration', 'Pending', GETDATE(), GETDATE())";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@Token",          token);
                    cmd.Parameters.AddWithValue("@NameNep",        nameNep);
                    cmd.Parameters.AddWithValue("@NameEng",        nameEng);
                    cmd.Parameters.AddWithValue("@CitizenshipNo",  citizenshipNo);
                    cmd.Parameters.AddWithValue("@DOB",            dobAD);
                    cmd.Parameters.AddWithValue("@Mobile",         mobile);
                    cmd.Parameters.AddWithValue("@MigrationDate",  migrationDate);
                    cmd.Parameters.AddWithValue("@OldDistrict",    oldDistrict);
                    cmd.Parameters.AddWithValue("@OldMunicipality",oldMunicipality);
                    cmd.Parameters.AddWithValue("@OldWard",        string.IsNullOrEmpty(oldWard) ? (object)DBNull.Value : int.Parse(oldWard));
                    cmd.Parameters.AddWithValue("@OldTole",        oldTole);
                    cmd.Parameters.AddWithValue("@NewDistrict",    newDistrict);
                    cmd.Parameters.AddWithValue("@NewMunicipality",newMunicipality);
                    cmd.Parameters.AddWithValue("@NewWard",        string.IsNullOrEmpty(newWard) ? (object)DBNull.Value : int.Parse(newWard));
                    cmd.Parameters.AddWithValue("@NewTole",        newTole);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            Response.Redirect("~/CitizenshipConfirmation.aspx?token=" + token);
        }
    }
}
