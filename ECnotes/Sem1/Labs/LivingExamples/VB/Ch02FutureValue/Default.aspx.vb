Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, _
             ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim iIndex As Integer

            For iIndex = 50 To 500 Step 50
                ddlMonthlyInvestment.Items.Add(iIndex)
            Next iIndex
        End If
    End Sub

    Protected Sub btnCalculate_Click(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles btnCalculate.Click
        Dim iMonths As Integer
        Dim dInterestRate, dMonthlyInvestment As Decimal
        Dim dFutureValue As Decimal

        iMonths = txtYears.Text * 12
        dInterestRate = txtInterestRate.Text / 12 / 100
        dMonthlyInvestment = ddlMonthlyInvestment.SelectedValue
        dFutureValue = FutureValue(iMonths, dInterestRate, dMonthlyInvestment)
        lblFutureValue.Text = FormatCurrency(dFutureValue)
    End Sub

    Private Function FutureValue(ByVal Months As Integer, _
            ByVal InterestRate As Decimal, _
            ByVal MonthlyInvestment As Decimal) As Decimal
        Dim iIndex As Integer
        Dim dFutureValue As Decimal

        For iIndex = 1 To Months
            dFutureValue = (dFutureValue + MonthlyInvestment) _
                         * (1 + InterestRate)
        Next iIndex

        Return dFutureValue
    End Function

    Protected Sub btnClear_Click(ByVal sender As Object, _
            ByVal e As System.EventArgs) Handles btnClear.Click
        ddlMonthlyInvestment.Text = 50
        txtInterestRate.Text = ""
        txtYears.Text = ""
        lblFutureValue.Text = ""
    End Sub

End Class
