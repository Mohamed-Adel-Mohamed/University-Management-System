using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace BugzUniversity
{
    public partial class Default : Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["UMSDatabase"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Clear();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string userId = txtID.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(userId) || string.IsNullOrEmpty(password))
            {
                lblError.Text = "Please fill in all fields.";
                lblError.Visible = true;
                return;
            }

            if (ValidateAdminLogin(userId, password))
            {
                Session["AdminID"] = userId;
                Response.Redirect("admin-dashboard.aspx");
            }
            else if (ValidateStudentLogin(userId, password))
            {
                Session["StudentID"] = userId;
                Response.Redirect("StudentDashboard.aspx");
            }
            else if (ValidateInstructorLogin(userId, password))
            {
                Session["InstructorID"] = userId;
                Response.Redirect("UserInstructorDetails.aspx");
            }
            else
            {
                lblError.Text = "Invalid login credentials.";
                lblError.Visible = true;
            }
        }

        private bool ValidateAdminLogin(string userId, string password)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT user_id FROM [UMS].[Accounts].[Users] WHERE user_id = @UserId AND user_password = @Password AND user_role = 'Admin'";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserId", userId);
                cmd.Parameters.AddWithValue("@Password", password);

                try
                {
                    conn.Open();
                    var result = cmd.ExecuteScalar();
                    return result != null;
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine("Admin login error: " + ex.Message);
                    return false;
                }
            }
        }

        private bool ValidateStudentLogin(string studentId, string lastName)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT student_id FROM [UMS].[Academics].[Student] WHERE student_id = @StudentId AND last_name = @LastName AND status = 'Active'";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StudentId", studentId);
                cmd.Parameters.AddWithValue("@LastName", lastName);

                try
                {
                    conn.Open();
                    var result = cmd.ExecuteScalar();
                    return result != null;
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine("Student login error: " + ex.Message);
                    return false;
                }
            }
        }

        private bool ValidateInstructorLogin(string instructorId, string lastName)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT instructor_id FROM [UMS].[Academics].[Instructor] WHERE instructor_id = @InstructorId AND last_name = @LastName";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@InstructorId", instructorId);
                cmd.Parameters.AddWithValue("@LastName", lastName);

                try
                {
                    conn.Open();
                    var result = cmd.ExecuteScalar();
                    return result != null;
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine("Instructor login error: " + ex.Message);
                    return false;
                }
            }
        }
    }
}