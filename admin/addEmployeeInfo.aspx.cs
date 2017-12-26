using System;
using System.Web.UI.WebControls;

public partial class admin_addEmployeeInfo : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if(!IsPostBack)
		{
			BindProjAndDep();
		}
	}

	private void BindProjAndDep()
	{
		string bindDepName = "select D_DepartmentName from tb_Department";
		ddlDepName.DataSource = DBHelper.DBHelper.ExecuteDataTable(bindDepName);
		ddlDepName.DataTextField = "D_DepartmentName";
		ddlDepName.DataBind();
		ddlDepName.Items.Insert(0, new ListItem("----请选择部门名称----"));
		//string bindProjName = "select * from tb_ProjectName";
		//if(DBHelper.DBHelper.ExecuteDataTable(bindProjName).Rows.Count > 0)
		//{
		//	ddlProjName.DataSource = DBHelper.DBHelper.ExecuteDataTable(bindProjName);
		//	ddlProjName.DataTextField = "P_ProjectName";
		//	ddlProjName.DataValueField = "P_ProjID";
		//	ddlProjName.DataBind();
		//	ddlProjName.Items.Insert(0, new ListItem("----请选择项目名称----"));
		//}
	}

	//protected void ddlProjName_SelectedIndexChanged(object sender, EventArgs e)
	//{
	//	string getProjName = ddlProjName.SelectedItem.Text.ToString();
	//	int projID = Convert.ToInt32(DBHelper.DBHelper.ExecuteScalar("select * from tb_ProjectName where P_ProjectName='" + getProjName + "'").ToString());
	//	string bindDepName = "select D_DepartmentName from tb_Department where D_DepartmentProID= '" + projID + "'";
	//	ddlDepName.DataSource = DBHelper.DBHelper.ExecuteDataTable(bindDepName);
	//	ddlDepName.DataTextField = "D_DepartmentName";
	//	ddlDepName.DataBind();
	//	ddlDepName.Items.Insert(0, new ListItem("----请选择部门名称----"));
	//}

	#region 新增员工信息
	protected void btnSave_Click(object sender, EventArgs e)
	{
		string userName = tbUserName.Text.Trim().ToString();
		string passWord = tbPassWord.Text.Trim().ToString();
		string chineseName = tbChineseName.Text.Trim().ToString();
		//string roleName = rblRole.SelectedItem.Text.Trim().ToString();
		//string projName = ddlProjName.SelectedItem.Text.Trim().ToString();
		string depName = ddlDepName.SelectedItem.Text.Trim().ToString();
		string contact = tbContact.Text.Trim().ToString();
		string dateEmployee = tbDate.Text.Trim().ToString();

		if (DBHelper.DBHelper.ExecuteDataTable("select * from tb_UserInfo").Rows.Count == 0)
		{
			string sqlInsert = "insert into tb_UserInfo(U_UserName, U_PassWord, U_ChineseName, U_Department, U_Contact, U_EmployDate) values('" + userName + "', '" + passWord + "', '" + chineseName + "', '" + depName + "', '" + contact + "', '" + dateEmployee + "')";
			DBHelper.DBHelper.ExectueNonQuery(sqlInsert);
			Response.Write("<script>alert('员工信息添加成功！！！');window.close();window.opener.location.href='adminPage.aspx';</script>");
		}
		else
		{
			if (DBHelper.DBHelper.ExecuteDataTable("select * from tb_UserInfo where U_UserName= '" + userName + "'").Rows.Count > 0)
			{
				Response.Write("<script>alert('用户名已存在！！！');</script>");
			}
			else if (DBHelper.DBHelper.ExecuteDataTable("select * from tb_UserInfo where U_ChineseName= '" + chineseName + "'").Rows.Count > 0)
			{
				Response.Write("<script>alert('用户中文名称已存在！！！');</script>");
			}
			else
			{
				string sqlInsert = "insert into tb_UserInfo(U_UserName, U_PassWord, U_ChineseName, U_Department, U_Contact, U_EmployDate) values('" + userName + "', '" + passWord + "', '" + chineseName + "', '" + depName + "', '" + contact + "', '" + dateEmployee + "')";
				DBHelper.DBHelper.ExectueNonQuery(sqlInsert);
				Response.Write("<script>alert('员工信息添加成功！！！');window.close();window.opener.location.href='adminPage.aspx';</script>");
			}
		}
	}
	#endregion
}