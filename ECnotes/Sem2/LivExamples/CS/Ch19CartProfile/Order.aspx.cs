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

public partial class Order : System.Web.UI.Page
{
    private Product selectedProduct;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            ddlProducts.DataBind();

        selectedProduct = this.GetSelectedProduct();

        lblName.Text = selectedProduct.Name;
        lblShortDescription.Text = selectedProduct.ShortDescription;
        lblLongDescription.Text = selectedProduct.LongDescription;
        lblUnitPrice.Text = selectedProduct.UnitPrice.ToString("c");
        imgProduct.ImageUrl = "Images\\Products\\" + selectedProduct.ImageFile;
    }

    private Product GetSelectedProduct()
    {
        DataView table = (DataView) AccessDataSource1.Select(DataSourceSelectArguments.Empty);

        table.RowFilter = "ProductID = '" + ddlProducts.SelectedValue + "'";

        DataRowView row = table[0];

        Product p = new Product();

        p.ProductID = (String) row["ProductID"];
        p.Name = (String) row["Name"];
        p.ShortDescription = (String) row["ShortDescription"];
        p.LongDescription = (String) row["LongDescription"];
        p.UnitPrice = (Decimal) row["UnitPrice"];
        p.ImageFile = (String) row["ImageFile"];

        return p;
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            CartItem item = new CartItem();

            item.Product = selectedProduct;
            item.Quantity = Convert.ToInt32(txtQuantity.Text);
            Profile.Cart.AddItem(item);
            Response.Redirect("Cart.aspx");
        }
    }
}