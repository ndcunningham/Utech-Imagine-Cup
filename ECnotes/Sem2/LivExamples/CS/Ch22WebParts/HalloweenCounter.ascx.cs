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

public partial class HalloweenCounter : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
		DateTime today = DateTime.Today;

		DateTime halloween = new DateTime(DateTime.Today.Year, 10, 31);

		if (today > halloween)
			halloween = halloween.AddYears(1);

		TimeSpan span = halloween - today;

		lblCounter.Text = "There are " + span.Days + " shopping days until Halloween.";
    }
}
