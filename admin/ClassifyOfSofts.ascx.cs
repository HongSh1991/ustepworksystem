using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ClassifyOfSofts : System.Web.UI.UserControl
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if(!IsPostBack)
		{
			BindSoftsClassify();
			BindGridView();
		}
	}

	private void BindSoftsClassify()
	{
		string sqlSearchClassify = "select distinct CS_SoftClassify from tb_ComSoftWare;";
		if (DBHelper.DBHelper.ExecuteDataTable(sqlSearchClassify).Rows.Count > 0)
		{
			ddlClassifyName.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlSearchClassify);
			ddlClassifyName.DataTextField = "CS_SoftClassify";
			ddlClassifyName.DataBind();
			ddlClassifyName.Items.Insert(0, new ListItem("----请选择分类名称----"));
		}
	}

	protected void ddlClassifyName_SelectedIndexChanged(object sender, EventArgs e)
	{
		string getClassifyName = ddlClassifyName.SelectedItem.Text.ToString();
		string sqlSearch = "select * from tb_ComSoftWare where CS_SoftClassify='" + getClassifyName + "'";
		gvSoftsList.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlSearch);
		gvSoftsList.DataBind();
	}

	protected void btnSearch_Click(object sender, EventArgs e)
	{
		string getFilesName = tbSoftsName.Text.Trim().ToString();
		string sqlSearch = "select * from tb_ComSoftWare where CS_SoftName like '%" + getFilesName + "%' and CS_SoftClassify like '%" + ddlClassifyName.SelectedItem.Text + "%'";
		gvSoftsList.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlSearch);
		gvSoftsList.DataBind();
	}

	protected void btnReset_Click(object sender, EventArgs e)
	{
		tbSoftsName.Text = "";
		ddlClassifyName.SelectedIndex = 0;
		BindGridView();
	}

	private void BindGridView()
	{
		string sqlBindData = "select * from tb_ComSoftWare";
		if (DBHelper.DBHelper.ExecuteDataTable(sqlBindData).Rows.Count > 0)
		{
			gvSoftsList.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlBindData);
			gvSoftsList.DataKeyNames = new string[] { "CS_ID" };
			gvSoftsList.DataBind();
		}
	}

	protected void gvSoftsList_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gvSoftsList.PageIndex = e.NewPageIndex;
		BindGridView();
	}

	protected void gvSoftsList_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		//显示每条记录前的数据
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
				ImageButton imgbtn = (ImageButton) e.Row.FindControl("ImageButton2");
				imgbtn.Attributes.Add("onclick", "javascript:return confirm('你确认要删除：\"" + e.Row.Cells[1].Text + "\"吗?')");
			}
		}
	}

	protected void gvSoftsList_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		string cmd = e.CommandName;

		if (cmd == "De")
		{
			string deleteRow = "delete from tb_ComSoftWare where CS_SoftName='" + e.CommandArgument + "'";
			DBHelper.DBHelper.ExectueNonQuery(deleteRow);
			BindGridView();
		}
		else if (cmd == "Ed")
		{
			Response.Write("<script>window.open('modifySoftWares.aspx?softsname=" + e.CommandArgument + "','','width=460,height=240,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no').moveTo((window.screen.availWidth-10-460)/2, (window.screen.availHeight-30-240)/2);</script>");
		}
		else if (cmd == "Dl")
		{
			Response.Write("<script>window.open('/downLoadFiles.aspx?softsname=" + e.CommandArgument + "','','width=460,height=240,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no').moveTo((window.screen.availWidth-10-460)/2, (window.screen.availHeight-30-240)/2);</script>");
		}
	}
}