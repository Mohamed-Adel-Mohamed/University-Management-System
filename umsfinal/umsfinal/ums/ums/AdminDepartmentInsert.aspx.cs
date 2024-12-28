using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace UMS
{
    public partial class AdminDepartmentInsert : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize if necessary
            }
        }

        protected void btnInsertDepartment_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["UMSDatabase"].ConnectionString;

            try
            {
                string query = "SET IDENTITY_INSERT Academics.Department ON; " +
                               "INSERT INTO Academics.Department (department_id, department_name) " +
                               "VALUES (@DepartmentID, @DepartmentName); " +
                               "SET IDENTITY_INSERT Academics.Department OFF;";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@DepartmentID", txtDepartmentId.Text.Trim());
                    command.Parameters.AddWithValue("@DepartmentName", txtDepartmentName.Text.Trim());

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();

                    lblMessage.Text = "Department inserted successfully!";
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "An error occurred: " + ex.Message;
            }
        }

    }
}
