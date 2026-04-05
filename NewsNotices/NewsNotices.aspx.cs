using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace HamroWard
{
    public partial class NewsNotices : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadNotices();
            }
        }

        private void LoadNotices()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["HamroWardDB"].ConnectionString;

            string query = @"
                SELECT Id, Title, ShortDescription, Category, PublishedDate
                FROM   NewsNotices
                WHERE  IsActive = 1
                ORDER  BY PublishedDate DESC";

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        rptNotices.DataSource = dt;
                        rptNotices.DataBind();

                        // Show "View All" button only when there are more than 6 records
                        pnlViewToggle.Visible = dt.Rows.Count > 6;
                        pnlEmpty.Visible      = false;
                    }
                    else
                    {
                        pnlEmpty.Visible      = true;
                        pnlViewToggle.Visible = false;
                    }
                }
            }
            catch (Exception ex)
            {
                // Log ex in production; show empty state gracefully
                pnlEmpty.Visible      = true;
                pnlViewToggle.Visible = false;
            }
        }

        // Called for every repeater row — use for any row-level server-side logic if needed
        protected void rptNotices_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            // Currently no extra per-row binding needed.
            // Extend here if you add controls like asp:HyperLink inside the repeater.
        }

        // ── Helper: top colour bar class ──
        protected string GetTypeBarClass(string category)
        {
            switch (category)
            {
                case "News":   return "type-news";
                case "Notice": return "type-notice";
                case "Event":  return "type-event";
                default:       return "type-notice";
            }
        }

        // ── Helper: badge CSS class ──
        protected string GetBadgeClass(string category)
        {
            switch (category)
            {
                case "News":   return "badge-news";
                case "Notice": return "badge-notice";
                case "Event":  return "badge-event";
                default:       return "badge-notice";
            }
        }
    }
}
