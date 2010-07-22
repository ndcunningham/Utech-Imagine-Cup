
Partial Class Checkout
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' Initialize the Expiration Year drop-down
            Dim iYear As Integer

            For iYear = DateTime.Now.Year To DateTime.Now.Year + 5
                ddlExpirationYear.Items.Add(iYear.ToString())
            Next
        End If
    End Sub

    Protected Sub btnFinish_Click(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles btnFinish.Click
        Me.DisplayMessage()
    End Sub

    Protected Sub DisplayMessage()
        Dim sShipVia As String = ""

        If (rdoUPSGround.Checked) Then
            sShipVia = "UPSG"
        ElseIf (rdoUPS2Day.Checked) Then
            sShipVia = "UPS2D"
        ElseIf (rdoFedEx.Checked) Then
            sShipVia = "FEDEX"
        End If

        Dim sMessage As String
        sMessage = _
            "Contact info" & ControlChars.CrLf & _
            "    First name: " & txtFirstName.Text & ControlChars.CrLf & _
            "    Last name: " & txtLastName.Text & ControlChars.CrLf & _
            "    Email: " & txtEmail.Text & ControlChars.CrLf & _
            "Shipping method" & ControlChars.CrLf & _
            "    Ship via: " & sShipVia & ControlChars.CrLf & _
            "Credit card info" & ControlChars.CrLf & _
            "    Type: " & listCardType.SelectedValue & ControlChars.CrLf & _
            "    Number: " & txtCardNumber.Text & ControlChars.CrLf & _
            "    Expiration date: " & ddlExpirationMonth.SelectedValue & "/" & _
                                      ddlExpirationYear.SelectedValue
        txtMessage.Text = sMessage
    End Sub
End Class
