using System;
using System.IO;
using System.Web.UI;

namespace HamroWard.Deathregistration
{
    public partial class RequestCopy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Optionally disable submit until verified
                // BtnSubmitRequest.Enabled = false;
            }
        }

        // 1. Verify the Original Certificate
        protected void BtnVerify_Click(object sender, EventArgs e)
        {
            string regNo = txtRegNum.Text.Trim();

            if (string.IsNullOrEmpty(regNo))
            {
                lblRecordStatus.Text = "Please enter a registration number.";
                lblRecordStatus.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // SIMULATION: Replace with database lookup logic
            // bool exists = Database.CheckRecord(regNo);
            bool exists = true;

            if (exists)
            {
                lblRecordStatus.Text = "✓ Record Found. You may proceed with the request.";
                lblRecordStatus.ForeColor = System.Drawing.Color.Green;
                // BtnSubmitRequest.Enabled = true;
            }
            else
            {
                lblRecordStatus.Text = "✕ Record not found. Please verify the number.";
                lblRecordStatus.ForeColor = System.Drawing.Color.Red;
            }
        }

        // 2. Submit the Request
        protected void BtnSubmitRequest_Click(object sender, EventArgs e)
        {
            // Validation
            if (rblReason.SelectedIndex == -1)
            {
                ShowAlert("Please select a reason for the duplicate copy.");
                return;
            }

            if (!fileApplicantId.HasFile)
            {
                ShowAlert("Please upload your identity document.");
                return;
            }

            try
            {
                // File Handling
                string fileName = "COPY_ID_" + Guid.NewGuid().ToString().Substring(0, 8) + Path.GetExtension(fileApplicantId.FileName);
                string path = Server.MapPath("~/Uploads/Requests/");

                if (!Directory.Exists(path)) Directory.CreateDirectory(path);
                fileApplicantId.SaveAs(path + fileName);

                // Data variables for DB saving
                string regNum = txtRegNum.Text.Trim();
                string reason = rblReason.SelectedValue;
                string remarks = txtRemarks.Text.Trim();
                string uploadedFile = "Uploads/Requests/" + fileName;

                // TODO: SQL INSERT logic here
                // SaveToDatabase(regNum, reason, remarks, uploadedFile);

                // Success
                string ticketId = "REQ-" + DateTime.Now.ToString("yyyyMM") + "-" + new Random().Next(1000, 9999);
                string msg = $"Request submitted successfully! Your Ticket ID is: {ticketId}. Please keep this for tracking.";

                ScriptManager.RegisterStartupScript(this, GetType(), "redirect",
                    $"alert('{msg}'); window.location='deathregistration.aspx';", true);
            }
            catch (Exception ex)
            {
                ShowAlert("Error: " + ex.Message);
            }
        }

        private void ShowAlert(string message)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", $"alert('{message}');", true);
        }
    }
}