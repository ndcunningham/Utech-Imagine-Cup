
Partial Class OrderCalculator
    Inherits System.Web.UI.UserControl

    Protected Sub btnCalculate_Click(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles btnCalculate.Click
        Dim dPrice As Decimal = CType(txtPrice.Text, Decimal)
        Dim iQuanity As Integer = CType(txtQuantity.Text, Integer)
        Dim dTotal As Decimal = dPrice * iQuanity
        lblTotal.Text = FormatCurrency(dTotal)
    End Sub
End Class
