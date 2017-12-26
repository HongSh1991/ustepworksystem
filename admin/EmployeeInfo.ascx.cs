using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_EmployeeInfo : System.Web.UI.UserControl
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			Bind();
		}
	}

	#region [删改查]员工信息
	protected void Bind()
	{
		string searchUserInfo = "select * from tb_UserInfo";
		if (DBHelper.DBHelper.ExecuteDataTable(searchUserInfo).Rows.Count > 0)
		{
			gvUser.DataSource = DBHelper.DBHelper.ExecuteDataTable(searchUserInfo);
			gvUser.DataKeyNames = new string[] { "U_ID" };
			gvUser.DataBind();

			//绑定项目
			//string bindDDLPro = "select distinct U_ProjectName from tb_UserInfo";
			//if (DBHelper.DBHelper.ExecuteDataTable(bindDDLPro).Rows.Count > 0)
			//{
			//	ddlProjectName.DataSource = DBHelper.DBHelper.ExecuteDataTable(bindDDLPro);
			//	ddlProjectName.DataTextField = "U_ProjectName";
			//	//ddlProjectName.DataValueField = "U_ID";
			//	ddlProjectName.DataBind();
			//	ddlProjectName.Items.Insert(0, new ListItem("----请选择项目名称----"));
			//}

			//绑定部门
			string bindDDLDep = "select distinct U_Department from tb_UserInfo";
			if (DBHelper.DBHelper.ExecuteDataTable(bindDDLDep).Rows.Count > 0)
			{
				ddlDepartment.DataSource = DBHelper.DBHelper.ExecuteDataTable(bindDDLDep);
				ddlDepartment.DataTextField = "U_Department";
				//ddlDepartment.DataValueField = "U_ID";
				ddlDepartment.DataBind();
				ddlDepartment.Items.Insert(0, new ListItem("----请选择部门名称----"));
			}
		}
	}



	protected void gvUser_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		//显示每条记录前的数据
		if (e.Row.RowIndex != -1)
		{
			//e.Row.Cells[0].Text = (e.Row.RowIndex + 1).ToString();

			//如果使用了分页控件且希望序号在翻页后不重新计算，使用下面方法  
			int indexID = (gvUser.PageIndex) * gvUser.PageSize + e.Row.RowIndex + 1;
			e.Row.Cells[0].Text = indexID.ToString();
		}

		//如果是绑定数据行 
		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
			{
				ImageButton imgbtn = (ImageButton) e.Row.FindControl("ImageButton2");
				imgbtn.Attributes.Add("onclick", "javascript:return confirm('你确认要删除：\"" + e.Row.Cells[1].Text + "\"吗?')");
				//((LinkButton) e.Row.Cells[7].Controls[0]).Attributes.Add("onclick", "javascript:return confirm('你确认要删除：\"" + e.Row.Cells[1].Text + "\"吗?')");
			}
		}
	}

	#region 编辑/删除
	//protected void gvUser_RowEditing(object sender, GridViewEditEventArgs e)
	//{
	//	gvUser.EditIndex = e.NewEditIndex;
	//	Bind();
	//}

	//protected void gvUser_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
	//{
	//	gvUser.EditIndex = -1;
	//	Bind();
	//}

	//protected void gvUser_RowDeleting(object sender, GridViewDeleteEventArgs e)
	//{
	//	string deleteRow = "delete from tb_UserInfo where U_ID='" + gvUser.DataKeys[e.RowIndex].Value.ToString() + "'";
	//	DBHelper.DBHelper.ExectueNonQuery(deleteRow);
	//	Bind();
	//}

	///// <summary>
	///// GridView自带的更新要注意、细心
	///// </summary>
	///// <param name="sender"></param>
	///// <param name="e"></param>
	//protected void gvUser_RowUpdating(object sender, GridViewUpdateEventArgs e)
	//{
	//	string updateRow = "update tb_UserInfo set U_UserName='"
	//		+ ((TextBox)(gvUser.Rows[e.RowIndex].Cells[1].Controls[0])).Text.ToString().Trim() + "', U_ChineseName='"
	//		+ ((TextBox)(gvUser.Rows[e.RowIndex].Cells[2].Controls[0])).Text.ToString().Trim() + "', U_Department='"
	//		+ ((TextBox)(gvUser.Rows[e.RowIndex].Cells[3].Controls[0])).Text.ToString().Trim() + "', U_ProjectName='"
	//		+ ((TextBox)(gvUser.Rows[e.RowIndex].Cells[4].Controls[0])).Text.ToString().Trim() + "', U_Contact='"
	//		+ ((TextBox)(gvUser.Rows[e.RowIndex].Cells[5].Controls[0])).Text.ToString().Trim() + "' where U_ID= '" + gvUser.DataKeys[e.RowIndex].Value.ToString() + "'";
	//	DBHelper.DBHelper.ExectueNonQuery(updateRow);
	//	gvUser.EditIndex = -1;
	//	Bind();
	//}
	#endregion

	protected void gvUser_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gvUser.PageIndex = e.NewPageIndex;
		Bind();
	}
	#endregion

	protected void btnSearch_Click(object sender, EventArgs e)
	{
		string getName = tbSearchUserName.Text.ToString();
		string proName = ddlDepartment.SelectedItem.Text.ToString();
		if(ddlDepartment.SelectedIndex == 0)
		{
			Page.ClientScript.RegisterStartupScript(this.GetType(), "ServiceManHistoryButtonClick", "<script>alert('请选择部门名称！！！');</script>");
		}
		else
		{
			string depName = ddlDepartment.SelectedItem.Text.ToString();
			string sqlSearch = "select * from tb_UserInfo where U_UserName = '" + getName + "' and U_Department = '" + depName + "'";

			if (DBHelper.DBHelper.ExecuteDataTable(sqlSearch).Rows.Count != 0)
			{
				gvUser.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlSearch);
				gvUser.DataKeyNames = new string[] { "U_ID" };
				gvUser.DataBind();
			}
			else
			{
				Page.ClientScript.RegisterStartupScript(this.GetType(), "ServiceManHistoryButtonClick", "<script>alert('没有该用户！！！');</script>");
				//Response.Write("<script>alert('没有该用户！！！');</script>");
			}
		}
	}

	/// <summary>
	/// 重置查询信息
	/// </summary>
	/// <param name="sender"></param>
	/// <param name="e"></param>
	protected void btnReset_Click(object sender, EventArgs e)
	{
		Bind();
		tbSearchUserName.Text = "";
		ddlDepartment.SelectedIndex = 0;
	}

	/// <summary>
	/// 根据选择的部门名称查询员工信息
	/// </summary>
	/// <param name="sender"></param>
	/// <param name="e"></param>
	protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
	{
		string depName = ddlDepartment.SelectedItem.Text.ToString();
		string sqlSearch = "select * from tb_UserInfo where U_Department = '" + depName + "'";

		if (DBHelper.DBHelper.ExecuteDataTable(sqlSearch).Rows.Count != 0)
		{
			gvUser.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlSearch);
			gvUser.DataKeyNames = new string[] { "U_ID" };
			gvUser.DataBind();
		}
		else
		{
			Response.Write("<script>alert('没有该部门员工！！！');</script>");
		}
	}

	/// <summary>
	/// 项目名称联动部门名称
	/// </summary>
	/// <param name="sender"></param>
	/// <param name="e"></param>
	//protected void ddlProjectName_SelectedIndexChanged(object sender, EventArgs e)
	//{
	//	string proName = ddlProjectName.SelectedItem.Text.ToString();
	//	int projID = Convert.ToInt32(DBHelper.DBHelper.ExecuteScalar("select P_ProjID from tb_ProjectName where P_ProjectName='" + proName +"'"));
	//	string sqlBindDep = "select D_DepartmentName from tb_Department where D_DepartmentProID='" + projID + "'";
	//	ddlDepartment.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlBindDep);
	//	ddlDepartment.DataTextField = "D_DepartmentName";
	//	ddlDepartment.DataBind();
	//	//string depName = ddlDepartment.SelectedItem.Text.ToString();
	//	//string sqlSearch = "select * from tb_UserInfo where U_Department = '" + depName + "' and U_ProjectName = '" + proName + "'";
	//	//if (DBHelper.DBHelper.ExecuteDataTable(sqlSearch).Rows.Count != 0)
	//	//{
	//	//	gvUser.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlSearch);
	//	//	gvUser.DataKeyNames = new string[] { "U_ID" };
	//	//	gvUser.DataBind();
	//	//}
	//	//else
	//	//{
	//	//	Response.Write("<script>alert('没有该项目对应的员工！！！');</script>");
	//	//}
	//}

	protected void gvUser_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		string cmd = e.CommandName;

		if(cmd == "De")
		{
			string deleteRow = "delete from tb_UserInfo where U_UserName='" + e.CommandArgument + "'";
			DBHelper.DBHelper.ExectueNonQuery(deleteRow);
			Bind();
		}
		else if(cmd == "Ed")
		{
			Response.Write("<script>window.open('modifyUserInfo.aspx?username=" + e.CommandArgument + "','','width=460,height=420,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no').moveTo((window.screen.availWidth-10-460)/2, (window.screen.availHeight-30-420)/2);</script>");
		}
	}
}