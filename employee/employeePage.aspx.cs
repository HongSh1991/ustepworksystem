using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
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

	}
}