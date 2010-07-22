
Partial Class Checkout
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' Set the initial step
            wizCheckout.ActiveStepIndex = 0

            ' Initialize the Expiration Year drop-down
            Dim iYear As Integer

            For iYear = DateTime.Now.Year To DateTime.Now.Year + 5
                ddlExpirationYear.Items.Add(iYear.ToString())
            Next
        End If
    End Sub

    Protected Sub wizCheckout_FinishButtonClick(ByVal sender As Object, _
            ByVal e As System.Web.UI.WebControls.WizardNavigationEventArgs) _
            Handles wizCheckout.FinishButtonClick
        Me.DisplayMessage()
    End Sub

    Protected Sub wizCheckout_CancelButtonClick(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles wizCheckout.CancelButtonClick
        wizCheckout.ActiveStepIndex = 0
        txtFirstName.Text = ""
        txtLastName.Text = ""
        txtEmail.Text = ""
        rdoUPSGround.Checked = True
        rdoUPS2Day.Checked = False
        rdoFedEx.Checked = False
        lstCardType.SelectedIndex = 0
        txtCardNumber.Text = ""
        ddlExpirationMonth.SelectedIndex = 0
        ddlExpirationYear.SelectedIndex = 0
    End Sub

    Protected Sub DisplayMessage()
        Dim sShipVia As String

        If (rdoUPSGround.Checked) Then
            sShipVia = "UPSG"
        ElseIf (rdoUPS2Day.Checked) Then
            sShipVia = "UPS2D"
        ElseIf (rdoFedEx.Checked) Then
            sShipVia = "FEDEX"
        Else
            sShipVia = ""
        End If

        Dim sMessage As String

        sMessage = _
            "Contact info" & ControlChars.Cr & _
            "    First name: " & txtFirstName.Text & ControlChars.Cr & _
            "    Last name: " & txtLastName.Text & ControlChars.Cr & _
            "    Email: " & txtEmail.Text & ControlChars.Cr & _
            "Shipping method" & ControlChars.Cr & _
            "    Ship via: " & sShipVia & ControlChars.Cr & _
            "Credit card info" & ControlChars.Cr & _
            "    Type: " & lstCardType.SelectedValue & ControlChars.Cr & _
            "    Number: " & txtCardNumber.Text & ControlChars.Cr & _
            "    Expiration date: " & ddlExpirationMonth.SelectedValue & "/" & _
                                      ddlExpirationYear.SelectedValue
        txtMessage.Text = sMessage
    End Sub

End Class
