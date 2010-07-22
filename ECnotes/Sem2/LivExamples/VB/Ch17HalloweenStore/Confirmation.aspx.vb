
Partial Class Confirmation
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblConfirm.Text = "Thank you for your order. It will be shipped on " _
            & Today.AddDays(1) & "."
    End Sub

    Protected Sub btnReturn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReturn.Click
        Dim sURL As String = "http:" _
            & ConfigurationManager.AppSettings("AppPath") _
            & "Order.aspx"
        Response.Redirect(sURL)
    End Sub

End Class
