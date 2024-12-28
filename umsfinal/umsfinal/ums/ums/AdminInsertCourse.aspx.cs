using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UMS
{
    public partial class admin_insert_course : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadInstructors();
            }
        }

        private void LoadInstructors()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["UMSDatabase"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT instructor_id, first_name, last_name FROM Academics.Instructor";
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                ddlInstructor.Items.Clear();
                ddlInstructor.Items.Add(new ListItem("Select Instructor", ""));
                while (reader.Read())
                {
                    ddlInstructor.Items.Add(new ListItem(reader["first_name"].ToString() + " " + reader["last_name"].ToString(), reader["instructor_id"].ToString()));
                }
            }
        }

        protected void btnInsertCourse_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["UMSDatabase"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    string query = "INSERT INTO Academics.Course ([course_name], [course_code], [department_id], [instructor_id], [semester], [year], [schedule], [classroom], [capacity], [status], [credit_hours]) " +
                                   "VALUES (@CourseName, @CourseCode, @DepartmentID, @InstructorID, @Semester, @Year, @Schedule, @Classroom, @Capacity, @Status, @CreditHours)";

                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@CourseName", txtCourseName.Text.Trim());
                    command.Parameters.AddWithValue("@CourseCode", txtCourseCode.Text.Trim());
                    command.Parameters.AddWithValue("@DepartmentID", ddlDepartment.SelectedValue);
                    command.Parameters.AddWithValue("@InstructorID", ddlInstructor.SelectedValue);
                    command.Parameters.AddWithValue("@Semester", txtSemester.Text.Trim());
                    command.Parameters.AddWithValue("@Year", txtYear.Text.Trim());
                    command.Parameters.AddWithValue("@Schedule", txtSchedule.Text.Trim());
                    command.Parameters.AddWithValue("@Classroom", txtClassroom.Text.Trim());
                    command.Parameters.AddWithValue("@Capacity", txtCapacity.Text.Trim());
                    command.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
                    command.Parameters.AddWithValue("@CreditHours", txtCreditHours.Text.Trim());

                    connection.Open();
                    command.ExecuteNonQuery();

                    // Register the JavaScript alert to show on client-side after successful course insertion
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Course inserted successfully!');", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", $"alert('An error occurred: {ex.Message}');", true);
                }
            }
        }
    }
}
