using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace BugzUniversity
{
    public partial class StudentDashboard : Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["UMSDatabase"].ConnectionString;
        private string studentId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["StudentID"] == null)
            {
                Response.Redirect("Default.aspx");
                return;
            }

            studentId = Session["StudentID"].ToString();

            if (!IsPostBack)
            {
                LoadStudentInformation();
                LoadAcademicResults();
                LoadAvailableCourses();
                LoadEnrolledCourses();
                LoadExamSchedule();
                LoadClassSchedule();
                LoadPayments();
            }
        }
        private void LoadStudentInformation()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"SELECT s.student_id, 
                                s.first_name, 
                                d.department_name, 
                                CONCAT(COALESCE(a.first_name, 'No Advisor'), ' ', COALESCE(a.last_name, '')) AS advisor_name, 
                                s.GPA, 
                                s.status, 
                                s.email 
                         FROM [UMS].[Academics].[Student] s
                         LEFT JOIN [UMS].[Academics].[Department] d ON s.department_id = d.department_id
                         LEFT JOIN [UMS].[Academics].[Advisor] a ON s.advisor_id = a.advisor_id
                         WHERE s.student_id = @StudentId";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StudentId", studentId);

                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        lblStudentName.Text = reader["first_name"].ToString();
                        lblStudentId.Text = reader["student_id"].ToString();
                        lblEmail.Text = reader["email"].ToString();
                        lblDepartment.Text = reader["department_name"].ToString();
                        lblGPA.Text = reader["GPA"].ToString();
                        lblAdvisor.Text = reader["advisor_name"].ToString();
                        lblStatus.Text = reader["status"].ToString();
                    }
                    else
                    {
                        System.Diagnostics.Debug.WriteLine("No data found for the given student ID.");
                    }
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine($"Error loading student information: {ex.Message}");
                }
            }
        }


        private void LoadAcademicResults()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"SELECT e.*, c.course_name
                               FROM [UMS].[Academics].[Enrollment] e
                               JOIN [UMS].[Academics].[Course] c ON e.course_id = c.course_id
                               WHERE e.student_id = @StudentId
                               ORDER BY e.enrollment_date DESC";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StudentId", studentId);

                try
                {
                    conn.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    gvAcademicResults.DataSource = dt;
                    gvAcademicResults.DataBind();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine($"Error loading academic results: {ex.Message}");
                }
            }
        }

        private void LoadAvailableCourses()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"SELECT c.course_id, c.course_name
                               FROM [UMS].[Academics].[Course] c
                               WHERE c.department_id = (
                                   SELECT department_id 
                                   FROM [UMS].[Academics].[Student]
                                   WHERE student_id = @StudentId)
                               AND c.status = 'Active'
                               AND c.course_id NOT IN (
                                   SELECT course_id 
                                   FROM [UMS].[Academics].[Enrollment]
                                   WHERE student_id = @StudentId)";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StudentId", studentId);

                try
                {
                    conn.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    ddlCourses.DataSource = dt;
                    ddlCourses.DataTextField = "course_name";
                    ddlCourses.DataValueField = "course_id";
                    ddlCourses.DataBind();
                    ddlCourses.Items.Insert(0, new ListItem("-- Select Course --", ""));
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine($"Error loading available courses: {ex.Message}");
                }
            }
        }

        private void LoadEnrolledCourses()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"SELECT e.course_id, c.course_name,
                               CONCAT(i.first_name, ' ', i.last_name) as instructor_name
                               FROM [UMS].[Academics].[Enrollment] e
                               JOIN [UMS].[Academics].[Course] c ON e.course_id = c.course_id
                               LEFT JOIN [UMS].[Academics].[Instructor] i ON c.instructor_id = i.instructor_id
                               WHERE e.student_id = @StudentId AND e.status = 'Active'";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StudentId", studentId);

                try
                {
                    conn.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    gvEnrolledCourses.DataSource = dt;
                    gvEnrolledCourses.DataBind();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine($"Error loading enrolled courses: {ex.Message}");
                }
            }
        }

        private void LoadExamSchedule()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"SELECT e.course_id, e.exam_date, e.start_time, e.end_time, e.classroom_id
                               FROM [UMS].[Academics].[ExamSchedule] e
                               JOIN [UMS].[Academics].[Enrollment] en ON e.course_id = en.course_id
                               WHERE en.student_id = @StudentId";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StudentId", studentId);

                try
                {
                    conn.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    gvExamSchedule.DataSource = dt;
                    gvExamSchedule.DataBind();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine($"Error loading exam schedule: {ex.Message}");
                }
            }
        }

        private void LoadClassSchedule()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"SELECT cs.course_code, c.course_name, cs.schedule, cs.classroom, 
                               CONCAT(i.first_name, ' ', i.last_name) as instructor_name
                               FROM [UMS].[Academics].[ClassSchedule] cs
                               JOIN [UMS].[Academics].[Course] c ON cs.course_code = c.course_code
                               LEFT JOIN [UMS].[Academics].[Instructor] i ON cs.instructor_id = i.instructor_id
                               WHERE cs.course_code IN (
                                   SELECT course_id FROM [UMS].[Academics].[Enrollment] WHERE student_id = @StudentId)";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StudentId", studentId);

                try
                {
                    conn.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    gvClassSchedule.DataSource = dt;
                    gvClassSchedule.DataBind();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine($"Error loading class schedule: {ex.Message}");
                }
            }
        }

        private void LoadPayments()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"SELECT p.payment_date, p.amount, p.payment_type, p.status
                               FROM [UMS].[Finance].[Payments] p
                               WHERE p.student_id = @StudentId
                               ORDER BY p.payment_date DESC";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StudentId", studentId);

                try
                {
                    conn.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    gvPayments.DataSource = dt;
                    gvPayments.DataBind();

                    // Calculate total due
                    query = @"SELECT SUM(amount) as total_due FROM [UMS].[Finance].[Payments] 
                              WHERE student_id = @StudentId AND status = 'Pending'";
                    cmd = new SqlCommand(query, conn);
                    object result = cmd.ExecuteScalar();
                    lblTotalDue.Text = result != DBNull.Value ? $"{result:C}" : "$0.00";
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine($"Error loading payments: {ex.Message}");
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Default.aspx");
        }

        protected void btnEnroll_Click(object sender, EventArgs e)
        {
            string courseId = ddlCourses.SelectedValue;
            if (string.IsNullOrEmpty(courseId))
            {
                // Show error: "Please select a course."
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"INSERT INTO [UMS].[Academics].[Enrollment] (student_id, course_id, enrollment_date, status)
                               VALUES (@StudentId, @CourseId, GETDATE(), 'Active')";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StudentId", studentId);
                cmd.Parameters.AddWithValue("@CourseId", courseId);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    LoadAvailableCourses();
                    LoadEnrolledCourses();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine($"Error enrolling course: {ex.Message}");
                }
            }
        }

        protected void gvEnrolledCourses_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DropCourse")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvEnrolledCourses.Rows[rowIndex];
                string courseId = row.Cells[0].Text;

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = @"UPDATE [UMS].[Academics].[Enrollment]
                                   SET status = 'Dropped' 
                                   WHERE student_id = @StudentId AND course_id = @CourseId";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@StudentId", studentId);
                    cmd.Parameters.AddWithValue("@CourseId", courseId);

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        LoadEnrolledCourses();
                    }
                    catch (Exception ex)
                    {
                        System.Diagnostics.Debug.WriteLine($"Error dropping course: {ex.Message}");
                    }
                }
            }
        }
    }
}
