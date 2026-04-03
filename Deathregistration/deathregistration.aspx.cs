using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace xyz
{
    public partial class Death1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Logic for first-time page load if needed
            }
        }

        // --- Navigation: Back Button ---
        protected void btnBack_Click(object sender, EventArgs e)
        {
            // Redirects user back to the main Citizen Services or Home page
            Response.Redirect("~/Default.aspx");
        }

        // --- Service Card 1: New Registration ---
        protected void BtnDeath1_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewDeathForm.aspx");
        }

        // --- Service Card 2: Correction ---
        protected void BtnDeath2_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditDeathDetails.aspx");
        }

        // --- Service Card 3: Cancellation ---
        protected void BtnDeath3_Click(object sender, EventArgs e)
        {
            Response.Redirect("CancelDeathRegistration.aspx");
        }

        // --- Service Card 4: Copy/Duplicate ---
        protected void BtnDeath4_Click(object sender, EventArgs e)
        {
            Response.Redirect("DuplicateDeathCert.aspx");
        }

        // --- Search/Track Application Logic ---
        protected void BtnDeathSearch_Click(object sender, EventArgs e)
        {
            string appId = txtDeathAppNo.Text.Trim();
            string informantCitizen = txtInformantCitizen.Text.Trim();

            if (string.IsNullOrEmpty(appId) || string.IsNullOrEmpty(informantCitizen))
            {
                // Feedback for empty fields
                ShowAlert("कृपया आवेदन नम्बर र नागरिकता नम्बर दुबै भर्नुहोस्।");
                return;
            }

            // Logic to verify status (Placeholder for Database call)
            // Example: Select Status from DeathApplications where AppID=@appId

            try
            {
                // Redirecting to a status result page with data
                Response.Redirect($"TrackStatus.aspx?type=death&id={appId}&ref={informantCitizen}");
            }
            catch (Exception ex)
            {
                ShowAlert("Error searching record: " + ex.Message);
            }
        }

        // Helper method to show JavaScript Alerts
        private void ShowAlert(string message)
        {
            string script = $"alert('{message}');";
            ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
        }
    }
}