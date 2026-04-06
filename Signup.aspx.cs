using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

namespace HamroWard
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSignUp_Click(object sender, EventArgs e)
        {
            // 🔒 Password match check
            if (txtPassword.Text != txtConfirmPassword.Text)
            {
                Response.Write("<script>alert('Passwords do not match!');</script>");
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                SqlTransaction trans = conn.BeginTransaction();

                try
                {
                    // 🔍 Check if user already exists
                    SqlCommand checkCmd = new SqlCommand(
                        "SELECT COUNT(*) FROM Users WHERE Phone=@Phone",
                        conn, trans);

                    checkCmd.Parameters.AddWithValue("@Phone", txtPhone.Text);

                    int count = (int)checkCmd.ExecuteScalar();

                    if (count > 0)
                    {
                        Response.Write("<script>alert('User already exists!');</script>");
                        trans.Rollback();
                        return;
                    }

                    // 🔐 Hash password
                    string hashedPassword = HashPassword(txtPassword.Text);

                    // 🧾 Insert into Users
                    SqlCommand userCmd = new SqlCommand(
                        @"INSERT INTO Users (Phone, PasswordHash)
                          VALUES (@Phone, @PasswordHash);
                          SELECT SCOPE_IDENTITY();",
                        conn, trans);

                    userCmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                    userCmd.Parameters.AddWithValue("@PasswordHash", hashedPassword);

                    int userId = Convert.ToInt32(userCmd.ExecuteScalar());

                    // 👤 Insert into CitizenProfile
                    SqlCommand profileCmd = new SqlCommand(
                        @"INSERT INTO CitizenProfile
                        (UserId, FullName, DOB, Gender, Email, District, Municipality,
                         CitizenshipNo, CitizenshipDistrict, CitizenshipDate)

                        VALUES
                        (@UserId, @FullName, @DOB, @Gender, @Email, @District, @Municipality,
                         @CitizenshipNo, @CitizenshipDistrict, @CitizenshipDate)",
                        conn, trans);

                    profileCmd.Parameters.AddWithValue("@UserId", userId);
                    profileCmd.Parameters.AddWithValue("@FullName", txtFullName.Text);
                    profileCmd.Parameters.AddWithValue("@DOB", Convert.ToDateTime(txtDOB.Text));
                    profileCmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                    profileCmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    profileCmd.Parameters.AddWithValue("@District", txtDistrict.Text);
                    profileCmd.Parameters.AddWithValue("@Municipality", txtMunicipality.Text);
                    profileCmd.Parameters.AddWithValue("@CitizenshipNo", txtCitizenshipNo.Text);
                    profileCmd.Parameters.AddWithValue("@CitizenshipDistrict", txtCitizenshipDistrict.Text);
                    profileCmd.Parameters.AddWithValue("@CitizenshipDate", Convert.ToDateTime(txtCitizenshipDate.Text));

                    profileCmd.ExecuteNonQuery();

                    // ✅ Commit transaction
                    trans.Commit();

                    Response.Write("<script>alert('Account Created Successfully!'); window.location='Login.aspx';</script>");
                }
                catch (Exception ex)
                {
                    trans.Rollback();
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }
        }

        // 🔐 Password Hash Function
        private string HashPassword(string password)
        {
            using (SHA256 sha = SHA256.Create())
            {
                byte[] bytes = sha.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder builder = new StringBuilder();

                foreach (byte b in bytes)
                {
                    builder.Append(b.ToString("x2"));
                }

                return builder.ToString();
            }
        }
    }
}