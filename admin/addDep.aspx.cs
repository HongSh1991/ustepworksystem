using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_addDep : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if(!IsPostBack)
		{
			BindDep();
		}
	}

	protected void btnAddDep_Click(object sender, EventArgs e)
	{
		string depName = tbAddDep.Text.Trim();
		string insertInfo = "insert into tb_Department(D_DepartmentName)values('" + depName + "')";
		if(DBHelper.DBHelper.ExecuteDataTable("select * from tb_Department").Rows.Count > 0)
		{
			Response.Write("<script>alert('部门名称已存在！'); window.location='';</script>");
		}
		else if(DBHelper.DBHelper.ExecuteDataTable("select * from tb_Department").Rows.Count == 0)
		{
			DBHelper.DBHelper.ExectueNonQuery(insertInfo);
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

	protected void BindPost()
	{

	}
	#endregion
}