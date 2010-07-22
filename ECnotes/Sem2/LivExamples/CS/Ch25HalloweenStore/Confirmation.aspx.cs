using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Confirmation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblConfirm.Text =
            "Thank you for your order. It will be shipped on " +
            DateTime.Today.AddDays(1) + ".";
    }

    protected void btnReturn_Click(object sender, EventArgs e)
    {
        string url = "http:"
            + ConfigurationManager.AppSettings["AppPath"]
            + "Order.aspx";

        Response.Redirect(url);
    }
}
