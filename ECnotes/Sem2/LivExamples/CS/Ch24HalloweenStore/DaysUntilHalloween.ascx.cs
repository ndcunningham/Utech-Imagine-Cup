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

public partial class DaysUntilHalloween : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblDaysUntilHalloween.Text = "Today is " + DateTime.Today.ToShortDateString();
            lblDaysUntilHalloween.Text += ". There are only ";
            lblDaysUntilHalloween.Text += this.GetDaysUntilHalloween();
            lblDaysUntilHalloween.Text += " more days until Halloween.";
        }
    }

    private int GetDaysUntilHalloween()
    {
        DateTime halloween = new DateTime(DateTime.Today.Year, 10, 31);

        if (DateTime.Today > halloween)
            halloween = halloween.AddYears(1);

        TimeSpan timeUntil = halloween - DateTime.Today;

        return timeUntil.Days;
    }
}
