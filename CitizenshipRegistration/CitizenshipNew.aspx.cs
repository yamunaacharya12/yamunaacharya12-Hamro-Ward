using System;
using System.Web.UI;

namespace HamroWard.CitizenshipRegistration
{
    public partial class CitizenshipNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Page load logic is handled in the ASPX inline <script runat="server"> block.
            // All dropdown population and initialisation is done there to keep it co-located
            // with the markup. No duplicate logic needed here.
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // ── Collect applicant details ──────────────────────────────────
            string nameNep = txtNameNep.Text.Trim();
            string nameEng = txtNameEng.Text.Trim();
            string dobBS   = txtDOBBS.Text.Trim();
            string dobAD   = txtDOBAD.Text.Trim();
            string gender  = ddlGender.SelectedValue;
            string bloodGroup = ddlBloodGroup.SelectedValue;

            // ── Permanent address ──────────────────────────────────────────
            string district     = ddlDistrict.SelectedValue;
            string municipality = txtMunicipality.Text.Trim();
            string wardNo       = txtWardNo.Text.Trim();
            string tole         = txtTole.Text.Trim();

            // ── Three-generation details ───────────────────────────────────
            string fatherNameNep    = txtFatherNameNep.Text.Trim();
            string fatherNameEng    = txtFatherNameEng.Text.Trim();
            string fatherCitizenNo  = txtFatherCitizenshipNo.Text.Trim();
            bool   fatherAlive      = ddlFatherAlive.SelectedValue == "yes";
            bool   selfDeclaration  = chkSelfDeclaration.Checked;

            string motherNameNep    = txtMotherNameNep.Text.Trim();
            string motherNameEng    = txtMotherNameEng.Text.Trim();
            string motherCitizenNo  = txtMotherCitizenshipNo.Text.Trim();
            bool   motherAlive      = ddlMotherAlive.SelectedValue == "yes";

            string grandfatherNep   = txtGrandfatherNameNep.Text.Trim();
            string grandfatherEng   = txtGrandfatherNameEng.Text.Trim();
            string grandmotherNep   = txtGrandmotherNameNep.Text.Trim();
            string grandmotherEng   = txtGrandmotherNameEng.Text.Trim();

            // ── Case-specific flags ────────────────────────────────────────
            bool   parentDeceased = chkParentDeceased.Checked;
            bool   isMarried      = chkMarried.Checked;
            bool   hasMigrated    = chkMigrated.Checked;
            string husbandName    = isMarried ? txtHusbandName.Text.Trim() : string.Empty;

            // ── File uploads — paths use ~/ so they resolve from app root ──
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

            // ── TODO: Persist all collected values to database here ────────
            // Example: CitizenshipService.Save(new CitizenshipApplication { ... });

            // ── Redirect — uses ~/ so it resolves from root, not subfolder ─
            Response.Redirect("~/CitizenshipConfirmation.aspx");
        }
    }
}
