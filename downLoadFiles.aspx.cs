using System;

public partial class downLoadFiles : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			if (Request.QueryString["P_ProjectName"] != null)
			{
				string fileFullName;
				string fileName = Request.QueryString["P_ProjectName"].ToString();//取出文件名称
				string selectData = "select P_ProjectFilesUrl from tb_ProjectName where P_ProjectName=" + fileName;
				fileFullName = DBHelper.DBHelper.ExecuteScalar(selectData).ToString();//取出文件下载路径
																					  //fileFullName = Server.MapPath(fileFullName);//将虚拟路径转化为物理路径
				DownloadFile(fileFullName);//下载文件
			}
			else if (Request.QueryString["filesname"] != null)
			{
				string fileFullName;
				string fileName = Request.QueryString["filesname"].ToString();//取出文件名称
				string selectData = "select CF_FilesPath from tb_ComFiles where CF_FilesName='" + fileName + "'";
				fileFullName = DBHelper.DBHelper.ExecuteScalar(selectData).ToString();//取出文件下载路径
				DownloadFile(fileFullName);//下载文件
			}
			else if (Request.QueryString["softsname"] != null)
			{

			}
		}
	}

	//在模态窗口中下载文件
	private void DownloadFile(string fileName)
	{
		System.IO.Stream iStream = null;
		byte[] buffer = new Byte[10000];
		int length;
		long dataToRead;
		string filePath = fileName;
		string filename = System.IO.Path.GetFileName(filePath);
		try
		{
			iStream = new System.IO.FileStream(filePath, System.IO.FileMode.Open, System.IO.FileAccess.Read, System.IO.FileShare.Read);
			dataToRead = iStream.Length;
			Response.ContentType = "application/form-data";
			Response.AddHeader("Content-Disposition", "attachment;filename=" + filename);
			while (dataToRead > 0)
			{
				if (Response.IsClientConnected)
				{
					length = iStream.Read(buffer, 0, 10000);
					Response.OutputStream.Write(buffer, 0, 10000);
					Response.Flush();
					buffer = new Byte[10000];
					dataToRead = dataToRead - length;
				}
				else
				{
					dataToRead = -1;
				}
			}
		}
		catch (Exception ex)
		{
			Response.Write("Error:" + ex.Message);
		}
		finally
		{
			if (iStream != null)
			{
				iStream.Close();
			}
		}
	}
}