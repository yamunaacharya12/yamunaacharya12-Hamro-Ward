using System;
using System.IO;
using System.Web.UI;

namespace HamroWard.Deathregistration
{
    public partial class EditRecord : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Optional: You can hide the correction fields until the record is verified
            // pnlCorrectionDetails.Visible = false;
        }

        // 1. Verify existing record
        protected void BtnVerify_Click(object sender, EventArgs e)
        {
            string certNum = txtSearchCert.Text.Trim();

            if (string.IsNullOrEmpty(certNum))
            {
                ShowAlert("Please enter a Certificate Number to verify.");
                return;
            }

            // SIMULATION: Check if cert exists in database
            // In reality, you'd do: SELECT * FROM DeathRegistrations WHERE CertNo = @certNum
            bool isFound = true;

            if (isFound)
            {
                ShowAlert("Record Verified! You can now enter the correction details.");
                // pnlCorrectionDetails.Visible = true;
            }
            else
            {
                ShowAlert("No record found with that number. Please verify and try again.");
            }
        }

        // 2. Submit Correction Request
        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            // Validation
            if (ddlField.SelectedIndex == 0 || string.IsNullOrEmpty(txtCorrectValue.Text))
            {
                ShowAlert("Please select a field and enter the correct value.");
                return;
            }

            if (!fileEvidence.HasFile)
            {
                ShowAlert("Please upload evidence (PDF) to support this correction.");
                return;
            }

            try
            {
                // Handle File Upload
                string fileName = Guid.NewGuid().ToString() + Path.GetExtension(fileEvidence.FileName);
                string folderPath = Server.MapPath("~/Uploads/Corrections/");

                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                fileEvidence.SaveAs(Path.Combine(folderPath, fileName));

                // Data to Save to Database:
                string certificateNumber = txtSearchCert.Text.Trim();
                string fieldToChange = ddlField.SelectedValue;
                string newValue = txtCorrectValue.Text.Trim();
                string reason = txtReason.Text.Trim();
                string filePath = "Uploads/Corrections/" + fileName;

                // TODO: Execute SQL INSERT into CorrectionRequests table
                // SaveToDB(certificateNumber, fieldToChange, newValue, reason, filePath);

                // Final Response
                string successMsg = "Correction request submitted successfully. It will be reviewed by the Ward Officer.";
                ScriptManager.RegisterStartupScript(this, GetType(), "redirect",
                    $"alert('{successMsg}'); window.location='deathregistration.aspx';", true);
            }
            catch (Exception ex)
            {
                ShowAlert("An error occurred: " + ex.Message);
            }
        }

        // Helper for Alerts
        private void ShowAlert(string message)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", $"alert('{message}');", true);
        }
    }
}