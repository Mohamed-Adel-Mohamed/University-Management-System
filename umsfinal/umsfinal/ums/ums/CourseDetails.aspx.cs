using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ums
{
    public partial class CourseDetails : Page
    {
        // Connection string to the database
        string connString = System.Configuration.ConfigurationManager.ConnectionStrings["UMSDatabase"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        // Bind GridView with data
        private void BindGridView()
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlDataAdapter cmd = new SqlDataAdapter("SELECT * FROM [UMS].[Academics].[Course]", conn);
                DataTable dt = new DataTable();
                cmd.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        // Handle Edit button click
        protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        // Handle Update button click
        protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            string course_id = GridView1.DataKeys[e.RowIndex].Value.ToString();
            string course_name = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            string department_id = ((TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
            string instructor_id = ((TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
            string course_code = ((TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]).Text;
            string semester = ((TextBox)GridView1.Rows[e.RowIndex].Cells[5].Controls[0]).Text;
            string year = ((TextBox)GridView1.Rows[e.RowIndex].Cells[6].Controls[0]).Text;
            string schedule = ((TextBox)GridView1.Rows[e.RowIndex].Cells[7].Controls[0]).Text;
            string classroom = ((TextBox)GridView1.Rows[e.RowIndex].Cells[8].Controls[0]).Text;
            string capacity = ((TextBox)GridView1.Rows[e.RowIndex].Cells[9].Controls[0]).Text;
            string status = ((TextBox)GridView1.Rows[e.RowIndex].Cells[10].Controls[0]).Text;
            string credit_hours = ((TextBox)GridView1.Rows[e.RowIndex].Cells[11].Controls[0]).Text;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("UPDATE [UMS].[Academics].[Course] SET course_name = @course_name, department_id = @department_id, instructor_id = @instructor_id, course_code = @course_code, semester = @semester, year = @year, schedule = @schedule, classroom = @classroom, capacity = @capacity, status = @status, credit_hours = @credit_hours WHERE course_id = @course_id", conn);
                cmd.Parameters.AddWithValue("@course_id", course_id);
                cmd.Parameters.AddWithValue("@course_name", course_name);
                cmd.Parameters.AddWithValue("@department_id", department_id);
                cmd.Parameters.AddWithValue("@instructor_id", instructor_id);
                cmd.Parameters.AddWithValue("@course_code", course_code);
                cmd.Parameters.AddWithValue("@semester", semester);
                cmd.Parameters.AddWithValue("@year", year);
                cmd.Parameters.AddWithValue("@schedule", schedule);
                cmd.Parameters.AddWithValue("@classroom", classroom);
                cmd.Parameters.AddWithValue("@capacity", capacity);
                cmd.Parameters.AddWithValue("@status", status);
                cmd.Parameters.AddWithValue("@credit_hours", credit_hours);

                conn.Open();
                cmd.ExecuteNonQuery();
                GridView1.EditIndex = -1;
                BindGridView();
            }
        }

        // Handle Cancel button click
        protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGridView();
        }

        // Handle Delete button click
        protected void GridView1_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            string course_id = GridView1.DataKeys[e.RowIndex].Value.ToString();

            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM [UMS].[Academics].[Course] WHERE course_id = @course_id", conn);
                cmd.Parameters.AddWithValue("@course_id", course_id);

                conn.Open();
                cmd.ExecuteNonQuery();
                BindGridView();
            }
        }
    }
}
