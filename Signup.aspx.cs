using System;
using System.Data.SqlClient;
using System.Configuration;

namespace HamroWard
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void BtnSignUp_Click(object sender, EventArgs e)
        {
            string connString = ConfigurationManager.ConnectionStrings["MyConn"].ConnectionString;

            string query = "INSERT INTO signUpDbTable (fullName, userName, password, confirmPassword) VALUES (@name, @user, @pass, @confirm)";

            using (SqlConnection con = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@name", txtFullName.Text.Trim());
                    cmd.Parameters.AddWithValue("@user", txtUsername.Text.Trim());
                    cmd.Parameters.AddWithValue("@pass", txtPassword.Text.Trim());
                    cmd.Parameters.AddWithValue("@confirm", txtConfirmPassword.Text.Trim());

                    con.Open();
                    cmd.ExecuteNonQuery();

                    Response.Redirect("login.aspx");
                }
            }
        }
    }
}