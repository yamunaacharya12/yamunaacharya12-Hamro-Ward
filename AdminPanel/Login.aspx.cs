using System;

namespace HamroWard.AdminPanel
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            string user = txtUsername.Text.Trim();
            string pass = txtPassword.Text.Trim();

            if (user == "admin" && pass == "admin123")
            {
                Session["UserRole"] = "Admin";
                Session["UserName"] = user;
                Response.Redirect("~/AdminPanel/Dashboard.aspx");
            }
            else
            {
                lblError.Text = "Invalid username or password.";
                lblError.Visible = true;
            }
        }
    }
}