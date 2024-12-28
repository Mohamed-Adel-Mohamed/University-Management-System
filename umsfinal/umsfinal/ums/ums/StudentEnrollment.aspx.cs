using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UMS
{
    public partial class StudentEnrollment : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStudents();
                LoadCourses();
            }
        }

        private void LoadStudents()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["UMSDatabase"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    string query = "SELECT student_id FROM [UMS].[Academics].[Student]";

                    SqlCommand command = new SqlCommand(query, connection);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    ddlStudents.Items.Clear();
                    ddlStudents.Items.Add(new ListItem("Select a Student", ""));
                    while (reader.Read())
                    {
                        ddlStudents.Items.Add(new ListItem(reader["student_id"].ToString(), reader["student_id"].ToString()));
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error loading students: " + ex.Message;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        private void LoadCourses()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["UMSDatabase"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    string query = "SELECT course_id FROM [UMS].[Academics].[Course]";

                    SqlCommand command = new SqlCommand(query, connection);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    ddlCourses.Items.Clear();
                    ddlCourses.Items.Add(new ListItem("Select a Course", ""));
                    while (reader.Read())
                    {
                        ddlCourses.Items.Add(new ListItem(reader["course_id"].ToString(), reader["course_id"].ToString()));
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error loading courses: " + ex.Message;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void btnEnroll_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["UMSDatabase"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    string query = "INSERT INTO [UMS].[Academics].[Enrollment] " +
                                   "(student_id, course_id, enrollment_date, status) " +
                                   "VALUES (@StudentID, @CourseID, @EnrollmentDate, @Status)";

                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@StudentID", ddlStudents.SelectedValue);
                    command.Parameters.AddWithValue("@CourseID", ddlCourses.SelectedValue);
                    command.Parameters.AddWithValue("@EnrollmentDate", txtEnrollmentDate.Text.Trim());
                    command.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);

                    connection.Open();
                    command.ExecuteNonQuery();

                    lblMessage.Text = "Student successfully enrolled!";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error enrolling student: " + ex.Message;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}
