using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            for (int i = 50; i <= 500; i += 50)
                ddlMonthlyInvestment.Items.Add(i.ToString());
    }

    protected void btnCalculate_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            int monthlyInvestment = Convert.ToInt32(ddlMonthlyInvestment.SelectedValue);
            decimal yearlyInterestRate = Convert.ToDecimal(txtInterestRate.Text);
            int years = Convert.ToInt32(txtYears.Text);

            int months = years * 12;
            decimal monthlyInterestRate = yearlyInterestRate / 12 / 100;

            decimal futureValue = this.CalculateFutureValue(monthlyInvestment,
                monthlyInterestRate, months);

            lblFutureValue.Text = futureValue.ToString("c");
        }
    }

    protected decimal CalculateFutureValue(int monthlyInvestment,
        decimal monthlyInterestRate, int months)
    {
        decimal futureValue = 0;

        for (int i = 0; i < months; i++)
        {
            futureValue = (futureValue + monthlyInvestment) * (1 + monthlyInterestRate);
        }
        return futureValue;
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        ddlMonthlyInvestment.SelectedIndex = 0;
        txtInterestRate.Text = "";
        txtYears.Text = "";
        lblFutureValue.Text = "";
    }
}
