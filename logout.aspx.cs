using System;
using System.Web;
using System.Web.UI;
using System.Web.Security;

public partial class logout : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Session.Clear();
        Session.Abandon();

        Response.Redirect("~/Login.aspx");
    }
}