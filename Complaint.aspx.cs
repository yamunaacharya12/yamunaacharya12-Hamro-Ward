using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace HamroWard
{
    public partial class Complaint : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string category = hfCategory.Value;
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string wardNumber = txtWardNumber.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string subject = txtSubject.Text.Trim();
            string description = txtDescription.Text.Trim();
            string location = txtLocation.Text.Trim();

            // Save uploaded photo if any
            if (fuPhoto.HasFile)
                fuPhoto.SaveAs(Server.MapPath("~/Uploads/") + fuPhoto.FileName);

            // Generate token
            string token = "CMP-" + DateTime.Now.ToString("yyyyMMddHHmmss");

            string connStr = ConfigurationManager.ConnectionStrings["HamroWardDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = @"INSERT INTO Complaints
                                (TokenNumber, Category, FullName, Email, WardNumber, Phone,
                                 Subject, Description, Location, Status, SubmittedDate)
                               VALUES
                                (@Token, @Category, @Name, @Email, @WardNumber, @Phone,
                                 @Subject, @Description, @Location, 'Pending', GETDATE())";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@Token", token);
                    cmd.Parameters.AddWithValue("@Category", string.IsNullOrEmpty(category) ? "Others" : category);
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Email", string.IsNullOrEmpty(email) ? (object)DBNull.Value : email);
                    cmd.Parameters.AddWithValue("@WardNumber", wardNumber);
                    cmd.Parameters.AddWithValue("@Phone", string.IsNullOrEmpty(phone) ? (object)DBNull.Value : phone);
                    cmd.Parameters.AddWithValue("@Subject", subject);
                    cmd.Parameters.AddWithValue("@Description", description);
                    cmd.Parameters.AddWithValue("@Location", string.IsNullOrEmpty(location) ? (object)DBNull.Value : location);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            // Show success message
            lblMessage.Text = "✅ Your complaint has been submitted successfully! Token: " + token;
            lblMessage.Visible = true;

            // Clear form
            hfCategory.Value = "";
            txtName.Text = "";
            txtEmail.Text = "";
            txtWardNumber.Text = "";
            txtPhone.Text = "";
            txtSubject.Text = "";
            txtDescription.Text = "";
            txtLocation.Text = "";
        }
    }
}
