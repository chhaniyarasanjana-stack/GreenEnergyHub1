using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class register : System.Web.UI.Page
{
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox6.Text != TextBox7.Text)
        {
            lblMessage.Text = "Passwords do not match!";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            return;
        }

        string cs = ConfigurationManager.ConnectionStrings["GreenEnergyDB"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(cs))
        {
            conn.Open();

            // Check if username already exists
            SqlCommand checkCmd = new SqlCommand("SELECT COUNT(*) FROM register_user WHERE username=@uname", conn);
            checkCmd.Parameters.AddWithValue("@uname", TextBox4.Text.Trim());

            int userExists = (int)checkCmd.ExecuteScalar();

            if (userExists > 0)
            {
                lblMessage.Text = "Username already exists!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string query = @"INSERT INTO register_user
                            (first_name, last_name, username, email, password, mobile)
                            VALUES (@fname,@lname,@uname,@email,@pass,@mobile)";

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@fname", TextBox2.Text.Trim());
            cmd.Parameters.AddWithValue("@lname", TextBox3.Text.Trim());
            cmd.Parameters.AddWithValue("@uname", TextBox4.Text.Trim());
            cmd.Parameters.AddWithValue("@email", TextBox5.Text.Trim());
            cmd.Parameters.AddWithValue("@pass", TextBox6.Text.Trim());
            cmd.Parameters.AddWithValue("@mobile", TextBox8.Text.Trim());

            int result = cmd.ExecuteNonQuery();

            if (result > 0)
            {
                Response.Redirect("login.aspx?msg=success");
            }
            else
            {
                lblMessage.Text = "Registration Failed!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}
