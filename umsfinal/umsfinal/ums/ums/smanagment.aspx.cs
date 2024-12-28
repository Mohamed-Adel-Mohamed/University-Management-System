using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace ums
{
    public partial class smanagment : System.Web.UI.Page
    {
        // Connection string from Web.config
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
                string query = "SELECT student_id, first_name, last_name, email, phone FROM [UMS].[Academics].[Student]";
                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                GridView1.DataSource = dataTable;
                GridView1.DataBind();
            }
        }

        // Row Editing
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex; // Set the row to edit mode
            BindGridView(); // Rebind data to show editable row
        }

        // Row Updating
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            string studentId = GridView1.DataKeys[e.RowIndex].Value.ToString();
            string firstName = ((TextBox)row.Cells[1].Controls[0]).Text;
            string lastName = ((TextBox)row.Cells[2].Controls[0]).Text;
            string email = ((TextBox)row.Cells[3].Controls[0]).Text;
            string phone = ((TextBox)row.Cells[4].Controls[0]).Text;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "UPDATE [UMS].[Academics].[Student] " +
                               "SET first_name = @FirstName, last_name = @LastName, email = @Email, phone = @Phone " +
                               "WHERE student_id = @StudentID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@FirstName", firstName);
                command.Parameters.AddWithValue("@LastName", lastName);
                command.Parameters.AddWithValue("@Email", email);
                command.Parameters.AddWithValue("@Phone", phone);
                command.Parameters.AddWithValue("@StudentID", studentId);
                connection.Open();
                command.ExecuteNonQuery();
            }

            GridView1.EditIndex = -1; // Exit edit mode
            BindGridView(); // Rebind data to reflect changes
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1; // Exit edit mode
            BindGridView(); // Rebind data to revert changes
        }

        // Row Deleting
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string studentId = GridView1.DataKeys[e.RowIndex].Value.ToString();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM [UMS].[Academics].[Student] WHERE student_id = @StudentID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@StudentID", studentId);
                connection.Open();
                command.ExecuteNonQuery();
            }

            BindGridView(); // Rebind data to reflect changes
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            string searchTerm = Request.Form["searchTerm"];
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT student_id, first_name, last_name, email, phone " +
                               "FROM [UMS].[Academics].[Student] " +
                               "WHERE first_name LIKE @Search OR last_name LIKE @Search OR student_id LIKE @Search";
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
