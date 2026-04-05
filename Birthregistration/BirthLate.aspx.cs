using System;
using System.Data.SqlClient;
using System.Configuration;
namespace HamroWard.Birthregistration
{
    public partial class BirthLate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string childNameNep   = txtChildNameNep.Text.Trim();
            string childNameEng   = txtChildNameEng.Text.Trim();
            string dobAD          = txtDOBAD.Text.Trim();
            string dobBS          = txtDOBBS.Text.Trim();
            string gender         = ddlGender.SelectedValue;
            string fatherNameNep  = txtFatherNameNep.Text.Trim();
            string motherNameNep  = txtMotherNameNep.Text.Trim();
            string fatherCitizenNo= txtFatherCitizenshipNo.Text.Trim();
            string mobile         = txtMobile.Text.Trim();
            string reason         = txtReason.Text.Trim();
            string uploadsPath    = Server.MapPath("~/Uploads/");
            if (fileWitnessLetter.HasFile)     fileWitnessLetter.SaveAs(uploadsPath + fileWitnessLetter.FileName);
            if (fileFatherCitizenship.HasFile) fileFatherCitizenship.SaveAs(uploadsPath + fileFatherCitizenship.FileName);
            if (fileMotherCitizenship.HasFile) fileMotherCitizenship.SaveAs(uploadsPath + fileMotherCitizenship.FileName);
            if (fileSchoolDoc.HasFile)         fileSchoolDoc.SaveAs(uploadsPath + fileSchoolDoc.FileName);
            string token = "BIR-LATE-" + DateTime.Now.ToString("yyyyMMddHHmmss");
            string connStr = ConfigurationManager.ConnectionStrings["HamroWardDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = @"INSERT INTO BirthApplications (TokenNumber,ChildNameNep,ChildNameEng,DOBAD,DOBBS,Gender,FatherNameNep,MotherNameNep,FatherCitizenshipNo,Mobile,Reason,ServiceType,Status,SubmittedDate,LastUpdatedDate)
                               VALUES (@Token,@ChildNameNep,@ChildNameEng,@DOBAD,@DOBBS,@Gender,@FatherNep,@MotherNep,@FatherCitizenNo,@Mobile,@Reason,'Late Registration','Pending',GETDATE(),GETDATE())";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@Token",          token);
                    cmd.Parameters.AddWithValue("@ChildNameNep",   childNameNep);
                    cmd.Parameters.AddWithValue("@ChildNameEng",   childNameEng);
                    cmd.Parameters.AddWithValue("@DOBAD",          dobAD);
                    cmd.Parameters.AddWithValue("@DOBBS",          dobBS);
                    cmd.Parameters.AddWithValue("@Gender",         gender);
                    cmd.Parameters.AddWithValue("@FatherNep",      fatherNameNep);
                    cmd.Parameters.AddWithValue("@MotherNep",      motherNameNep);
                    cmd.Parameters.AddWithValue("@FatherCitizenNo",fatherCitizenNo);
                    cmd.Parameters.AddWithValue("@Mobile",         mobile);
                    cmd.Parameters.AddWithValue("@Reason",         reason);
                    conn.Open(); cmd.ExecuteNonQuery();
                }
            }
            Response.Redirect("~/BirthConfirmation.aspx?token=" + token);
        }
    }
}
