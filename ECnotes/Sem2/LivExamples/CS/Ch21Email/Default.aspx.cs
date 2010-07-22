using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Net.Mail;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        MailAddress fromAdd = new MailAddress("vpougatchev@utech.edu.jm", "ValeriUtechSCIT");
        MailAddress toAdd = new MailAddress("Valera_Pougatchev@yahoo.com");
        //MailAddress ccAdd = new MailAddress("vpougatchev@utech.edu.jm");
         
        MailMessage msg = new MailMessage(fromAdd, toAdd);

        msg.Subject = "My email from SCIT lab111";
        msg.Body = "Hi from Valeri SCIT lab111";
        //msg.CC.Add(ccAdd);

        SmtpClient client = new SmtpClient();

        client.EnableSsl = true;

        client.Send(msg);
    }
}
