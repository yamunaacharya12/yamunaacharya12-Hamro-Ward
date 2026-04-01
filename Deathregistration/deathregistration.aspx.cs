using System;
using System.Web.UI;

namespace HamroWard

{
    public partial class deathregistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void BtnDeath1_Click(object sender, EventArgs e) { Response.Redirect("ApplyNew.aspx"); }
        protected void BtnDeath2_Click(object sender, EventArgs e) { Response.Redirect("EditRecord.aspx"); }
        protected void BtnDeath3_Click(object sender, EventArgs e) { Response.Redirect("CancelRecord.aspx"); }
        protected void BtnDeath4_Click(object sender, EventArgs e) { Response.Redirect("RequestCopy.aspx"); }

        protected void BtnSearchDeath_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtAppNoDeath.Text))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Enter Application Number');", true);
            }
            // Add tracking logic here
        }
    }
}