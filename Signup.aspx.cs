using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

namespace HamroWard
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSignUp_Click(object sender, EventArgs e)
        {
            // Updated connection string
            string connString = @"Data Source=DESKTOP-AMMHF6M;Initial Catalog=signUpDB;Integrated Security=True;";

            // Use parameters (@name, etc.) instead of string concatenation
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