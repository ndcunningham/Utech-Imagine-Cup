Imports System.Data

Partial Class Order
    Inherits System.Web.UI.Page

    Private SelectedProduct As Product

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
        imgProduct.ImageUrl = "Images/Products/" _
            & SelectedProduct.ImageFile
    End Sub

    Private Function GetSelectedProduct() As Product
        Dim dvProduct As DataView = CType( _
            AccessDataSource1.Select(DataSourceSelectArguments.Empty), DataView)

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

    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        If Page.IsValid Then
            Dim CartItem As New CartItem

            CartItem.Product = SelectedProduct
            CartItem.Quantity = CType(txtQuantity.Text, Integer)

            Me.AddToCart(CartItem)

            Response.Redirect("Cart.aspx")
        End If
    End Sub

    Private Sub AddToCart(ByVal CartItem As CartItem)
        Dim Cart As SortedList = GetCart()
        Dim sProductID As String = SelectedProduct.ProductID

        If Cart.ContainsKey(sProductID) Then
            CartItem = CType(Cart(sProductID), CartItem)
            CartItem.Quantity += CType(txtQuantity.Text, Integer)
        Else
            Cart.Add(sProductID, CartItem)
        End If
    End Sub

    Private Function GetCart() As SortedList
        If Session("Cart") Is Nothing Then
            Session.Add("Cart", New SortedList)
        End If

        Return CType(Session("Cart"), SortedList)
    End Function
End Class
