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

public partial class MyPortalPage : System.Web.UI.Page
{
    protected void rdoDisplayMode_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rdoDisplayMode.SelectedIndex == 0)
            WebPartManager1.DisplayMode = WebPartManager.BrowseDisplayMode;
        else if (rdoDisplayMode.SelectedIndex == 1)
            WebPartManager1.DisplayMode = WebPartManager.DesignDisplayMode;
        else if (rdoDisplayMode.SelectedIndex == 2)
            WebPartManager1.DisplayMode = WebPartManager.CatalogDisplayMode;
        else if (rdoDisplayMode.SelectedIndex == 3)
            WebPartManager1.DisplayMode = WebPartManager.EditDisplayMode;
    }
}
