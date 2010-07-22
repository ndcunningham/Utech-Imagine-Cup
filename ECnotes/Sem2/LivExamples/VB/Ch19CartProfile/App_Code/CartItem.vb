Imports Microsoft.VisualBasic

<Serializable()> _
Public Class CartItem
    Public Product As Product
    Public Quantity As Integer

    Public Function Display() As String
        Return Product.Name + " (" + Quantity.ToString() _
            + " at " + FormatCurrency(Product.UnitPrice) + " each)"

    End Function
End Class
