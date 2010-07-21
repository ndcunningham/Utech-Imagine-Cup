using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;

public partial class Order : System.Web.UI.Page 
{
    private Product selectedProduct;

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Trace.IsEnabled)
        //    //Trace.Write("Page Load", "Binding products drop-down list");
        //    Trace.Warn("Page Load", "Binding products drop-down list");

        //Response.Write("My point");

        if (!IsPostBack)
            ddlProducts.DataBind();

        selectedProduct = this.GetSelectedProduct();

        lblName.Text = selectedProduct.Name;
        lblShortDescription.Text = selectedProduct.ShortDescription;
        lblLongDescription.Text = selectedProduct.LongDescription;
        lblUnitPrice.Text = selectedProduct.UnitPrice.ToString("c");
        imgProduct.ImageUrl = "Images/Products/" + selectedProduct.ImageFile;
    }

    private Product GetSelectedProduct()
    {
        DataView productsTable = (DataView) 
            AccessDataSource1.Select(DataSourceSelectArguments.Empty);

        productsTable.RowFilter = "ProductID = '" + ddlProducts.SelectedValue + "'";

        DataRowView row = (DataRowView) productsTable[0];

        Product p = new Product();

        p.ProductID = row["ProductID"].ToString();
        p.Name = row["Name"].ToString();
        p.ShortDescription = row["ShortDescription"].ToString();
        p.LongDescription = row["LongDescription"].ToString();
        p.UnitPrice = (decimal) row["UnitPrice"];
        p.ImageFile = row["ImageFile"].ToString();

        return p;
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {   
            CartItem item = new CartItem();

            item.Product = selectedProduct;
            item.Quantity = Convert.ToInt32(txtQuantity.Text);

            this.AddToCart(item);

            Response.Redirect("Cart.aspx");
        }
    }

    private void AddToCart(CartItem item)
    {
        SortedList cart = this.GetCart();

        string productID = selectedProduct.ProductID;

        if (cart.ContainsKey(productID))
        {
            CartItem existingItem = (CartItem) cart[productID];

            existingItem.Quantity += item.Quantity;
        }
        else
            cart.Add(productID, item);
    }

    private SortedList GetCart()
    {
        if (Session["Cart"] == null) { Session.Add("Cart", new SortedList()); }

        return (SortedList) Session["Cart"];
    }
}
