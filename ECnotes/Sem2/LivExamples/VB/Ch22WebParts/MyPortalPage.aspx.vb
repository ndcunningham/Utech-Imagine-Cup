
Partial Class MyPortalPage
    Inherits System.Web.UI.Page

    Protected Sub rdoDisplayMode_SelectedIndexChanged(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles rdoDisplayMode.SelectedIndexChanged
        If rdoDisplayMode.SelectedIndex = 0 Then
            WebPartManager1.DisplayMode = WebPartManager.BrowseDisplayMode
        ElseIf rdoDisplayMode.SelectedIndex = 1 Then
            WebPartManager1.DisplayMode = WebPartManager.DesignDisplayMode
        ElseIf rdoDisplayMode.SelectedIndex = 2 Then
            WebPartManager1.DisplayMode = WebPartManager.CatalogDisplayMode
        ElseIf rdoDisplayMode.SelectedIndex = 3 Then
            WebPartManager1.DisplayMode = WebPartManager.EditDisplayMode
        End If
    End Sub
End Class
