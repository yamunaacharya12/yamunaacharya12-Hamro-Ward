using System;
using System.Data.SqlClient;
using System.Configuration;
namespace HamroWard.Birthregistration
{
    public partial class BirthTransfer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string childNameNep    = txtChildNameNep.Text.Trim();
            string childNameEng    = txtChildNameEng.Text.Trim();
            string regNo           = txtRegNo.Text.Trim();
            string dobAD           = txtDOBAD.Text.Trim();
            string mobile          = txtMobile.Text.Trim();
            string oldDistrict     = txtOldDistrict.Text.Trim();
            string oldMunicipality = txtOldMunicipality.Text.Trim();
            string oldWard         = txtOldWard.Text.Trim();
            string newDistrict     = txtNewDistrict.Text.Trim();
            string newMunicipality = txtNewMunicipality.Text.Trim();
            string newWard         = txtNewWard.Text.Trim();
            string uploadsPath     = Server.MapPath("~/Uploads/");
            if (fileOriginalCert.HasFile)   fileOriginalCert.SaveAs(uploadsPath + fileOriginalCert.FileName);
            if (fileMigrationCert.HasFile)  fileMigrationCert.SaveAs(uploadsPath + fileMigrationCert.FileName);
            string token = "BIR-TRF-" + DateTime.Now.ToString("yyyyMMddHHmmss");
            string connStr = ConfigurationManager.ConnectionStrings["HamroWardDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = @"INSERT INTO BirthApplications (TokenNumber,ChildNameNep,ChildNameEng,RegNo,DOBAD,Mobile,OldDistrict,OldMunicipality,OldWardNo,NewDistrict,NewMunicipality,NewWardNo,ServiceType,Status,SubmittedDate,LastUpdatedDate)
                               VALUES (@Token,@ChildNep,@ChildEng,@RegNo,@DOB,@Mobile,@OldDist,@OldMun,@OldWard,@NewDist,@NewMun,@NewWard,'Transfer/Migration','Pending',GETDATE(),GETDATE())";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@Token",   token);
                    cmd.Parameters.AddWithValue("@ChildNep",childNameNep);
                    cmd.Parameters.AddWithValue("@ChildEng",childNameEng);
                    cmd.Parameters.AddWithValue("@RegNo",   regNo);
                    cmd.Parameters.AddWithValue("@DOB",     dobAD);
                    cmd.Parameters.AddWithValue("@Mobile",  mobile);
                    cmd.Parameters.AddWithValue("@OldDist", oldDistrict);
                    cmd.Parameters.AddWithValue("@OldMun",  oldMunicipality);
                    cmd.Parameters.AddWithValue("@OldWard", string.IsNullOrEmpty(oldWard) ? (object)DBNull.Value : int.Parse(oldWard));
                    cmd.Parameters.AddWithValue("@NewDist", newDistrict);
                    cmd.Parameters.AddWithValue("@NewMun",  newMunicipality);
                    cmd.Parameters.AddWithValue("@NewWard", string.IsNullOrEmpty(newWard) ? (object)DBNull.Value : int.Parse(newWard));
                    conn.Open(); cmd.ExecuteNonQuery();
                }
            }
            Response.Redirect("~/BirthConfirmation.aspx?token=" + token);
        }
    }
}
