using System;
using System.Data.SqlClient;
using System.Configuration;
namespace HamroWard.Birthregistration
{
    public partial class BirthCopy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string childNameNep  = txtChildNameNep.Text.Trim();
            string childNameEng  = txtChildNameEng.Text.Trim();
            string regNo         = txtRegNo.Text.Trim();
            string dobAD         = txtDOBAD.Text.Trim();
            string mobile        = txtMobile.Text.Trim();
            int    copies        = int.Parse(ddlCopies.SelectedValue);
            string purpose       = ddlPurpose.SelectedValue;
            string uploadsPath   = Server.MapPath("~/Uploads/");
            if (fileOriginalCert.HasFile) fileOriginalCert.SaveAs(uploadsPath + fileOriginalCert.FileName);
            if (filePhoto.HasFile)        filePhoto.SaveAs(uploadsPath + filePhoto.FileName);
            string token = "BIR-COPY-" + DateTime.Now.ToString("yyyyMMddHHmmss");
            string connStr = ConfigurationManager.ConnectionStrings["HamroWardDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = @"INSERT INTO BirthApplications (TokenNumber,ChildNameNep,ChildNameEng,RegNo,DOBAD,Mobile,CopiesRequired,Purpose,ServiceType,Status,SubmittedDate,LastUpdatedDate)
                               VALUES (@Token,@ChildNameNep,@ChildNameEng,@RegNo,@DOB,@Mobile,@Copies,@Purpose,'Certified Copy','Pending',GETDATE(),GETDATE())";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@Token",       token);
                    cmd.Parameters.AddWithValue("@ChildNameNep",childNameNep);
                    cmd.Parameters.AddWithValue("@ChildNameEng",childNameEng);
                    cmd.Parameters.AddWithValue("@RegNo",       regNo);
                    cmd.Parameters.AddWithValue("@DOB",         dobAD);
                    cmd.Parameters.AddWithValue("@Mobile",      mobile);
                    cmd.Parameters.AddWithValue("@Copies",      copies);
                    cmd.Parameters.AddWithValue("@Purpose",     purpose);
                    conn.Open(); cmd.ExecuteNonQuery();
                }
            }
            Response.Redirect("~/BirthConfirmation.aspx?token=" + token);
        }
    }
}
