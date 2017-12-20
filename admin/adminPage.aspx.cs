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

		else if (Session["UserName"].ToString() != null)
		{
			string searChineseName = "select U_ChineseName from tb_UserInfo where U_UserName = '" + Session["UserName"].ToString() + "'";
			//string searDepartment = "select U_Department from tb_UserInfo where U_UserName = '" + Session["UserName"].ToString() + "'";
			//string searJob = "select U_ProjectName from tb_UserInfo where U_UserName = '" + Session["UserName"].ToString() + "'";
			string chineseName = DBHelper.DBHelper.ExecuteScalar(searChineseName).ToString();
			lbUserName.Text = chineseName;
			//string department = DBHelper.DBHelper.ExecuteScalar(searDepartment).ToString();
			//string job = DBHelper.DBHelper.ExecuteScalar(searJob).ToString();
			//lbChineseName.Text = chineseName;
			//lbDepartment.Text = department;
			//lbJob.Text = job;
		}
	}

	protected void lbtnExitSystem_Click(object sender, EventArgs e)
	{
		Session.Clear();
		Session.Abandon();
		this.Response.Redirect("../login/login.aspx"); // 退出并跳转到登录页
	}

	protected void lbtnEmployeeMana_Click(object sender, EventArgs e)
	{
		display1.Visible = true;
		display2.Visible = false;
		display3.Visible = false;
		display4.Visible = false;
	}

	protected void lbtnProAndDepMana_Click(object sender, EventArgs e)
	{
		display1.Visible = false;
		display2.Visible = true;
		display3.Visible = false;
		display4.Visible = false;
	}

	protected void lbtnComFilesMana_Click(object sender, EventArgs e)
	{
		display1.Visible = false;
		display2.Visible = false;
		display3.Visible = true;
		display4.Visible = false;
	}

	protected void lbtnComSoftWMana_Click(object sender, EventArgs e)
	{
		display1.Visible = false;
		display2.Visible = false;
		display3.Visible = false;
		display4.Visible = true;
	}
}