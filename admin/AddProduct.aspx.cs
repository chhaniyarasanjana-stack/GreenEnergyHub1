using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.UI.WebControls;

public partial class Admin_AddProduct : System.Web.UI.Page
{
    // કનેક્શન સ્ટ્રિંગ
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["GreenEnergyDB"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCategory();
            LoadProduct();
        }
    }

    void LoadCategory()
    {
        using (SqlDataAdapter da = new SqlDataAdapter("SELECT category_id, category_name FROM category", con))
        {
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlCategory.DataSource = dt;
            ddlCategory.DataTextField = "category_name";
            ddlCategory.DataValueField = "category_id";
            ddlCategory.DataBind();
            ddlCategory.Items.Insert(0, new ListItem("--Select Category--", "0"));
        }
    }

    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadSubCategory(Convert.ToInt32(ddlCategory.SelectedValue));
    }

    void LoadSubCategory(int catId)
    {
        using (SqlDataAdapter da = new SqlDataAdapter("SELECT subcategory_id, subcategory_name FROM subcategory WHERE category_id=@cid", con))
        {
            da.SelectCommand.Parameters.AddWithValue("@cid", catId);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlSubCategory.DataSource = dt;
            ddlSubCategory.DataTextField = "subcategory_name";
            ddlSubCategory.DataValueField = "subcategory_id";
            ddlSubCategory.DataBind();
            ddlSubCategory.Items.Insert(0, new ListItem("--Select SubCategory--", "0"));
        }
    }

    void LoadProduct()
    {
        using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM product ORDER BY product_id DESC", con))
        {
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvProduct.DataSource = dt;
            gvProduct.DataBind();
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        decimal price = 0;
        decimal.TryParse(txtPrice.Text, out price);
        int catId = Convert.ToInt32(ddlCategory.SelectedValue);
        int subId = Convert.ToInt32(ddlSubCategory.SelectedValue);
        string imgPath = hfOldImage.Value;

        if (fuImage.HasFile)
        {
            string folder = Server.MapPath("~/img/");
            if (!Directory.Exists(folder)) Directory.CreateDirectory(folder);
            string name = Guid.NewGuid() + Path.GetExtension(fuImage.FileName);
            fuImage.SaveAs(folder + name);
            imgPath = "~/img/" + name;
        }

        con.Open();
        if (string.IsNullOrEmpty(hfProductId.Value))
        {
            SqlCommand cmd = new SqlCommand(@"INSERT INTO product (product_name,description,price,image,category_id,subcategory_id,created_at) 
                                            VALUES(@n,@d,@p,@i,@c,@s,GETDATE())", con);
            cmd.Parameters.AddWithValue("@n", txtName.Text);
            cmd.Parameters.AddWithValue("@d", txtDesc.Text);
            cmd.Parameters.AddWithValue("@p", price);
            cmd.Parameters.AddWithValue("@i", imgPath);
            cmd.Parameters.AddWithValue("@c", catId);
            cmd.Parameters.AddWithValue("@s", subId);
            cmd.ExecuteNonQuery();
            ShowPopup("Success", "Product Added Successfully!", "success");
        }
        else
        {
            int pid = Convert.ToInt32(hfProductId.Value);
            SqlCommand cmd = new SqlCommand(@"UPDATE product SET product_name=@n,description=@d,price=@p,image=@i,
                                            category_id=@c, subcategory_id=@s WHERE product_id=@id", con);
            cmd.Parameters.AddWithValue("@n", txtName.Text);
            cmd.Parameters.AddWithValue("@d", txtDesc.Text);
            cmd.Parameters.AddWithValue("@p", price);
            cmd.Parameters.AddWithValue("@i", imgPath);
            cmd.Parameters.AddWithValue("@c", catId);
            cmd.Parameters.AddWithValue("@s", subId);
            cmd.Parameters.AddWithValue("@id", pid);
            cmd.ExecuteNonQuery();
            hfProductId.Value = "";
            btnSave.Text = "Add Product";
            ShowPopup("Updated", "Product Updated Successfully!", "success");
        }
        con.Close();
        ClearFields();
        LoadProduct();
    }

    protected void gvProduct_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        int id = Convert.ToInt32(gvProduct.DataKeys[index].Value);

        if (e.CommandName == "editRow")
        {
            // ભૂલ સુધારવા માટે અહીં DataTable નો ઉપયોગ કર્યો છે
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM product WHERE product_id=@id", con);
            da.SelectCommand.Parameters.AddWithValue("@id", id);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                txtName.Text = dr["product_name"].ToString();
                txtDesc.Text = dr["description"].ToString();
                txtPrice.Text = dr["price"].ToString();
                string catId = dr["category_id"].ToString();
                string subId = dr["subcategory_id"].ToString();
                hfOldImage.Value = dr["image"].ToString();
                hfProductId.Value = id.ToString();

                ddlCategory.SelectedValue = catId;
                LoadSubCategory(Convert.ToInt32(catId)); // હવે અહીં એરર નહીં આવે
                ddlSubCategory.SelectedValue = subId;

                btnSave.Text = "Add Product";
                ShowPopup("Edit Mode", "Product loaded for editing", "info");
            }
        }

        if (e.CommandName == "deleteRow")
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM product WHERE product_id=@id", con);
            cmd.Parameters.AddWithValue("@id", id);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            LoadProduct();
            ShowPopup("Deleted", "Product deleted successfully!", "success");
        }
    }

    private void ClearFields()
    {
        txtName.Text = txtDesc.Text = txtPrice.Text = "";
        ddlCategory.SelectedIndex = 0;
        ddlSubCategory.Items.Clear();
        hfProductId.Value = hfOldImage.Value = "";
    }

    void ShowPopup(string title, string msg, string icon)
    {
        string script = "Swal.fire({ title: '" + title + "', text: '" + msg + "', icon: '" + icon + "' });";
        ClientScript.RegisterStartupScript(this.GetType(), "popup", script, true);
    }
}