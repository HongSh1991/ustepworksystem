using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_modifyProj : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			this.fuFiles.Style.Add("display", "none");

			BindData();
		}
	}

	private void BindData()
	{
		string projectName = Request.QueryString["projectname"].ToString();
		tbProjectName.Text = projectName;
		string getUrl = DBHelper.DBHelper.ExecuteScalar("select P_ProjectFilesUrl from tb_ProjectName where P_ProjectName='" + projectName + "'").ToString();
		tbFilesPath.Text = getUrl;
	}

	protected void btnModify_Click(object sender, EventArgs e)
	{
		string projectName = Request.QueryString["projectname"].ToString();
		string getProjName = tbProjectName.Text.Trim().ToString();
		if (getProjName == "")
		{
			Response.Write("<script>alert('项目名称不能为空！！！');</script>");
		}
		else
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

						string sqlInsert = "update tb_ProjectName set P_ProjectName='" + getProjName + "', P_ProjectFilesUrl='" + projectFilePath + "' where P_ProjectName='" + projectName + "'";
						DBHelper.DBHelper.ExectueNonQuery(sqlInsert);
						Response.Write("<script>alert('项目信息添加成功！！！');window.close();window.opener.location.href='adminPage.aspx';</script>");
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