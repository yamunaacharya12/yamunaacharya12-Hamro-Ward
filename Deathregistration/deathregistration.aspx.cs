using System;
using System.Web.UI;

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
            Response.Redirect("~/Default.aspx");
        }

        // --- Search/Track Application Logic ---
        protected void BtnDeathSearch_Click(object sender, EventArgs e)
        {
            string appId = txtDeathAppNo.Text.Trim();
            string informantCitizen = txtInformantCitizen.Text.Trim();

            if (string.IsNullOrEmpty(appId) || string.IsNullOrEmpty(informantCitizen))
            {
                ShowAlert("कृपया आवेदन नम्बर र नागरिकता नम्बर दुबै भर्नुहोस्।");
                return;
            }

            // Redirect to status page with query parameters
            Response.Redirect($"~/DeathRegistration/DeathStatus.aspx?type=death&id={appId}&ref={informantCitizen}");
        }

        // --- Helper: Show JavaScript Alert ---
        private void ShowAlert(string message)
        {
            string script = $"alert('{message}');";
            ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
        }
    }
}
