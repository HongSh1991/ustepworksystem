using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Department : System.Web.UI.UserControl
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			BindDep();
		}
	}

	#region [删改查]部门/职务
	protected void BindDep()
	{
		string bindDepData = "select * from tb_Department";
		gvDepartment.DataSource = DBHelper.DBHelper.ExecuteDataTable(bindDepData);
		gvDepartment.DataKeyNames = new string[] { "D_DepID" };
		gvDepartment.DataBind();
	}

	protected void btnSearchDep_Click(object sender, EventArgs e)
	{
		string getDepName = tbSearchDepartment.Text.Trim().ToString();
		string sqlSearch = "select * from tb_Department where D_DepartmentName='" + getDepName + "'";
		if(DBHelper.DBHelper.ExecuteDataTable(sqlSearch).Rows.Count == 0)
		{
			//Page.RegisterStartupScript("ServiceManHistoryButtonClick","<script>alert('部门名称不存在！！！');</script>"); //已经过时
			Page.ClientScript.RegisterStartupScript(this.GetType(), "ServiceManHistoryButtonClick", "<script>alert('部门名称不存在！！！');</script>");
			BindDep();
			tbSearchDepartment.Text = "";
		}
		else
		{
			gvDepartment.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlSearch);
			gvDepartment.DataKeyNames = new string[] { "D_DepID" };
			gvDepartment.DataBind();
		}
	}

	protected void gvDepartment_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowIndex != -1)
		{
			//e.Row.Cells[0].Text = (e.Row.RowIndex + 1).ToString();

			//如果使用了分页控件且希望序号在翻页后不重新计算，使用下面方法  
			int indexID = (gvDepartment.PageIndex) * gvDepartment.PageSize + e.Row.RowIndex + 1;
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

	protected void gvDepartment_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gvDepartment.PageIndex = e.NewPageIndex;
		BindDep();
	}
	#endregion

	protected void gvDepartment_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		string cmd = e.CommandName;

		if (cmd == "De")
		{
			string deleteRow = "delete from tb_Department where D_DepartmentName='" + e.CommandArgument + "'";
			DBHelper.DBHelper.ExectueNonQuery(deleteRow);
			BindDep();
		}
		else if (cmd == "Ed")
		{
			Response.Write("<script>window.open('modifyDep.aspx?departmentname=" + e.CommandArgument + "','','width=460,height=200,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no').moveTo((1920-660)/2, (1080-500)/2);</script>");
		}
	}
}