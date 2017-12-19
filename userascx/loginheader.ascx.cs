using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class userascx_loginheader : System.Web.UI.UserControl
{
	public enum WeekDays
	{
		星期日 = 0,
		星期一 = 1,
		星期二 = 2,
		星期三 = 3,
		星期四 = 4,
		星期五 = 5,
		星期六 = 6
	}
	protected void Page_Load(object sender, EventArgs e)
	{
		//lbYear.Text = System.DateTime.Now.Year.ToString();
		//lbMonth.Text = System.DateTime.Now.Month.ToString();
		//lbDay.Text = System.DateTime.Now.Day.ToString();
		//int dayNum = Convert.ToInt32(System.DateTime.Now.DayOfWeek.GetHashCode().ToString());
		//switch(dayNum)
		//{
		//	case 0: lbWeekDay.Text = WeekDays.星期日.ToString();
		//		break;
		//	case 1: lbWeekDay.Text = WeekDays.星期一.ToString();
		//		break;
		//	case 2: lbWeekDay.Text = WeekDays.星期二.ToString();
		//		break;
		//	case 3: lbWeekDay.Text = WeekDays.星期三.ToString();
		//		break;
		//	case 4: lbWeekDay.Text = WeekDays.星期四.ToString();
		//		break;
		//	case 5: lbWeekDay.Text = WeekDays.星期五.ToString();
		//		break;
		//	case 6: lbWeekDay.Text = WeekDays.星期六.ToString();
		//		break;
		//}
	}
}