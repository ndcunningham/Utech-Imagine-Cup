using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HalloweenWebControlLibrary
{
    [ToolboxData("<{0}:DaysUntil runat=server></{0}:DaysUntil>")]
    public class DaysUntil : WebControl
    {
        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        [Localizable(true)]
        public string TextBefore
        {
            get
            {
                String s = (String) ViewState["TextBefore"];

                return ((s == null) ? String.Empty : s);
            }

            set
            {
                ViewState["TextBefore"] = value;
            }
        }

        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        [Localizable(true)]
        public string TextAfter
        {
            get
            {
                String s = (String) ViewState["TextAfter"];

                return ((s == null) ? String.Empty : s);
            }

            set
            {
                ViewState["TextAfter"] = value;
            }
        }

        [Bindable(true)] [Category("Appearance")]
        [DefaultValue("")] [Localizable(true)]
        public int Month
        {
            get
            {
                String s = (String) ViewState["Month"];

                if (s == null || s.Equals(""))
                    return 10;
                else
                    return Convert.ToInt32(ViewState["Month"]);
            }
            set
            {
                ViewState["Month"] = value.ToString();
            }
        }

        [Bindable(true)] [Category("Appearance")]
        [DefaultValue("")] [Localizable(true)]
        public int Day
        {
            get
            {
                String s = (String)ViewState["Day"];

                if (s == null || s.Equals(""))
                    return 31;
                else
                    return Convert.ToInt32(ViewState["Day"]);
            }

            set
            {
                ViewState["Day"] = value.ToString();
            }
        }

        protected override void RenderContents(HtmlTextWriter output)
        {
            output.Write(TextBefore + " ");
            output.Write(DaysUntilDate());
            output.Write(" " + TextAfter);
        }

        private int DaysUntilDate()
        {
            DateTime targetDate = new DateTime(DateTime.Today.Year, Month, Day);

            if (DateTime.Today > targetDate)
                targetDate = targetDate.AddYears(1);

            TimeSpan timeUntil = targetDate - DateTime.Today;

            return timeUntil.Days;
        }

    }
}
