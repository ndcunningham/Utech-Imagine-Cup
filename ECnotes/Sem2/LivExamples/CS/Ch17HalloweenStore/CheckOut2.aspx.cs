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

using System.Data.SqlClient;

public partial class CheckOut2 : System.Web.UI.Page
{
    SortedList cart;
    string email;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Request.IsSecureConnection)
        {
            string url = Request.Url.ToString().Replace("http:", "https:");

            Response.Redirect(url);
        }

        cart = (SortedList) Session["Cart"];

        email = (string) Session["Email"];

        if (!IsPostBack)
            this.LoadYears();
    }

    private void LoadYears()
    {
        int year = DateTime.Now.Year;

        for (int i = 0; i < 7; i++)
        {
            ddlYear.Items.Add(year.ToString());
            year += 1;
        }
    }

    protected void btnAccept_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            this.PutInvoice();
            this.GetInvoiceNumber();
            this.PutLineItems();

            Session.Remove("Cart");

            Response.Redirect("Confirmation.aspx");
        }
    }

    private void PutInvoice()
    {
        SqlDataSource1.InsertParameters["CustEMail"].DefaultValue = email;
        SqlDataSource1.InsertParameters["OrderDate"].DefaultValue = DateTime.Today.ToString();

        int quantity = this.Quantity();

        if (rdoGround.Checked)
        {
            SqlDataSource1.InsertParameters["ShipMethod"].DefaultValue = "UPS Ground";

            double shipping = 3.95 + (quantity - 1) * 1.25;

            SqlDataSource1.InsertParameters["Shipping"].DefaultValue = shipping.ToString();
        }
        else if (rdo2Day.Checked)
        {
            SqlDataSource1.InsertParameters["ShipMethod"].DefaultValue = "UPS Second Day";

            double shipping = 7.95 + (quantity - 1) * 2.5;

            SqlDataSource1.InsertParameters["Shipping"].DefaultValue = shipping.ToString();
        }
        else if (rdoFedEx.Checked)
        {
            SqlDataSource1.InsertParameters["ShipMethod"].DefaultValue = "Federal Express";

            double shipping = 19.95 + (quantity - 1) * 4.95;

            SqlDataSource1.InsertParameters["Shipping"].DefaultValue = shipping.ToString();
        }

        decimal subTotal = this.SubTotal();

        SqlDataSource1.InsertParameters["Subtotal"].DefaultValue = subTotal.ToString();

        decimal salesTax = subTotal * (decimal) 0.075;

        SqlDataSource1.InsertParameters["SalesTax"].DefaultValue = salesTax.ToString();

        decimal total = subTotal + salesTax;

        SqlDataSource1.InsertParameters["Total"].DefaultValue = total.ToString();
        SqlDataSource1.InsertParameters["CreditCardType"].DefaultValue = lstCardType.SelectedValue;
        SqlDataSource1.InsertParameters["CardNumber"].DefaultValue = txtCardNumber.Text;
        SqlDataSource1.InsertParameters["ExpirationMonth"].DefaultValue = ddlMonth.SelectedValue;
        SqlDataSource1.InsertParameters["ExpirationYear"].DefaultValue = ddlYear.SelectedValue;

        SqlDataSource1.Insert();
    }

    private int Quantity()
    {
        int quantity = 0;

        foreach (DictionaryEntry entry in cart)
        {
            CartItem cartItem = (CartItem) entry.Value;

            quantity += cartItem.Quantity;
        }
        return quantity;
    }

    private decimal SubTotal()
    {
        decimal subTotal = 0;

        foreach (DictionaryEntry entry in cart)
        {
            CartItem cartItem = (CartItem) entry.Value;

            subTotal += cartItem.Quantity * cartItem.Product.UnitPrice;
        }
        return subTotal;
    }

    private int GetInvoiceNumber()
    {
        string conString = ConfigurationManager.ConnectionStrings["HalloweenConnectionString"].ConnectionString;

        SqlConnection conHalloween = new SqlConnection(conString);

        SqlCommand cmdInvoiceNumber = new SqlCommand("Select Ident_Current('Invoices')", conHalloween);

        conHalloween.Open();

        int iInvoiceNumber = Convert.ToInt32(cmdInvoiceNumber.ExecuteScalar().ToString());

        conHalloween.Close();

        return iInvoiceNumber;
    }

    private void PutLineItems()
    {
        foreach (DictionaryEntry entry in cart)
        {
            CartItem cartItem = (CartItem)entry.Value;

            SqlDataSource2.InsertParameters["InvoiceNumber"].DefaultValue = this.GetInvoiceNumber().ToString();
            SqlDataSource2.InsertParameters["ProductID"].DefaultValue = cartItem.Product.ProductID;
            SqlDataSource2.InsertParameters["UnitPrice"].DefaultValue = cartItem.Product.UnitPrice.ToString();
            SqlDataSource2.InsertParameters["Quantity"].DefaultValue = cartItem.Quantity.ToString();

            //decimal extension = cartItem.Quantity * cartItem.Product.UnitPrice;
            //SqlDataSource2.InsertParameters["Extension"].DefaultValue = extension.ToString();

            SqlDataSource2.Insert();
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Session.Remove("Cart");

        string url = "http:" + ConfigurationManager.AppSettings["AppPath"] + "Order.aspx";

        Response.Redirect(url);
    }

    protected void btnContinue_Click(object sender, EventArgs e)
    {
        string url = "http:" + ConfigurationManager.AppSettings["AppPath"] + "Order.aspx";

        Response.Redirect(url);
    }
}
