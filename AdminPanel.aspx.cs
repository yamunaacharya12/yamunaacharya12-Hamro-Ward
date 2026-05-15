using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HamroWard
{
    public partial class AdminPanel : System.Web.UI.Page
    {
        // ── Connection string — reads from Web.config ──────────────────────
        private string ConnStr
        {
            get
            {
                return System.Configuration.ConfigurationManager
                             .ConnectionStrings["HamroWardDB"].ConnectionString;
            }
        }

        private int PageSize = 10;

        private int CurrentPage
        {
            get
            {
                int p;
                return int.TryParse(hfCurrentPage.Value, out p) ? p : 1;
            }
            set { hfCurrentPage.Value = value.ToString(); }
        }

        // ════════════════════════════════════════════════════════════════════
        //  PAGE LOAD
        // ════════════════════════════════════════════════════════════════════
        protected void Page_Load(object sender, EventArgs e)
        {
            // Session guard — redirect if not logged in
            if (Session["AdminID"] == null)
            {
                Response.Redirect("~/Default.aspx");
                return;
            }

            if (!IsPostBack)
            {
                lblAdminName.Text = Session["AdminName"] != null ? Session["AdminName"].ToString() : "Admin";
                lblDate.Text = DateTime.Now.ToString("dddd, dd MMMM yyyy");
                lblTime.Text = DateTime.Now.ToString("hh:mm tt");

                LoadStats();
                LoadApplications();
                LoadNotices();
                LoadServiceStats();
            }
        }

        // ════════════════════════════════════════════════════════════════════
        //  STATS
        // ════════════════════════════════════════════════════════════════════
        private void LoadStats()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnStr))
                using (SqlCommand cmd = new SqlCommand(@"
                    SELECT
                        COUNT(*)                                                  AS TotalApps,
                        SUM(CASE WHEN Status='Pending'     THEN 1 ELSE 0 END)    AS PendingApps,
                        SUM(CASE WHEN Status='Approved'
                             AND CAST(UpdatedDate AS DATE) = CAST(GETDATE() AS DATE)
                             THEN 1 ELSE 0 END)                                   AS ApprovedToday,
                        (SELECT COUNT(*) FROM Citizens)                           AS TotalCitizens
                    FROM Applications", con))
                {
                    con.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            lblTotalApps.Text = dr["TotalApps"].ToString();
                            lblPendingApps.Text = dr["PendingApps"].ToString();
                            lblApprovedToday.Text = dr["ApprovedToday"].ToString();
                            lblCitizens.Text = dr["TotalCitizens"].ToString();

                            // Update sidebar pending badge
                            lblPendingBadge.Text = dr["PendingApps"].ToString();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowAlert("Error loading stats: " + ex.Message, "error");
            }
        }

        // ════════════════════════════════════════════════════════════════════
        //  APPLICATIONS GRID
        // ════════════════════════════════════════════════════════════════════
        private void LoadApplications()
        {
            try
            {
                string search = txtSearch.Text.Trim();
                string status = ddlStatusFilter.SelectedValue;
                string service = ddlServiceFilter.SelectedValue;

                string where = "WHERE 1=1";
                if (!string.IsNullOrEmpty(search))
                    where += " AND (CitizenName LIKE @search OR CAST(ApplicationID AS VARCHAR) LIKE @search)";
                if (!string.IsNullOrEmpty(status))
                    where += " AND Status = @status";
                if (!string.IsNullOrEmpty(service))
                    where += " AND ServiceType = @service";

                string sql = string.Format(@"
                    SELECT ApplicationID, CitizenName, ServiceType,
                           SubmittedDate, Status, WardNo
                    FROM Applications
                    {0}
                    ORDER BY SubmittedDate DESC
                    OFFSET @offset ROWS FETCH NEXT @pageSize ROWS ONLY;

                    SELECT COUNT(*) FROM Applications {0};", where);

                using (SqlConnection con = new SqlConnection(ConnStr))
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    if (!string.IsNullOrEmpty(search))
                        cmd.Parameters.AddWithValue("@search", "%" + search + "%");
                    if (!string.IsNullOrEmpty(status))
                        cmd.Parameters.AddWithValue("@status", status);
                    if (!string.IsNullOrEmpty(service))
                        cmd.Parameters.AddWithValue("@service", service);

                    cmd.Parameters.AddWithValue("@offset", (CurrentPage - 1) * PageSize);
                    cmd.Parameters.AddWithValue("@pageSize", PageSize);

                    con.Open();
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        gvApplications.DataSource = ds.Tables[0];
                        gvApplications.DataBind();

                        int total = (ds.Tables.Count > 1 && ds.Tables[1].Rows.Count > 0)
                                    ? Convert.ToInt32(ds.Tables[1].Rows[0][0]) : 0;
                        int totalPages = (int)Math.Ceiling(total / (double)PageSize);

                        lblPageInfo.Text = string.Format("Page {0} of {1}  ({2} records)",
                                                CurrentPage, Math.Max(1, totalPages), total);
                        btnPrev.Enabled = CurrentPage > 1;
                        btnNext.Enabled = CurrentPage < totalPages;
                    }
                }
            }
            catch (Exception ex)
            {
                ShowAlert("Error loading applications: " + ex.Message, "error");
            }
        }

        // ════════════════════════════════════════════════════════════════════
        //  NOTICES
        // ════════════════════════════════════════════════════════════════════
        private void LoadNotices()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnStr))
                using (SqlCommand cmd = new SqlCommand(
                    "SELECT TOP 5 Title, PublishedDate, Category FROM Notices ORDER BY PublishedDate DESC", con))
                {
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    rptNotices.DataSource = dt;
                    rptNotices.DataBind();
                }
            }
            catch (Exception ex)
            {
                ShowAlert("Error loading notices: " + ex.Message, "error");
            }
        }

        // ════════════════════════════════════════════════════════════════════
        //  SERVICE STATS
        // ════════════════════════════════════════════════════════════════════
        private void LoadServiceStats()
        {
            try
            {
                string sql = @"
                    SELECT TOP 5
                        ServiceType AS ServiceName,
                        COUNT(*) AS Count,
                        CAST(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER() AS INT) AS Percentage
                    FROM Applications
                    WHERE MONTH(SubmittedDate) = MONTH(GETDATE())
                      AND YEAR(SubmittedDate)  = YEAR(GETDATE())
                    GROUP BY ServiceType
                    ORDER BY Count DESC";

                using (SqlConnection con = new SqlConnection(ConnStr))
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    rptServiceStats.DataSource = dt;
                    rptServiceStats.DataBind();
                }
            }
            catch (Exception ex)
            {
                ShowAlert("Error loading service stats: " + ex.Message, "error");
            }
        }

        // ════════════════════════════════════════════════════════════════════
        //  GRID ROW COMMANDS  (Approve / Reject / View)
        // ════════════════════════════════════════════════════════════════════
        protected void GvApplications_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int appID = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "ApproveApp")
                UpdateApplicationStatus(appID, "Approved");
            else if (e.CommandName == "RejectApp")
                UpdateApplicationStatus(appID, "Rejected");
            else if (e.CommandName == "ViewApp")
                ShowAlert("View modal for Application #" + appID + " — extend with your modal logic.", "success");
        }

        private void UpdateApplicationStatus(int appID, string newStatus)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnStr))
                using (SqlCommand cmd = new SqlCommand(
                    "UPDATE Applications SET Status=@status, UpdatedDate=GETDATE(), UpdatedBy=@admin WHERE ApplicationID=@id", con))
                {
                    cmd.Parameters.AddWithValue("@status", newStatus);
                    cmd.Parameters.AddWithValue("@admin", Session["AdminID"]);
                    cmd.Parameters.AddWithValue("@id", appID);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                LogAdminAction(appID, "Status changed to " + newStatus);
                ShowAlert("Application #" + appID + " has been " + newStatus.ToLower() + " successfully.", "success");

                LoadStats();
                LoadApplications();
            }
            catch (Exception ex)
            {
                ShowAlert("Error: " + ex.Message, "error");
            }
        }

        private void LogAdminAction(int appID, string action)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnStr))
                using (SqlCommand cmd = new SqlCommand(
                    "INSERT INTO AdminLogs (ApplicationID, AdminID, Action, LogDate) VALUES (@appID,@admin,@action,GETDATE())", con))
                {
                    cmd.Parameters.AddWithValue("@appID", appID);
                    cmd.Parameters.AddWithValue("@admin", Session["AdminID"]);
                    cmd.Parameters.AddWithValue("@action", action);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            catch { /* silent — logging failure should not break UI */ }
        }

        // ════════════════════════════════════════════════════════════════════
        //  FILTER / SEARCH EVENTS
        // ════════════════════════════════════════════════════════════════════
        protected void TxtSearch_TextChanged(object sender, EventArgs e)
        {
            CurrentPage = 1;
            LoadApplications();
        }

        protected void DdlStatus_Changed(object sender, EventArgs e)
        {
            CurrentPage = 1;
            LoadApplications();
        }

        protected void DdlService_Changed(object sender, EventArgs e)
        {
            CurrentPage = 1;
            LoadApplications();
        }

        // ════════════════════════════════════════════════════════════════════
        //  PAGINATION
        // ════════════════════════════════════════════════════════════════════
        protected void BtnPrev_Click(object sender, EventArgs e)
        {
            if (CurrentPage > 1) CurrentPage--;
            LoadApplications();
        }

        protected void BtnNext_Click(object sender, EventArgs e)
        {
            CurrentPage++;
            LoadApplications();
        }

        // ════════════════════════════════════════════════════════════════════
        //  LOGOUT
        // ════════════════════════════════════════════════════════════════════
        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Default.aspx");
        }

        // ════════════════════════════════════════════════════════════════════
        //  HELPERS
        // ════════════════════════════════════════════════════════════════════

        // Maps status value → CSS class  (C# 7.3 compatible — no switch expression)
        protected string GetStatusClass(string status)
        {
            switch (status)
            {
                case "Pending": return "status-pending";
                case "Approved": return "status-approved";
                case "Rejected": return "status-rejected";
                case "Under Review": return "status-review";
                default: return "status-pending";
            }
        }

        protected void ShowAlert(string message, string type)
        {
            lblAlert.Text = message;
            lblAlert.CssClass = "alert " + type;
            lblAlert.Visible = true;
        }
    }
}
