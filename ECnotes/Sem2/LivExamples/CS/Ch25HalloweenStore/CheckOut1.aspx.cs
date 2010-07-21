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

public partial class CheckOut1 : System.Web.UI.Page
{
    bool cookieExists;
    DataView dvCustomer = new DataView();

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!Request.IsSecureConnection)
        //{
        //    string url = Request.Url.ToString().Replace("http:", "https:");
        //    Response.Redirect(url);
        //}

        if (Request.Cookies["Email"] == null)
            cookieExists = false;
        else
            cookieExists = true;

        if (!IsPostBack)
        {
            if (cookieExists)
            {
                SqlDataSource1.SelectParameters["Email"].DefaultValue = Request.Cookies["Email"].Value;
                
                dvCustomer = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

                Session["CustomerView"] = dvCustomer;

                if (dvCustomer.Count == 1)
                {
                    this.DisplayCustomerData();

                    txtEmail.Enabled = false;
                    txtFirstName.Focus();
                }
                else
                {
                    txtEmail.Enabled = true;
                    txtEmail.Text = Request.Cookies["Email"].Value;
                    txtFirstName.Focus();
                }
            }
            else
            {
                txtEmail.Enabled = true;
                txtEmail.Focus();
            }
        }
        else
        {
            if (!cookieExists)
            {
                SqlDataSource1.SelectParameters["Email"].DefaultValue = txtEmail.Text;

                dvCustomer = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            }
            else
            {
                dvCustomer = (DataView)Session["CustomerView"];
            }
        }
    }

    private void DisplayCustomerData()
    {
        txtEmail.Text = dvCustomer[0]["Email"].ToString();
        txtFirstName.Text = dvCustomer[0]["FirstName"].ToString();
        txtLastName.Text = dvCustomer[0]["LastName"].ToString();
        txtAddress.Text = dvCustomer[0]["Address"].ToString();
        txtCity.Text = dvCustomer[0]["City"].ToString();
        txtState.Text = dvCustomer[0]["State"].ToString();
        txtZipCode.Text = dvCustomer[0]["ZipCode"].ToString();
        txtPhone.Text = dvCustomer[0]["PhoneNumber"].ToString();
    }

    protected void btnCheckOut_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (!cookieExists)
                this.AddCookie();
            if (dvCustomer.Count == 0)
                this.AddCustomer();
            else
                if (CustomerModified())
                    this.UpdateCustomer();

            Session["Email"] = txtEmail.Text;

            Response.Redirect("CheckOut2.aspx");
        }
    }

    private void AddCookie()
    {
        HttpCookie emailCookie = new HttpCookie("Email", txtEmail.Text);

        emailCookie.Expires = DateTime.Now.AddYears(1);

        Response.Cookies.Add(emailCookie);
    }

    private void AddCustomer()
    {
        SqlDataSource1.InsertParameters["Email"].DefaultValue = txtEmail.Text;
        SqlDataSource1.InsertParameters["FirstName"].DefaultValue = txtFirstName.Text;
        SqlDataSource1.InsertParameters["LastName"].DefaultValue = txtLastName.Text;
        SqlDataSource1.InsertParameters["Address"].DefaultValue = txtAddress.Text;
        SqlDataSource1.InsertParameters["City"].DefaultValue = txtCity.Text;
        SqlDataSource1.InsertParameters["State"].DefaultValue = txtState.Text;
        SqlDataSource1.InsertParameters["ZipCode"].DefaultValue = txtZipCode.Text;
        SqlDataSource1.InsertParameters["PhoneNumber"].DefaultValue = txtPhone.Text;

        SqlDataSource1.Insert();
    }

    private bool CustomerModified()
    {
        if (dvCustomer[0]["FirstName"].ToString() != txtFirstName.Text ||
            dvCustomer[0]["LastName"].ToString() != txtLastName.Text ||
            dvCustomer[0]["Address"].ToString() != txtAddress.Text ||
            dvCustomer[0]["City"].ToString() != txtCity.Text ||
            dvCustomer[0]["State"].ToString() != txtState.Text ||
            dvCustomer[0]["ZipCode"].ToString() != txtZipCode.Text ||
            dvCustomer[0]["PhoneNumber"].ToString() != txtPhone.Text)
        {
            return true;
        }
        else
            return false;
    }

    private void UpdateCustomer()
    {
        SqlDataSource1.UpdateParameters["FirstName"].DefaultValue = txtFirstName.Text;
        SqlDataSource1.UpdateParameters["LastName"].DefaultValue = txtLastName.Text;
        SqlDataSource1.UpdateParameters["Address"].DefaultValue = txtAddress.Text;
        SqlDataSource1.UpdateParameters["City"].DefaultValue = txtCity.Text;
        SqlDataSource1.UpdateParameters["State"].DefaultValue = txtState.Text;
        SqlDataSource1.UpdateParameters["ZipCode"].DefaultValue = txtZipCode.Text;
        SqlDataSource1.UpdateParameters["PhoneNumber"].DefaultValue = txtPhone.Text;
        SqlDataSource1.UpdateParameters["original_Email"].DefaultValue = txtEmail.Text;

        SqlDataSource1.Update();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Session.Remove("Cart");

        string url = "http:"
            + ConfigurationManager.AppSettings["AppPath"]
            + "Order.aspx";

        Response.Redirect(url);
    }

    protected void btnContinue_Click(object sender, EventArgs e)
    {
        string url = "http:"
            + ConfigurationManager.AppSettings["AppPath"]
            + "Order.aspx";

        Response.Redirect(url);
    }
}
