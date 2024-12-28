using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace UMS
{
    public partial class admin_dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["UMSDatabase"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    string query = "INSERT INTO Academics.Student ([student_id], [first_name], [last_name], [email], [phone], [department_id], [status], [address]) " +
                                   "VALUES (@StudentID, @FirstName, @LastName, @Email, @Phone, @DepartmentID, @Status, @Address)";

                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@StudentID", txtStudentId.Text.Trim());
                    command.Parameters.AddWithValue("@FirstName", txtFirstName.Text.Trim());
                    command.Parameters.AddWithValue("@LastName", txtLastName.Text.Trim());
                    command.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    command.Parameters.AddWithValue("@Phone", txtPhone.Text.Trim());
                    command.Parameters.AddWithValue("@DepartmentID", ddlDepartment.SelectedValue);
                    command.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
                    command.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());

                    connection.Open();
                    command.ExecuteNonQuery();

                    // Register the JavaScript alert to show on client-side after successful registration
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Student registered successfully!');", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", $"alert('An error occurred: {ex.Message}');", true);
                }
            }
        }



    }
}
