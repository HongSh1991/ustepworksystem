using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_addEmployeeInfo : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}

	#region 新增员工信息
	protected void btnSave_Click(object sender, EventArgs e)
	{
		string userName = tbUserName.Text.Trim().ToString();
		string passWord = tbPassWord.Text.Trim().ToString();
		string chineseName = tbChineseName.Text.Trim().ToString();


	}
	#endregion
}