
Partial Class Cart
    Inherits System.Web.UI.Page

    Private Cart As SortedList

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Cart = GetCart()

        If Not IsPostBack Then
            Me.DisplayCart()
        End If
    End Sub

    Private Function GetCart() As SortedList
        If Session("cart") Is Nothing Then
            Session.Add("cart", New SortedList)
        End If

        Return CType(Session("cart"), SortedList)
    End Function

    Private Sub DisplayCart()
        lstCart.Items.Clear()

        Dim CartItem As CartItem
        Dim CartEntry As DictionaryEntry

        For Each CartEntry In Cart
            CartItem = CType(CartEntry.Value, CartItem)

            lstCart.Items.Add(CartItem.Display)
        Next
    End Sub

    Protected Sub btnRemove_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRemove.Click
        If lstCart.SelectedIndex > -1 And Cart.Count > 0 Then
            Cart.RemoveAt(lstCart.SelectedIndex)

            Me.DisplayCart()
        End If
    End Sub

    Protected Sub btnEmpty_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEmpty.Click
        Cart.Clear()

        lstCart.Items.Clear()

        lblMessage.Text = ""
    End Sub

    Protected Sub btnCheckOut_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCheckOut.Click
        lblMessage.Text = "Sorry, that function hasn't been implemented yet."
    End Sub
End Class
