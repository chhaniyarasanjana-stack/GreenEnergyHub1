using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ProductList : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["GreenEnergyDB"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadProducts();
        }
    }

    private void LoadProducts()
    {
        string query;
        if (Request.QueryString["subcatid"] != null)
        {
            query = "SELECT * FROM product WHERE subcategory_id=@sid";
        }
        else
        {
            query = "SELECT * FROM product";
        }

        SqlCommand cmd = new SqlCommand(query, con);
        if (Request.QueryString["subcatid"] != null)
        {
            cmd.Parameters.AddWithValue("@sid", Convert.ToInt32(Request.QueryString["subcatid"]));
        }

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        rptProducts.DataSource = dt;
        rptProducts.DataBind();
    }

    protected void rptProducts_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
    {
        int productId = Convert.ToInt32(e.CommandArgument);

        if (e.CommandName == "addtocart")
        {
            if (Session["user_id"] == null)
            {
                Session["pendingProductId"] = productId;
                Session["action"] = "cart";
                Response.Redirect("Login.aspx");
                return;
            }

            AddProductToCart(productId);
            Response.Redirect("Cart.aspx?msg=added");
        }

        if (e.CommandName == "buynow")
        {
            if (Session["user_id"] == null)
            {
                Session["pendingProductId"] = productId;
                Session["action"] = "buy";
                Response.Redirect("Login.aspx");
                return;
            }
            Response.Redirect("Checkout.aspx?pid=" + productId);
        }
    }

    private void AddProductToCart(int productId)
    {
        // --- ડેટાબેઝમાં ઇન્સર્ટ કરવાનું લોજિક ---
        int uid = Convert.ToInt32(Session["user_id"]);

        con.Open();
        // ચેક કરો કે આ આઈટમ પહેલેથી ટેબલમાં છે?
        SqlCommand checkCmd = new SqlCommand("SELECT COUNT(*) FROM cart WHERE user_id=@uid AND product_id=@pid", con);
        checkCmd.Parameters.AddWithValue("@uid", uid);
        checkCmd.Parameters.AddWithValue("@pid", productId);
        int count = (int)checkCmd.ExecuteScalar();

        if (count > 0)
        {
            // જો હોય તો માત્ર Quantity વધારો
            SqlCommand upCmd = new SqlCommand("UPDATE cart SET quantity = quantity + 1 WHERE user_id=@uid AND product_id=@pid", con);
            upCmd.Parameters.AddWithValue("@uid", uid);
            upCmd.Parameters.AddWithValue("@pid", productId);
            upCmd.ExecuteNonQuery();
        }
        else
        {
            // જો ના હોય તો નવી એન્ટ્રી કરો
            SqlCommand insCmd = new SqlCommand("INSERT INTO cart (user_id, product_id, quantity, added_at) VALUES (@uid, @pid, 1, GETDATE())", con);
            insCmd.Parameters.AddWithValue("@uid", uid);
            insCmd.Parameters.AddWithValue("@pid", productId);
            insCmd.ExecuteNonQuery();
        }
        con.Close();

       
        DataTable dt;
        if (Session["cart"] == null)
        {
            dt = new DataTable();
            dt.Columns.Add("product_id");
            dt.Columns.Add("product_name");
            dt.Columns.Add("price", typeof(decimal));
            dt.Columns.Add("quantity", typeof(int));
            dt.Columns.Add("total", typeof(decimal));
        }
        else
        {
            dt = (DataTable)Session["cart"];
        }

        string name = "";
        decimal price = 0;
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT product_name, price FROM product WHERE product_id=@id", con);
        cmd.Parameters.AddWithValue("@id", productId);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            name = dr["product_name"].ToString();
            price = Convert.ToDecimal(dr["price"]);
        }
        con.Close();

        bool found = false;
        foreach (DataRow row in dt.Rows)
        {
            if (row["product_id"].ToString() == productId.ToString())
            {
                row["quantity"] = Convert.ToInt32(row["quantity"]) + 1;
                row["total"] = Convert.ToDecimal(row["price"]) * Convert.ToInt32(row["quantity"]);
                found = true;
                break;
            }
        }
        if (!found) { dt.Rows.Add(productId, name, price, 1, price); }
        Session["cart"] = dt;
    }
}