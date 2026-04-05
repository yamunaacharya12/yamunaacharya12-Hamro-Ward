using System;
using System.Data.SqlClient;
using System.Configuration;

namespace HamroWard.CitizenshipRegistration
{
    public partial class CitizenshipCopy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string nameNep       = txtNameNep.Text.Trim();
            string nameEng       = txtNameEng.Text.Trim();
            string citizenshipNo = txtCitizenshipNo.Text.Trim();
            string dobAD         = txtDOBAD.Text.Trim();
            string mobile        = txtMobile.Text.Trim();
            int    copies        = int.Parse(ddlCopies.SelectedValue);
            string purpose       = ddlPurpose.SelectedValue;

            // Save uploaded files
            string uploadsPath = Server.MapPath("~/Uploads/");
            if (fileOriginalCitizenship.HasFile) fileOriginalCitizenship.SaveAs(uploadsPath + fileOriginalCitizenship.FileName);
            if (filePhoto.HasFile)               filePhoto.SaveAs(uploadsPath + filePhoto.FileName);
            if (fileApplication.HasFile)         fileApplication.SaveAs(uploadsPath + fileApplication.FileName);

            // Generate token
            string token = "CIT-COPY-" + DateTime.Now.ToString("yyyyMMddHHmmss");

            string connStr = ConfigurationManager.ConnectionStrings["HamroWardDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = @"INSERT INTO CitizenshipApplications
                                (TokenNumber, ApplicantNameNep, ApplicantNameEng, CitizenshipNo, DOBAD,
                                 Mobile, CopiesRequired, Purpose, ServiceType, Status, SubmittedDate, LastUpdatedDate)
                               VALUES
                                (@Token, @NameNep, @NameEng, @CitizenshipNo, @DOB,
                                 @Mobile, @Copies, @Purpose, 'Certified Copy', 'Pending', GETDATE(), GETDATE())";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@Token",        token);
                    cmd.Parameters.AddWithValue("@NameNep",      nameNep);
                    cmd.Parameters.AddWithValue("@NameEng",      nameEng);
                    cmd.Parameters.AddWithValue("@CitizenshipNo", citizenshipNo);
                    cmd.Parameters.AddWithValue("@DOB",          dobAD);
                    cmd.Parameters.AddWithValue("@Mobile",       mobile);
                    cmd.Parameters.AddWithValue("@Copies",       copies);
                    cmd.Parameters.AddWithValue("@Purpose",      purpose);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            Response.Redirect("~/CitizenshipConfirmation.aspx?token=" + token);
        }
    }
}
