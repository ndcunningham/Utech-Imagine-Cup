
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim iDaysUntil As Integer = DaysUntilHalloween()
        If iDaysUntil = 0 Then
            lblMessage.Text = "Happy Halloween!"
        ElseIf iDaysUntil = 1 Then
            lblMessage.Text = "Tomorrow is Halloween!"
        Else
            lblMessage.Text = "There are only " & iDaysUntil _
                & " days left until Halloween!"
        End If
    End Sub

    Private Function DaysUntilHalloween() As Integer
        Dim dtmHalloween As Date = New DateTime(DateTime.Today.Year, 10, 31)
        If DateTime.Today > dtmHalloween Then
            dtmHalloween = dtmHalloween.AddYears(1)
        End If
        Dim tsTimeUntil As TimeSpan = dtmHalloween - DateTime.Today
        Return tsTimeUntil.Days
    End Function

End Class

