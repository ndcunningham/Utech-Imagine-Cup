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
    int sessionCount;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Count"] == null)
        {
            sessionCount = 0;
        }
        else
        {
            sessionCount = Convert.ToInt32(Session["Count"]);
        }
    }

    protected void btnPost_Click(object sender, EventArgs e)
    {
        // update the session state
        sessionCount++;
        Session["Count"] = sessionCount;
        lblSessionClicks.Text = "You have clicked the button " + sessionCount + " times.";

        // update the application state
        Application.Lock();

        int applicationCount = Convert.ToInt32(Application["HitCount"]);

        applicationCount++;

        Application["HitCount"] = applicationCount;

        Application.UnLock();

        lblApplicationClicks.Text = "All users have clicked the button " +
            applicationCount + " times.";
    }
    
}
