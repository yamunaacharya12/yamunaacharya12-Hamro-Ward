using System;
using System.IO;
using System.Web.UI;

namespace HamroWard.Migrationregistration
{
    public partial class AmendmentMigrationCertificate : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Page load logic (if needed)
        }

        // ✅ Button Click Event (IMPORTANT: name must match ASPX)
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                // 🔹 Get form values
                string migrationCertNo = MigrationCertNo.Value;
                string amendmentReason = AmendmentReason.Value;

                string currentFullName = CurrentFullName.Value;
                string currentAddress = CurrentAddress.Value;

                string correctFullName = CorrectFullName.Value;
                string correctAddress = CorrectAddress.Value;

                // 🔹 File Upload Paths
                string supportDocPath = "";
                string photoPath = "";

                // 📁 Create folder if not exists
                string uploadFolder = Server.MapPath("~/Uploads/");
                if (!Directory.Exists(uploadFolder))
                {
                    Directory.CreateDirectory(uploadFolder);
                }

                // 🔹 Save Supporting Document
                if (SupportDoc.HasFile)
                {
                    string fileName = Guid.NewGuid().ToString() + Path.GetExtension(SupportDoc.FileName);
                    supportDocPath = "~/Uploads/" + fileName;
                    SupportDoc.SaveAs(Server.MapPath(supportDocPath));
                }

                // 🔹 Save Photo (optional)
                if (photoInput.HasFile)
                {
                    string fileName = Guid.NewGuid().ToString() + Path.GetExtension(photoInput.FileName);
                    photoPath = "~/Uploads/" + fileName;
                    photoInput.SaveAs(Server.MapPath(photoPath));
                }

                // 🔹 TODO: Save to Database (optional)
                // You can insert into SQL Server here

                // 🔹 Success Message
                Response.Write("<script>alert('Application Submitted Successfully!');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
    }
}