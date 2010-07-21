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

public partial class Cart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string title = "Your shopping cart:";

            string fn = Profile.Customer.FirstName;

            if (fn != null && !fn.Equals(""))
                title = fn + "'s shopping cart:";

            lblCartTitle.Text = title;

            this.DisplayCart();
        }
    }

    private void DisplayCart()
    {
        lstCart.Items.Clear();

        CartItem[] items = Profile.Cart.GetItems();

        foreach (CartItem i in items)
            lstCart.Items.Add(i.display);
    }

    protected void btnRemove_Click(object sender, EventArgs e)
    {
        if (lstCart.SelectedIndex > -1 && Profile.Cart.Count > 0)
        {
            Profile.Cart.RemoveAt(lstCart.SelectedIndex);

            this.DisplayCart();
        }
    }

    protected void btnEmpty_Click(object sender, EventArgs e)
    {
        Profile.Cart.Clear();

        lstCart.Items.Clear();
    }

    protected void btnCheckOut_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/CheckOut/CheckOut1.aspx");
    }
}
