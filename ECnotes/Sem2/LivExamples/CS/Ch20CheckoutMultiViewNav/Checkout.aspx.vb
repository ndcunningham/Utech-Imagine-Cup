
Partial Class Checkout
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            ' set the initial view state
            Me.DisplayStatus()

            ' initialize the Expiration Year drop-down
            Dim iYear As Integer

            For iYear = DateTime.Now.Year To DateTime.Now.Year + 5
                ddlExpirationYear.Items.Add(iYear.ToString())
            Next
        End If
    End Sub

    Protected Sub btnFinish_Click(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles btnFinish.Click
        mvCheckout.ActiveViewIndex = 3

        DisplayMessage()
    End Sub

    Protected Sub DisplayMessage()
        Dim shipVia As String

        shipVia = ""

        If (rdoUPSGround.Checked) Then
            shipVia = "UPSG"
        ElseIf (rdoUPS2Day.Checked) Then
            shipVia = "UPS2D"
        ElseIf (rdoFedEx.Checked) Then
            shipVia = "FEDEX"
        End If

        Dim message As String

        message = _
             "Contact info" & ControlChars.Cr & _
             "    First name: " & txtFirstName.Text & ControlChars.Cr & _
             "    Last name: " & txtLastName.Text & ControlChars.Cr & _
             "    Email: " & txtEmail.Text & ControlChars.Cr & _
             "Shipping method" & ControlChars.Cr & _
             "    Ship via: " & shipVia & ControlChars.Cr & _
             "Credit card info" & ControlChars.Cr & _
             "    Type: " & listCardType.SelectedValue & ControlChars.Cr & _
             "    Number: " & txtCardNumber.Text & ControlChars.Cr & _
             "    Expiration date: " & ddlExpirationMonth.SelectedValue & "/" & _
                                       ddlExpirationYear.SelectedValue
        txtMessage.Text = message
    End Sub

    Protected Sub mvCheckout_ActiveViewChanged(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles mvCheckout.ActiveViewChanged
        Me.DisplayStatus()
    End Sub

    Private Sub DisplayStatus()
        Dim viewNumber As Integer = mvCheckout.ActiveViewIndex + 1

        lblStatus.Text = "View " & viewNumber & " of " & mvCheckout.Views.Count
    End Sub
End Class
