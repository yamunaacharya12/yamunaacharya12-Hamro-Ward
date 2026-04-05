using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace HamroWard.CitizenshipRegistration
{
    public partial class CitizenshipStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void btnCheck_Click(object sender, EventArgs e)
        {
            string token = txtTokenNo.Text.Trim();
            string dob   = txtDOB.Text.Trim();

            if (string.IsNullOrEmpty(token) || string.IsNullOrEmpty(dob))
            {
                lblError.Text    = "Please enter both Token Number and Date of Birth.";
                lblError.Visible = true;
                pnlResult.Visible = false;
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["HamroWardDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = @"SELECT ApplicationID, TokenNumber, ApplicantNameEng, ServiceType,
                                      Status, SubmittedDate, LastUpdatedDate, Remarks,
                                      Step1Date, Step2Date, Step3Date, Step4Date
                               FROM CitizenshipApplications
                               WHERE TokenNumber = @Token
                                 AND CONVERT(date, DOBAD) = CONVERT(date, @DOB)";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@Token", token);
                    cmd.Parameters.AddWithValue("@DOB",   dob);
                    conn.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        lblError.Visible  = false;
                        pnlResult.Visible = true;

                        string status = dr["Status"].ToString();

                        lblTokenDisplay.Text   = dr["TokenNumber"].ToString();
                        lblApplicantName.Text  = dr["ApplicantNameEng"].ToString();
                        lblServiceType.Text    = dr["ServiceType"].ToString();
                        lblSubmittedDate.Text  = Convert.ToDateTime(dr["SubmittedDate"]).ToString("dd MMM yyyy");
                        lblLastUpdated.Text    = Convert.ToDateTime(dr["LastUpdatedDate"]).ToString("dd MMM yyyy");
                        lblRemarks.Text        = dr["Remarks"] == DBNull.Value ? "—" : dr["Remarks"].ToString();

                        // Status badge
                        string badgeClass = status == "Approved"   ? "status-approved"
                                          : status == "Rejected"   ? "status-rejected"
                                          : status == "Processing" ? "status-processing"
                                          : "status-pending";
                        lblStatusBadge.Text      = $"<span class='status-badge {badgeClass}'>{status}</span>";
                        lblStatusBadge.CssClass  = "";

                        // Timeline dates
                        lblStep1Date.Text = dr["Step1Date"] != DBNull.Value ? Convert.ToDateTime(dr["Step1Date"]).ToString("dd MMM yyyy") : "—";
                        lblStep2Date.Text = dr["Step2Date"] != DBNull.Value ? Convert.ToDateTime(dr["Step2Date"]).ToString("dd MMM yyyy") : "Pending";
                        lblStep3Date.Text = dr["Step3Date"] != DBNull.Value ? Convert.ToDateTime(dr["Step3Date"]).ToString("dd MMM yyyy") : "Pending";
                        lblStep4Date.Text = dr["Step4Date"] != DBNull.Value ? Convert.ToDateTime(dr["Step4Date"]).ToString("dd MMM yyyy") : "Pending";
                    }
                    else
                    {
                        lblError.Text     = "No application found with the provided Token Number and Date of Birth. Please check and try again.";
                        lblError.Visible  = true;
                        pnlResult.Visible = false;
                    }
                }
            }
        }
    }
}
