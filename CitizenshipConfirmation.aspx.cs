using System;

namespace HamroWard
{
    public partial class CitizenshipConfirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Get token from URL e.g. CitizenshipConfirmation.aspx?token=CIT-COPY-xxx
            string token = Request.QueryString["token"];

            if (!string.IsNullOrEmpty(token))
                lblToken.Text = token;
            else
                lblToken.Text = "N/A";
        }
    }
}
