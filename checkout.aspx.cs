using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

public partial class Checkout : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["GreenEnergyDB"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (Session["cart"] != null)
            {
                BindOrderSummary();
            }
            else
            {
                lblMessage.Text = "Your cart is empty!";
                lblMessage.CssClass = "message text-danger";
                btnPlaceOrder.Enabled = false;
            }
        }
    }

    private void BindOrderSummary()
    {
        try
        {
            DataTable dt = (DataTable)Session["cart"];

            if (dt != null && dt.Rows.Count > 0)
            {
                rptSummary.DataSource = dt;
                rptSummary.DataBind();

                decimal grandTotal = 0;
                foreach (DataRow row in dt.Rows)
                {
                    grandTotal += Convert.ToDecimal(row["total"]);
                }

                lblGrandTotal.Text = "Grand Total: ₹ " + grandTotal.ToString("N2");
            }
            else
            {
                lblGrandTotal.Text = "Grand Total: ₹ 0.00";
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Error loading cart: " + ex.Message;
            lblMessage.CssClass = "message text-danger";
        }
    }

    protected void btnPlaceOrder_Click(object sender, EventArgs e)
    {
        if (Session["user_id"] == null)
        {
            Response.Redirect("Login.aspx");
            return;
        }

        // Validate required fields
        if (string.IsNullOrEmpty(txtName.Text) || string.IsNullOrEmpty(txtEmail.Text) ||
            string.IsNullOrEmpty(txtAddress.Text) || string.IsNullOrEmpty(txtCity.Text) ||
            string.IsNullOrEmpty(txtZip.Text))
        {
            lblMessage.Text = "Please fill all required fields!";
            lblMessage.CssClass = "message text-danger";
            return;
        }

        DataTable dt = (DataTable)Session["cart"];
        if (dt == null || dt.Rows.Count == 0)
        {
            lblMessage.Text = "Your cart is empty!";
            lblMessage.CssClass = "message text-danger";
            return;
        }

        decimal grandTotal = 0;
        foreach (DataRow row in dt.Rows)
        {
            grandTotal += Convert.ToDecimal(row["total"]);
        }

        con.Open();

        try
        {
            // Insert order into orders table
            SqlCommand cmd = new SqlCommand(@"INSERT INTO orders (user_id, name, email, address, city, zip, payment_method, total_amount, order_status, order_date) 
                                            VALUES (@uid, @name, @email, @address, @city, @zip, @payment, @total, 'Pending', GETDATE());
                                            SELECT SCOPE_IDENTITY();", con);

            cmd.Parameters.AddWithValue("@uid", Session["user_id"]);
            cmd.Parameters.AddWithValue("@name", txtName.Text);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@city", txtCity.Text);
            cmd.Parameters.AddWithValue("@zip", txtZip.Text);
            cmd.Parameters.AddWithValue("@payment", ddlPayment.SelectedValue);
            cmd.Parameters.AddWithValue("@total", grandTotal);

            int orderId = Convert.ToInt32(cmd.ExecuteScalar());

            // Insert order details
            foreach (DataRow row in dt.Rows)
            {
                SqlCommand cmd2 = new SqlCommand("INSERT INTO order_details (order_id, product_id, quantity, price) VALUES (@oid, @pid, @qty, @price)", con);
                cmd2.Parameters.AddWithValue("@oid", orderId);
                cmd2.Parameters.AddWithValue("@pid", row["product_id"]);
                cmd2.Parameters.AddWithValue("@qty", row["quantity"]);
                cmd2.Parameters.AddWithValue("@price", row["price"]);
                cmd2.ExecuteNonQuery();
            }

            Session["cart"] = null;

            if (ddlPayment.SelectedValue == "UPI")
            {
                Response.Redirect("UPIPayment.aspx?orderId=" + orderId + "&amount=" + grandTotal);
            }
            else
            {
                Response.Redirect("OrderSuccess.aspx?orderId=" + orderId + "&payment=COD&amount=" + grandTotal);
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Error placing order: " + ex.Message;
            lblMessage.CssClass = "message text-danger";
        }
        finally
        {
            con.Close();
        }
    }
}