using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ClassifyOfFiles : System.Web.UI.UserControl
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if(!IsPostBack)
		{
			BindGridView();
			BindFilesClassify();
		}
	}

	private void BindFilesClassify()
	{
		string sqlSearchClassify = "select distinct CF_FilesClassify from tb_ComFiles;";
		if (DBHelper.DBHelper.ExecuteDataTable(sqlSearchClassify).Rows.Count > 0)
		{
			ddlClassifyName.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlSearchClassify);
			ddlClassifyName.DataTextField = "CF_FilesClassify";
			ddlClassifyName.DataBind();
			ddlClassifyName.Items.Insert(0, new ListItem("----请选择分类名称----"));
		}
	}

	protected void ddlClassifyName_SelectedIndexChanged(object sender, EventArgs e)
	{
		string getClassifyName = ddlClassifyName.SelectedItem.Text.ToString();
		string sqlSearch = "select * from tb_ComFiles where CF_FilesClassify='" + getClassifyName + "'";
		gvFilesList.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlSearch);
		gvFilesList.DataBind();
	}

	protected void btnSearch_Click(object sender, EventArgs e)
	{
		string getFilesName = tbFilesName.Text.Trim().ToString();
		string sqlSearch = "select * from tb_ComFIles where CF_FilesName='" + getFilesName + "' and CF_FilesClassify='" + ddlClassifyName.SelectedItem.Text + "'";
		gvFilesList.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlSearch);
		gvFilesList.DataBind();
	}

	protected void btnReset_Click(object sender, EventArgs e)
	{
		tbFilesName.Text = "";
		ddlClassifyName.SelectedIndex = 0;
		BindGridView();
	}

	private void BindGridView()
	{
		string sqlBindData = "select * from tb_ComFiles";
		if(DBHelper.DBHelper.ExecuteDataTable(sqlBindData).Rows.Count > 0)
		{
			gvFilesList.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlBindData);
			gvFilesList.DataKeyNames = new string[] { "CF_ID" };
			gvFilesList.DataBind();
		}
		//string getFilesName = ((System.Web.UI.WebControls.Label) lvFiles.Items[0].FindControl("lbFilesName")).Text.ToString();
		//string sqlSearch = "select * from tb_ComFiles where CF_FilesClassify='" + getFilesName + "'";
		//((GridView) lvFiles.Items[1].FindControl("gvFilesList")).DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlSearch);
		//((GridView) lvFiles.Items[1].FindControl("gvFilesList")).DataKeyNames = new string[] { "CF_FilesClassify" };
		//((GridView) lvFiles.Items[1].FindControl("gvFilesList")).DataBind();
	}

	protected void gvFilesList_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gvFilesList.PageIndex = e.NewPageIndex;
		BindGridView();
	}

	protected void gvFilesList_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		//显示每条记录前的数据
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
				ImageButton imgbtn = (ImageButton) e.Row.FindControl("ImageButton2");
				imgbtn.Attributes.Add("onclick", "javascript:return confirm('你确认要删除：\"" + e.Row.Cells[1].Text + "\"吗?')");
			}
		}
	}

	protected void gvFilesList_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		string cmd = e.CommandName;

		if (cmd == "De")
		{
			string deleteRow = "delete from tb_ComFiles where CF_FilesName='" + e.CommandArgument + "'";
			DBHelper.DBHelper.ExectueNonQuery(deleteRow);
			BindGridView();
		}
		else if (cmd == "Ed")
		{
			Response.Write("<script>window.open('addMaterials.aspx?filesname=" + e.CommandArgument + "','','width=460,height=240,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no').moveTo((window.screen.availWidth-10-460)/2, (window.screen.availHeight-30-240)/2);</script>");
		}
		else if(cmd == "Dl")
		{
			Response.Write("<script>window.open('/downLoadFiles.aspx?filesname=" + e.CommandArgument + "','','width=460,height=240,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no').moveTo((window.screen.availWidth-10-460)/2, (window.screen.availHeight-30-240)/2);</script>");
		}
	}
}