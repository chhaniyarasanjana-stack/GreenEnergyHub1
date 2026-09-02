using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class Cart : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["GreenEnergyDB"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_id"] == null)
        {
            Response.Redirect("Login.aspx");
            return;
        }

        if (!IsPostBack)
        {
            BindCart();

            // ✅ Show success message
            if (Request.QueryString["msg"] == "added")
            {
                lblMessage.Text = "✅ Product added to cart successfully!";
                lblMessage.Visible = true;
            }
            else
            {
                lblMessage.Visible = false;
            }
        }
    }
    private void BindCart()
    {
        int uid = Convert.ToInt32(Session["user_id"]);
        // ડેટાબેઝ માંથી ડેટા લાવવો (JOIN કરીને)
        string query = @"SELECT c.product_id, p.product_name, p.price, c.quantity, (p.price * c.quantity) as total 
                         FROM cart c INNER JOIN product p ON c.product_id = p.product_id 
                         WHERE c.user_id = @uid";

        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Parameters.AddWithValue("@uid", uid);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);

        gvCart.DataSource = dt;
        gvCart.DataBind();

        decimal grandTotal = 0;
        foreach (DataRow row in dt.Rows)
        {
            grandTotal += Convert.ToDecimal(row["total"]);
        }
        lblTotal.Text = "Grand Total: ₹ " + grandTotal.ToString("N2");

        Session["cart"] = dt;
    }

    protected void gvCart_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        DataTable dt = (DataTable)Session["cart"];
        if (dt == null || dt.Rows.Count <= index) return;

        int productId = Convert.ToInt32(dt.Rows[index]["product_id"]);
        int uid = Convert.ToInt32(Session["user_id"]);

        con.Open();
        if (e.CommandName == "Increase")
        {
            new SqlCommand("UPDATE cart SET quantity = quantity + 1 WHERE user_id=" + uid + " AND product_id=" + productId, con).ExecuteNonQuery();
        }
        else if (e.CommandName == "Decrease")
        {
            new SqlCommand("UPDATE cart SET quantity = CASE WHEN quantity > 1 THEN quantity - 1 ELSE 1 END WHERE user_id=" + uid + " AND product_id=" + productId, con).ExecuteNonQuery();
        }
        else if (e.CommandName == "Remove")
        {
            new SqlCommand("DELETE FROM cart WHERE user_id=" + uid + " AND product_id=" + productId, con).ExecuteNonQuery();
        }
        con.Close();

        BindCart();
    }

    protected void btnCheckout_Click(object sender, EventArgs e)
    {
        Response.Redirect("Checkout.aspx");
    }
}