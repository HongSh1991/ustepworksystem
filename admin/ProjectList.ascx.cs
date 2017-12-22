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
				imgbtn.Attributes.Add("onclick", "javascript:return confirm('你确认要删除：\"" + e.Row.Cells[1].Text + "\"吗?')");
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
			Response.Write("<script>window.open('modifyProj.aspx?departmentname=" + e.CommandArgument + "','','width=460,height=200,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no').moveTo((1920-660)/2, (1080-500)/2);</script>");
		}
		else if(cmd == "Dl")
		{

		}
	}

	protected void btnSearchProj_Click(object sender, EventArgs e)
	{

	}
}