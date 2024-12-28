using System;
using System.Data;
using System.Data.SqlClient;

namespace YourNamespace
{
    public partial class InstructorDashboard : System.Web.UI.Page
    {
        private readonly string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["UMSDatabase"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["InstructorId"] == null)
                {
                    Response.Redirect("Default.aspx");
                    return;
                }
                GetInstructorProfile();
                GetAssignedCourses();
                GetEnrolledStudents();
                GetUpcomingExams();
            }
        }

        private void GetInstructorProfile()
        {
            string instructorId = Session["InstructorId"] as string;

            string query = @"SELECT i.first_name, i.email, i.phone, 
                           d.department_name
                           FROM [UMS].[Academics].[Instructor] i
                           LEFT JOIN [UMS].[Academics].[Department] d ON i.department_id = d.department_id
                           WHERE i.instructor_id = @instructorId";
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@instructorId", instructorId);
                    conn.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lblInstructorName.Text = $"{reader["first_name"]} ";
                            lblInstructorEmail.Text = reader["email"].ToString();
                            lblInstructorPhone.Text = reader["phone"].ToString();
                            lblDepartment.Text = reader["department_name"].ToString();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblInstructorName.Text = "Error: " + ex.Message;
            }
        }

        private void GetAssignedCourses()
        {
            string instructorId = Session["InstructorId"] as string;

            string query = @"SELECT c.course_code, c.course_name, c.semester, c.year, 
                           c.schedule, c.classroom, c.credit_hours
                           FROM [UMS].[Academics].[Course] c 
                           JOIN [UMS].[Academics].[InstructorCourse] ic ON c.course_id = ic.course_id 
                           WHERE ic.instructor_id = @instructorId
                           ORDER BY c.semester, c.course_name";
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@instructorId", instructorId);
                    conn.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        gvAssignedCourses.DataSource = reader;
                        gvAssignedCourses.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                lblInstructorName.Text = "Error: " + ex.Message;
            }
        }

        private void GetEnrolledStudents()
        {
            string instructorId = Session["InstructorId"] as string;

            string query = @"SELECT  
                           CONCAT(s.first_name, ' ') as student_name,
                           c.course_name,
                           c.course_code,
                           s.email,
                           s.phone,
                           e.grade,
                           e.status as enrollment_status
                           FROM [UMS].[Academics].[InstructorCourse] ic
                           JOIN [UMS].[Academics].[Course] c ON ic.course_id = c.course_id
                           JOIN [UMS].[Academics].[Enrollment] e ON c.course_id = e.course_id
                           JOIN [UMS].[Academics].[Student] s ON e.student_id = s.student_id
                           WHERE ic.instructor_id = @instructorId
                           ORDER BY c.course_name, s.first_name";
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@instructorId", instructorId);
                    conn.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        gvEnrolledStudents.DataSource = reader;
                        gvEnrolledStudents.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                lblInstructorName.Text = "Error: " + ex.Message;
            }
        }

        private void GetUpcomingExams()
        {
            string instructorId = Session["InstructorId"] as string;
            string query = @"SELECT DISTINCT
                            c.course_name,
                            c.course_code,
                            s.schedule_id,
                            s.exam_date,
                            s.start_time, -- Include start_time directly
                            s.end_time, -- Include end_time directly
                            s.day_of_week,
                            cl.room_number,
                            cl.building_name
                        FROM [UMS].[Exams].[Schedule] s
                        JOIN [UMS].[Academics].[Course] c ON s.course_id = c.course_id
                        LEFT JOIN [UMS].[Clubs].[Classroom] cl ON s.classroom_id = cl.classroom_id
                        WHERE s.instructor_id = @instructorId
                        AND s.exam_date >= CAST(GETDATE() AS DATE)
                        ORDER BY s.exam_date ASC, s.start_time ASC
                        ";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@instructorId", instructorId);
                    conn.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        gvUpcomingExams.DataSource = reader;
                        gvUpcomingExams.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                lblInstructorName.Text = "Error: " + ex.Message;
            }
        }
    }
}