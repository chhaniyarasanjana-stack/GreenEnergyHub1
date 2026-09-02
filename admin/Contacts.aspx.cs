using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Contacts : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["GreenEnergyDB"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadContacts();
        }
    }

    void LoadContacts()
    {
        SqlDataAdapter da = new SqlDataAdapter(
            "SELECT contact_id,name,email,message,created_at FROM contact_us ORDER BY contact_id DESC",
            con);

        DataTable dt = new DataTable();
        da.Fill(dt);
        gvContacts.DataSource = dt;
        gvContacts.DataBind();
    }

    protected void gvContacts_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        if (e.CommandName == "deleteRow")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            int id = Convert.ToInt32(gvContacts.DataKeys[index].Value);

            SqlCommand cmd = new SqlCommand(
                "DELETE FROM contact_us WHERE contact_id=@id", con);
            cmd.Parameters.AddWithValue("@id", id);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            LoadContacts();

            ClientScript.RegisterStartupScript(
                this.GetType(),
                "popup",
                "showPopup('Deleted','Message deleted successfully');",
                true);
        }
    }
}
