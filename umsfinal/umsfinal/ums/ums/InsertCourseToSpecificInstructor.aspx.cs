using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace UMS
{
    public partial class InsertCourseToSpecificInstructor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCourses();
                LoadInstructors();
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

        private void LoadInstructors()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["UMSDatabase"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT instructor_id, first_name FROM Academics.Instructor";
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                ddlInstructor.Items.Clear();
                ddlInstructor.Items.Add(new ListItem("Select Instructor", ""));
                while (reader.Read())
                {
                    // Store ID as value, display name and ID as text
                    ddlInstructor.Items.Add(new ListItem(
                        reader["first_name"].ToString() + " ID: " + reader["instructor_id"].ToString(),
                        reader["instructor_id"].ToString()
                    ));
                }
            }
        }

        protected void btnAssignCourse_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(ddlInstructor.SelectedValue) || string.IsNullOrEmpty(ddlCourse.SelectedValue))
            {
                lblMessage.Text = "Please select both an instructor and a course.";
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["UMSDatabase"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    string query = "INSERT INTO Academics.InstructorCourse ([instructor_id], [course_id]) VALUES (@InstructorID, @CourseID)";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@InstructorID", ddlInstructor.SelectedValue);
                    command.Parameters.AddWithValue("@CourseID", ddlCourse.SelectedValue);
                    connection.Open();
                    command.ExecuteNonQuery();
                    lblMessage.Text = "Course assigned to instructor successfully!";
                }
                catch (Exception ex)
                {
                    lblMessage.Text = $"An error occurred: {ex.Message}";
                }
            }
        }
    }
}