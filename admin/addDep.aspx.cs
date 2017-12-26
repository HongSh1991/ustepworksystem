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
			
		}
	}

	protected void btnAddDep_Click(object sender, EventArgs e)
	{
		string getDepName = tbAddDep.Text.Trim().ToString();
		if (getDepName == "")
		{
			Response.Write("<script>alert('部门名称不能为空！！！');</script>");
		}
		else
		{
			string insertInfo = "insert into tb_Department(D_DepartmentName)values('" + getDepName + "')";

			if (DBHelper.DBHelper.ExecuteDataTable("select * from tb_Department").Rows.Count == 0)
			{
				DBHelper.DBHelper.ExectueNonQuery(insertInfo);
				Response.Write("<script>alert('部门名称添加成功！！！');window.close();window.opener.location.href='adminPage.aspx';</script>");
			}
			else if (DBHelper.DBHelper.ExecuteDataTable("select * from tb_Department").Rows.Count > 0)
			{
				string sqlCheckExist = "select * from tb_Department where D_DepartmentName='" + getDepName + "'";
				if (DBHelper.DBHelper.ExecuteDataTable(sqlCheckExist).Rows.Count > 0)
				{
					Response.Write("<script>alert('部门名称已存在！');</script>");
				}
				else
				{
					DBHelper.DBHelper.ExectueNonQuery(insertInfo);
					Response.Write("<script>alert('部门名称添加成功！！！');window.close();window.opener.location.href='adminPage.aspx';</script>");
				}
			}
		}
	}
}