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
    private SortedList cart;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsExpired())
            Response.Redirect("Expired.aspx");
        else
            this.SaveTimeStamps();

        this.GetCart();

        if (!IsPostBack)
            this.DisplayCart();
    }

    private bool IsExpired()
    {
        if (Session["Cart_TimeStamp"] == null)
            return false;
        else if (ViewState["TimeStamp"] == null)
            return false;
        else if (ViewState["TimeStamp"].ToString()
            == Session["Cart_TimeStamp"].ToString())
            return false;
        else
            return true;
    }

    private void SaveTimeStamps()
    {
        DateTime dtm = DateTime.Now;

        ViewState.Add("TimeStamp", dtm);

        Session.Add("Cart_TimeStamp", dtm);
    }

    private void GetCart()
    {
        if (Session["Cart"] == null)
            Session.Add("Cart", new SortedList());

        cart = (SortedList) Session["Cart"];
    }

    private void DisplayCart()
    {
        lstCart.Items.Clear();

        CartItem item;

        foreach (DictionaryEntry entry in cart)
        {
            item = (CartItem) entry.Value;

            lstCart.Items.Add(item.Display());
        }
    }

    protected void btnRemove_Click(object sender, EventArgs e)
    {
        if (lstCart.SelectedIndex > -1 && cart.Count > 0)
        {
            cart.RemoveAt(lstCart.SelectedIndex);

            this.DisplayCart();
        }
    }

    protected void btnEmpty_Click(object sender, EventArgs e)
    {
        cart.Clear();

        lstCart.Items.Clear();

        lblMessage.Text = "";
    }

    protected void btnCheckOut_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "Sorry, that function hasn't been "
                        + "implemented yet.";
    }

}