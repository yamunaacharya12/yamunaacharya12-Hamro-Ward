using System;
using System.Data.SqlClient;
using System.Configuration;

namespace HamroWard.CitizenshipRegistration
{
    public partial class CitizenshipCorrection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string currentNameNep  = txtCurrentNameNep.Text.Trim();
            string currentNameEng  = txtCurrentNameEng.Text.Trim();
            string citizenshipNo   = txtCitizenshipNo.Text.Trim();
            string mobile          = txtMobile.Text.Trim();
            string currentValue    = txtCurrentValue.Text.Trim();
            string correctValue    = txtCorrectValue.Text.Trim();
            string notes           = txtNotes.Text.Trim();

            // Build a comma-separated list of fields to correct
            System.Collections.Generic.List<string> fields = new System.Collections.Generic.List<string>();
            if (chkName.Checked)       fields.Add("Name");
            if (chkDOB.Checked)        fields.Add("Date of Birth");
            if (chkAddress.Checked)    fields.Add("Address");
            if (chkParentName.Checked) fields.Add("Parent Name");
            if (chkGender.Checked)     fields.Add("Gender");
            if (chkOther.Checked)      fields.Add("Other");
            string correctionFields = string.Join(", ", fields);

            string uploadsPath = Server.MapPath("~/Uploads/");
            if (fileCurrentCitizenship.HasFile) fileCurrentCitizenship.SaveAs(uploadsPath + fileCurrentCitizenship.FileName);
            if (fileSupportingDoc.HasFile)      fileSupportingDoc.SaveAs(uploadsPath + fileSupportingDoc.FileName);
            if (filePhoto.HasFile)              filePhoto.SaveAs(uploadsPath + filePhoto.FileName);

            string token = "CIT-COR-" + DateTime.Now.ToString("yyyyMMddHHmmss");

            string connStr = ConfigurationManager.ConnectionStrings["HamroWardDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = @"INSERT INTO CitizenshipApplications
                                (TokenNumber, ApplicantNameNep, ApplicantNameEng, CitizenshipNo, Mobile,
                                 CorrectionFields, CurrentValue, CorrectValue, Notes,
                                 ServiceType, Status, SubmittedDate, LastUpdatedDate)
                               VALUES
                                (@Token, @NameNep, @NameEng, @CitizenshipNo, @Mobile,
                                 @CorrectionFields, @CurrentValue, @CorrectValue, @Notes,
                                 'Correction', 'Pending', GETDATE(), GETDATE())";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@Token",            token);
                    cmd.Parameters.AddWithValue("@NameNep",          currentNameNep);
                    cmd.Parameters.AddWithValue("@NameEng",          currentNameEng);
                    cmd.Parameters.AddWithValue("@CitizenshipNo",    citizenshipNo);
                    cmd.Parameters.AddWithValue("@Mobile",           mobile);
                    cmd.Parameters.AddWithValue("@CorrectionFields", correctionFields);
                    cmd.Parameters.AddWithValue("@CurrentValue",     currentValue);
                    cmd.Parameters.AddWithValue("@CorrectValue",     correctValue);
                    cmd.Parameters.AddWithValue("@Notes",            string.IsNullOrEmpty(notes) ? (object)DBNull.Value : notes);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            Response.Redirect("~/CitizenshipConfirmation.aspx?token=" + token);
        }
    }
}
