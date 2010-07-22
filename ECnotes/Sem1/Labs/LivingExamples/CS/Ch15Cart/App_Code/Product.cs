using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for Product
/// </summary>
public class Product
{
    public string ProductID;
    public string Name;
    public string ShortDescription;
    public string LongDescription;
    public decimal UnitPrice;
    public string ImageFile;
}
