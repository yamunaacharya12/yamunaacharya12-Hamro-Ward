using System;
using System.Web.UI;

namespace xyz
{
    public partial class Birth1 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnService1_Click(object sender, EventArgs e)
        {
            // Routes to New Birth Registration
            Response.Redirect("NewBirthRegistration.aspx");
        }

        protected void BtnService2_Click(object sender, EventArgs e)
        {
            // Routes to Amendment
            Response.Redirect("AmendmentBirthRegistration.aspx");
        }

        protected void BtnService3_Click(object sender, EventArgs e)
        {
            // Routes to Cancellation
            Response.Redirect("CancellationBirthRegistration.aspx");
        }

        protected void BtnService4_Click(object sender, EventArgs e)
        {
            // Routes to Birth Certificate Copy
            Response.Redirect("BirthCertificateCopy.aspx");
        }
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            // Routes to Birth Certificate Copy
            
        }
    }
}
