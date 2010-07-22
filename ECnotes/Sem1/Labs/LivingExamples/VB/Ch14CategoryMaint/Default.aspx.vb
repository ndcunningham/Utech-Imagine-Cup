Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub btnAdd_Click(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles btnAdd.Click
        SqlDataSource1.InsertParameters("CategoryID").DefaultValue = txtID.Text
        SqlDataSource1.InsertParameters("ShortName").DefaultValue = txtShortName.Text
        SqlDataSource1.InsertParameters("LongName").DefaultValue = txtLongName.Text
        Try
            SqlDataSource1.Insert()

            txtID.Text = ""
            txtShortName.Text = ""
            txtLongName.Text = ""
        Catch ex As Exception
            lblError.Text = "An exception occurred. " _
                & ex.Message
        End Try
    End Sub

    Protected Sub GridView1_RowUpdated(ByVal sender As Object, _
            ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) _
            Handles GridView1.RowUpdated
        If e.Exception IsNot Nothing Then
            lblError.Text = "An exception occurred. " _
                & e.Exception.Message
            e.ExceptionHandled = True
            e.KeepInEditMode = True
        ElseIf e.AffectedRows = 0 Then
            lblError.Text = "No rows were updated. " _
                & "Another user may have updated that category. " _
                & "Please try again."
        End If
    End Sub

    Protected Sub GridView1_RowDeleted(ByVal sender As Object, _
            ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) _
            Handles GridView1.RowDeleted
        If e.Exception IsNot Nothing Then
            lblError.Text = "An exception occured. " _
                & e.Exception.Message
            e.ExceptionHandled = True
        ElseIf e.AffectedRows = 0 Then
            lblError.Text = "No rows were deleted. " _
                & "Another user may have updated this category. " _
                & "Please try again."
        End If
    End Sub
End Class
