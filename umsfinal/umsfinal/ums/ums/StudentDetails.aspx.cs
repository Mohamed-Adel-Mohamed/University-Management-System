using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace YourNamespace
{
    public partial class StudentDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string studentId = txtSearchStudentId.Text.Trim();
            if (!string.IsNullOrEmpty(studentId))
            {
                string query = "SELECT [student_id], [first_name], [last_name], [email], [phone], [department_id], [advisor_id], [GPA], [status], [address] " +
                               "FROM [UMS].[Academics].[Student] WHERE [student_id] = @studentId";

                SqlCommand cmd = new SqlCommand(query);
                cmd.Parameters.AddWithValue("@studentId", studentId);

                gvStudents.DataSource = GetData(cmd);
                gvStudents.DataBind();
            }
            else
            {
                BindGridView();
            }
        }

        private void BindGridView()
        {
            string query = "SELECT [student_id], [first_name], [last_name], [email], [phone], [department_id], [advisor_id], [GPA], [status], [address] FROM [UMS].[Academics].[Student]";
            SqlCommand cmd = new SqlCommand(query);

            gvStudents.DataSource = GetData(cmd);
            gvStudents.DataBind();
        }

        private DataTable GetData(SqlCommand cmd)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["UMSDatabase"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                cmd.Connection = conn;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }

        protected void gvStudents_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvStudents.PageIndex = e.NewPageIndex;
            BindGridView();
        }
    }
}
