using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employee_projectChargerCheck : System.Web.UI.Page
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
			BindApprovalData();
		}
	}

	protected void lbtnExitSystem_Click(object sender, EventArgs e)
	{
		Session.Clear();
		Session.Abandon();
		this.Response.Redirect("../login/login.aspx"); // 退出并跳转到登录页
	}

	private void BindApprovalData()
	{
		if (Session["UserName"] != null)
		{
			string searChineseName = "select U_ChineseName from tb_UserInfo where U_UserName = '" + Session["UserName"].ToString() + "'";
			string chineseName = DBHelper.DBHelper.ExecuteScalar(searChineseName).ToString();

			string sqlBind = "select * from tb_ProjectManage a, tb_TaskStatus b where a.PM_TaskName = b.TS_TaskName and a.PM_UserName= '" + chineseName + "' and b.TS_TaskStatusNow = '" + "待审批" + "'";
			if (DBHelper.DBHelper.ExecuteDataTable(sqlBind).Rows.Count > 0)
			{
				gvApprovalList.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlBind);
				gvApprovalList.DataBind();
			}
		}
	}

	protected void gvApprovalList_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gvApprovalList.PageIndex = e.NewPageIndex;
		BindApprovalData();
	}

	protected void gvApprovalList_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowIndex != -1)
		{
			//如果使用了分页控件且希望序号在翻页后不重新计算，使用下面方法  
			int indexID = (gvApprovalList.PageIndex) * gvApprovalList.PageSize + e.Row.RowIndex + 1;
			e.Row.Cells[0].Text = indexID.ToString();
		}
	}

	protected void gvApprovalList_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		string cmd = e.CommandName;
		if(cmd == "Approval")
		{
			Response.Write("<script>window.open('approvalDialog.aspx','','width=640,height=560,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no').moveTo((window.screen.availWidth-10-640)/2, (window.screen.availHeight-30-560)/2);</script>");
		}
	}
}