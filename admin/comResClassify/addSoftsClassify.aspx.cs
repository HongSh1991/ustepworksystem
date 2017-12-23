using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_comResClassify_addSoftsClassify : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}

	protected void btnAddSoftsClassify_Click(object sender, EventArgs e)
	{
		string getFilesClassify = tbAddsoftsClassify.Text.Trim().ToString();
		if (getFilesClassify == "")
		{
			Page.ClientScript.RegisterStartupScript(this.GetType(), "ServiceManHistoryButtonClick", "<script>alert('软件分类名称不能为空！！！');</script>");
		}
		else
		{
			string sqlCheckExist = "select * from tb_SoftsClassify where SC_ClassifyName = '" + getFilesClassify + "'";
			if (DBHelper.DBHelper.ExecuteDataTable("select * from tb_SoftsClassify").Rows.Count == 0)
			{
				string sqlInsert = "insert into tb_SoftsClassify(SC_ClassifyName) values('" + getFilesClassify + "')";
				DBHelper.DBHelper.ExectueNonQuery(sqlInsert);
				Page.ClientScript.RegisterStartupScript(this.GetType(), "ServiceManHistoryButtonClick", "<script>alert('软件分类名称添加成功！！！');window.close();window.opener.location.href='/admin/adminPage.aspx';</script>");
			}
			else
			{
				if (DBHelper.DBHelper.ExecuteDataTable(sqlCheckExist).Rows.Count > 0)
				{
					Page.ClientScript.RegisterStartupScript(this.GetType(), "ServiceManHistoryButtonClick", "<script>alert('部门分类名称已存在！！！');</script>");
				}
				else
				{
					string sqlInsert = "insert into tb_SoftsClassify(SC_ClassifyName) values('" + getFilesClassify + "')";
					DBHelper.DBHelper.ExectueNonQuery(sqlInsert);
					Page.ClientScript.RegisterStartupScript(this.GetType(), "ServiceManHistoryButtonClick", "<script>alert('软件分类名称添加成功！！！');window.close();window.opener.location.href='/admin/adminPage.aspx';</script>");
				}
			}
		}
	}
}