using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employee_problemList : System.Web.UI.Page
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
			string sqlBind = "select * from tb_SubmitProblem";
			gvProblemList.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlBind);
			gvProblemList.DataKeyNames = new string[] { "SP_ID" };
			gvProblemList.DataBind();
		}
	}

	protected void gvProblemList_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gvProblemList.PageIndex = e.NewPageIndex;
		BindData();
	}

	protected void gvProblemList_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowIndex != -1)
		{
			//如果使用了分页控件且希望序号在翻页后不重新计算，使用下面方法  
			int indexID = (gvProblemList.PageIndex) * gvProblemList.PageSize + e.Row.RowIndex + 1;
			e.Row.Cells[0].Text = indexID.ToString();
		}
	}
}