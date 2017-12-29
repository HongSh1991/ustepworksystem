using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employee_problemDetails : System.Web.UI.Page
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
			BindData();
			BindReplyData();
		}
	}

	private void BindData()
	{
		if(Request.QueryString["problemname"] != null)
		{
			string problemName = Request.QueryString["problemname"].ToString();
			string projectName = DBHelper.DBHelper.ExecuteScalar("select SP_ProjectName from tb_SubmitProblem where SP_ProblemName = '" + problemName + "'").ToString();
			string taskName = DBHelper.DBHelper.ExecuteScalar("select SP_TaskName from tb_SubmitProblem where SP_ProblemName = '" + problemName + "'").ToString();
			string problemDetails = DBHelper.DBHelper.ExecuteScalar("select SP_ProblemState from tb_SubmitProblem where SP_ProblemName = '" + problemName + "'").ToString();

			lbProblemName.Text = problemName;
			lbProjectName.Text = projectName;
			lbTaskName.Text = taskName;
			lbProblemDetails.Text = problemDetails;
		}
	}

	private void BindReplyData()
	{
		string sqlBind = "select * from tb_ProblemReply";
		if(DBHelper.DBHelper.ExecuteDataTable(sqlBind).Rows.Count > 0)
		{
			showDiv.Attributes.Add("style", "display:block;");

			dlReply.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlBind);
			dlReply.DataBind();
		}
	}

	protected void lbtnExitSystem_Click(object sender, EventArgs e)
	{
		Session.Clear();
		Session.Abandon();
		this.Response.Redirect("../login/login.aspx"); // 退出并跳转到登录页
	}

	protected void btnReply_Click(object sender, EventArgs e)
	{
		string reply = tbReply.Text.Trim().ToString();
		DateTime dt = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
		string searChineseName = "select U_ChineseName from tb_UserInfo where U_UserName = '" + Session["UserName"].ToString() + "'";
		string chineseName = DBHelper.DBHelper.ExecuteScalar(searChineseName).ToString();

		string sqlInsert = "insert into tb_ProblemReply(PR_ProblemReply, PR_ReplyTime, PR_ReplyEmployee)values('" + reply + "', '" + dt + "', '" + chineseName + "')";
		DBHelper.DBHelper.ExectueNonQuery(sqlInsert);
		Page.ClientScript.RegisterStartupScript(this.GetType(), "ServiceManHistoryButtonClick", "<script>alert('回复成功！！！');window.location.href=' '</script>");
	}
}