using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class SubCategory : System.Web.UI.Page
{
    // Connection String
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["GreenEnergyDB"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadSubCategory();
        }
    }

    void LoadSubCategory()
    {
        string cid = Request.QueryString["cid"];
       
        string query = "SELECT subcategory_id, subcategory_name, image FROM subcategory WHERE category_id=@cid";

        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Parameters.AddWithValue("@cid", cid);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt); // Have ahia error nahi aave

        rptSub.DataSource = dt;
        rptSub.DataBind();
    }
}