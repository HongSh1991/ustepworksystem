using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class projectmanager_projManagerPage : System.Web.UI.Page
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
			BindData();
		}
	}

	protected void lbtnExitSystem_Click(object sender, EventArgs e)
	{
		Session.Clear();
		Session.Abandon();
		this.Response.Redirect("../login/login.aspx"); // 退出并跳转到登录页
	}

	private void BindData()
	{
		string sqlBind = "select * from tb_UserInfo where U_UserName = '" + Session["UserName"].ToString() + "'";
		gvProjectList.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlBind);
		gvProjectList.DataKeyNames = new string[] { "U_UserName" };
		gvProjectList.DataBind();
	}

	protected void gvProjectList_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{

	}

	protected void gvProjectList_RowDataBound(object sender, GridViewRowEventArgs e)
	{

	}

	protected void gvProjectList_RowCommand(object sender, GridViewCommandEventArgs e)
	{

	}
}