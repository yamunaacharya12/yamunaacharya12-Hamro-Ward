using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace HamroWard.Migrationregistration
{
    public partial class Migration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Initial load logic if needed
        }

        // 1. New Migration Application
        protected void BtnMigrate1_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewMigrationCertificate.aspx");
        }

        // 2. Modification Application
        protected void BtnMigrate2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AmendmentMigrationCertificate.aspx");
        }

        // 3. Cancellation Application
        protected void BtnMigrate3_Click(object sender, EventArgs e)
        {
            Response.Redirect("CancelMigration.aspx");
        }

        // 4. Copy/Duplicate Request
        protected void BtnMigrate4_Click(object sender, EventArgs e)
        {
            Response.Redirect("MigrationRegistrationCopy.aspx");
        }

        // --- Track Application Status Logic ---
        protected void BtnMigSearch_Click(object sender, EventArgs e)
        {
           
        }

        private void CheckApplicationStatus(string id, string citizenNo)
        {
           
        }
    }
}