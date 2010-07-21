using System;
using System.Web;
using System.Collections;
using System.Web.Services;
using System.Web.Services.Protocols;


/// <summary>
/// Summary description for DaysUntilDates
/// </summary>
[WebService(Namespace = "http://www.utech.edu.jm/",
    Description="Calculates the number of days until a given date.")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public class DaysUntilDates : System.Web.Services.WebService {

    [WebMethod]
    public int DaysUntil(DateTime date)
    {
        return DaysUntilDate(date.Month, date.Day);
    }

    [WebMethod]
    public int DaysUntilHalloween()
    {
        return DaysUntilDate(10, 31);
    }

    [WebMethod]
    public int DaysUntilChristmas()
    {
        return DaysUntilDate(12, 25);
    }

    private int DaysUntilDate(int month, int day)
    {
        DateTime targetDate;

        targetDate = DateTime.Parse(month.ToString() + "/"
                   + day.ToString() + "/"
                   + DateTime.Today.Year);

        if (DateTime.Today > targetDate)
        {
            targetDate = targetDate.AddYears(1);
        }

        TimeSpan timeUntil = targetDate - DateTime.Today;

        return timeUntil.Days;
    }    
}

