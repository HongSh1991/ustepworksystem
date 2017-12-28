using System;
using System.Web.UI.WebControls;

public partial class employee_employeeDefault : System.Web.UI.Page
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

		if (!IsPostBack)
		{
			BindGrid();
		}
	}

	protected void lbtnExitSystem_Click(object sender, EventArgs e)
	{
		Session.Clear();
		Session.Abandon();
		this.Response.Redirect("../login/login.aspx"); // 退出并跳转到登录页
	}

	private void BindGrid()
	{
		if(Session["UserName"] != null)
		{
			string getChineseName = DBHelper.DBHelper.ExecuteScalar("select U_ChineseName from tb_UserInfo where U_UserName = '" + Session["UserName"].ToString() + "'").ToString();
			string sqlSearch = "select * from tb_ProjectManage where PM_UserName = '" + getChineseName + "'";
			gvTaskList.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlSearch);
			gvTaskList.DataKeyNames = new string[] { "PM_ID" };
			gvTaskList.DataBind();
		}
	}

	protected void gvTaskList_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gvTaskList.PageIndex = e.NewPageIndex;
		BindGrid();
	}

	protected void gvTaskList_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowIndex != -1)
		{
			//如果使用了分页控件且希望序号在翻页后不重新计算，使用下面方法  
			int indexID = (gvTaskList.PageIndex) * gvTaskList.PageSize + e.Row.RowIndex + 1;
			e.Row.Cells[0].Text = indexID.ToString();
		}

		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
			{
				Label lb1 = (Label)e.Row.FindControl("lbtasklist");
				Label lb2 = (Label) e.Row.FindControl("lbfont");
				string taskName = lb1.Text.Trim().ToString();
				if (taskName != "")
				{
					string sqlSearch1 = "select PM_TaskRate from tb_ProjectManage where PM_TaskName = '" + taskName + "'";
					int RateID = Convert.ToInt32(DBHelper.DBHelper.ExecuteScalar(sqlSearch1).ToString());
					switch (RateID)
					{
						case 1:
							lb2.Text = "&#xe658;";
							break;
						case 2:
							lb2.Text = "&#xe658;&#xe658;";
							break;
						case 3:
							lb2.Text = "&#xe658;&#xe658;&#xe658;";
							break;
						default:
							return;
					}
				}
			}
		}
	}
}