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

	protected void lbAddDepartmentAndPost_Click(object sender, EventArgs e)
	{
		
	}

	protected void lbAddUserInfo_Click(object sender, EventArgs e)
	{
		
	}

	protected void lbAddMaterialAndSoft_Click(object sender, EventArgs e)
	{
		
	}
}