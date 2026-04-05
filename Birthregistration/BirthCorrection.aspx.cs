using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
namespace HamroWard.Birthregistration
{
    public partial class BirthCorrection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string currentNameNep = txtCurrentNameNep.Text.Trim();
            string currentNameEng = txtCurrentNameEng.Text.Trim();
            string regNo          = txtRegNo.Text.Trim();
            string mobile         = txtMobile.Text.Trim();
            string currentValue   = txtCurrentValue.Text.Trim();
            string correctValue   = txtCorrectValue.Text.Trim();
            string notes          = txtNotes.Text.Trim();
            var fields = new List<string>();
            if (chkName.Checked)   fields.Add("Name");
            if (chkDOB.Checked)    fields.Add("Date of Birth");
            if (chkParent.Checked) fields.Add("Parent Name");
            if (chkGender.Checked) fields.Add("Gender");
            if (chkOther.Checked)  fields.Add("Other");
            string correctionFields = string.Join(", ", fields);
            string uploadsPath = Server.MapPath("~/Uploads/");
            if (fileOriginalCert.HasFile)   fileOriginalCert.SaveAs(uploadsPath + fileOriginalCert.FileName);
            if (fileSupportingDoc.HasFile)  fileSupportingDoc.SaveAs(uploadsPath + fileSupportingDoc.FileName);
            string token = "BIR-COR-" + DateTime.Now.ToString("yyyyMMddHHmmss");
            string connStr = ConfigurationManager.ConnectionStrings["HamroWardDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = @"INSERT INTO BirthApplications (TokenNumber,ChildNameNep,ChildNameEng,RegNo,Mobile,CorrectionFields,CurrentValue,CorrectValue,Notes,ServiceType,Status,SubmittedDate,LastUpdatedDate)
                               VALUES (@Token,@NameNep,@NameEng,@RegNo,@Mobile,@Fields,@CurrentVal,@CorrectVal,@Notes,'Correction','Pending',GETDATE(),GETDATE())";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@Token",      token);
                    cmd.Parameters.AddWithValue("@NameNep",    currentNameNep);
                    cmd.Parameters.AddWithValue("@NameEng",    currentNameEng);
                    cmd.Parameters.AddWithValue("@RegNo",      regNo);
                    cmd.Parameters.AddWithValue("@Mobile",     mobile);
                    cmd.Parameters.AddWithValue("@Fields",     correctionFields);
                    cmd.Parameters.AddWithValue("@CurrentVal", currentValue);
                    cmd.Parameters.AddWithValue("@CorrectVal", correctValue);
                    cmd.Parameters.AddWithValue("@Notes",      string.IsNullOrEmpty(notes) ? (object)DBNull.Value : notes);
                    conn.Open(); cmd.ExecuteNonQuery();
                }
            }
            Response.Redirect("~/BirthConfirmation.aspx?token=" + token);
        }
    }
}
