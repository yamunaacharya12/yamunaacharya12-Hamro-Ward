using System;
using System.Data.SqlClient;
using System.Configuration;

namespace HamroWard.Birthregistration
{
    public partial class BirthStatus : System.Web.UI.Page
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
                string sql = @"SELECT TokenNumber, ChildNameEng, ServiceType, Status,
                                      SubmittedDate, LastUpdatedDate, Remarks,
                                      Step1Date, Step2Date, Step3Date
                               FROM BirthApplications
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
                        lblTokenDisplay.Text  = dr["TokenNumber"].ToString();
                        lblChildName.Text     = dr["ChildNameEng"].ToString();
                        lblServiceType.Text   = dr["ServiceType"].ToString();
                        lblSubmittedDate.Text = Convert.ToDateTime(dr["SubmittedDate"]).ToString("dd MMM yyyy");
                        lblLastUpdated.Text   = Convert.ToDateTime(dr["LastUpdatedDate"]).ToString("dd MMM yyyy");
                        lblRemarks.Text       = dr["Remarks"] == DBNull.Value ? "—" : dr["Remarks"].ToString();

                        string badgeClass = status == "Approved" ? "status-approved"
                                          : status == "Rejected" ? "status-rejected"
                                          : status == "Processing" ? "status-processing"
                                          : "status-pending";
                        lblStatusBadge.Text = $"<span class='status-badge {badgeClass}'>{status}</span>";

                        lblStep1Date.Text = dr["Step1Date"] != DBNull.Value ? Convert.ToDateTime(dr["Step1Date"]).ToString("dd MMM yyyy") : "—";
                        lblStep2Date.Text = dr["Step2Date"] != DBNull.Value ? Convert.ToDateTime(dr["Step2Date"]).ToString("dd MMM yyyy") : "Pending";
                        lblStep3Date.Text = dr["Step3Date"] != DBNull.Value ? Convert.ToDateTime(dr["Step3Date"]).ToString("dd MMM yyyy") : "Pending";
                    }
                    else
                    {
                        lblError.Text     = "No application found. Please check your Token Number and Date of Birth.";
                        lblError.Visible  = true;
                        pnlResult.Visible = false;
                    }
                }
            }
        }
    }
}
