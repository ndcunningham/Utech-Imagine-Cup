
Partial Class Cart
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim sTitle As String = "Your shopping cart:"
            Dim sFirstName As String = Profile.Customer.FirstName
            If Not sFirstName Is Nothing And Not sFirstName = "" Then
                sTitle = sFirstName & "'s shopping cart:"
            End If
            lblCartTitle.Text = sTitle

            Me.DisplayCart()
        End If
    End Sub

    Private Sub DisplayCart()
        lstCart.Items.Clear()
        Dim CartItem As CartItem
        For Each CartItem In Profile.Cart.GetItems
            If Not CartItem Is Nothing Then
                lstCart.Items.Add(CartItem.Display)
            End If
        Next CartItem
    End Sub

    Protected Sub btnRemove_Click(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles btnRemove.Click
        If lstCart.SelectedIndex > -1 And Profile.Cart.Count > 0 Then
            Profile.Cart.RemoveAt(lstCart.SelectedIndex)
            Me.DisplayCart()
        End If
    End Sub

    Protected Sub btnEmpty_Click(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles btnEmpty.Click
        Profile.Cart.Clear()
        lstCart.Items.Clear()
    End Sub

    Protected Sub btnCheckOut_Click(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles btnCheckOut.Click
        Response.Redirect("~/CheckOut/CheckOut1.aspx")
    End Sub

End Class
