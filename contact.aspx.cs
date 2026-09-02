using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;


public partial class contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
   protected void btnSend_Click(object sender, EventArgs e)
    {
        try
        {
            string cs = ConfigurationManager
                        .ConnectionStrings["GreenEnergyDB"]
                        .ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"INSERT INTO contact_us
                                (name, email, subject, message)
                                VALUES
                                (@name, @email, @subject, @message)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@name", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@subject", txtSubject.Text.Trim());
                    cmd.Parameters.AddWithValue("@message", txtMessage.Text.Trim());

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = "Message sent successfully!";

            // Clear fields
            txtName.Text = "";
            txtEmail.Text = "";
            txtSubject.Text = "";
            txtMessage.Text = "";
        }
        catch (Exception ex)
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Error: " + ex.Message;
        }
    }
}