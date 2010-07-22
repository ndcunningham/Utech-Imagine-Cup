Imports System.Data

Partial Class CheckOut1
    Inherits System.Web.UI.Page

    Dim sEmail As String
    Dim bCookieExists As Boolean
    Dim dvCustomer As DataView

    Protected Sub Page_Load(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles Me.Load
        If Not Request.IsSecureConnection Then
            Dim sURL As String
            sURL = Request.Url.ToString.Replace("http:", "https:")
            Response.Redirect(sURL)
        Else
            If Request.Cookies("Email") Is Nothing Then
                bCookieExists = False
            Else
                bCookieExists = True
            End If
            If Not IsPostBack Then
                If bCookieExists Then
                    SqlDataSource1.SelectParameters("Email").DefaultValue _
                        = Request.Cookies("Email").Value
                    dvCustomer = CType(SqlDataSource1.Select( _
                        DataSourceSelectArguments.Empty), DataView)
                    Session("CustomerView") = dvCustomer
                    If dvCustomer.Count <> 0 Then
                        Me.DisplayCustomerData()
                        txtEmail.Enabled = False
                    Else
                        txtEmail.Enabled = True
                        txtEmail.Text = Request.Cookies("Email").Value
                    End If
                Else
                    txtEmail.Enabled = True
                End If
            Else
                If Not bCookieExists Then
                    SqlDataSource1.SelectParameters("Email").DefaultValue _
                        = txtEmail.Text
                    dvCustomer = CType(SqlDataSource1.Select( _
                        DataSourceSelectArguments.Empty), DataView)
                Else
                    dvCustomer = CType(Session("CustomerView"), DataView)
                End If
            End If
        End If

    End Sub

    Private Sub DisplayCustomerData()
        txtEmail.Text = dvCustomer(0)("Email").ToString
        txtFirstName.Text = dvCustomer(0)("FirstName").ToString
        txtLastName.Text = dvCustomer(0)("LastName").ToString
        txtAddress.Text = dvCustomer(0)("Address").ToString
        txtCity.Text = dvCustomer(0)("City").ToString
        txtState.Text = dvCustomer(0)("State").ToString
        txtZipCode.Text = dvCustomer(0)("ZipCode").ToString
        txtPhone.Text = dvCustomer(0)("PhoneNumber").ToString
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles btnCancel.Click
        Session.Remove("Cart")
        Dim sURL As String = "http:" _
            & ConfigurationManager.AppSettings("AppPath") _
            & "Order.aspx"
        Response.Redirect(sURL)
    End Sub

    Protected Sub btnCheckOut_Click(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles btnCheckOut.Click
        If Page.IsValid Then
            If Not bCookieExists Then
                Me.AddCookie()
            End If
            If dvCustomer.Count = 0 Then
                Me.AddCustomer()
            Else
                If CustomerModified() Then
                    Me.UpdateCustomer()
                End If
            End If
            Session("Email") = txtEmail.Text
            Response.Redirect("CheckOut2.aspx")
        End If
    End Sub

    Private Sub AddCookie()
        Dim EmailCookie As New HttpCookie("Email", txtEmail.Text)
        EmailCookie.Expires = Now.AddYears(1)
        Response.Cookies.Add(EmailCookie)
    End Sub

    Private Sub AddCustomer()
        SqlDataSource1.InsertParameters("Email").DefaultValue _
            = txtEmail.Text
        SqlDataSource1.InsertParameters("FirstName").DefaultValue _
            = txtFirstName.Text
        SqlDataSource1.InsertParameters("LastName").DefaultValue _
            = txtLastName.Text
        SqlDataSource1.InsertParameters("Address").DefaultValue _
            = txtAddress.Text
        SqlDataSource1.InsertParameters("City").DefaultValue _
            = txtCity.Text
        SqlDataSource1.InsertParameters("State").DefaultValue _
            = txtState.Text
        SqlDataSource1.InsertParameters("ZipCode").DefaultValue _
            = txtZipCode.Text
        SqlDataSource1.InsertParameters("PhoneNumber").DefaultValue _
            = txtPhone.Text
        SqlDataSource1.Insert()
    End Sub

    Private Function CustomerModified() As Boolean
        If dvCustomer(0)("FirstName").ToString <> txtFirstName.Text Then
            CustomerModified = True
        ElseIf dvCustomer(0)("LastName").ToString <> txtLastName.Text Then
            CustomerModified = True
        ElseIf dvCustomer(0)("Address").ToString <> txtAddress.Text Then
            CustomerModified = True
        ElseIf dvCustomer(0)("City").ToString <> txtCity.Text Then
            CustomerModified = True
        ElseIf dvCustomer(0)("State").ToString <> txtState.Text Then
            CustomerModified = True
        ElseIf dvCustomer(0)("ZipCode").ToString <> txtZipCode.Text Then
            CustomerModified = True
        ElseIf dvCustomer(0)("PhoneNumber").ToString <> txtPhone.Text Then
            CustomerModified = True
        End If
    End Function

    Private Sub UpdateCustomer()
        SqlDataSource1.UpdateParameters("FirstName").DefaultValue _
            = txtFirstName.Text
        SqlDataSource1.UpdateParameters("LastName").DefaultValue _
            = txtLastName.Text
        SqlDataSource1.UpdateParameters("Address").DefaultValue _
            = txtAddress.Text
        SqlDataSource1.UpdateParameters("City").DefaultValue _
            = txtCity.Text
        SqlDataSource1.UpdateParameters("State").DefaultValue _
            = txtState.Text
        SqlDataSource1.UpdateParameters("ZipCode").DefaultValue _
            = txtZipCode.Text
        SqlDataSource1.UpdateParameters("PhoneNumber").DefaultValue _
            = txtPhone.Text
        SqlDataSource1.UpdateParameters("original_Email").DefaultValue _
            = txtEmail.Text
        SqlDataSource1.Update()
    End Sub

    Protected Sub btnContinue_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnContinue.Click
        Dim sURL As String = "http:" _
            & ConfigurationManager.AppSettings("AppPath") _
            & "Order.aspx"
        Response.Redirect(sURL)
    End Sub
End Class
