using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_addMaterials : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		//不会每次都进行隐藏和显示上传控件条
		if (!IsPostBack)
		{
			this.fuFiles.Style.Add("display", "none");
		}
	}

	protected void btnSave_Click(object sender, EventArgs e)
	{
		string getFilesName = tbFilesName.Text.Trim().ToString();
		if(getFilesName == "")
		{
			Response.Write("<script>alert('资源名称不能为空！！！');</script>");
		}
		else
		{
			string sqlCheckNull = "select * from tb_ComFiles";
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
						string innerFilePath = @"G:\webfiles\comfiles\" + fileName;
						//string innerFilePath = Server.MapPath("~\\upload\\comFiles") + "\\" + fileName;
						this.fuFiles.PostedFile.SaveAs(innerFilePath);

						string sqlInsert = "insert into tb_ComFiles(CF_FilesName, CF_FilesPath) values('" + getFilesName + "', '" + innerFilePath + "')";
						DBHelper.DBHelper.ExectueNonQuery(sqlInsert);
						Response.Write("<script>alert('文件添加成功！！！');window.close();window.opener.location.href='adminPage.aspx';</script>");
					}
				}
				catch (Exception error)
				{
					lbShowTips.Text = "处理发生错误！原因： " + error.ToString();
				}
			}
			else if (DBHelper.DBHelper.ExecuteDataTable(sqlCheckNull).Rows.Count > 0)
			{
				string sqlCheckExist = "select * from tb_ComFiles where CF_FilesName='" + getFilesName + "'";
				if (DBHelper.DBHelper.ExecuteDataTable(sqlCheckExist).Rows.Count > 0)
				{
					Response.Write("<script>alert('文件名称已存在！！！');</script>");
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
							string innerFilePath = @"G:\webfiles\comfiles\" + fileName;
							this.fuFiles.PostedFile.SaveAs(innerFilePath);

							string sqlInsert = "insert into tb_ComFiles(CF_FilesName, CF_FilesPath) values('" + getFilesName + "', '" + innerFilePath + "')";
							DBHelper.DBHelper.ExectueNonQuery(sqlInsert);
							Response.Write("<script>alert('文件添加成功！！！');window.close();window.opener.location.href='adminPage.aspx';</script>");
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