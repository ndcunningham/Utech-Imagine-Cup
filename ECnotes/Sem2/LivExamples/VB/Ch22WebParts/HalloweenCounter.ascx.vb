
Partial Class HalloweenCounter
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles Me.Load
        Dim dtmToday As Date = Date.Today
        Dim dtmHalloween As Date = New Date(Date.Today.Year, 10, 31)

        If dtmToday > dtmHalloween Then
            dtmHalloween = dtmHalloween.AddYears(1)
        End If

        Dim tsSpan As TimeSpan = dtmHalloween - dtmToday

        lblCounter.Text = "There are " & tsSpan.Days & " shopping days until Halloween."
    End Sub
End Class
