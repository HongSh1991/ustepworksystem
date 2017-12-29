using System;
using System.Web.UI.WebControls;

public partial class employee_employeeBack : System.Web.UI.Page
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
			BindProject();

		}
	}

	protected void lbtnExitSystem_Click(object sender, EventArgs e)
	{
		Session.Clear();
		Session.Abandon();
		this.Response.Redirect("../login/login.aspx"); // 退出并跳转到登录页
	}

	private void BindProject()
	{
		if (Session["UserName"] != null)
		{
			string searChineseName = "select U_ChineseName from tb_UserInfo where U_UserName = '" + Session["UserName"].ToString() + "'";
			string chineseName = DBHelper.DBHelper.ExecuteScalar(searChineseName).ToString();
			string sqlBindProject = "select distinct TS_ProjectName from tb_TaskStatus where TS_TaskEmployee = '" + chineseName + "'";
			ddlProjectName.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlBindProject);
			ddlProjectName.DataTextField = "TS_ProjectName";
			ddlProjectName.DataBind();
			ddlProjectName.Items.Insert(0, new ListItem("----请选择项目名称----"));
		}
	}

	protected void ddlProjectName_SelectedIndexChanged(object sender, EventArgs e)
	{
		if (Session["UserName"] != null)
		{
			string searChineseName = "select U_ChineseName from tb_UserInfo where U_UserName = '" + Session["UserName"].ToString() + "'";
			string chineseName = DBHelper.DBHelper.ExecuteScalar(searChineseName).ToString();
			string getProjectName = ddlProjectName.SelectedItem.Text.ToString();
			string sqlBindTask = "select * from tb_TaskStatus where TS_TaskEmployee = '" + chineseName + "' and TS_ProjectName = '" + getProjectName + "'";
			ddlTaskName.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlBindTask);
			ddlTaskName.DataTextField = "TS_TaskName";
			ddlTaskName.DataBind();
			ddlTaskName.Items.Insert(0, new ListItem());
		}
	}

	protected void btnSubmitProblem_Click(object sender, EventArgs e)
	{
		string getProblemName = tbProblemName.Text.Trim();
		string getProjectName = ddlProjectName.SelectedItem.Text.ToString();
		string getTaskName = ddlTaskName.SelectedItem.Text.ToString();
		string getProblemClassify = ddlProblemClassify.SelectedItem.Text.ToString();
		string getProblemState = tbTaskDetails.Text.Trim().ToString();
		DateTime datetime1 = Convert.ToDateTime(DateTime.Now.ToString("yyyy年MM月dd日 HH时mm分ss秒"));

		string sqlInsert = "insert into tb_SubmitProblem(SP_ProblemName, SP_ProjectName, SP_TaskName, SP_ProblemClassify, SP_ProblemState, SP_DateTime)values('" + getProblemName + "', '" + getProjectName + "', '" + getTaskName + "', '" + getProblemClassify + "', '" + getProblemState + "', '" + datetime1 + "')";
		DBHelper.DBHelper.ExectueNonQuery(sqlInsert);
		Page.ClientScript.RegisterStartupScript(this.GetType(), "ServiceManHistoryButtonClick", "<script>alert('问题提交成功！！！');window.location.href=''</script>");
	}
}