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
/// Summary description for CartItem
/// </summary>
public class CartItem
{
    public Product Product;
    public int Quantity;

    public string Display()
    {
        string displayString = 
            Product.Name + " (" + Quantity.ToString()
                         + " at " + Product.UnitPrice.ToString("c") + " each)";

        return displayString;
    }
    
}
