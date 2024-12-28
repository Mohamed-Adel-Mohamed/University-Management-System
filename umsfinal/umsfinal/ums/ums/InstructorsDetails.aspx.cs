using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace ums
{
    public partial class InstructorsDetails : System.Web.UI.Page
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
                string query = "SELECT instructor_id, first_name, last_name, email, phone, department_id FROM [UMS].[Academics].[Instructor]";
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
            string instructorId = GridView1.DataKeys[e.RowIndex].Value.ToString();
            string firstName = ((TextBox)row.Cells[1].Controls[0]).Text;
            string lastName = ((TextBox)row.Cells[2].Controls[0]).Text;
            string email = ((TextBox)row.Cells[3].Controls[0]).Text;
            string phone = ((TextBox)row.Cells[4].Controls[0]).Text;
            string departmentId = ((TextBox)row.Cells[5].Controls[0]).Text;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "UPDATE [UMS].[Academics].[Instructor] " +
                               "SET first_name = @FirstName, last_name = @LastName, email = @Email, phone = @Phone, department_id = @DepartmentID " +
                               "WHERE instructor_id = @InstructorID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@FirstName", firstName);
                command.Parameters.AddWithValue("@LastName", lastName);
                command.Parameters.AddWithValue("@Email", email);
                command.Parameters.AddWithValue("@Phone", phone);
                command.Parameters.AddWithValue("@DepartmentID", departmentId);
                command.Parameters.AddWithValue("@InstructorID", instructorId);
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
            string instructorId = GridView1.DataKeys[e.RowIndex].Value.ToString();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM [UMS].[Academics].[Instructor] WHERE instructor_id = @InstructorID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@InstructorID", instructorId);
                connection.Open();
                command.ExecuteNonQuery();
            }

            BindGridView();
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            string searchTerm = searchTermTextBox.Text.Trim(); // Get the instructor_id from the TextBox

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Modify the query to search only by instructor_id
                string query = @"SELECT instructor_id, first_name, last_name, email, phone 
                         FROM [UMS].[Academics].[Instructor] 
                         WHERE instructor_id LIKE @Search"; // Only filter by instructor_id

                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                adapter.SelectCommand.Parameters.AddWithValue("@Search", "%" + searchTerm + "%"); // Using LIKE to allow partial matching

                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

                GridView1.DataSource = dataTable;
                GridView1.DataBind();
            }
        }



    }
}
