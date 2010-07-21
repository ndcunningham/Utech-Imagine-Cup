using System;
using System.Web.UI;
using System.Web.UI.WebControls.WebParts;

namespace murach
{
	public class HalloweenCounter : WebPart
	{
		public HalloweenCounter()
		{
			this.Title = "Days to Halloween";
		}

		protected override void RenderContents(HtmlTextWriter writer)
		{
			DateTime today = DateTime.Today;

			DateTime halloween = new DateTime(DateTime.Today.Year, 10, 31);

			if (today > halloween)
				halloween = halloween.AddYears(1);

			TimeSpan span = halloween - today;

			string content = "There are " + span.Days + " shopping days until Halloween.";
             
			writer.Write(content);
		}
	}
}
