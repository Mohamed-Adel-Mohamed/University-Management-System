using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace ums
{
    public partial class DepartmentDetails : System.Web.UI.Page
    {
        private readonly string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["UMSDatabase"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        private void BindGridView()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT department_id, department_name FROM [UMS].[Academics].[Department]";
                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                GridView1.DataSource = dataTable;
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            string departmentId = GridView1.DataKeys[e.RowIndex].Value.ToString();
            string departmentName = ((TextBox)row.Cells[1].Controls[0]).Text;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "UPDATE [UMS].[Academics].[Department] " +
                               "SET department_name = @DepartmentName " +
                               "WHERE department_id = @DepartmentID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@DepartmentName", departmentName);
                command.Parameters.AddWithValue("@DepartmentID", departmentId);
                connection.Open();
                command.ExecuteNonQuery();
            }

            GridView1.EditIndex = -1;
            BindGridView();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGridView();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string departmentId = GridView1.DataKeys[e.RowIndex].Value.ToString();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM [UMS].[Academics].[Department] WHERE department_id = @DepartmentID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@DepartmentID", departmentId);
                connection.Open();
                command.ExecuteNonQuery();
            }

            BindGridView();
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            string searchTerm = searchTermTextBox.Text.Trim();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT department_id, department_name FROM [UMS].[Academics].[Department] WHERE department_name LIKE @Search OR department_id LIKE @Search";
                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                adapter.SelectCommand.Parameters.AddWithValue("@Search", "%" + searchTerm + "%");
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

                GridView1.DataSource = dataTable;
                GridView1.DataBind();
            }
        }
    }
}
