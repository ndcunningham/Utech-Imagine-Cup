using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HalloweenWebControlLibrary
{
    [DefaultProperty("Text")]
    [ToolboxData("<{0}:DateDDL runat=server></{0}:DateDDL>")]
    public class DateDDL : CompositeControl
    {
        private Label lblCaption = new Label();
        private Label lblMessage = new Label();
        private Label lblCaptionPadding = new Label();
        private DropDownList ddlMonth = new DropDownList();
        private DropDownList ddlDay = new DropDownList();
        private DropDownList ddlYear = new DropDownList();

        private string caption;
        private Unit captionWidth;
        private Unit captionPadding;
        private bool rightAlignCaption;

        private int month;
        private int day;
        private int year;
        private bool autoPostBack;
        private bool dateChangedEventRaised = false;

        public event EventHandler DateChanged;

        public DateDDL()
        {
            ddlDay.SelectedIndexChanged += new EventHandler(ddlDay_SelectedIndexChanged);
            ddlMonth.SelectedIndexChanged += new EventHandler(ddlMonth_SelectedIndexChanged);
            ddlYear.SelectedIndexChanged += new EventHandler(ddlYear_SelectedIndexChanged);
        }

        [Category("Appearance")]
        [Description("The caption displayed to the left of the text box.")]
        public string Caption
        {
            get { return caption; }
            set { caption = value; }
        }

        [Category("Appearance")]
        [Description("The width of the caption.")]
        public Unit CaptionWidth
        {
            get { return captionWidth; }
            set { captionWidth = value; }
        }

        [Category("Appearance")]
        [Description("The space between the caption and the text box.")]
        public Unit CaptionPadding
        {
            get { return captionPadding; }
            set { captionPadding = value; }
        }

        [Category("Appearance")]
        [Description("Determines if the caption is right-aligned.")]
        public bool RightAlignCaption
        {
            get { return rightAlignCaption; }
            set { rightAlignCaption = value; }
        }

        public DateTime Date
        {
            get { return Convert.ToDateTime(Month + "/" + Day + "/" + Year); }
        }

        [Category("Misc"), Description("Gets or set the month.")]
        public int Month
        {
            get
            {
                month = ddlMonth.SelectedIndex + 1;

                return month;
            }
            set
            {
                month = value;

                ddlMonth.SelectedIndex = month - 1;

                if (!dateChangedEventRaised)
                {
                    DateChanged(this, new EventArgs());

                    dateChangedEventRaised = true;
                }
            }
        }

        [Category("Misc"), Description("Gets or sets the day.")]
        public int Day
        {
            get
            {
                day = ddlDay.SelectedIndex + 1;

                return day;
            }
            set
            {
                day = value;

                ddlDay.SelectedIndex = day - 1;

                if (!dateChangedEventRaised)
                {
                    DateChanged(this, new EventArgs());

                    dateChangedEventRaised = true;
                }
            }
        }

        [Category("Misc"), Description("Gets or sets the year.")]
        public int Year
        {
            get
            {
                year = Convert.ToInt32(ddlYear.SelectedValue);

                return year;
            }
            set
            {
                year = value;

                ddlYear.SelectedValue = year.ToString();

                if (!dateChangedEventRaised)
                {
                    DateChanged(this, new EventArgs());

                    dateChangedEventRaised = true;
                }
            }
        }

        [Category("Misc")]
        [Description("Determines whether a postback occurs "
            + "when the selection is changed.")]
        [DefaultValue(false)]
        public bool AutoPostBack
        {
            get { return autoPostBack; }
            set { autoPostBack = value; }
        }

        protected override void Render(HtmlTextWriter output)
        {
            base.Render(output);
        }

        protected override void CreateChildControls()
        {
            this.MakeCaption();
            this.MakeCaptionPadding();
            this.MakeMonthList();
            this.MakeDayList();
            this.MakeYearList();

            Controls.Clear();
            Controls.Add(lblCaption);
            Controls.Add(lblMessage);
            Controls.Add(lblCaptionPadding);
            Controls.Add(ddlMonth);
            Controls.Add(new LiteralControl("&nbsp;"));
            Controls.Add(ddlDay);
            Controls.Add(new LiteralControl(",&nbsp;"));
            Controls.Add(ddlYear);
        }

        private void MakeCaption()
        {
            lblCaption.Text = Caption;
            lblCaption.Width = CaptionWidth;

            if (RightAlignCaption)
                lblCaption.Style["text-align"] = "right";
        }

        private void MakeCaptionPadding()
        {
            lblCaptionPadding.Width = CaptionPadding;
        }

        private void MakeMonthList()
        {
            ddlMonth.Width = Unit.Pixel(85);
            ddlMonth.Items.Clear();
            ddlMonth.Items.Add("January");
            ddlMonth.Items.Add("February");
            ddlMonth.Items.Add("March");
            ddlMonth.Items.Add("April");
            ddlMonth.Items.Add("May");
            ddlMonth.Items.Add("June");
            ddlMonth.Items.Add("July");
            ddlMonth.Items.Add("August");
            ddlMonth.Items.Add("September");
            ddlMonth.Items.Add("October");
            ddlMonth.Items.Add("November");
            ddlMonth.Items.Add("December");
            ddlMonth.SelectedIndex = Month - 1;
            ddlMonth.AutoPostBack = AutoPostBack;
        }

        private void MakeDayList()
        {
            ddlDay.Width = Unit.Pixel(40);
            ddlDay.Items.Clear();

            for (int i = 1; i <= 31; i++)
                ddlDay.Items.Add(i.ToString());

            ddlDay.SelectedValue = Day.ToString();

            ddlDay.AutoPostBack = AutoPostBack;
        }

        private void MakeYearList()
        {
            ddlYear.Width = Unit.Pixel(65);
            ddlYear.Items.Clear();

            for (int i = DateTime.Today.Year; i <= DateTime.Today.Year + 10; i++)
                ddlYear.Items.Add(i.ToString());

            ddlYear.SelectedValue = Year.ToString();
            ddlYear.AutoPostBack = AutoPostBack;
        }

        private void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.Month = ddlMonth.SelectedIndex + 1;
            this.AdjustDay();
        }

        private void ddlDay_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.Day = Convert.ToInt32(ddlDay.SelectedValue);
            this.AdjustDay();
        }

        private void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.Year = Convert.ToInt32(ddlYear.SelectedValue);
            this.AdjustDay();
        }

        private void AdjustDay()
        {
            switch (Month)
            {
                case 4:
                case 6:
                case 9:
                case 11:
                    if (Day == 31) Day = 30;

                    break;
                case 2:
                    if (Year % 4 == 0)
                        if (Day > 29) Day = 29;
                    else
                        if (Day > 28) Day = 28;

                    break;
            }
        }

        protected void ddlDay_DateChanged(object sender, EventArgs e)
        {
            WebControl control = (WebControl)sender;

            lblMessage.Text = "The DateChanged event was raised by the "
                + control.ID + " control.";
        }
    }
}
