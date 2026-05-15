using System;
using System.Web.UI;

namespace HamroWard.CitizenshipRegistration
{
    public partial class CitizenshipNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Page load logic is handled in the ASPX inline <script runat="server"> block.
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string nameNep = txtNameNep.Text.Trim();
            string nameEng = txtNameEng.Text.Trim();
            string dobBS = txtDOBBS.Text.Trim();
            string dobAD = txtDOBAD.Text.Trim();
            string gender = ddlGender.SelectedValue;
            string bloodGroup = ddlBloodGroup.SelectedValue;

            string district = ddlDistrict.SelectedValue;
            string municipality = txtMunicipality.Text.Trim();
            string wardNo = txtWardNo.Text.Trim();
            string tole = txtTole.Text.Trim();

            string fatherNameNep = txtFatherNameNep.Text.Trim();
            string fatherNameEng = txtFatherNameEng.Text.Trim();
            string fatherCitizenNo = txtFatherCitizenshipNo.Text.Trim();
            bool fatherAlive = ddlFatherAlive.SelectedValue == "yes";
            bool selfDeclaration = chkSelfDeclaration.Checked;

            string motherNameNep = txtMotherNameNep.Text.Trim();
            string motherNameEng = txtMotherNameEng.Text.Trim();
            string motherCitizenNo = txtMotherCitizenshipNo.Text.Trim();
            bool motherAlive = ddlMotherAlive.SelectedValue == "yes";

            string grandfatherNep = txtGrandfatherNameNep.Text.Trim();
            string grandfatherEng = txtGrandfatherNameEng.Text.Trim();
            string grandmotherNep = txtGrandmotherNameNep.Text.Trim();
            string grandmotherEng = txtGrandmotherNameEng.Text.Trim();

            bool parentDeceased = chkParentDeceased.Checked;
            bool isMarried = chkMarried.Checked;
            bool hasMigrated = chkMigrated.Checked;
            string husbandName = isMarried ? txtHusbandName.Text.Trim() : string.Empty;

            if (filePhoto.HasFile)
                filePhoto.SaveAs(Server.MapPath("~/Uploads/") + filePhoto.FileName);

            if (fileBirth.HasFile)
                fileBirth.SaveAs(Server.MapPath("~/Uploads/") + fileBirth.FileName);

            if (fileFatherCitizenship.HasFile)
                fileFatherCitizenship.SaveAs(Server.MapPath("~/Uploads/") + fileFatherCitizenship.FileName);

            if (fileMotherCitizenship.HasFile)
                fileMotherCitizenship.SaveAs(Server.MapPath("~/Uploads/") + fileMotherCitizenship.FileName);

            if (fileEducation.HasFile)
                fileEducation.SaveAs(Server.MapPath("~/Uploads/") + fileEducation.FileName);

            if (parentDeceased && fileDeathCert.HasFile)
                fileDeathCert.SaveAs(Server.MapPath("~/Uploads/") + fileDeathCert.FileName);

            if (isMarried && fileMarriageCert.HasFile)
                fileMarriageCert.SaveAs(Server.MapPath("~/Uploads/") + fileMarriageCert.FileName);

            if (hasMigrated && fileMigration.HasFile)
                fileMigration.SaveAs(Server.MapPath("~/Uploads/") + fileMigration.FileName);

            Response.Redirect("~/CitizenshipConfirmation.aspx");
        }

        // ✅ ADD THIS METHOD (FIX)
        protected string GetStatusClass(object statusObj)
        {
            string status = statusObj?.ToString() ?? "";

            switch (status)
            {
                case "Approved":
                    return "bg-success";

                case "Pending":
                    return "bg-warning";

                case "Rejected":
                    return "bg-danger";

                default:
                    return "bg-secondary";
            }
        }
    }
}