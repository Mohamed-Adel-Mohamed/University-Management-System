using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace BugzUniversity
{
    public partial class ExamResult : System.Web.UI.Page
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
                LoadExamResults();
            }
        }

        private void LoadExamResults()
        {
            string instructorId = Session["InstructorId"].ToString();
            string query = @"
                SELECT 
                    s.student_id,
                    s.first_name + ' '  AS student_name,
                    c.course_name,
                    e.grade
                FROM 
                    [UMS].[Academics].[Student] s
                INNER JOIN 
                    [UMS].[Academics].[Enrollment] e ON s.student_id = e.student_id
                INNER JOIN 
                    [UMS].[Academics].[Course] c ON e.course_id = c.course_id
                INNER JOIN 
                    [UMS].[Academics].[InstructorCourse] ic ON c.course_id = ic.course_id
                WHERE 
                    ic.instructor_id = @InstructorId
                ORDER BY 
                    s.last_name, s.first_name";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@InstructorId", instructorId);
                    conn.Open();

                    DataTable dt = new DataTable();
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }

                    if (dt.Rows.Count > 0)
                    {
                        gvExamResults.DataSource = dt;
                        gvExamResults.DataBind();
                    }
                    else
                    {
                        lblMessage.Text = "No exam results found for your courses.";
                    }
                }
            }
        }
    }
}
