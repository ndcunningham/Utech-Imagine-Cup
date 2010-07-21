
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

End Class
