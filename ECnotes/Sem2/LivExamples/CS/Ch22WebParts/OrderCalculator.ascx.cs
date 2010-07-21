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

public partial class OrderCalculator : System.Web.UI.UserControl
{
    protected void btnCalculate_Click(object sender, EventArgs e)
    {
        decimal price = Convert.ToDecimal(txtPrice.Text);

        int quanity = Convert.ToInt32(txtQuantity.Text);

        decimal total = price * quanity;

        lblTotal.Text = total.ToString("c");
    }
}
