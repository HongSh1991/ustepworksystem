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

	#region 后台页面显示管理
	protected void lbtnEmployeeMana_Click(object sender, EventArgs e)
	{
		display1.Visible = true;
		display2.Visible = false;
		display3.Visible = false;
		display4.Visible = false;
	}

	protected void lbtnProMana_Click(object sender, EventArgs e)
	{
		display1.Visible = false;
		display2.Visible = true;
		display2.Attributes.Add("style", "padding:1.2%;display:block;text-align-last:center;");
		display3.Visible = false;
		display4.Visible = false;
		display5.Visible = false;
	}

	protected void lbtnDepMana_Click(object sender, EventArgs e)
	{
		display1.Visible = false;
		display2.Visible = false;
		display3.Visible = true;
		display3.Attributes.Add("style", "padding:1.2%;display:block;text-align-last:center;");
		display4.Visible = false;
		display5.Visible = false;
	}

	protected void lbtnComFilesMana_Click(object sender, EventArgs e)
	{
		display1.Visible = false;
		display2.Visible = false;
		display3.Visible = false;
		display4.Visible = true;
		display4.Attributes.Add("style", "padding:1.2%;display:block;text-align-last:center;");
		display5.Visible = false;
	}

	protected void lbtnComSoftWMana_Click(object sender, EventArgs e)
	{
		display1.Visible = false;
		display2.Visible = false;
		display3.Visible = false;
		display4.Visible = false;
		display5.Visible = true;
		display5.Attributes.Add("style", "padding:1.2%;display:block;text-align-last:center;");
	}
	#endregion

	protected void lbtnAddProjectName_Click(object sender, EventArgs e)
	{
		Response.Write("<script>window.open('addProjectName.aspx','','width=460,height=200,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no').moveTo((window.screen.availWidth-10-460)/2, (window.screen.availHeight-30-200)/2);</script>");
	}

	protected void lbtnAddDepName_Click(object sender, EventArgs e)
	{
		Response.Write("<script>window.open('addDep.aspx','','width=460,height=200,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no').moveTo((window.screen.availWidth-10-460)/2, (window.screen.availHeight-30-200)/2);</script>");
	}

	protected void lbtnAddEmpoyee_Click(object sender, EventArgs e)
	{
		Response.Write("<script>window.open('addEmployeeInfo.aspx','','width=460,height=520,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no').moveTo((window.screen.availWidth-10-460)/2, (window.screen.availHeight-30-520)/2);</script>");
	}

	protected void lbtnAddComFiles_Click(object sender, EventArgs e)
	{

	}

	protected void lbtnAddComSofts_Click(object sender, EventArgs e)
	{

	}
}