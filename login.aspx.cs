using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

namespace HamroWard
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Text = ""; // Clear any previous messages on page load
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            string loginInput = txtUsername.Text.Trim(); // Phone number
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(loginInput) || string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "Please enter Phone and Password.";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                try
                {
                    conn.Open();
                    // Match columns exactly: UserId, Phone, PasswordHash
                    string query = "SELECT UserId, PasswordHash FROM Users WHERE Phone = @Login";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Login", loginInput);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Access columns using the exact names from your screenshot
                            string storedHash = reader["PasswordHash"].ToString();
                            string enteredHash = HashPassword(password);

                            if (enteredHash == storedHash)
                            {
                                Session["UserId"] = reader["UserId"].ToString();
                                Session["LoginUser"] = loginInput;
                                Response.Redirect("/");
                            }
                            else
                            {
                                lblMessage.Text = "Invalid Phone or Password.";
                            }
                        }
                        else
                        {
                            lblMessage.Text = "User not found.";
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                }
            }
        }

        // SHA256 password hashing
        private string HashPassword(string password)
        {
            using (SHA256 sha = SHA256.Create())
            {
                byte[] bytes = sha.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder builder = new StringBuilder();
                foreach (byte b in bytes)
                {
                    builder.Append(b.ToString("x2"));
                }
                return builder.ToString();
            }
        }
    }
}