using System;
namespace HamroWard
{
    public partial class BirthConfirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string token = Request.QueryString["token"];
            lblToken.Text = string.IsNullOrEmpty(token) ? "N/A" : token;
        }
    }
}
