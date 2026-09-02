using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;

public partial class reset_password : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        // Get the username or email from the form
        string userInput = TextBoxUsernameOrEmail.Text.Trim();

        // Get the new password and confirm password
        string newPassword = TextBox1.Text.Trim();
        string confirmPassword = TextBox2.Text.Trim();

        if (newPassword == confirmPassword)
        {
            // Connection string from web.config
            string connectionString = ConfigurationManager.ConnectionStrings["GreenEnergyDB"].ConnectionString;

            // SQL to check if the username or email exists
            string userCheckQuery = "SELECT COUNT(*) FROM login_user WHERE username = @UserInput";

            // SQL to update password
            string updateQuery = "UPDATE login_user SET password = @NewPassword WHERE username = @UserInput";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    // Check if the username or email exists
                    using (SqlCommand userCheckCmd = new SqlCommand(userCheckQuery, conn))
                    {
                        userCheckCmd.Parameters.AddWithValue("@UserInput", userInput);
                        int userExists = (int)userCheckCmd.ExecuteScalar();

                        if (userExists > 0)
                        {
                            // Update the password
                            using (SqlCommand updateCmd = new SqlCommand(updateQuery, conn))
                            {
                                updateCmd.Parameters.AddWithValue("@NewPassword", newPassword);
                                updateCmd.Parameters.AddWithValue("@UserInput", userInput);

                                int rowsAffected = updateCmd.ExecuteNonQuery();

                                if (rowsAffected > 0)
                                {
                                    // Password updated successfully
                                    Response.Write("<script>alert('Password updated successfully.');</script>");
                                }
                                else
                                {
                                    // Unexpected error during password update
                                    Response.Write("<script>alert('An error occurred while updating the password. Please try again.');</script>");
                                }
                            }
                        }
                        else
                        {
                            // No user found with the provided username or email
                            Response.Write("<script>alert('No user found with the provided username or email.');</script>");
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                // Log the exception
                LogError(ex);

                // Show a generic error message to the user
                Response.Write("<script>alert('An error occurred while processing your request. Please try again later.');</script>");
            }
        }
        else
        {
            // Show error if passwords do not match
            Response.Write("<script>alert('Passwords do not match.');</script>");
        }
    }

    private void LogError(Exception ex)
    {
        // Implement logging (e.g., write to a file, database, or event log)
        // Example: System.IO.File.WriteAllText("error.log", ex.ToString());
    }
}
