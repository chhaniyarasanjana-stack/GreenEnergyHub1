using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class Admin_AddSubCategory : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["GreenEnergyDB"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCategory();
            LoadSubCategory();
        }
    }

    void LoadCategory()
    {
        SqlDataAdapter da = new SqlDataAdapter(
            "SELECT category_id, category_name FROM category", con);
        DataTable dt = new DataTable();
        da.Fill(dt);

        ddlCategory.DataSource = dt;
        ddlCategory.DataTextField = "category_name";
        ddlCategory.DataValueField = "category_id";
        ddlCategory.DataBind();
    }

    void LoadSubCategory()
    {
        SqlDataAdapter da = new SqlDataAdapter(
            "SELECT * FROM subcategory ORDER BY subcategory_id DESC", con);
        DataTable dt = new DataTable();
        da.Fill(dt);

        gvSubCategory.DataSource = dt;
        gvSubCategory.DataBind();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string imgPath = null;

        if (fuImage.HasFile)
        {
            string folder = Server.MapPath("~/images/");
            if (!Directory.Exists(folder))
                Directory.CreateDirectory(folder);

            string imgName = Guid.NewGuid() + Path.GetExtension(fuImage.FileName);
            fuImage.SaveAs(folder + imgName);
            imgPath = "~/images/" + imgName;
        }

        con.Open();

        if (hfSubId.Value == "")
        {
            SqlCommand cmd = new SqlCommand(
                "INSERT INTO subcategory(category_id,subcategory_name,image) VALUES(@cid,@name,@img)", con);
            cmd.Parameters.AddWithValue("@cid", ddlCategory.SelectedValue);
            cmd.Parameters.AddWithValue("@name", txtSubCategory.Text);
            cmd.Parameters.AddWithValue("@img", (object)imgPath ?? DBNull.Value);
            cmd.ExecuteNonQuery();

            ShowPopup("Success", "SubCategory added successfully!", "success");
        }
        else
        {
            SqlCommand cmd = new SqlCommand(
                "UPDATE subcategory SET category_id=@cid,subcategory_name=@name,image=@img WHERE subcategory_id=@id", con);
            cmd.Parameters.AddWithValue("@cid", ddlCategory.SelectedValue);
            cmd.Parameters.AddWithValue("@name", txtSubCategory.Text);
            cmd.Parameters.AddWithValue("@img", (object)imgPath ?? DBNull.Value);
            cmd.Parameters.AddWithValue("@id", hfSubId.Value);
            cmd.ExecuteNonQuery();

            hfSubId.Value = "";
            ShowPopup("Updated", "SubCategory updated successfully!", "success");
        }

        con.Close();
        txtSubCategory.Text = "";
        LoadSubCategory();
    }

    protected void gvSubCategory_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        int id = Convert.ToInt32(gvSubCategory.DataKeys[index].Value);

        if (e.CommandName == "editRow")
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT * FROM subcategory WHERE subcategory_id=@id", con);
            cmd.Parameters.AddWithValue("@id", id);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                txtSubCategory.Text = dr["subcategory_name"].ToString();
                ddlCategory.SelectedValue = dr["category_id"].ToString();
                hfSubId.Value = id.ToString();
            }
            con.Close();

            ShowPopup("Edit Mode", "SubCategory loaded for editing", "info");
        }

        if (e.CommandName == "deleteRow")
        {
            SqlCommand cmd = new SqlCommand(
                "DELETE FROM subcategory WHERE subcategory_id=@id", con);
            cmd.Parameters.AddWithValue("@id", id);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            LoadSubCategory();
            ShowPopup("Deleted", "SubCategory deleted successfully!", "success");
        }
    }

    void ShowPopup(string title, string msg, string icon)
    {
        string script = "Swal.fire({ title: '" + title +
                        "', text: '" + msg +
                        "', icon: '" + icon + "' });";

        ClientScript.RegisterStartupScript(this.GetType(), "popup", script, true);
    }
}
