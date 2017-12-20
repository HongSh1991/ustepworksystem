using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_adminPage : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (Session["UserName"] == null)
		{
			Response.Write("<script>alert('请先登录！'); window.location='../login/login.aspx';</script>");
		}

		#region
		//else if (Session["UserName"].ToString() != null)
		//{
		//	//string searChineseName = "select U_ChineseName from tb_UserInfo where U_UserName = '" + Session["UserName"].ToString() + "'";
		//	//string searDepartment = "select U_Department from tb_UserInfo where U_UserName = '" + Session["UserName"].ToString() + "'";
		//	//string searJob = "select U_ProjectName from tb_UserInfo where U_UserName = '" + Session["UserName"].ToString() + "'";
		//	//string chineseName = DBHelper.DBHelper.ExecuteScalar(searChineseName).ToString();
		//	//string department = DBHelper.DBHelper.ExecuteScalar(searDepartment).ToString();
		//	//string job = DBHelper.DBHelper.ExecuteScalar(searJob).ToString();
		//	//lbChineseName.Text = chineseName;
		//	//lbDepartment.Text = department;
		//	//lbJob.Text = job;
		//}
		#endregion
	}
}