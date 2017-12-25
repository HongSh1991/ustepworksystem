using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_modifyMaterials : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		//不会每次都进行隐藏和显示上传控件条
		if (!IsPostBack)
		{
			this.fuFiles.Style.Add("display", "none");
			BindFilesClassify();
		}
	}

	private void BindFilesClassify()
	{
		string bindFilesClassify = "select * from tb_FilesClassify";
		ddlFilesName.DataSource = DBHelper.DBHelper.ExecuteDataTable(bindFilesClassify);
		ddlFilesName.DataTextField = "FC_ClassifyName";
		ddlFilesName.DataValueField = "FC_ID";
		ddlFilesName.DataBind();
		//绑定已有数据
		if(!string.IsNullOrEmpty(Request.QueryString["filesname"].ToString()))//Request.QueryString["filesname"].ToString() != null
		{
			string getFilesName = Request.QueryString["filesname"].ToString();
			ddlFilesName.Items.Insert(0, new ListItem(DBHelper.DBHelper.ExecuteScalar("select CF_FilesClassify from tb_ComFiles where CF_FilesName='" + getFilesName + "'").ToString()));
			tbFilesName.Text = getFilesName;
			tbFilesPath.Text = DBHelper.DBHelper.ExecuteScalar("select CF_FilesPath from tb_ComFiles where CF_FilesName='" + getFilesName + "'").ToString();
			btnSave.Text = "修改文档信息";
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

						string sqlInsert = "insert into tb_ComFiles(CF_FilesName, CF_FilesPath, CF_FilesClassify) values('" + getFilesName + "', '" + innerFilePath + "', '" + ddlFilesName.SelectedItem.Text + "')";
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

							if(!string.IsNullOrEmpty(Request.QueryString["filesname"].ToString()))
							{
								string getFilesNamePart = Request.QueryString["filesname"].ToString();
								string sqlUpdate = "update tb_ComFiles set CF_FilesName= '" + getFilesName + "' , CF_FilesPath= '" + innerFilePath + "' , CF_FilesClassify= '" + ddlFilesName.SelectedItem.Text + "' where CF_FilesName='" + getFilesNamePart + "'";
								DBHelper.DBHelper.ExectueNonQuery(sqlUpdate);
								Response.Write("<script>alert('文件修改成功！！！');window.close();window.opener.location.href='adminPage.aspx';</script>");
							}
							else
							{
								string sqlInsert = "insert into tb_ComFiles(CF_FilesName, CF_FilesPath, CF_FilesClassify) values('" + getFilesName + "', '" + innerFilePath + "', '" + ddlFilesName.SelectedItem.Text + "')";
								DBHelper.DBHelper.ExectueNonQuery(sqlInsert);
								Response.Write("<script>alert('文件添加成功！！！');window.close();window.opener.location.href='adminPage.aspx';</script>");
							}
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