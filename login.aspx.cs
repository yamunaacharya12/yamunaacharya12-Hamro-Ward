using System;
using System.Data.SqlClient;

namespace HamroWard
{
    public partial class Login : System.Web.UI.Page
    {
        private readonly string ConnString = @"Data Source=DESKTOP-AMMHF6M;Initial Catalog=signUpDB;Integrated Security=True;";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConnString))
            {
                string query = "SELECT COUNT(*) FROM signUpDbTable WHERE userName=@user AND password=@pass";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@user", txtUsername.Text.Trim());
                    cmd.Parameters.AddWithValue("@pass", txtPassword.Text.Trim());

                    try
                    {
                        con.Open();
                        int userCount = (int)cmd.ExecuteScalar();

                        if (userCount > 0)
                        {
                            Response.Redirect("default.aspx");
                        }
                        else
                        {
                            lblMessage.Text = "Invalid Username or Password.";
                        }
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Database Error: " + ex.Message;
                    }
                }
            }
        }
    }
}