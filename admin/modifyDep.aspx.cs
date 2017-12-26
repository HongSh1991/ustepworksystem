using System;

public partial class admin_modifyDep : System.Web.UI.Page
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
		string departmentname = Request.QueryString["departmentname"].ToString();
		tbModifyDepartment.Text = departmentname;
	}

	protected void btnModifyDep_Click(object sender, EventArgs e)
	{
		string departmentname = Request.QueryString["departmentname"].ToString();
		string getDepName = tbModifyDepartment.Text.Trim().ToString();
		string sqlUpdate = "update tb_Department set D_DepartmentName='" + getDepName + "' where D_DepartmentName='" + departmentname + "'";
		DBHelper.DBHelper.ExectueNonQuery(sqlUpdate);
		Response.Write("<script>alert('部门信息更新成功！！！');window.close();window.opener.parent.location.href='adminPage.aspx';</script>");
	}
}