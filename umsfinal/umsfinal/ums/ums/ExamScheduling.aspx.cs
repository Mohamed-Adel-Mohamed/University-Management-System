using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ums
{
    public partial class ExamScheduling : System.Web.UI.Page
    {
        private readonly string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["UMSDatabase"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDepartments();
                LoadExams();
            }
        }

        private void LoadDepartments()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT department_id, department_name FROM [UMS].[Academics].[Department] ORDER BY department_name";
                SqlCommand cmd = new SqlCommand(query, conn);

                try
                {
                    conn.Open();
                    ddlDepartment.DataSource = cmd.ExecuteReader();
                    ddlDepartment.DataTextField = "department_name";
                    ddlDepartment.DataValueField = "department_id";
                    ddlDepartment.DataBind();

                    ddlDepartment.Items.Insert(0, new ListItem("-- Select Department --", ""));
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error loading departments: " + ex.Message;
                    lblMessage.CssClass = "text-danger";
                }
            }
        }

        protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadCourses();
        }

        private void LoadCourses()
        {
            if (string.IsNullOrEmpty(ddlDepartment.SelectedValue))
            {
                ddlCourse.Items.Clear();
                ddlCourse.Items.Insert(0, new ListItem("-- Select Course --", ""));
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"SELECT 
                course_id, 
                course_code + ' - ' + course_name as course_full_name 
                FROM [UMS].[Academics].[Course] 
                WHERE department_id = @DepartmentId 
                ORDER BY course_code";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@DepartmentId", ddlDepartment.SelectedValue);

                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        ddlCourse.DataSource = reader;
                        ddlCourse.DataTextField = "course_full_name";
                        ddlCourse.DataValueField = "course_id";
                        ddlCourse.DataBind();

                        ddlCourse.Items.Insert(0, new ListItem("-- Select Course --", ""));
                    }
                    else
                    {
                        ddlCourse.Items.Clear();
                        ddlCourse.Items.Insert(0, new ListItem("-- No Courses Available --", ""));
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error loading courses: " + ex.Message;
                    lblMessage.CssClass = "text-danger";
                }
            }
        }


        protected void btnSchedule_Click(object sender, EventArgs e)
        {
            if (!ValidateInput())
            {
                lblMessage.Text = "Please fill in all required fields.";
                lblMessage.CssClass = "text-danger";
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"INSERT INTO [UMS].[Exams].[Schedule]
                               (course_id, classroom_id, exam_date, start_time, end_time ,day_of_week)
                               VALUES (@CourseId, @ClassroomId, @ExamDate, @StartTime, @EndTime ,@DayOfWeek)";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@CourseId", ddlCourse.SelectedValue);
                cmd.Parameters.AddWithValue("@ClassroomId", txtClassroom.Text.Trim());
                cmd.Parameters.AddWithValue("@ExamDate", Convert.ToDateTime(txtExamDate.Text));
                cmd.Parameters.AddWithValue("@StartTime", txtStartTime.Text);
                cmd.Parameters.AddWithValue("@EndTime", txtEndTime.Text);
                cmd.Parameters.AddWithValue("@DayOfWeek", txtdayofweek.Text);


                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();

                    lblMessage.Text = "Exam scheduled successfully!";
                    lblMessage.CssClass = "text-success";

                    ClearForm();
                    LoadExams();
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error scheduling exam: " + ex.Message;
                    lblMessage.CssClass = "text-danger";
                }
            }
        }

        private void LoadExams()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"SELECT s.schedule_id, d.department_name, c.course_code, 
                               c.course_name, s.exam_date, s.start_time, s.end_time, 
                               s.classroom_id
                               FROM [UMS].[Exams].[Schedule] s
                               JOIN [UMS].[Academics].[Course] c ON s.course_id = c.course_id
                               JOIN [UMS].[Academics].[Department] d ON c.department_id = d.department_id
                               ORDER BY s.exam_date DESC, s.start_time";

                SqlCommand cmd = new SqlCommand(query, conn);

                try
                {
                    conn.Open();
                    gvExams.DataSource = cmd.ExecuteReader();
                    gvExams.DataBind();
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error loading exams: " + ex.Message;
                    lblMessage.CssClass = "text-danger";
                }
            }
        }

        protected void gvExams_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteExam")
            {
                int scheduleId = Convert.ToInt32(e.CommandArgument);
                DeleteExam(scheduleId);
            }
        }

        private void DeleteExam(int scheduleId)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM [UMS].[Exams].[Schedule] WHERE schedule_id = @ScheduleId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@ScheduleId", scheduleId);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();

                    lblMessage.Text = "Exam deleted successfully!";
                    lblMessage.CssClass = "text-success";

                    LoadExams();
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error deleting exam: " + ex.Message;
                    lblMessage.CssClass = "text-danger";
                }
            }
        }

        private bool ValidateInput()
        {
            return !string.IsNullOrEmpty(ddlDepartment.SelectedValue) &&
                   !string.IsNullOrEmpty(ddlCourse.SelectedValue) &&
                   !string.IsNullOrEmpty(txtClassroom.Text) &&
                   !string.IsNullOrEmpty(txtExamDate.Text) &&
                   !string.IsNullOrEmpty(txtStartTime.Text) &&
                   !string.IsNullOrEmpty(txtEndTime.Text) &&
                   !string.IsNullOrEmpty(txtdayofweek.Text);
        }

        private void ClearForm()
        {
            ddlCourse.SelectedIndex = 0;
            txtClassroom.Text = string.Empty;
            txtExamDate.Text = string.Empty;
            txtStartTime.Text = string.Empty;
            txtEndTime.Text = string.Empty;
            txtdayofweek.Text = string.Empty;
        }
    }
}