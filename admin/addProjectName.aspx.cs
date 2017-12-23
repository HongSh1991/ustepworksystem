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
		if(!IsPostBack)
		{
			this.fuFiles.Style.Add("display", "none");
		}
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
				try
				{
					if (fuFiles.PostedFile.FileName == "")
					{
						lbShowTips.Text = "要上传的文件不允许为空！";
						return;
					}
					else
					{
						string filePath = fuFiles.PostedFile.FileName;
						string fileName = filePath.Substring(filePath.LastIndexOf("\\") + 1);
						string fileExtension = filePath.Substring(filePath.LastIndexOf(".") + 1);
						string projectFilePath = @"G:\webfiles\projectfies\" + fileName;
						this.fuFiles.PostedFile.SaveAs(projectFilePath);

						string sqlInsert = "insert into tb_ProjectName(P_ProjectName, P_ProjectFilesUrl) values('" + getProjName + "', '" + projectFilePath + "')";
						DBHelper.DBHelper.ExectueNonQuery(sqlInsert);
						Response.Write("<script>alert('项目名称添加成功！！！');window.close();window.opener.location.href='adminPage.aspx';</script>");
					}
				}
				catch (Exception error)
				{
					lbShowTips.Text = "处理发生错误！原因： " + error.ToString();
				}
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
					try
					{
						if (fuFiles.PostedFile.FileName == "")
						{
							lbShowTips.Text = "要上传的文件不允许为空！";
							return;
						}
						else
						{
							string filePath = fuFiles.PostedFile.FileName;
							string fileName = filePath.Substring(filePath.LastIndexOf("\\") + 1);
							string fileExtension = filePath.Substring(filePath.LastIndexOf(".") + 1);
							string projectFilePath = @"G:\webfiles\projectfies\" + fileName;
							this.fuFiles.PostedFile.SaveAs(projectFilePath);

							string sqlInsert = "insert into tb_ProjectName(P_ProjectName, P_ProjectFilesUrl) values('" + getProjName + "', '" + projectFilePath + "')";
							DBHelper.DBHelper.ExectueNonQuery(sqlInsert);
							Response.Write("<script>alert('项目名称添加成功！！！');window.close();window.opener.location.href='adminPage.aspx';</script>");
						}
					}
					catch (Exception error)
					{
						lbShowTips.Text = "处理发生错误！原因： " + error.ToString();
					}
				}
			}
		}
	}
}