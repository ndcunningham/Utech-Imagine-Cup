
Partial Class CheckOut1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Dim States As US_States = New US_States()
            ddlState.DataSource = States
            ddlState.DataMember = "US_States.State"
            ddlState.DataValueField = "Abbreviation"
            ddlState.DataTextField = "Name"
            ddlState.DataBind()

            Dim Customer As Customer = Profile.Customer
            If Not Customer Is Nothing Then
                txtLastName.Text = Customer.LastName
                txtFirstName.Text = Customer.FirstName
                txtAddress.Text = Customer.Address
                txtCity.Text = Customer.City
                ddlState.SelectedValue = Customer.State
                txtZipCode.Text = Customer.ZipCode
                txtPhone.Text = Customer.Phone
                txtEmail.Text = Customer.Email
            End If
        End If

    End Sub

    Protected Sub UpdateCustomer()
        Dim Customer As New Customer
        Customer.LastName = txtLastName.Text
        Customer.FirstName = txtFirstName.Text
        Customer.Address = txtAddress.Text
        Customer.City = txtCity.Text
        Customer.State = ddlState.SelectedValue
        Customer.ZipCode = txtZipCode.Text
        Customer.Phone = txtPhone.Text
        Customer.Email = txtEmail.Text
        Profile.Customer = Customer
    End Sub

    Protected Sub btnContinue_Click(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles btnContinue.Click
        UpdateCustomer()
        Response.Redirect("~/Order.aspx")
    End Sub

    Protected Sub btnCheckout_Click(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles btnCheckout.Click
        UpdateCustomer()
        lblMessage.Text = "Sorry, that function hasn't been implemented yet."
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles btnCancel.Click
        Profile.Cart.Clear()
        Response.Redirect("~/Order.aspx")
    End Sub
End Class
