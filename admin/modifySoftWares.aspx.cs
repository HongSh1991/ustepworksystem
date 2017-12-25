using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_modifySoftWares : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			this.fuFiles.Style.Add("display", "none");
			BindSoftsClassify();
		}
	}

	private void BindSoftsClassify()
	{
		string bindSofts = "select * from tb_SoftsClassify";
		ddlSoftsName.DataSource = DBHelper.DBHelper.ExecuteDataTable(bindSofts);
		ddlSoftsName.DataTextField = "SC_ClassifyName";
		ddlSoftsName.DataValueField = "SC_ID";
		ddlSoftsName.DataBind();
		ddlSoftsName.Items.Insert(0, new ListItem("----请选择软件分类----"));
		//绑定已有数据
		if (!string.IsNullOrEmpty(Request.QueryString["softsname"].ToString()))//Request.QueryString["filesname"].ToString() != null
		{
			string getFilesName = Request.QueryString["softsname"].ToString();
			ddlSoftsName.Items.Insert(0, new ListItem(DBHelper.DBHelper.ExecuteScalar("select CS_SoftClassify from tb_ComSoftWare where CS_SoftName='" + getFilesName + "'").ToString()));
			tbSoftsName.Text = getFilesName;
			tbFilesPath.Text = DBHelper.DBHelper.ExecuteScalar("select CS_SoftPath from tb_ComSoftWare where CS_SoftName='" + getFilesName + "'").ToString();
			btnSave.Text = "修改软件信息";
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
					string savePath = System.IO.Path.Combine(@"G:\webfiles\softwares\", fileName);
					fuFiles.MoveTo(savePath, Brettle.Web.NeatUpload.MoveToOptions.Overwrite);
					string url= @"G:\webfiles\softwares\" + DateTime.Now.ToString("yyyy-MM-dd") + extensionName;
					float fileSize = (float) System.Math.Round((float) fuFiles.ContentLength / 1024000, 1);
					string sqlInsert = "insert into tb_ComSoftWare(CS_SoftName, CS_SoftPath, CS_SoftClassify) values('" + getSoftsName + "', '" + savePath + "', '" + ddlSoftsName.SelectedItem.Text.ToString() + "')";
					DBHelper.DBHelper.ExectueNonQuery(sqlInsert);
					Response.Write("<script>alert('软件添加成功！！！');window.close();window.opener.location.href='adminPage.aspx';</script>");
				}
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
						if (!string.IsNullOrEmpty(Request.QueryString["softsname"].ToString()))
						{
							string getFilesNamePart = Request.QueryString["softsname"].ToString();
							string sqlUpdate = "update tb_ComSoftWare set CS_SoftName= '" + getSoftsName + "' , CS_SoftPath= '" + savePath + "' , CS_SoftClassify= '" + ddlSoftsName.SelectedItem.Text + "' where CS_SoftName='" + getFilesNamePart + "'";
							DBHelper.DBHelper.ExectueNonQuery(sqlUpdate);
							Response.Write("<script>alert('文件修改成功！！！');window.close();window.opener.location.href='adminPage.aspx';</script>");
						}
						else
						{
							string sqlInsert = "insert into tb_ComSoftWare(CS_SoftName, CS_SoftPath, CS_SoftClassify) values('" + getSoftsName + "', '" + savePath + "', '" + ddlSoftsName.SelectedItem.Text.ToString() + "')";
							DBHelper.DBHelper.ExectueNonQuery(sqlInsert);
							Response.Write("<script>alert('软件添加成功！！！');window.close();window.opener.location.href='adminPage.aspx';</script>");
						}
					}
				}
			}
		}
	}
}