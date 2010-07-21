
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub ObjectDataSource1_Updated(ByVal sender As Object, _
            ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) _
            Handles ObjectDataSource1.Updated
        e.AffectedRows = CType(e.ReturnValue, Integer)
    End Sub

    Protected Sub GridView1_RowUpdated(ByVal sender As Object, _
            ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) _
            Handles GridView1.RowUpdated
        If e.Exception IsNot Nothing Then
            lblError.Text = "Invalid data. Please correct and try again."
            e.ExceptionHandled = True
            e.KeepInEditMode = True
        ElseIf e.AffectedRows = 0 Then
            lblError.Text = "The row was not updated. " _
                & "Another user may have updated that category. " _
                & "Please try again."
        End If
    End Sub

    Protected Sub ObjectDataSource1_Deleted(ByVal sender As Object, _
            ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) _
            Handles ObjectDataSource1.Deleted
        e.AffectedRows = CType(e.ReturnValue, Integer)
    End Sub

    Protected Sub GridView1_RowDeleted(ByVal sender As Object, _
            ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) _
            Handles GridView1.RowDeleted
        If e.Exception IsNot Nothing Then
            lblError.Text = "The category cound not be deleted."
            'lblError.Text = e.Exception.InnerException.Message
            e.ExceptionHandled = True
        ElseIf e.AffectedRows = 0 Then
            lblError.Text = "The row was not updated. " _
                & "Another user may have updated that category. " _
                & "Please try again."
        End If
    End Sub

    Protected Sub DetailsView1_ItemInserted(ByVal sender As Object, _
            ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) _
            Handles DetailsView1.ItemInserted
        If e.Exception IsNot Nothing Then
            lblError.Text = "Invalid data. Please correct and try again."
            e.ExceptionHandled = True
        End If
    End Sub

End Class
