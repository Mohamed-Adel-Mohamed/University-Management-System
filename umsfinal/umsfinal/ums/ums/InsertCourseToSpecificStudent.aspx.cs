using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UMS
{
    public partial class admin_insert_course_to_student : Page
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
                string query = "SELECT student_id, first_name, last_name FROM Academics.Student";
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                ddlStudent.Items.Clear();
                ddlStudent.Items.Add(new ListItem("Select Student", ""));
                while (reader.Read())
                {
                    ddlStudent.Items.Add(new ListItem($"{reader["first_name"]}", reader["student_id"].ToString()));
                }
            }
        }

        private void LoadCourses()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["UMSDatabase"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT course_id, course_name FROM Academics.Course";
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                ddlCourse.Items.Clear();
                ddlCourse.Items.Add(new ListItem("Select Course", ""));
                while (reader.Read())
                {
                    ddlCourse.Items.Add(new ListItem(reader["course_name"].ToString(), reader["course_id"].ToString()));
                }
            }
        }

        protected void btnAssignCourse_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["UMSDatabase"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    string query = @"
                        INSERT INTO Academics.Enrollment (student_id, course_id, enrollment_date, status)
                        VALUES (@StudentID, @CourseID, @EnrollmentDate,  @Status)";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@StudentID", ddlStudent.SelectedValue);
                    command.Parameters.AddWithValue("@CourseID", ddlCourse.SelectedValue);
                    command.Parameters.AddWithValue("@EnrollmentDate", txtEnrollmentDate.Text);
                    command.Parameters.AddWithValue("@Status", "Active");

                    connection.Open();
                    command.ExecuteNonQuery();

                    lblMessage.Text = "Course successfully assigned to the student!";
                }
                catch (Exception ex)
                {
                    lblMessage.Text = $"An error occurred: {ex.Message}";
                }
            }
        }
    }
}
