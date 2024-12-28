using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.UI;

namespace BugzUniversity
{
    public partial class ExamResultEntry : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["UMSDatabase"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["InstructorId"] == null)
            {
                Response.Redirect("Default.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadInstructorCourses();
            }
        }

        private void LoadInstructorCourses()
        {
            string instructorId = Session["InstructorId"].ToString();
            string query = @"SELECT c.course_id, 
                           c.course_name + ' (' + c.course_code + ')' as course_display
                           FROM [UMS].[Academics].[Course] c 
                           INNER JOIN [UMS].[Academics].[InstructorCourse] ic 
                           ON c.course_id = ic.course_id 
                           WHERE ic.instructor_id = @InstructorId";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@InstructorId", instructorId);
                    conn.Open();

                    ddlCourses.DataSource = cmd.ExecuteReader();
                    ddlCourses.DataTextField = "course_display";
                    ddlCourses.DataValueField = "course_id";
                    ddlCourses.DataBind();

                    ddlCourses.Items.Insert(0, new ListItem("-- Select Course --", ""));
                }
            }
        }

        protected void ddlCourses_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(ddlCourses.SelectedValue)) return;
            LoadStudents();
        }

        private void LoadStudents()
        {
            string query = @"SELECT s.student_id,
                           s.first_name + ' '  as full_name,
                           e.grade as current_grade
                           FROM [UMS].[Academics].[Student] s
                           INNER JOIN [UMS].[Academics].[Enrollment] e 
                           ON s.student_id = e.student_id
                           WHERE e.course_id = @CourseId
                           ORDER BY s.last_name, s.first_name";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@CourseId", ddlCourses.SelectedValue);
                    conn.Open();

                    DataTable dt = new DataTable();
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }

                    gvStudents.DataSource = dt;
                    gvStudents.DataBind();
                }
            }
        }

        protected void gvStudents_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string currentGrade = DataBinder.Eval(e.Row.DataItem, "current_grade")?.ToString();
                DropDownList ddlGrade = (DropDownList)e.Row.FindControl("ddlGrade");

                if (!string.IsNullOrEmpty(currentGrade) && ddlGrade != null)
                {
                    ListItem item = ddlGrade.Items.FindByValue(currentGrade);
                    if (item != null)
                    {
                        item.Selected = true;
                    }
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(ddlCourses.SelectedValue))
            {
                lblMessage.Text = "Please select a course first.";
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                using (SqlTransaction transaction = conn.BeginTransaction())
                {
                    try
                    {
                        foreach (GridViewRow row in gvStudents.Rows)
                        {
                            string studentId = row.Cells[0].Text;
                            DropDownList ddlGrade = (DropDownList)row.FindControl("ddlGrade");
                            string grade = ddlGrade.SelectedValue;

                            if (!string.IsNullOrEmpty(grade))
                            {
                                string query = @"UPDATE [UMS].[Academics].[Enrollment]
                                               SET grade = @Grade
                                               WHERE student_id = @StudentId 
                                               AND course_id = @CourseId";

                                using (SqlCommand cmd = new SqlCommand(query, conn, transaction))
                                {
                                    cmd.Parameters.AddWithValue("@Grade", grade);
                                    cmd.Parameters.AddWithValue("@StudentId", studentId);
                                    cmd.Parameters.AddWithValue("@CourseId", ddlCourses.SelectedValue);
                                    cmd.ExecuteNonQuery();
                                }
                            }
                        }

                        transaction.Commit();
                        lblMessage.Text = "Grades saved successfully!";
                        LoadStudents(); // Refresh the grid
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        lblMessage.Text = "Error saving grades: " + ex.Message;
                    }
                }
            }
        }
    }
}