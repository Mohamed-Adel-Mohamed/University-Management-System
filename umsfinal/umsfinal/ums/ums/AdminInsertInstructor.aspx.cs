using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace UMS
{
    public partial class admin_insert_instructor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // You may load departments or other data if needed
            }
        }

        protected void btnInsertInstructor_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["UMSDatabase"].ConnectionString;

            try
            {
                // Debugging step: Log message to check if button click is triggering the event
                Console.WriteLine("Button clicked!");

                string query = "INSERT INTO Academics.Instructor ([first_name], [last_name], [email], [phone], [department_id]) " +
                               "VALUES (@FirstName, @LastName, @Email, @Phone, @DepartmentID)";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@FirstName", txtFirstName.Text.Trim());
                    command.Parameters.AddWithValue("@LastName", txtLastName.Text.Trim());
                    command.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    command.Parameters.AddWithValue("@Phone", txtPhone.Text.Trim());
                    command.Parameters.AddWithValue("@DepartmentID", ddlDepartment.SelectedValue);

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();

                    // Register the JavaScript alert to show on client-side after successful insert
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Instructor inserted successfully!');", true);
                }
            }
            catch (Exception ex)
            {
                // Display error message in case of an exception
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", $"alert('An error occurred: {ex.Message}');", true);
            }
        }

    }
}
