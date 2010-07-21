Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub DetailsView1_ItemUpdated(ByVal sender As Object, _
            ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) _
            Handles DetailsView1.ItemUpdated
        If e.Exception IsNot Nothing Then
            lblError.Text = "Invalid data. Please correct and try again."
            e.ExceptionHandled = True
        ElseIf e.AffectedRows = 0 Then
            lblError.Text = "Another user has updated that product. " _
                & "Please try again."
        Else
            GridView1.DataBind()
        End If
    End Sub

    Protected Sub DetailsView1_ItemDeleted(ByVal sender As Object, _
            ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) _
            Handles DetailsView1.ItemDeleted
        If e.Exception IsNot Nothing Then
            lblError.Text = "A database error has occurred. " _
                & "Please try again."
            e.ExceptionHandled = True
        ElseIf e.AffectedRows = 0 Then
            lblError.Text = "Another user has updated that product. " _
                & "Please try again."
        Else
            GridView1.DataBind()
        End If
    End Sub

    Protected Sub DetailsView1_ItemInserted(ByVal sender As Object, _
            ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) _
            Handles DetailsView1.ItemInserted
        If e.Exception IsNot Nothing Then
            lblError.Text = "Invalid data. Please correct and try again."
            e.ExceptionHandled = True
        Else
            GridView1.DataBind()
        End If
    End Sub

    Protected Sub DetailsView1_ItemDeleting(ByVal sender As Object, _
            ByVal e As System.Web.UI.WebControls.DetailsViewDeleteEventArgs) _
            Handles DetailsView1.ItemDeleting
        e.Values("UnitPrice") = e.Values("UnitPrice").ToString().Substring(1)
    End Sub

End Class
