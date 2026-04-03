using System;
using System.IO;
using System.Web.UI;

namespace HamroWard.Migrationregistration
{
    public partial class MigrationRegistrationCopy : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                // 🔹 Get Values
                string fullName = FullName.Value;
                string citizenshipNo = CitizenshipNo.Value;
                string migrationCertNo = MigrationCertNo.Value;
                string fromAddress = FromAddress.Value;
                string toAddress = ToAddress.Value;
                string reason = CopyReason.Value;

                string filePath = "";

                // 📁 Folder create
                string folder = Server.MapPath("~/Uploads/");
                if (!Directory.Exists(folder))
                {
                    Directory.CreateDirectory(folder);
                }

                // 📂 File upload
                if (DocumentUpload.HasFile)
                {
                    string fileName = Guid.NewGuid().ToString() + Path.GetExtension(DocumentUpload.FileName);
                    filePath = "~/Uploads/" + fileName;
                    DocumentUpload.SaveAs(Server.MapPath(filePath));
                }

                // 💾 (Optional DB Save here)

                // ✅ Success
                Response.Write("<script>alert('Migration Copy Request Submitted Successfully');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
    }
}