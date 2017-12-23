using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_comResClassify_addFilesClassify : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}

	protected void btnAddFilesClassify_Click(object sender, EventArgs e)
	{
		string getFilesClassify = tbAddFilesClassify.Text.Trim().ToString();
		if(getFilesClassify == "")
		{
			Page.ClientScript.RegisterStartupScript(this.GetType(), "ServiceManHistoryButtonClick", "<script>alert('分类名称不能为空！！！');</script>");
		}
		else
		{
			string sqlCheckExist = "select * from tb_FilesClassify where FC_ClassifyName = '" + getFilesClassify + "'";
			if (DBHelper.DBHelper.ExecuteDataTable("select * from tb_FilesClassify").Rows.Count == 0)
			{
				string sqlInsert = "insert into tb_FilesClassify(FC_ClassifyName) values('" + getFilesClassify + "')";
				DBHelper.DBHelper.ExectueNonQuery(sqlInsert);
				Page.ClientScript.RegisterStartupScript(this.GetType(), "ServiceManHistoryButtonClick", "<script>alert('部门名称添加成功！！！');window.close();window.opener.location.href='/admin/adminPage.aspx';</script>");
			}
			else
			{
				if(DBHelper.DBHelper.ExecuteDataTable(sqlCheckExist).Rows.Count > 0)
				{
					Page.ClientScript.RegisterStartupScript(this.GetType(), "ServiceManHistoryButtonClick", "<script>alert('分类名称已存在！！！');</script>");
				}
				else
				{
					string sqlInsert = "insert into tb_FilesClassify(FC_ClassifyName) values('" + getFilesClassify + "')";
					DBHelper.DBHelper.ExectueNonQuery(sqlInsert);
					Page.ClientScript.RegisterStartupScript(this.GetType(), "ServiceManHistoryButtonClick", "<script>alert('分类名称添加成功！！！');window.close();window.opener.location.href='/admin/adminPage.aspx';</script>");
				}
			}
		}
	}
}