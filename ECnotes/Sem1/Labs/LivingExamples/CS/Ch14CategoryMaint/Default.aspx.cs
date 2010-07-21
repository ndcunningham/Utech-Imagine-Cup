using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page 
{
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        SqlDataSource1.InsertParameters["CategoryID"].DefaultValue = txtID.Text;
        SqlDataSource1.InsertParameters["ShortName"].DefaultValue = txtShortName.Text;
        SqlDataSource1.InsertParameters["LongName"].DefaultValue = txtLongName.Text;

        try
        {
            SqlDataSource1.Insert();

            txtID.Text = "";
            txtShortName.Text = "";
            txtLongName.Text = "";
        }
        catch (Exception ex)
        {
            lblError.Text = "An exception occurred. " +
                "The category was not added. Please try again.<br /><br />" +
                "Message: " + ex.Message;
        }
    }

    protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "An exception occurred. " +
                "Please correct any invalid data and try again.<br /><br />" +
                "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
        }
        else if (e.AffectedRows == 0)
            lblError.Text = "No rows were updated. " +
                "Another user may have updated that category.<br />" +
                "Please try again.";
    }

    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "An exception occurred. " +
                "No rows were deleted.<br /><br />" +
                "Message: " + e.Exception.Message;

            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
            lblError.Text = "No rows were deleted. " +
                "Another user may have updated that category.<br />" +
                "Please try again.";
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}