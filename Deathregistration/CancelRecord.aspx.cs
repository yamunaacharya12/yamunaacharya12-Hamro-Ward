using System;
using System.IO;
using System.Web.UI;

namespace HamroWard.Deathregistration
{
    public partial class CancelRecord : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void BtnVerify_Click(object sender, EventArgs e)
        {
            string certNo = txtCancelCert.Text.Trim();
            if (string.IsNullOrEmpty(certNo))
            {
                ShowAlert("Please enter the certificate number first.");
                return;
            }

            // SIMULATION: Check DB for record
            bool found = true;

            if (found)
            {
                ShowAlert("Record found: [Full Name Placeholder]. Please proceed with the legal justification.");
            }
            else
            {
                ShowAlert("Record not found. Please double-check the certificate number.");
            }
        }

        protected void BtnSubmitCancellation_Click(object sender, EventArgs e)
        {
            // Validation
            if (string.IsNullOrWhiteSpace(txtCancelReason.Text))
            {
                ShowAlert("Please provide a justification for cancellation.");
                return;
            }

            if (!fileLegalDoc.HasFile)
            {
                ShowAlert("A legal supporting document is mandatory for cancellation.");
                return;
            }

            try
            {
                // File Processing
                string ext = Path.GetExtension(fileLegalDoc.FileName).ToLower();
                if (ext != ".pdf")
                {
                    ShowAlert("Only PDF documents are allowed for legal evidence.");
                    return;
                }

                string fileName = "CANCEL_LEGAL_" + DateTime.Now.Ticks + ".pdf";
                string folder = Server.MapPath("~/Uploads/Cancellations/");

                if (!Directory.Exists(folder)) Directory.CreateDirectory(folder);
                fileLegalDoc.SaveAs(Path.Combine(folder, fileName));

                // DB Values
                string certToCancel = txtCancelCert.Text.Trim();
                string reason = txtCancelReason.Text.Trim();
                string docPath = "Uploads/Cancellations/" + fileName;

                // TODO: Save to database table 'CancellationRequests'
                // DB.SaveCancelRequest(certToCancel, reason, docPath);

                string msg = "Cancellation request for " + certToCancel + " has been submitted for legal review.";
                ScriptManager.RegisterStartupScript(this, GetType(), "redirect",
                    $"alert('{msg}'); window.location='deathregistration.aspx';", true);
            }
            catch (Exception ex)
            {
                ShowAlert("An error occurred: " + ex.Message);
            }
        }

        private void ShowAlert(string message)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", $"alert('{message}');", true);
        }
    }
}