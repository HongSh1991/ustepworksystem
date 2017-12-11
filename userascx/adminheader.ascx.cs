using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class userascx_adminheader : System.Web.UI.UserControl
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (Session["UserName"] == null)
		{
			Response.Write("<script>alert('请先登录！'); window.location='../login/login.aspx';</script>");
		}
	}

	protected void lbAddDepartment_Click(object sender, EventArgs e)
	{
		
	}

	protected void lbAddPost_Click(object sender, EventArgs e)
	{
		
	}

	protected void lbAddUserInfo_Click(object sender, EventArgs e)
	{
		
	}

	protected void lbtnExitSystem_Click(object sender, EventArgs e)
	{
		Session.Clear();
		Session.Abandon();
		this.Response.Redirect("../login/login.aspx"); // 退出并跳转到登录页
	}
}