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
    protected void ObjectDataSource1_Updated(
        object sender, ObjectDataSourceStatusEventArgs e)
    {
        e.AffectedRows = Convert.ToInt32(e.ReturnValue);
    }

    protected void GridView1_RowUpdated(
        Object sender, GridViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "An exception has occurred. " +
                "Please check all entries and try again.<br /><br />" +
                e.Exception.Message;

            if (e.Exception.InnerException != null)
                lblError.Text += "<br />Message: " 
                    + e.Exception.InnerException.Message + "<br />";

            e.ExceptionHandled = true;

            e.KeepInEditMode = true;
        }
        else if (e.AffectedRows == 0)
            lblError.Text = "Another user may have updated that category. "
                + "Please try again.<br />";
    }

    protected void ObjectDataSource1_Deleted(
        object sender, ObjectDataSourceStatusEventArgs e)
    {
        e.AffectedRows = Convert.ToInt32(e.ReturnValue);
    }

    protected void GridView1_RowDeleted(
        object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "An exception has occurred. " +
                "The category was not deleted.<br />";

            if (e.Exception.InnerException != null)
                lblError.Text += "<br />Message: " 
                    + e.Exception.InnerException.Message + "<br />";

            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
            lblError.Text = "Another user may have updated that category. "
                + "Please try again.<br />";
    }

    protected void DetailsView1_ItemInserted(
        object sender, DetailsViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "An exception has occurred. " +
                "Please check all entries and try again. <br />";

            if (e.Exception.InnerException != null)
                lblError.Text += "<br />Message: " 
                    + e.Exception.InnerException.Message + "<br />";

            e.ExceptionHandled = true;

            e.KeepInInsertMode = true;
        }
    }
}
