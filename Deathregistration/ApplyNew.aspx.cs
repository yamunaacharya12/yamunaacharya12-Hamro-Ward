using System;
using System.IO;
using System.Web.UI;

namespace xyz.Deathregistration
{
    public partial class ApplyNew : System.Web.UI.Page
    {
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                // 1. Basic Validation
                if (string.IsNullOrEmpty(txtNameEng.Text) || !fileDeathDoc.HasFile)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Please fill all required fields and upload documents.');", true);
                    return;
                }

                // 2. Handle File Upload (Simulated)
                string folderPath = Server.MapPath("~/Uploads/");
                if (!Directory.Exists(folderPath)) Directory.CreateDirectory(folderPath);

                string fileName = Path.GetFileName(fileDeathDoc.FileName);
                fileDeathDoc.SaveAs(folderPath + fileName);

                // 3. Database Logic (Placeholder)
                // SaveDataToDatabase(txtNameEng.Text, txtDate.Text, fileName);

                // 4. Success Message & Redirect
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Application Submitted Successfully! Your tracking ID is: D-2026-X89'); window.location='deathregistration.aspx';", true);
            }
            catch (Exception ex)
            {
                // Log error
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Error: " + ex.Message + "');", true);
            }
        }
    }
}