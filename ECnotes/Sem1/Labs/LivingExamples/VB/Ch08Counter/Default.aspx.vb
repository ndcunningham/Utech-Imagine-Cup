Partial Class _Default
    Inherits System.Web.UI.Page

    Dim iSessionCount As Integer

    Protected Sub Page_Load(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles Me.Load
        If Session("Count") Is Nothing Then
            iSessionCount = 0
        Else
            iSessionCount = CType(Session("Count"), Integer)
        End If
    End Sub

    Protected Sub btnPost_Click(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles btnPost.Click
        iSessionCount += 1

        lblSessionClicks.Text = "You have clicked the button " & iSessionCount & " times."

        Application.Lock()

        Dim iApplicationCount As Integer = CType(Application("HitCount"), Integer)

        iApplicationCount += 1

        Application("HitCount") = iApplicationCount

        Application.UnLock()

        lblApplicationClicks.Text = "All users have clicked the button " _
            & iApplicationCount & " times."
    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles Me.PreRender
        Session("Count") = iSessionCount
    End Sub
End Class
