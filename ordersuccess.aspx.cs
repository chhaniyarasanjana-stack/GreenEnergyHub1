using System;

public partial class OrderSuccess : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // QueryString se data fetch karo
            lblOrderId.Text = Request.QueryString["orderId"];
            lblPayment.Text = Request.QueryString["payment"];
            lblAmount.Text = Request.QueryString["amount"];

            // Session clear karo (order place thai gayu)
            Session.Clear();
            Session.Abandon();
        }
    }
}