using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class UPIPayment : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["GreenEnergyDB"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblOrderId.Text = Request.QueryString["orderId"];
            lblAmount.Text = Request.QueryString["amount"];
        }
    }

    protected void btnPayNow_Click(object sender, EventArgs e)
    {
        if (txtUPI.Text == "") { lblMsg.Text = "કૃપા કરીને UPI ID આપો!"; return; }

        int orderId = Convert.ToInt32(Request.QueryString["orderId"]);
        string totalAmt = Request.QueryString["amount"];

        con.Open();
        // પેમેન્ટ થયા પછી સ્ટેટસ 'Paid' કરવું
        SqlCommand cmd = new SqlCommand("UPDATE orders SET order_status='Paid' WHERE order_id=@id", con);
        cmd.Parameters.AddWithValue("@id", orderId);
        cmd.ExecuteNonQuery();
        con.Close();

        // સફળ થયા પછી Success પેજ પર રીડાયરેક્ટ (બીજો સ્ક્રીનશોટ)
        Response.Redirect("OrderSuccess.aspx?orderId=" + orderId + "&payment=UPI&amount=" + totalAmt);
    }
}