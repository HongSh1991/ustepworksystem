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
		BindData();
	}

	private void BindData()
	{
		if (Request.QueryString["U_UserName"].ToString() != null)
		{
			string sqlBind = "select * from tb_UserInfo where U_UserName = " + Request.QueryString["U_UserName"].ToString();

		}
	}

	protected void btnUpdate_Click(object sender, EventArgs e)
	{
		string getUserName = tbUserName.Text.Trim().ToString();
		string getChineseName = tbChineseName.Text.Trim().ToString();
		string getDepName = ddlDepName.SelectedItem.Text.ToString();
		string getProjName = ddlProjName.SelectedItem.Text.ToString();
		string getContact = tbContact.Text.Trim().ToString();

		string sqlUpdate = "update tb_UserInfo set "
	}
}