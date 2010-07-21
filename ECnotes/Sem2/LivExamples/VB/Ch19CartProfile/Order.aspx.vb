Imports System.Data

Partial Class Order
    Inherits System.Web.UI.Page

    Dim SelectedProduct As Product

    Protected Sub Page_Load(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ddlProducts.DataBind()
        End If
        SelectedProduct = Me.GetSelectedProduct()
        lblName.Text = SelectedProduct.Name
        lblShortDescription.Text = SelectedProduct.ShortDescription
        lblLongDescription.Text = SelectedProduct.LongDescription
        lblUnitPrice.Text = FormatCurrency(SelectedProduct.UnitPrice)
        imgProduct.ImageUrl = "Images\Products\" & SelectedProduct.ImageFile
    End Sub

    Private Function GetSelectedProduct() As Product
        Dim dvProduct As Data.DataView = CType(AccessDataSource1.Select( _
            DataSourceSelectArguments.Empty), DataView)
        dvProduct.RowFilter = "ProductID = '" & ddlProducts.SelectedValue & "'"
        Dim Product As New Product
        Product.ProductID = dvProduct(0)("ProductID").ToString
        Product.Name = dvProduct(0)("Name").ToString
        Product.ShortDescription = dvProduct(0)("ShortDescription").ToString
        Product.LongDescription = dvProduct(0)("LongDescription").ToString
        Product.UnitPrice = CDec(dvProduct(0)("UnitPrice"))
        Product.ImageFile = dvProduct(0)("ImageFile").ToString
        Return Product
    End Function

    Protected Sub btnAdd_Click(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles btnAdd.Click
        If Page.IsValid Then
            Dim CartItem As New CartItem()
            CartItem.Product = SelectedProduct
            CartItem.Quantity = CType(txtQuantity.Text, Integer)
            Profile.Cart.AddItem(CartItem)
            Response.Redirect("Cart.aspx")
        End If
    End Sub

End Class

