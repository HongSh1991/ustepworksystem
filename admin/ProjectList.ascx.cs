using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ProjectList : System.Web.UI.UserControl
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if(!IsPostBack)
		{
			BindProj();
		}
	}

	private void BindProj()
	{
		string bindProjectData = "select * from tb_ProjectName";
		gvPeojectInfo.DataSource = DBHelper.DBHelper.ExecuteDataTable(bindProjectData);
		gvPeojectInfo.DataKeyNames = new string[] { "P_ProjID" };
		gvPeojectInfo.DataBind();
	}

	protected void gvPeojectInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gvPeojectInfo.PageIndex = e.NewPageIndex;
		BindProj();
	}

	protected void gvPeojectInfo_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowIndex != -1)
		{
			//e.Row.Cells[0].Text = (e.Row.RowIndex + 1).ToString();

			//如果使用了分页控件且希望序号在翻页后不重新计算，使用下面方法  
			int indexID = (gvPeojectInfo.PageIndex) * gvPeojectInfo.PageSize + e.Row.RowIndex + 1;
			e.Row.Cells[0].Text = indexID.ToString();
		}

		//如果是绑定数据行 
		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
			{
				ImageButton imgbtn = (ImageButton) e.Row.FindControl("ImageButton2");
				imgbtn.Attributes.Add("onclick", "javascript:return confirm('你确认要删除吗?')");
			}
		}
	}

	protected void gvPeojectInfo_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		string cmd = e.CommandName;

		if (cmd == "De")
		{
			string deleteRow = "delete from tb_ProjectName where P_ProjectName='" + e.CommandArgument + "'";
			DBHelper.DBHelper.ExectueNonQuery(deleteRow);
			BindProj();
		}
		else if (cmd == "Ed")
		{
			Response.Write("<script>window.open('modifyProj.aspx?projectname=" + e.CommandArgument + "','','width=460,height=200,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no').moveTo((window.screen.availWidth-10-460)/2, (window.screen.availHeight-30-200)/2);</script>");
		}
	}

	protected void btnSearchProj_Click(object sender, EventArgs e)
	{
		string getProjName = tbSearchProject.Text.Trim().ToString();
		string sqlSearch = "select * from tb_ProjectName where P_ProjectName like'%" + getProjName + "%'";
		if (DBHelper.DBHelper.ExecuteDataTable(sqlSearch).Rows.Count == 0)
		{
			//Page.RegisterStartupScript("ServiceManHistoryButtonClick","<script>alert('部门名称不存在！！！');</script>"); //已经过时
			Page.ClientScript.RegisterStartupScript(this.GetType(), "ServiceManHistoryButtonClick", "<script>alert('项目名称不存在！！！');</script>");
			BindProj();
			tbSearchProject.Text = "";
		}
		else
		{
			gvPeojectInfo.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlSearch);
			gvPeojectInfo.DataKeyNames = new string[] { "P_ProjID" };
			gvPeojectInfo.DataBind();
		}
	}

	protected void btnReset_Click(object sender, EventArgs e)
	{
		tbSearchProject.Text = "";
		BindProj();
	}
}