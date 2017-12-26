using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_projectAllocation_allocationList : System.Web.UI.UserControl
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if(!IsPostBack)
		{
			BindDDLData();
			BindGrid();
		}
	}

	private void BindDDLData()
	{
		string bindProjectName = "select distinct ATPM_ProjectName from tb_AdminToProjMan";
		if(DBHelper.DBHelper.ExecuteDataTable(bindProjectName).Rows.Count > 0)
		{
			ddlProjectName.DataSource = DBHelper.DBHelper.ExecuteDataTable(bindProjectName);
			ddlProjectName.DataTextField = "ATPM_ProjectName";
			ddlProjectName.DataBind();
			ddlProjectName.Items.Insert(0, new ListItem("----请选择项目名称----"));

			
		}

		string bindProjectCharge = "select distinct ATPM_ChargeUserName from tb_AdminToProjMan";
		if (DBHelper.DBHelper.ExecuteDataTable(bindProjectCharge).Rows.Count > 0)
		{
			ddlProjectCharge.DataSource = DBHelper.DBHelper.ExecuteDataTable(bindProjectCharge);
			ddlProjectCharge.DataTextField = "ATPM_ChargeUserName";
			ddlProjectCharge.DataBind();
			ddlProjectCharge.Items.Insert(0, new ListItem("----请选择项目名称----"));
		}
	}

	private void BindGrid()
	{
		string sqlBind = "select * from tb_AdminToProjMan";
		if(DBHelper.DBHelper.ExecuteDataTable(sqlBind).Rows.Count > 0)
		{
			gvAllocation.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlBind);
			gvAllocation.DataKeyNames = new string[] { "ATPM_ID" };
			gvAllocation.DataBind();
		}
	}

	protected void gvAllocation_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gvAllocation.PageIndex = e.NewPageIndex;
		BindGrid();
	}

	protected void gvAllocation_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowIndex != -1)
		{
			//e.Row.Cells[0].Text = (e.Row.RowIndex + 1).ToString();

			//如果使用了分页控件且希望序号在翻页后不重新计算，使用下面方法  
			int indexID = (gvAllocation.PageIndex) * gvAllocation.PageSize + e.Row.RowIndex + 1;
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

	protected void gvAllocation_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		string cmd = e.CommandName;

		if (cmd == "De")
		{
			string deleteRow = "delete from tb_AdminToProjMan where ATPM_ProjectName='" + e.CommandArgument + "'";
			DBHelper.DBHelper.ExectueNonQuery(deleteRow);
			BindGrid();
		}
		else if (cmd == "Ed")
		{
			Response.Write("<script>window.open('/admin/projectAllocation/modifyAllocation.aspx?allocationname=" + e.CommandArgument + "','','width=640,height=420,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no').moveTo((window.screen.availWidth-10-640)/2, (window.screen.availHeight-30-420)/2);</script>");
		}
	}

	protected void ddlProjectName_SelectedIndexChanged(object sender, EventArgs e)
	{
		string getProjectName = ddlProjectName.SelectedItem.Text.ToString();
		string sqlSearch = "select * from tb_AdminToProjMan where ATPM_ProjectName='" + getProjectName + "'";
		gvAllocation.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlSearch);
		gvAllocation.DataBind();
		if(ddlProjectName.SelectedIndex == 0)
		{
			BindGrid();
		}
	}

	protected void ddlProjectCharge_SelectedIndexChanged(object sender, EventArgs e)
	{
		string getChargeUserName = ddlProjectCharge.SelectedItem.Text.ToString();
		string sqlSearch = "select * from tb_AdminToProjMan where ATPM_ChargeUserName='" + getChargeUserName + "'";
		gvAllocation.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlSearch);
		gvAllocation.DataBind();
		if (ddlProjectCharge.SelectedIndex == 0)
		{
			BindGrid();
		}
	}
}