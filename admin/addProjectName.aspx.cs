using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_addProjectName : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}

	protected void btnSave_Click(object sender, EventArgs e)
	{
		string getProjName = tbProjectName.Text.Trim().ToString();
		if (getProjName == "")
		{
			Response.Write("<script>alert('项目名称不能为空！！！');</script>");
		}
		else
		{
			string sqlCheckNull = "select * from tb_ProjectName";
			if (DBHelper.DBHelper.ExecuteDataTable(sqlCheckNull).Rows.Count == 0)
			{
				string sqlInsert = "insert into tb_ProjectName(P_ProjectName) values('" + getProjName + "')";
				DBHelper.DBHelper.ExectueNonQuery(sqlInsert);
				Response.Write("<script>alert('项目名称添加成功！！！');window.close();window.opener.location.href='adminPage.aspx';</script>");
			}
			else if (DBHelper.DBHelper.ExecuteDataTable(sqlCheckNull).Rows.Count > 0)
			{
				string sqlCheckExist = "select * from tb_ProjectName where P_ProjectName='" + getProjName + "'";
				if (DBHelper.DBHelper.ExecuteDataTable(sqlCheckExist).Rows.Count > 0)
				{
					Response.Write("<script>alert('项目名称已存在！！！');</script>");
				}
				else
				{
					string sqlInsert = "insert into tb_ProjectName(P_ProjectName) values('" + getProjName + "')";
					DBHelper.DBHelper.ExectueNonQuery(sqlInsert);
					Response.Write("<script>alert('项目名称添加成功！！！');window.close();window.opener.location.href='adminPage.aspx';</script>");
				}
			}
		}
	}
}