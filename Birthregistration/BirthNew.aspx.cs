using System;
using System.Data.SqlClient;
using System.Configuration;

namespace HamroWard.Birthregistration
{
    public partial class BirthNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string childNameNep      = txtChildNameNep.Text.Trim();
            string childNameEng      = txtChildNameEng.Text.Trim();
            string dobBS             = txtDOBBS.Text.Trim();
            string dobAD             = txtDOBAD.Text.Trim();
            string gender            = ddlGender.SelectedValue;
            string birthOrder        = ddlBirthOrder.SelectedValue;
            string province          = ddlProvince.SelectedValue;
            string birthDistrict     = txtBirthDistrict.Text.Trim();
            string birthMunicipality = txtBirthMunicipality.Text.Trim();
            string birthWard         = txtBirthWard.Text.Trim();
            string birthPlaceType    = ddlBirthPlaceType.SelectedValue;
            string hospitalName      = txtHospitalName.Text.Trim();
            string fatherNameNep     = txtFatherNameNep.Text.Trim();
            string fatherNameEng     = txtFatherNameEng.Text.Trim();
            string fatherCitizenNo   = txtFatherCitizenshipNo.Text.Trim();
            string fatherMobile      = txtFatherMobile.Text.Trim();
            string motherNameNep     = txtMotherNameNep.Text.Trim();
            string motherNameEng     = txtMotherNameEng.Text.Trim();
            string motherCitizenNo   = txtMotherCitizenshipNo.Text.Trim();
            string motherMobile      = txtMotherMobile.Text.Trim();
            string district          = txtDistrict.Text.Trim();
            string municipality      = txtMunicipality.Text.Trim();
            string wardNo            = txtWardNo.Text.Trim();
            string tole              = txtTole.Text.Trim();

            string uploadsPath = Server.MapPath("~/Uploads/");
            if (fileHospitalDoc.HasFile)       fileHospitalDoc.SaveAs(uploadsPath + fileHospitalDoc.FileName);
            if (fileFatherCitizenship.HasFile) fileFatherCitizenship.SaveAs(uploadsPath + fileFatherCitizenship.FileName);
            if (fileMotherCitizenship.HasFile) fileMotherCitizenship.SaveAs(uploadsPath + fileMotherCitizenship.FileName);
            if (fileMarriageCert.HasFile)      fileMarriageCert.SaveAs(uploadsPath + fileMarriageCert.FileName);

            string token = "BIR-NEW-" + DateTime.Now.ToString("yyyyMMddHHmmss");

            string connStr = ConfigurationManager.ConnectionStrings["HamroWardDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = @"INSERT INTO BirthApplications
                    (TokenNumber, ChildNameNep, ChildNameEng, DOBBS, DOBAD, Gender, BirthOrder,
                     Province, BirthDistrict, BirthMunicipality, BirthWardNo, BirthPlaceType, HospitalName,
                     FatherNameNep, FatherNameEng, FatherCitizenshipNo, FatherMobile,
                     MotherNameNep, MotherNameEng, MotherCitizenshipNo, MotherMobile,
                     District, Municipality, WardNo, Tole,
                     ServiceType, Status, SubmittedDate, LastUpdatedDate)
                VALUES
                    (@Token, @ChildNameNep, @ChildNameEng, @DOBBS, @DOBAD, @Gender, @BirthOrder,
                     @Province, @BirthDistrict, @BirthMunicipality, @BirthWard, @BirthPlaceType, @HospitalName,
                     @FatherNameNep, @FatherNameEng, @FatherCitizenNo, @FatherMobile,
                     @MotherNameNep, @MotherNameEng, @MotherCitizenNo, @MotherMobile,
                     @District, @Municipality, @WardNo, @Tole,
                     'New Birth Registration', 'Pending', GETDATE(), GETDATE())";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@Token",            token);
                    cmd.Parameters.AddWithValue("@ChildNameNep",     childNameNep);
                    cmd.Parameters.AddWithValue("@ChildNameEng",     childNameEng);
                    cmd.Parameters.AddWithValue("@DOBBS",            dobBS);
                    cmd.Parameters.AddWithValue("@DOBAD",            dobAD);
                    cmd.Parameters.AddWithValue("@Gender",           gender);
                    cmd.Parameters.AddWithValue("@BirthOrder",       birthOrder);
                    cmd.Parameters.AddWithValue("@Province",         province);
                    cmd.Parameters.AddWithValue("@BirthDistrict",    birthDistrict);
                    cmd.Parameters.AddWithValue("@BirthMunicipality",birthMunicipality);
                    cmd.Parameters.AddWithValue("@BirthWard",        string.IsNullOrEmpty(birthWard) ? (object)DBNull.Value : int.Parse(birthWard));
                    cmd.Parameters.AddWithValue("@BirthPlaceType",   birthPlaceType);
                    cmd.Parameters.AddWithValue("@HospitalName",     hospitalName);
                    cmd.Parameters.AddWithValue("@FatherNameNep",    fatherNameNep);
                    cmd.Parameters.AddWithValue("@FatherNameEng",    fatherNameEng);
                    cmd.Parameters.AddWithValue("@FatherCitizenNo",  fatherCitizenNo);
                    cmd.Parameters.AddWithValue("@FatherMobile",     fatherMobile);
                    cmd.Parameters.AddWithValue("@MotherNameNep",    motherNameNep);
                    cmd.Parameters.AddWithValue("@MotherNameEng",    motherNameEng);
                    cmd.Parameters.AddWithValue("@MotherCitizenNo",  motherCitizenNo);
                    cmd.Parameters.AddWithValue("@MotherMobile",     motherMobile);
                    cmd.Parameters.AddWithValue("@District",         district);
                    cmd.Parameters.AddWithValue("@Municipality",     municipality);
                    cmd.Parameters.AddWithValue("@WardNo",           string.IsNullOrEmpty(wardNo) ? (object)DBNull.Value : int.Parse(wardNo));
                    cmd.Parameters.AddWithValue("@Tole",             tole);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            Response.Redirect("~/BirthConfirmation.aspx?token=" + token);
        }
    }
}
