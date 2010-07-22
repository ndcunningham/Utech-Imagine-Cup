Imports System.Data.SqlClient

Partial Class CheckOut2
    Inherits System.Web.UI.Page

    Dim Cart As SortedList
    Dim sEmail As String
    Dim iInvoiceNumber As String

    Protected Sub Page_Load(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles Me.Load
        If Not Request.IsSecureConnection Then
            Dim sURL As String
            sURL = Request.Url.ToString.Replace("http:", "https:")
            Response.Redirect(sURL)
        Else
            Cart = CType(Session("Cart"), SortedList)
            sEmail = Session("Email").ToString
            If Not IsPostBack Then
                Me.LoadYears()
            End If
        End If
    End Sub

    Private Sub LoadYears()
        Dim iCount As Integer
        Dim iYear As Integer = Now.Year
        Do Until iCount = 6
            ddlYear.Items.Add(iYear)
            iCount += 1
            iYear += 1
        Loop
    End Sub

    Protected Sub btnAccept_Click(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles btnAccept.Click
        If Page.IsValid Then
            Me.PutInvoice()
            Me.GetInvoiceNumber()
            Me.PutLineItems()
            Session.Remove("Cart")
            Response.Redirect("Confirmation.aspx")
        End If
    End Sub

    Private Sub PutInvoice()
        SqlDataSource1.InsertParameters("CustEMail").DefaultValue = sEmail
        SqlDataSource1.InsertParameters("OrderDate").DefaultValue = Today
        Dim iQuantity As Integer = Me.Quantity
        If rdoGround.Checked Then
            SqlDataSource1.InsertParameters("ShipMethod").DefaultValue _
                = "UPS Ground"
            SqlDataSource1.InsertParameters("Shipping").DefaultValue _
                = 3.95 + (iQuantity - 1) * 1.25
        ElseIf rdo2Day.Checked Then
            SqlDataSource1.InsertParameters("ShipMethod").DefaultValue _
                = "UPS Second Day"
            SqlDataSource1.InsertParameters("Shipping").DefaultValue _
                = 7.95 + (iQuantity - 1) * 2.5
        ElseIf rdoFedEx.Checked Then
            SqlDataSource1.InsertParameters("ShipMethod").DefaultValue _
                = "Federal Express"
            SqlDataSource1.InsertParameters("Shipping").DefaultValue _
                = 19.95 + (iQuantity - 1) * 4.95
        End If
        Dim dSubtotal As Decimal = Me.SubTotal
        SqlDataSource1.InsertParameters("Subtotal").DefaultValue = dSubtotal
        Dim dSalesTax As Decimal = dSubtotal * 0.075
        SqlDataSource1.InsertParameters("SalesTax").DefaultValue = dSalesTax
        SqlDataSource1.InsertParameters("Total").DefaultValue = dSubtotal + dSalesTax
        SqlDataSource1.InsertParameters("CreditCardType").DefaultValue = lstCardType.SelectedValue
        SqlDataSource1.InsertParameters("CardNumber").DefaultValue = txtCardNumber.Text
        SqlDataSource1.InsertParameters("ExpirationMonth").DefaultValue = ddlMonth.SelectedValue
        SqlDataSource1.InsertParameters("ExpirationYear").DefaultValue = ddlYear.SelectedValue
        SqlDataSource1.Insert()
    End Sub

    Private Function Quantity() As Integer
        Dim CartItem As CartItem
        Dim CartEntry As DictionaryEntry
        For Each CartEntry In Cart
            CartItem = CType(CartEntry.Value, CartItem)
            Quantity += CartItem.Quantity
        Next
    End Function

    Private Function SubTotal() As Decimal
        Dim CartItem As CartItem
        Dim CartEntry As DictionaryEntry
        For Each CartEntry In Cart
            CartItem = CType(CartEntry.Value, CartItem)
            SubTotal += CartItem.Quantity * CartItem.Product.UnitPrice
        Next

    End Function

    Private Function GetInvoiceNumber() As Integer
        Dim conHalloween As New SqlConnection(ConfigurationManager.ConnectionStrings("HalloweenConnectionString").ConnectionString)
        Dim cmdInvoiceNumber As New SqlCommand("Select Ident_Current('Invoices')", conHalloween)
        conHalloween.Open()
        iInvoiceNumber = cmdInvoiceNumber.ExecuteScalar
        conHalloween.Close()
    End Function

    Private Sub PutLineItems()
        Dim CartEntry As DictionaryEntry
        For Each CartEntry In Cart
            Dim CartItem As CartItem
            CartItem = CType(CartEntry.Value, CartItem)
            SqlDataSource2.InsertParameters("InvoiceNumber").DefaultValue = iInvoiceNumber
            SqlDataSource2.InsertParameters("ProductID").DefaultValue = CartItem.Product.ProductID
            SqlDataSource2.InsertParameters("UnitPrice").DefaultValue = CartItem.Product.UnitPrice
            SqlDataSource2.InsertParameters("Quantity").DefaultValue = CartItem.Quantity
            SqlDataSource2.Insert()
        Next

    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles btnCancel.Click
        Session.Remove("Cart")
        Dim sURL As String = "http:" _
            & ConfigurationManager.AppSettings("AppPath") _
            & "Order.aspx"
        Response.Redirect(sURL)
    End Sub

    Protected Sub btnContinue_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnContinue.Click
        Dim sURL As String = "http:" _
            & ConfigurationManager.AppSettings("AppPath") _
            & "Order.aspx"
        Response.Redirect(sURL)
    End Sub
End Class
