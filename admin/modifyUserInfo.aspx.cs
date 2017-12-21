using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_modifyUserInfo : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if(!IsPostBack)
		{
			BindData();
		}
	}

	private void BindData()
	{
		string userName = Request.QueryString["username"].ToString();
		if (userName != null)
		{
			tbUserName.Text = userName;
			string sqlBindChineseName = "select U_ChineseName from tb_UserInfo where U_UserName='" + userName + "'";
			string sqlBindDepName = "select U_Department from tb_UserInfo where U_UserName='" + userName + "'";
			string sqlBindProjName = "select U_ProjectName from tb_UserInfo where U_UserName='" + userName + "'";
			string sqlBindContact = "select U_Contact from tb_UserInfo where U_UserName='" + userName + "'";
			tbChineseName.Text = DBHelper.DBHelper.ExecuteScalar(sqlBindChineseName).ToString();
			tbDepName.Text = DBHelper.DBHelper.ExecuteScalar(sqlBindDepName).ToString();
			tbProjName.Text = DBHelper.DBHelper.ExecuteScalar(sqlBindProjName).ToString();
			tbContact.Text = DBHelper.DBHelper.ExecuteScalar(sqlBindContact).ToString();
		}
	}

	protected void btnUpdate_Click(object sender, EventArgs e)
	{
		string getUserName = tbUserName.Text.Trim().ToString();
		string getChineseName = tbChineseName.Text.Trim().ToString();
		string getDepName = tbDepName.Text.ToString();
		string getProjName = tbProjName.Text.ToString();
		string getContact = tbContact.Text.Trim().ToString();

		string sqlUpdate = "update tb_UserInfo set U_UserName= '" + getUserName + "', U_ChineseName= '" + getChineseName + "', U_Department= '" + getDepName + "', U_ProjectName= '" + getProjName + "', U_Contact= '" + getContact + "' where U_UserName= '" + Request.QueryString["username"].ToString() + "'";
		DBHelper.DBHelper.ExectueNonQuery(sqlUpdate);
		Response.Write("<script>alert('员工信息更新成功！！！');window.close();window.opener.parent.location.href='adminPage.aspx';</script>");
	}
}