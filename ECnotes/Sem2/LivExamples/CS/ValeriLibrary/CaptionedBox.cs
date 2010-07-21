using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ValeriLibrary
{
    [DefaultProperty("Text")]
    [ToolboxData("<{0}:CaptionedBox runat=server></{0}:CaptionedBox>")]
    public class CaptionedBox : TextBox
    {       
        private string caption;
        private Unit captionWidth;
        private Unit captionPadding;
        private bool rightAlignCaption;

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

        protected override void Render(HtmlTextWriter output)
        {
            //begin writing table
            output.WriteBeginTag("table");
            output.WriteAttribute("cellpadding", "0");
            output.WriteAttribute("cellspacing", "0");
            output.Write(HtmlTextWriter.TagRightChar);

            //begin writing row
            output.WriteBeginTag("tr");
            output.Write(HtmlTextWriter.TagRightChar);

            //write first column
            output.WriteBeginTag("td");

            string style = "width: " + CaptionWidth.ToString() + ";";

            if (RightAlignCaption)
                style += "text-align: right;";

            output.WriteAttribute("Style", style);
            output.Write(HtmlTextWriter.TagRightChar);
            output.Write(Caption);
            output.WriteEndTag("td");

            //write second column
            output.WriteBeginTag("td");

            style = "width: " + CaptionPadding.ToString() + ";";

            output.WriteAttribute("Style", style);
            output.Write(HtmlTextWriter.TagRightChar);
            output.WriteEndTag("td");

            //write third column
            output.WriteBeginTag("td");
            output.Write(HtmlTextWriter.TagRightChar);

            base.Render(output);    // this renders the TextBox

            output.WriteEndTag("td");

            //finish writing row
            output.WriteEndTag("tr");

            //finish writing table
            output.WriteEndTag("table");
        }
    }
}