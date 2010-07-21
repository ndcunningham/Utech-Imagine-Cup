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

using System.ComponentModel;

public partial class DaysUntil : System.Web.UI.UserControl
{
    private string textBefore = "There are only";
    private string textAfter = "days until Halloween.";
    private int month = 10;
    private int day = 31;

    [Category("Appearance")]
    public string TextBefore
    {
        get
        {
            return textBefore;
        }
        set
        {
            textBefore = value;
        }
    }

    [Category("Appearance")]
    public string TextAfter
    {
        get
        {
            return textAfter;
        }
        set
        {
            textAfter = value;
        }
    }

    [Category("Appearance")]
    public int Month
    {
        get
        {
            return month;
        }
        set
        {
            month = value;
        }
    }

    [Category("Appearance")]
    public int Day
    {
        get
        {
            return day;
        }
        set
        {
            day = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        lblDaysUntil.Text = textBefore + " ";
        lblDaysUntil.Text += this.DaysUntilDate();
        lblDaysUntil.Text += " " + textAfter;
    }

    private int DaysUntilDate()
    {
        DateTime targetDate = new DateTime(DateTime.Today.Year, Month, Day);

        if (DateTime.Today > targetDate)
        {
            targetDate = targetDate.AddYears(1);
        }

        TimeSpan timeUntil = targetDate - DateTime.Today;

        return timeUntil.Days;
    }

}