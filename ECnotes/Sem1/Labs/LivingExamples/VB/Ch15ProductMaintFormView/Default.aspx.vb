
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GridView1.SelectedIndex = 0
        End If
    End Sub

    Protected Sub FormView1_ItemDeleted(ByVal sender As Object, _
            ByVal e As System.Web.UI.WebControls.FormViewDeletedEventArgs) Handles FormView1.ItemDeleted
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

    Protected Sub FormView1_ItemDeleting(ByVal sender As Object, _
            ByVal e As System.Web.UI.WebControls.FormViewDeleteEventArgs) Handles FormView1.ItemDeleting
        e.Values("UnitPrice") = e.Values("UnitPrice").ToString.Substring(1)
    End Sub

    Protected Sub FormView1_ItemInserted(ByVal sender As Object, _
            ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormView1.ItemInserted
        If e.Exception IsNot Nothing Or e.AffectedRows = 0 Then
            lblError.Text = "Error: Product not inserted."
            e.ExceptionHandled = True
        Else
            GridView1.DataBind()
        End If
    End Sub

    Protected Sub FormView1_ItemUpdated(ByVal sender As Object, _
            ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormView1.ItemUpdated
        If e.Exception IsNot Nothing Then
            lblError.Text = "Invalid data. Please correct and try again."
            e.ExceptionHandled = True
        ElseIf e.AffectedRows = 0 Then
            lblError.Text = "Another user has updated that product. " _
                          & "Please try again."
        End If
        GridView1.DataBind()
    End Sub

End Class
