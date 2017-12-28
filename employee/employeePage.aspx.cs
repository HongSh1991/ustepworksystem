using System;
using System.Web.UI.WebControls;

public partial class employee_employeePage : System.Web.UI.Page
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
			BindData1();
			BindTaskStatus();
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
		if (Session["UserName"] != null)
		{
			string getChineseName = DBHelper.DBHelper.ExecuteScalar("select U_ChineseName from tb_UserInfo where U_UserName = '" + Session["UserName"].ToString() + "'").ToString();
			string sqlBind = "select * from tb_AdminToProjMan where ATPM_ChargeUserName = '" + getChineseName + "'";
			gvProjectList.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlBind);
			//gvProjectList.DataKeyNames = new string[] { "ATPM_ChargeUserName" };
			gvProjectList.DataBind();
		}
	}

	private void BindData1()
	{
		if (Session["UserName"] != null)
		{
			string getChineseName = DBHelper.DBHelper.ExecuteScalar("select U_ChineseName from tb_UserInfo where U_UserName = '" + Session["UserName"].ToString() + "'").ToString();
			string sqlBind = "select * from tb_ProjectManage where PM_AttenderName = '" + getChineseName + "'";
			gvAttendList.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlBind);
			//gvAttendList.DataKeyNames = new string[] { "PM_AttenderName" };
			gvAttendList.DataBind();
		}
	}

	protected void gvProjectList_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gvProjectList.PageIndex = e.NewPageIndex;
		BindData();
	}

	protected void gvProjectList_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowIndex != -1)
		{
			//如果使用了分页控件且希望序号在翻页后不重新计算，使用下面方法  
			int indexID = (gvProjectList.PageIndex) * gvProjectList.PageSize + e.Row.RowIndex + 1;
			e.Row.Cells[0].Text = indexID.ToString();
		}
	}

	protected void gvProjectList_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		string cmd = e.CommandName;

		if(cmd == "View")
		{

		}
		else if(cmd == "DownLoad")
		{
			Response.Write("<script>window.open('/downLoadFiles.aspx?allocatedFilesName=" + e.CommandArgument + "','','width=460,height=240,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no').moveTo((window.screen.availWidth-10-460)/2, (window.screen.availHeight-30-240)/2);</script>");
		}
	}

	protected void gvAttendList_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gvAttendList.PageIndex = e.NewPageIndex;
		BindData1();
	}

	protected void gvAttendList_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowIndex != -1)
		{
			//如果使用了分页控件且希望序号在翻页后不重新计算，使用下面方法  
			int indexID = (gvAttendList.PageIndex) * gvAttendList.PageSize + e.Row.RowIndex + 1;
			e.Row.Cells[0].Text = indexID.ToString();
		}
	}

	protected void gvAttendList_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		string cmd = e.CommandName;

		if (cmd == "View")
		{

		}
		else if (cmd == "DownLoad")
		{
			Response.Write("<script>window.open('/downLoadFiles.aspx?attendFilesName=" + e.CommandArgument + "','','width=460,height=240,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no').moveTo((window.screen.availWidth-10-460)/2, (window.screen.availHeight-30-240)/2);</script>");
		}
	}

	private void BindTaskStatus()
	{
		if (Session["UserName"] != null)
		{
			string searChineseName = "select U_ChineseName from tb_UserInfo where U_UserName = '" + Session["UserName"].ToString() + "'";
			string chineseName = DBHelper.DBHelper.ExecuteScalar(searChineseName).ToString();

			if(DBHelper.DBHelper.ExecuteDataTable("select * from tb_TaskStatus").Rows.Count > 0)
			{
				string sqlBindStatus = "select * from tb_TaskStatus where TS_TaskEmployee='" + chineseName + "'";
				gvTaskStatus.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlBindStatus);
				gvTaskStatus.DataKeyNames = new string[] { "TS_TaskEmployee" };
				gvTaskStatus.DataBind();
			}
		}
	}

	protected void gvTaskStatus_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gvTaskStatus.PageIndex = e.NewPageIndex;
		BindTaskStatus();
	}

	protected void gvTaskStatus_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowIndex != -1)
		{
			//如果使用了分页控件且希望序号在翻页后不重新计算，使用下面方法  
			int indexID = (gvTaskStatus.PageIndex) * gvTaskStatus.PageSize + e.Row.RowIndex + 1;
			e.Row.Cells[0].Text = indexID.ToString();
		}
	}
}