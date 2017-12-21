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
			BindProjName();
		}
	}

	private void BindProjName()
	{
		string sqlReadData = "select * from tb_ProjectName";
		if(DBHelper.DBHelper.ExecuteDataTable(sqlReadData).Rows.Count >0)
		{
			ddlProjectName.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlReadData);
			ddlProjectName.DataTextField = "P_ProjectName";
			ddlProjectName.DataValueField = "P_ProjID";
			ddlProjectName.DataBind();
			ddlProjectName.Items.Insert(0, new ListItem("----请选择项目名称----"));
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
			string getProjName = ddlProjectName.SelectedItem.Text.Trim().ToString();
			if (ddlProjectName.SelectedIndex == 0)
			{
				Response.Write("<script>alert('请选择项目名称！！！');</script>");
			}
			else
			{
				int projID = Convert.ToInt32(DBHelper.DBHelper.ExecuteScalar("select P_ProjID from tb_ProjectName where P_ProjectName='" + getProjName + "'").ToString());
				string insertInfo = "insert into tb_Department(D_DepartmentName, D_DepartmentProID)values('" + getDepName + "', '" + projID + "')";

				if (DBHelper.DBHelper.ExecuteDataTable("select * from tb_Department").Rows.Count == 0)
				{
					DBHelper.DBHelper.ExectueNonQuery(insertInfo);
					Response.Write("<script>alert('部门名称添加成功！！！');window.close();window.opener.location.href='adminPage.aspx';</script>");
				}
				else if (DBHelper.DBHelper.ExecuteDataTable("select * from tb_Department").Rows.Count > 0)
				{
					string sqlCheckExist = "select * from tb_Department where D_DepartmentName='" + getDepName + "' and D_DepartmentProID='" + projID + "'";
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
}