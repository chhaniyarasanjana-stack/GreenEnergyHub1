using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class MasterPage : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["GreenEnergyDB"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCategory();   // 🔥 ADD THIS LINE
        }

        if (Session["user"] == null)
        {
            lnkLogin.Visible = true;
            lnkLogout.Visible = false;
        }
        else
        {
            lnkLogin.Visible = false;
            lnkLogout.Visible = true;
        }
    }
    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("~/Login.aspx");
    }

    void LoadCategory()
    {
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM category", con);
        DataTable dt = new DataTable();
        da.Fill(dt);

        rptCategory.DataSource = dt;
        rptCategory.DataBind();
    }

    // ✅ This method is required for nav highlight
    public string GetActiveClass(string pageName)
    {
        string currentPage = System.IO.Path.GetFileName(Request.Url.AbsolutePath);
        return currentPage.Equals(pageName, StringComparison.OrdinalIgnoreCase)
            ? "nav-item nav-link active"
            : "nav-item nav-link";
    }
}
