using System;
using System.Web.UI;

namespace HamroWard
{
    public partial class Citizenship : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Page load logic handled in ASPX script block
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            // Here you can process form values and files
            // Example: Save to DB or redirect to confirmation
            Response.Redirect("CitizenshipConfirmation.aspx");
        }
    }
}
