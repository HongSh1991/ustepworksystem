using System;

public partial class login_login : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		lbTime.Text = DateTime.Now.Year.ToString();
	}

	protected void btnSubmit_Click(object sender, EventArgs e)
	{
		string userName = tbUserName.Text.Trim().ToString();
		string passWord = tbPassWord.Text.Trim().ToString();
		if(userName != "" && passWord != "")
		{
			string searchInfo = "select count(*) from tb_UserInfo where U_UserName = '" + userName + "' and U_PassWord = '" + passWord + "'";
			int num = Convert.ToInt32(DBHelper.DBHelper.ExecuteScalar(searchInfo).ToString());
			if(num == 0)
			{
				Response.Write("<script>alert('用户名或密码错误！'); window.location.href='login.aspx';</script>");
			}
			else
			{
				Session["UserName"] = userName;
				Session.Timeout = 9000;
				if (userName == "admin")
				{
					Response.Redirect("../admin/adminPage.aspx?username=" + userName);
				}
				else
				{
					Response.Redirect("../employee/employeePage.aspx?username=" + userName);
				}
			}
		}
	}
}