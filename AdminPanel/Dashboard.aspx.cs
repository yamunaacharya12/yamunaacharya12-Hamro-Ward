using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace HamroWard.AdminPanel
{
    // Temporary inline helper to test if the issue is file inclusion
    public static class DBHelper
    {
        private static string connStr =
            ConfigurationManager.ConnectionStrings["HamroWardDB"].ConnectionString;

        public static int GetCount(string tableName)
        {
            string[] allowed = {
                "BirthRegistration", "DeathRegistration",
                "MigrationRegistration", "CitizenshipRegistration"
            };
            if (Array.IndexOf(allowed, tableName) < 0)
                throw new ArgumentException("Invalid table.");

            using (SqlConnection con = new SqlConnection(connStr))
            using (SqlCommand cmd = new SqlCommand(
                "SELECT COUNT(*) FROM " + tableName, con))
            {
                con.Open();
                return (int)cmd.ExecuteScalar();
            }
        }
    }

    public class AdminBasePage : Page
    {
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            if (Session["UserRole"] == null ||
                Session["UserRole"].ToString() != "Admin")
            {
                Response.Redirect("~/AdminPanel/Login.aspx");
            }
        }
    }

    public partial class Dashboard : AdminBasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStats();
            }
        }

        private void LoadStats()
        {
            try
            {
                lblBirth.Text = DBHelper.GetCount("BirthRegistration").ToString();
                lblDeath.Text = DBHelper.GetCount("DeathRegistration").ToString();
                lblMigration.Text = DBHelper.GetCount("MigrationRegistration").ToString();
                lblCitizenship.Text = DBHelper.GetCount("CitizenshipRegistration").ToString();
            }
            catch
            {
                lblBirth.Text = lblDeath.Text =
                lblMigration.Text = lblCitizenship.Text = "0";
            }
        }
    }
}