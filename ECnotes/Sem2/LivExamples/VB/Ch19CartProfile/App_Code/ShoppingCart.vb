Imports Microsoft.VisualBasic

<Serializable()> _
Public Class ShoppingCart

    Private Cart As SortedList = New SortedList()

    Public ReadOnly Property Count() As Integer
        Get
            Return Cart.Count
        End Get
    End Property

    Public Sub AddItem(ByVal Item As CartItem)
        Dim sProductID As String = Item.Product.ProductID
        If (Cart.ContainsKey(sProductID)) Then
            Dim ExistingItem As CartItem
            ExistingItem = CType(Cart.Item(sProductID), CartItem)
            ExistingItem.Quantity += Item.Quantity
        Else
            Cart.Add(sProductID, Item)
        End If
    End Sub

    Public Function GetItems() As CartItem()
        Dim Items(Cart.Count) As CartItem
        Dim i As Integer
        If (Cart.Count > 0) Then
            For i = 0 To Cart.Count - 1
                Items(i) = CType(Cart.GetByIndex(i), CartItem)
            Next
        End If
        Return Items
    End Function

    Public Sub Clear()
        Cart.Clear()
    End Sub

    Public Sub RemoveAt(ByVal i As Integer)
        Cart.RemoveAt(i)
    End Sub

End Class
