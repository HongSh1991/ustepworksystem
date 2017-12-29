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
		lbTime.Text = DateTime.Now.Year.ToString();
		if (!IsPostBack)
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
		string taskName = Request.QueryString["taskname"].ToString();
		string projectName = DBHelper.DBHelper.ExecuteScalar("select TS_ProjectName from tb_TaskStatus where TS_TaskName='" + taskName + "'").ToString();
		string taskemployee = DBHelper.DBHelper.ExecuteScalar("select TS_TaskEmployee from tb_TaskStatus where TS_TaskName='" + taskName + "'").ToString();
		if (Session["UserName"] != null)
		{
			string taskChargerName = Session["UserName"].ToString();
			string searChineseName = "select U_ChineseName from tb_UserInfo where U_UserName = '" + taskChargerName + "'";
			string chineseName = DBHelper.DBHelper.ExecuteScalar(searChineseName).ToString();
			string approvalOpinion = ddlPass.SelectedItem.Text.ToString();
			string approvalState = tbApprovalOpinion.Text.Trim().ToString();
			DateTime finishedTime = Convert.ToDateTime(DBHelper.DBHelper.ExecuteScalar("select TS_SubmitTime from tb_TaskStatus where TS_TaskName='" + taskName + "'").ToString());
			DateTime deadLine = Convert.ToDateTime(DBHelper.DBHelper.ExecuteScalar("select PM_DeadLine from tb_ProjectManage where PM_TaskName='" + taskName + "'").ToString());

			string sqlInsert = "insert into tb_ApprovalStatus(AS_TaskName, AS_ProjectName, AS_ApprovalOpinion, AS_ApprovalState, AS_TaskFinishedEmployee, AS_TaskChargerEmployee, AS_TaskDeadLine, AS_TaskFinishedTime )values('" + taskName + "', '" + projectName + "', '" + approvalOpinion + "', '" + approvalState + "', '" + taskemployee + "', '" + chineseName +"', '" + deadLine +"', '" + finishedTime + "')";
			DBHelper.DBHelper.ExectueNonQuery(sqlInsert);
			Page.ClientScript.RegisterStartupScript(this.GetType(), "ServiceManHistoryButtonClick", "<script>alert('审批意见提交成功！！！');window.close();window.location.href=''</script>");
			if (ddlPass.SelectedItem.Text == "通过")
			{
				string sqlUpdate = "update tb_TaskStatus set TS_TaskStatusNow = '" + "负责人已审批通过" + "' where TS_TaskName = '" + taskName + "' and TS_TaskEmployee = '" + taskemployee + "'";
				DBHelper.DBHelper.ExectueNonQuery(sqlUpdate);

				string sqlUpdate1 = "update tb_ProjectManage set PM_TaskRate = '" + 0 + "' where PM_TaskName = '" + taskName + "' and PM_AttenderName = '" + taskemployee + "'";
				DBHelper.DBHelper.ExectueNonQuery(sqlUpdate1);
			}
			else if(ddlPass.SelectedItem.Text == "不通过")
			{
				string sqlUpdate = "update tb_TaskStatus set TS_TaskStatusNow = '" + "负责人已审批,未通过！" + "' where TS_TaskName = '" + taskName + "' and TS_TaskEmployee = '" + taskemployee + "'";
				DBHelper.DBHelper.ExectueNonQuery(sqlUpdate);
			}
		}
	}
}