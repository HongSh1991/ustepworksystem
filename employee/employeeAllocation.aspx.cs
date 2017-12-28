using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employee_employeeAllocation : System.Web.UI.Page
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
			string chineseName = DBHelper.DBHelper.ExecuteScalar(searChineseName).ToString();
			lbUserName.Text = chineseName;
		}

		if(!IsPostBack)
		{
			BindDDLData();
			BindCheckData();
			BindRate();
		}
	}

	protected void lbtnExitSystem_Click(object sender, EventArgs e)
	{
		Session.Clear();
		Session.Abandon();
		this.Response.Redirect("../login/login.aspx"); // 退出并跳转到登录页
	}

	private void BindDDLData()
	{
		if (Session["UserName"] != null)
		{
			string userName = Session["UserName"].ToString();
			string userChineseName = DBHelper.DBHelper.ExecuteScalar("select U_ChineseName from tb_UserInfo where U_UserName = '" + userName + "'").ToString();
			string bindProjectName = "select * from tb_AdminToProjMan where ATPM_ChargeUserName = '" + userChineseName + "'";
			ddlProjectName.DataSource = DBHelper.DBHelper.ExecuteDataTable(bindProjectName);
			ddlProjectName.DataTextField = "ATPM_ProjectName";
			ddlProjectName.DataBind();
			ddlProjectName.Items.Insert(0, new ListItem());//"----请选择项目名称----"
		}
	}

	private void BindCheckData()
	{
		if (Session["UserName"] != null)
		{
			string userName = Session["UserName"].ToString();
			string userChineseName = DBHelper.DBHelper.ExecuteScalar("select U_ChineseName from tb_UserInfo where U_UserName = '" + userName + "'").ToString();
			string bindCheckData = "select * from tb_UserInfo where U_ChineseName !='" + "系统管理员" + "' and U_ChineseName !='" + userChineseName + "'";
			ddlAssginEmployee.DataSource = DBHelper.DBHelper.ExecuteDataTable(bindCheckData);
			ddlAssginEmployee.DataTextField = "U_ChineseName";
			ddlAssginEmployee.DataValueField = "U_ID";
			ddlAssginEmployee.DataBind();
			ddlAssginEmployee.Items.Insert(0, new ListItem());
		}
	}

	private void BindRate()
	{
		ddlTaskRate.Items.Insert(0, new ListItem());
		ddlTaskRate.Items.Insert(1, new ListItem("1"));
		ddlTaskRate.Items.Insert(2, new ListItem("2"));
		ddlTaskRate.Items.Insert(3, new ListItem("3"));
	}

	protected void btnAssignTask_Click(object sender, EventArgs e)
	{
		string userName = Session["UserName"].ToString();
		string userChineseName = DBHelper.DBHelper.ExecuteScalar("select U_ChineseName from tb_UserInfo where U_UserName = '" + userName + "'").ToString();

		string getProjectName = ddlProjectName.SelectedItem.Text.ToString();
		string getTaskName = tbTaskName.Text.Trim().ToString();
		string getTaskRate = ddlTaskRate.SelectedItem.Text.ToString();
		string getAttenderName = ddlAssginEmployee.SelectedItem.Text.ToString();
		string datetime = tbDeadLine.Text.Trim();
		string getTaskDetails = tbTaskDetails.Text.Trim().ToString();

		string compareTime = DateTime.Now.ToString("yyyy-MM-dd");
		DateTime dt1 = Convert.ToDateTime(datetime);
		DateTime dt2 = Convert.ToDateTime(compareTime);
		if (DateTime.Compare(dt1, dt2) <= 0)
		{
			Page.ClientScript.RegisterStartupScript(this.GetType(), "ServiceManHistoryButtonClick", "<script>alert('指派时间不得小于当前时间！！！');</script>");
		}
		else
		{
			string sqlInsert = "insert into tb_ProjectManage(PM_ProjectName, PM_TaskName, PM_TaskRate, PM_UserName, PM_AttenderName, PM_DeadLine, PM_TaskDetails )values('" + getProjectName + "', '" + getTaskName + "', '" + getTaskRate + "', '" + userChineseName + "', '" + getAttenderName + "', '" + datetime + "', '" + getTaskDetails + "')";
			DBHelper.DBHelper.ExectueNonQuery(sqlInsert);
			Page.ClientScript.RegisterStartupScript(this.GetType(), "ServiceManHistoryButtonClick", "<script>alert('项目任务指派成功！！！');window.location.href='employeePage.aspx'</script>");
		}
	}
}