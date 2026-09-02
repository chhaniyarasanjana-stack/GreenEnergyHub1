using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;          // 🔥 ADD THIS
using System.Web.Security;
using System.Configuration;
public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["msg"] == "success")
            {
                lblError.Text = "Registration Successful! Please Login.";
                lblError.ForeColor = System.Drawing.Color.Green;
            }
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string username = txtUser.Text.Trim();
        string password = txtPass.Text.Trim();

        string cs = ConfigurationManager.ConnectionStrings["GreenEnergyDB"].ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = "SELECT * FROM register_user WHERE username=@uname AND password=@pass";
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@uname", username);
            cmd.Parameters.AddWithValue("@pass", password);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                Session["user_id"] = Convert.ToInt32(dr["user_id"]);
                Session["user"] = dr["username"].ToString();

                FormsAuthentication.SetAuthCookie(username, false);

                dr.Close();

                if (Session["pendingProductId"] != null)
                {
                    int productId = Convert.ToInt32(Session["pendingProductId"]);
                    string action = Session["action"].ToString();

                    Session.Remove("pendingProductId");
                    Session.Remove("action");

                    if (action == "cart")
                    {
                        AddProductToCart(productId);
                        Response.Redirect("~/Cart.aspx");
                        return;
                    }

                    if (action == "buy")
                    {
                        Response.Redirect("~/Checkout.aspx?pid=" + productId);
                        return;
                    }
                }
                if (username.ToLower() == "admin")
                {
                    Response.Redirect("~/admin/Default.aspx");
                }
                else
                {
                    Response.Redirect("~/home.aspx");
                }
            }
            else
            {
                lblError.Text = "Invalid Username or Password!";
                lblError.ForeColor = System.Drawing.Color.Red;
            }
        }
    }

    private void AddProductToCart(int productId)
    {
        string cs = ConfigurationManager.ConnectionStrings["GreenEnergyDB"].ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT product_name, price FROM Product WHERE product_id=@id", con);

            cmd.Parameters.AddWithValue("@id", productId);
            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                string name = dr["product_name"].ToString();
                decimal price = Convert.ToDecimal(dr["price"]);

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

                bool exists = false;

                foreach (DataRow row in dt.Rows)
                {
                    if (row["product_id"].ToString() == productId.ToString())
                    {
                        row["quantity"] = Convert.ToInt32(row["quantity"]) + 1;
                        row["total"] = Convert.ToDecimal(row["price"]) *
                                       Convert.ToInt32(row["quantity"]);
                        exists = true;
                        break;
                    }
                }

                if (!exists)
                {
                    DataRow newRow = dt.NewRow();
                    newRow["product_id"] = productId;
                    newRow["product_name"] = name;
                    newRow["price"] = price;
                    newRow["quantity"] = 1;
                    newRow["total"] = price;
                    dt.Rows.Add(newRow);
                }

                Session["cart"] = dt;
            }
        }
    }
}