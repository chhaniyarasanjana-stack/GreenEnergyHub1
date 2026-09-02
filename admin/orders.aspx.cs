using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Orders : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["GreenEnergyDB"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadOrders();
        }
    }

    private void LoadOrders()
    {
        SqlDataAdapter da = new SqlDataAdapter(
            @"SELECT order_id,
                     user_id,
                     name,
                     email,
                     address,
                     city,
                     zip,
                     payment_method,
                     total_amount,
                     order_status,
                     order_date
              FROM orders
              ORDER BY order_id DESC", con);

        DataTable dt = new DataTable();
        da.Fill(dt);

        gvOrders.DataSource = dt;
        gvOrders.DataBind();
    }

    protected void gvOrders_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        if (e.CommandName == "deleteRow")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            int id = Convert.ToInt32(gvOrders.DataKeys[index].Value);

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["GreenEnergyDB"].ConnectionString))
            {
                con.Open();

                // First delete child rows (order_details)
                SqlCommand cmdDetails = new SqlCommand("DELETE FROM order_details WHERE order_id=@id", con);
                cmdDetails.Parameters.AddWithValue("@id", id);
                cmdDetails.ExecuteNonQuery();

                // Then delete parent order
                SqlCommand cmdOrder = new SqlCommand("DELETE FROM orders WHERE order_id=@id", con);
                cmdOrder.Parameters.AddWithValue("@id", id);
                cmdOrder.ExecuteNonQuery();

                con.Close();
            }

            LoadOrders(); // refresh grid
        }
    }
}
