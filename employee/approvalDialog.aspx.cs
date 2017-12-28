using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employee_approvalDialog : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (Session["UserName"] == null)
		{
			Response.Write("<script>alert('请先登录！'); window.location='../login/login.aspx';</script>");
		}

		if(!IsPostBack)
		{
			BindData();
		}
	}

	private void BindData()
	{
		string taskName = Request.QueryString["taskname"].ToString();
		string projectName = DBHelper.DBHelper.ExecuteScalar("select TS_ProjectName from tb_TaskStatus where TS_TaskName='" + taskName + "'").ToString();
		string taskemployee = DBHelper.DBHelper.ExecuteScalar("select TS_TaskEmployee from tb_TaskStatus where TS_TaskName='" + taskName + "'").ToString();
		DateTime finishedTime = Convert.ToDateTime(DBHelper.DBHelper.ExecuteScalar("select TS_SubmitTime from tb_TaskStatus where TS_TaskName='" + taskName + "'").ToString());
		string taskState = DBHelper.DBHelper.ExecuteScalar("select TS_TaskState from tb_TaskStatus where TS_TaskName='" + taskName + "'").ToString();

		lbTaskName.Text = taskName;
		lbProjectName.Text = projectName;
		lbTaskEmployee.Text = taskemployee;
		lbFinishedTime.Text = finishedTime.ToString("yyyy年MM月dd日");
		lbTaskProgressState.Text = taskState;

		ddlPass.Items.Insert(0, new ListItem("请选择"));
		ddlPass.Items.Insert(1, new ListItem("通过"));
		ddlPass.Items.Insert(2, new ListItem("不通过"));
	}

	protected void btnApproval_Click(object sender, EventArgs e)
	{
		
	}
}