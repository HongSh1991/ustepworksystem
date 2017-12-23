using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_addSoftWares : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			this.fuFiles.Style.Add("display", "none");
		}
	}

	protected void btnSave_Click(object sender, EventArgs e)
	{
		string getSoftsName = tbSoftsName.Text.Trim().ToString();
		if (getSoftsName == "")
		{
			Response.Write("<script>alert('资源名称不能为空！！！');</script>");
		}
		else
		{
			string sqlCheckNull = "select * from tb_ComSoftWare";
			if (DBHelper.DBHelper.ExecuteDataTable(sqlCheckNull).Rows.Count == 0)
			{
				if (fuFiles.HasFile)
				{
					string fileName = this.fuFiles.FileName;
					string extensionName = System.IO.Path.GetExtension(fileName);
					string savePath = System.IO.Path.Combine(@"G:\webfiles\softwares\", fileName);//DateTime.Now.ToString("yyyy-MM-dd") + extensionName
					fuFiles.MoveTo(savePath, Brettle.Web.NeatUpload.MoveToOptions.Overwrite);
					string url= @"G:\webfiles\softwares\" + DateTime.Now.ToString("yyyy-MM-dd") + extensionName;
					float fileSize = (float) System.Math.Round((float) fuFiles.ContentLength / 1024000, 1);
					string sqlInsert = "insert into tb_ComSoftWare(CS_SoftName, CS_SoftPath) values('" + getSoftsName + "', '" + savePath + "')";
					DBHelper.DBHelper.ExectueNonQuery(sqlInsert);
					Response.Write("<script>alert('软件添加成功！！！');window.close();window.opener.location.href='adminPage.aspx';</script>");
				}
				//if (fuFiles.PostedFile.FileName == "")
				//{
				//	lbShowTips.Text = "要上传的文件不允许为空！";
				//	return;
				//}
				//else
				//{
				//	string filePath = fuFiles.PostedFile.FileName;
				//	string fileName = filePath.Substring(filePath.LastIndexOf("\\") + 1);
				//	string fileExtension = filePath.Substring(filePath.LastIndexOf(".") + 1);
				//	string innerFilePath = Server.MapPath("~\\upload\\comSofts") + "\\" + fileName;
				//	this.fuFiles.PostedFile.SaveAs(innerFilePath);

				//	string sqlInsert = "insert into tb_ComSoftWare(CS_SoftName, CS_SoftPath) values('" + getSoftsName + "', '" + innerFilePath + "')";
				//	DBHelper.DBHelper.ExectueNonQuery(sqlInsert);
				//	Response.Write("<script>alert('文件添加成功！！！');window.close();window.opener.location.href='adminPage.aspx';</script>");
				//}
			}
			else if (DBHelper.DBHelper.ExecuteDataTable(sqlCheckNull).Rows.Count > 0)
			{
				string sqlCheckExist = "select * from tb_ComSoftWare where CS_SoftName='" + getSoftsName + "'";
				if (DBHelper.DBHelper.ExecuteDataTable(sqlCheckExist).Rows.Count > 0)
				{
					Response.Write("<script>alert('文件名称已存在！！！');</script>");
				}
				else
				{
					if (fuFiles.HasFile)
					{
						string fileName = this.fuFiles.FileName;
						string extensionName = System.IO.Path.GetExtension(fileName);
						string savePath = System.IO.Path.Combine(@"G:\webfiles\softwares\", fileName);
						fuFiles.MoveTo(savePath, Brettle.Web.NeatUpload.MoveToOptions.Overwrite);
						string url = @"G:\webfiles\softwares\" + DateTime.Now.ToString("yyyy-MM-dd") + extensionName;
						float fileSize = (float) System.Math.Round((float) fuFiles.ContentLength / 1024000, 1);
						string sqlInsert = "insert into tb_ComSoftWare(CS_SoftName, CS_SoftPath) values('" + getSoftsName + "', '" + savePath + "')";
						DBHelper.DBHelper.ExectueNonQuery(sqlInsert);
						Response.Write("<script>alert('软件添加成功！！！');window.close();window.opener.location.href='adminPage.aspx';</script>");
					}
				}
			}
		}
	}
}