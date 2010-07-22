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

public partial class CheckOut_CheckOut1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            US_States states = new US_States();

            ddlState.DataSource = states;
            ddlState.DataMember = "US_States.State";
            ddlState.DataValueField = "Abbreviation";
            ddlState.DataTextField = "Name";
            ddlState.DataBind();

            Customer c = Profile.Customer;

            if (c != null)
            {
                txtLastName.Text = c.LastName;
                txtFirstName.Text = c.FirstName;
                txtAddress.Text = c.Address;
                txtCity.Text = c.City;
                ddlState.SelectedValue = c.State;
                txtZipCode.Text = c.ZipCode;
                txtPhone.Text = c.Phone;
                txtEmail.Text = c.Email;
            }
        }
    }

    protected void UpdateCustomer()
    {
        Customer c = new Customer();

        c.LastName = txtLastName.Text;
        c.FirstName = txtFirstName.Text;
        c.Address = txtAddress.Text;
        c.City = txtCity.Text;
        c.State = ddlState.SelectedValue;
        c.ZipCode = txtZipCode.Text;
        c.Phone = txtPhone.Text;
        c.Email = txtEmail.Text;

        Profile.Customer = c;
    }

    protected void btnContinue_Click(object sender, EventArgs e)
    {
        UpdateCustomer();

        Response.Redirect("~/Order.aspx");
    }

    protected void btnCheckout_Click(object sender, EventArgs e)
    {
        UpdateCustomer();

        lblMessage.Text = "Sorry, that function hasn't been implemented yet.";
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Profile.Cart.Clear();

        Response.Redirect("~/Order.aspx");
    }
}
