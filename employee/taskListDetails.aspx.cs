using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employee_taskListDetails : System.Web.UI.Page
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
		lbTime.Text = DateTime.Now.Year.ToString();
		if (!IsPostBack)
		{
			BindTaskData();
			BindTaskState();

			if (Request.QueryString["taskname"] != null)
			{
				string taskName = Request.QueryString["taskname"].ToString();
				string searChineseName = "select U_ChineseName from tb_UserInfo where U_UserName = '" + Session["UserName"].ToString() + "'";
				string chineseName = DBHelper.DBHelper.ExecuteScalar(searChineseName).ToString();
				int checkTaskStatus = Convert.ToInt32(DBHelper.DBHelper.ExecuteScalar("select PM_TaskRate from tb_ProjectManage where PM_TaskName = '" + taskName + "' and PM_AttenderName = '" + chineseName + "'").ToString());
				if(checkTaskStatus == 0)
				{
					controlDiv.Visible = false;
				}
			}
		}
	}

	protected void lbtnExitSystem_Click(object sender, EventArgs e)
	{
		Session.Clear();
		Session.Abandon();
		this.Response.Redirect("../login/login.aspx"); // 退出并跳转到登录页
	}

	private void BindTaskData()
	{
		if(Request.QueryString["taskname"] != null)
		{
			string taskName = Request.QueryString["taskname"].ToString();
			string belongProject = DBHelper.DBHelper.ExecuteScalar("select PM_ProjectName from tb_ProjectManage where PM_TaskName='" + taskName + "'").ToString();
			DateTime dt = Convert.ToDateTime(DBHelper.DBHelper.ExecuteScalar("select PM_DeadLine from tb_ProjectManage where PM_TaskName='" + taskName + "'").ToString());
			string taskDetails = DBHelper.DBHelper.ExecuteScalar("select PM_TaskDetails from tb_ProjectManage where PM_TaskName='" + taskName + "'").ToString();

			lbTaskName.Text = taskName;
			lbBelongsTo.Text = belongProject;
			string sqlSearch1 = "select PM_TaskRate from tb_ProjectManage where PM_TaskName = '" + taskName + "'";
			int RateID = Convert.ToInt32(DBHelper.DBHelper.ExecuteScalar(sqlSearch1).ToString());
			switch (RateID)
			{
				case 1:
					lbTaskRate.Text = "&#xe658;";
					break;
				case 2:
					lbTaskRate.Text = "&#xe658;&#xe658;";
					break;
				case 3:
					lbTaskRate.Text = "&#xe658;&#xe658;&#xe658;";
					break;
				default:
					return;
			}
			lbTaskDeadLine.Text = dt.ToString("yyyy年MM月dd日");
			lbTaskDetails.Text = taskDetails;
		}
	}

	private void BindTaskState()
	{
		ddlTaskState.Items.Insert(0, new ListItem());
	}

	protected void btnCommitTaskStatus_Click(object sender, EventArgs e)
	{
		if(tbTaskStatusState.Text != "")
		{
			string taskStatus = ddlTaskState.SelectedItem.Text;
			string taskName = Request.QueryString["taskname"].ToString();
			string projectName = DBHelper.DBHelper.ExecuteScalar("select PM_ProjectName from tb_ProjectManage where PM_TaskName='" + taskName + "'").ToString();

			string searChineseName = "select U_ChineseName from tb_UserInfo where U_UserName = '" + Session["UserName"].ToString() + "'";
			string chineseName = DBHelper.DBHelper.ExecuteScalar(searChineseName).ToString();

			DateTime dt = Convert.ToDateTime(tbSubmitTime.Text);
			string taskProgressState = tbTaskStatusState.Text.Trim().ToString();
			string sqlInsert = "insert into tb_TaskStatus(TS_TaskName, TS_ProjectName, TS_TaskStatusNow, TS_SubmitTime, TS_TaskEmployee, TS_TaskState )values('" + taskName + "', '" + projectName + "', '" + taskStatus + "', '" + dt.ToShortDateString() + "', '" + chineseName + "', '" + taskProgressState + "')";
			DBHelper.DBHelper.ExectueNonQuery(sqlInsert);
			Page.ClientScript.RegisterStartupScript(this.GetType(), "ServiceManHistoryButtonClick", "<script>alert('任务状态提交成功！！！');window.location.href=''</script>");
		}
		else
		{
			Page.ClientScript.RegisterStartupScript(this.GetType(), "ServiceManHistoryButtonClick", "<script>alert('请检查未填项！！！');window.location.href=''</script>");
		}
	}
}