using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Users : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["GreenEnergyDB"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadUsers();
        }
    }

    private void LoadUsers()
    {
        SqlDataAdapter da = new SqlDataAdapter(
            @"SELECT user_id,
                     first_name,
                     last_name,
                     username,
                     email,
                     password,
                     confirm_password,
                     mobile
              FROM register_user
              ORDER BY user_id DESC", con);

        DataTable dt = new DataTable();
        da.Fill(dt);

        gvUsers.DataSource = dt;
        gvUsers.DataBind();
    }

    protected void gvUsers_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        if (e.CommandName == "deleteRow")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            int id = Convert.ToInt32(gvUsers.DataKeys[index].Value);

            SqlCommand cmd = new SqlCommand(
                "DELETE FROM register_user WHERE user_id=@id", con);

            cmd.Parameters.AddWithValue("@id", id);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            LoadUsers();
        }
    }
}