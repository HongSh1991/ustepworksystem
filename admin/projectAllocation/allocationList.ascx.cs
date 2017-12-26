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
			BindData();
		}
	}

	private void BindData()
	{
		string bindProjectName = "select distinct ATPM_ProjectName from tb_AdminToProjMan";
		if(DBHelper.DBHelper.ExecuteDataTable(bindProjectName).Rows.Count > 0)
		{
			ddlProjectName.DataSource = DBHelper.DBHelper.ExecuteDataTable(bindProjectName);
			ddlProjectName.DataTextField = "ATPM_ProjectName";
			ddlProjectName.DataBind();
			ddlProjectName.Items.Insert(0, new ListItem(""));
		}
	}

	protected void btnReset_Click(object sender, EventArgs e)
	{

	}

	protected void gvAllocation_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{

	}

	protected void gvAllocation_RowDataBound(object sender, GridViewRowEventArgs e)
	{

	}

	protected void gvAllocation_RowCommand(object sender, GridViewCommandEventArgs e)
	{

	}
}