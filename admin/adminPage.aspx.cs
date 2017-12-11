using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_adminPage : System.Web.UI.Page
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
			string searDepartment = "select U_Department from tb_UserInfo where U_UserName = '" + Session["UserName"].ToString() + "'";
			string searJob = "select U_Job from tb_UserInfo where U_UserName = '" + Session["UserName"].ToString() + "'";
			string chineseName = DBHelper.DBHelper.ExecuteScalar(searChineseName).ToString();
			string department = DBHelper.DBHelper.ExecuteScalar(searDepartment).ToString();
			string job = DBHelper.DBHelper.ExecuteScalar(searJob).ToString();
			lbChineseName.Text = chineseName;
			lbDepartment.Text = department;
			lbJob.Text = job;
		}
		if(!IsPostBack)
		{
			Bind();
			BindDep();
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

			//绑定部门

			//绑定职务

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
				((LinkButton)e.Row.Cells[7].Controls[0]).Attributes.Add("onclick", "javascript:return confirm('你确认要删除：\"" + e.Row.Cells[1].Text + "\"吗?')");
			}
		}
	}
	protected void gvUser_RowEditing(object sender, GridViewEditEventArgs e)
	{
		gvUser.EditIndex = e.NewEditIndex;
		Bind();
	}

	protected void gvUser_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
	{
		gvUser.EditIndex = -1;
		Bind();
	}

	protected void gvUser_RowDeleting(object sender, GridViewDeleteEventArgs e)
	{
		string deleteRow = "delete from tb_UserInfo where U_ID='" + gvUser.DataKeys[e.RowIndex].Value.ToString() + "'";
		DBHelper.DBHelper.ExectueNonQuery(deleteRow);
		Bind();
	}

	/// <summary>
	/// GridView自带的更新要注意、细心
	/// </summary>
	/// <param name="sender"></param>
	/// <param name="e"></param>
	protected void gvUser_RowUpdating(object sender, GridViewUpdateEventArgs e)
	{
		string updateRow = "update tb_UserInfo set U_UserName='"
			+ ((TextBox)(gvUser.Rows[e.RowIndex].Cells[1].Controls[0])).Text.ToString().Trim() + "', U_ChineseName='"
			+ ((TextBox)(gvUser.Rows[e.RowIndex].Cells[2].Controls[0])).Text.ToString().Trim() + "', U_Department='"
			+ ((TextBox)(gvUser.Rows[e.RowIndex].Cells[3].Controls[0])).Text.ToString().Trim() + "', U_Job='"
			+ ((TextBox)(gvUser.Rows[e.RowIndex].Cells[4].Controls[0])).Text.ToString().Trim() + "', U_Contact='"
			+ ((TextBox)(gvUser.Rows[e.RowIndex].Cells[5].Controls[0])).Text.ToString().Trim() + "' where U_ID= '" + gvUser.DataKeys[e.RowIndex].Value.ToString() + "'";
		DBHelper.DBHelper.ExectueNonQuery(updateRow);
		gvUser.EditIndex = -1;
		Bind();
	}

	protected void gvUser_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gvUser.PageIndex = e.NewPageIndex;
		Bind();
	}
	#endregion

	#region [增删改]部门/职务
	protected void BindDep()
	{
		string bindDepData = "select * from tb_Department";
		gvDepartment.DataSource = DBHelper.DBHelper.ExecuteDataTable(bindDepData);
		gvDepartment.DataKeyNames = new string[] { "D_DepID" };
		gvDepartment.DataBind();
	}

	protected void btnSaveDep_Click(object sender, EventArgs e)
	{
		string checkNull = "select * from tb_Department";
		if (DBHelper.DBHelper.ExecuteDataTable(checkNull).Rows.Count == 0)
		{
			string val = tbAddDepartment.Text.Trim().ToString();
			string insertDep = "insert into tb_Department(D_DepartmentName)values('" + val + "')";
			DBHelper.DBHelper.ExectueNonQuery(insertDep);
			Response.Write("<script>alert('部门名称添加成功！！');window.location=''</script>");
		}
		else if (tbAddDepartment.Text.Trim() == "")
		{
			Response.Write("<script>alert('请填写部门名称！！');window.location=''</script>");
		}
		else
		{
			string checkVal = tbAddDepartment.Text.Trim();
			string compareVal = "select * from tb_Department where D_DepartmentName = '" + checkVal + "'";
			if (DBHelper.DBHelper.ExecuteDataTable(compareVal).Rows.Count > 0)
			{
				Response.Write("<script>alert('部门名称已存在！！');window.location=''</script>");
			}
			else
			{
				string val = tbAddDepartment.Text.Trim().ToString();
				string insertDep = "insert into tb_Department(D_DepartmentName) values('" + val + "')";
				DBHelper.DBHelper.ExectueNonQuery(insertDep);
				Response.Write("<script>alert('部门名称添加成功！！');window.location=''</script>");
			}
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
				((LinkButton)e.Row.Cells[3].Controls[0]).Attributes.Add("onclick", "javascript:return confirm('你确认要删除：\"" + e.Row.Cells[1].Text + "\"吗?')");
			}
		}
	}

	protected void gvDepartment_RowEditing(object sender, GridViewEditEventArgs e)
	{
		gvDepartment.EditIndex = e.NewEditIndex;
		BindDep();
	}

	protected void gvDepartment_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
	{
		gvDepartment.EditIndex = -1;
		BindDep();
	}

	protected void gvDepartment_RowDeleting(object sender, GridViewDeleteEventArgs e)
	{
		string deleteRow = "delete from tb_Department where D_DepID='" + gvDepartment.DataKeys[e.RowIndex].Value.ToString() + "'";
		DBHelper.DBHelper.ExectueNonQuery(deleteRow);
		BindDep();
	}

	protected void gvDepartment_RowUpdating(object sender, GridViewUpdateEventArgs e)
	{
		string updateRow = "update tb_Department set D_DepartmentName='"
			+ ((TextBox)(gvDepartment.Rows[e.RowIndex].Cells[1].Controls[0])).Text.ToString().Trim() + "' where D_DepID= '" + gvDepartment.DataKeys[e.RowIndex].Value.ToString() + "'";
		DBHelper.DBHelper.ExectueNonQuery(updateRow);
		gvDepartment.EditIndex = -1;
		BindDep();
	}

	protected void gvDepartment_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gvDepartment.PageIndex = e.NewPageIndex;
		BindDep();
	}
	#endregion

	#region [删改查]公司文档/软件资源

	#endregion

	#region 新增员工信息
	protected void btnSave_Click(object sender, EventArgs e)
	{
		string userName = tbUserName.Text.Trim().ToString();
		string passWord = tbPassWord.Text.Trim().ToString();
		string chineseName = tbChineseName.Text.Trim().ToString();


	}
	#endregion
}