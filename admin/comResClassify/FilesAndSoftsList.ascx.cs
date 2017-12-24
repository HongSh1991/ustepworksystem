using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_comResClassify_FilesAndSoftsList : System.Web.UI.UserControl
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if(!IsPostBack)
		{
			BindFilesData();
			BindSoftsData();
		}
	}

	#region 文档资源分类
	private void BindFilesData()
	{
		string bindFilesData = "select * from tb_FilesClassify";
		gvFilesList.DataSource = DBHelper.DBHelper.ExecuteDataTable(bindFilesData);
		gvFilesList.DataKeyNames = new string[] { "FC_ID" };
		gvFilesList.DataBind();
	}

	protected void gvFilesList_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gvFilesList.PageIndex = e.NewPageIndex;
		BindFilesData();
	}

	protected void gvFilesList_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowIndex != -1)
		{
			//e.Row.Cells[0].Text = (e.Row.RowIndex + 1).ToString();

			//如果使用了分页控件且希望序号在翻页后不重新计算，使用下面方法  
			int indexID = (gvFilesList.PageIndex) * gvFilesList.PageSize + e.Row.RowIndex + 1;
			e.Row.Cells[0].Text = indexID.ToString();
		}

		//如果是绑定数据行 
		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
			{
				ImageButton imgbtn = (ImageButton) e.Row.FindControl("ImageButtonFiles");
				imgbtn.Attributes.Add("onclick", "javascript:return confirm('你确认要删除：\"" + e.Row.Cells[1].Text + "\"吗?')");
			}
		}
	}

	protected void gvFilesList_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		string cmd = e.CommandName;
		if (cmd == "De")
		{
			string deleteRow = "delete from tb_FilesClassify where FC_ClassifyName='" + e.CommandArgument + "'";
			DBHelper.DBHelper.ExectueNonQuery(deleteRow);
			BindFilesData();
		}
	}
	#endregion

	#region 软件资源分类
	private void BindSoftsData()
	{
		string bindSoftsData = "select * from tb_SoftsClassify";
		gvSoftsList.DataSource = DBHelper.DBHelper.ExecuteDataTable(bindSoftsData);
		gvSoftsList.DataKeyNames = new string[] { "SC_ID" };
		gvSoftsList.DataBind();
	}

	protected void gvSoftsList_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gvSoftsList.PageIndex = e.NewPageIndex;
		BindSoftsData();
	}

	protected void gvSoftsList_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowIndex != -1)
		{
			//e.Row.Cells[0].Text = (e.Row.RowIndex + 1).ToString();

			//如果使用了分页控件且希望序号在翻页后不重新计算，使用下面方法  
			int indexID = (gvSoftsList.PageIndex) * gvSoftsList.PageSize + e.Row.RowIndex + 1;
			e.Row.Cells[0].Text = indexID.ToString();
		}

		//如果是绑定数据行 
		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
			{
				ImageButton imgbtn = (ImageButton) e.Row.FindControl("ImageButtonSoft");
				imgbtn.Attributes.Add("onclick", "javascript:return confirm('你确认要删除：\"" + e.Row.Cells[1].Text + "\"吗?')");
			}
		}
	}

	protected void gvSoftsList_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		string cmd = e.CommandName;
		if (cmd == "De")
		{
			string deleteRow = "delete from tb_SoftsClassify where SC_ClassifyName='" + e.CommandArgument + "'";
			DBHelper.DBHelper.ExectueNonQuery(deleteRow);
			BindSoftsData();
		}
	}
	#endregion
}