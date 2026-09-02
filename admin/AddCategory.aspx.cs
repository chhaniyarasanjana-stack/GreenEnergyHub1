using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class Admin_category : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["GreenEnergyDB"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            LoadCategory();
    }

    void LoadCategory()
    {
        SqlDataAdapter da = new SqlDataAdapter(
            "SELECT * FROM category ORDER BY category_id DESC", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        gvCategory.DataSource = dt;
        gvCategory.DataBind();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string imgPath = null;

        if (fuImage.HasFile)
        {
            string folder = Server.MapPath("~/img/");
            if (!Directory.Exists(folder))
                Directory.CreateDirectory(folder);

            string imgName = Guid.NewGuid() + Path.GetExtension(fuImage.FileName);
            fuImage.SaveAs(folder + imgName);
            imgPath = "~/img/" + imgName;
        }

        con.Open();

        if (hfCategoryId.Value == "")
        {
            SqlCommand cmd = new SqlCommand(
                "INSERT INTO category(category_name,image,created_at) VALUES(@n,@i,GETDATE())", con);
            cmd.Parameters.AddWithValue("@n", txtCategory.Text);
            cmd.Parameters.AddWithValue("@i", (object)imgPath ?? DBNull.Value);
            cmd.ExecuteNonQuery();

            ShowPopup("Success", "Category added successfully!", "success");
        }
        else
        {
            SqlCommand cmd = new SqlCommand(
                "UPDATE category SET category_name=@n,image=@i WHERE category_id=@id", con);
            cmd.Parameters.AddWithValue("@n", txtCategory.Text);
            cmd.Parameters.AddWithValue("@i", (object)imgPath ?? DBNull.Value);
            cmd.Parameters.AddWithValue("@id", hfCategoryId.Value);
            cmd.ExecuteNonQuery();

            hfCategoryId.Value = "";
            ShowPopup("Updated", "Category updated successfully!", "success");
        }

        con.Close();
        txtCategory.Text = "";
        LoadCategory();
    }

    protected void gvCategory_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        int id = Convert.ToInt32(gvCategory.DataKeys[index].Value);

        if (e.CommandName == "editRow")
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT * FROM category WHERE category_id=@id", con);
            cmd.Parameters.AddWithValue("@id", id);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                txtCategory.Text = dr["category_name"].ToString();
                hfCategoryId.Value = id.ToString();
            }
            con.Close();

            ShowPopup("Edit Mode", "Category loaded for editing", "info");
        }

        if (e.CommandName == "deleteRow")
        {
            SqlCommand cmd = new SqlCommand(
                "DELETE FROM category WHERE category_id=@id", con);
            cmd.Parameters.AddWithValue("@id", id);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            LoadCategory();
            ShowPopup("Deleted", "Category deleted successfully!", "success");
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