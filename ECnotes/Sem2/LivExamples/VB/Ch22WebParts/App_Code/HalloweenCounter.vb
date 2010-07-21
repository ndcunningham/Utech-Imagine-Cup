Imports Microsoft.VisualBasic

Namespace murach

    Public Class HalloweenCounter
        Inherits WebPart

        Public Sub New()
            Me.Title = "Days to Halloween"
        End Sub

        Protected Overrides Sub RenderContents(ByVal writer As HtmlTextWriter)
            Dim dtmToday As Date = Date.Today
            Dim dtmHalloween As Date = New Date(Date.Today.Year, 10, 31)

            If dtmToday > dtmHalloween Then
                dtmHalloween = dtmHalloween.AddYears(1)
            End If

            Dim tsSpan As TimeSpan = dtmHalloween - dtmToday
            Dim sContent As String = "There are " & tsSpan.Days & " shopping days until Halloween."

            writer.Write(sContent)
        End Sub

    End Class

End Namespace
