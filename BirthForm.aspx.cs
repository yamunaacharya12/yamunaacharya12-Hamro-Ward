using System;
using System.Data.SqlClient;
using System.Configuration;

namespace xyz
{
    public partial class BirthForm : System.Web.UI.Page
    {
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "INSERT INTO birthRegistration (ChildName, FatherName, MotherName, GrandfatherName, Gender, birthplace, DOB) VALUES (@ChildName, @FatherName, @MotherName, @GrandfatherName, @Gender, @birthplace, @DOB)";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@ChildName", txtChildName.Text);
                cmd.Parameters.AddWithValue("@FatherName", txtFatherName.Text);
                cmd.Parameters.AddWithValue("@MotherName", txtMotherName.Text);
                cmd.Parameters.AddWithValue("@GrandfatherName", txtGrandfather.Text);
                cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                cmd.Parameters.AddWithValue("@birthplace", txtBirthPlace.Text);
                cmd.Parameters.AddWithValue("@DOB", Convert.ToDateTime(txtDOB.Text));

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
    }
}