using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_modifyDep : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if(!IsPostBack)
		{
			BindDDL();
			BindData();
		}
	}

	private void BindDDL()
	{
		string departmentname = Request.QueryString["departmentname"].ToString();
		string sqlBind = "select * from tb_ProjectName";
		ddlProjectName.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlBind);
		ddlProjectName.DataTextField = "P_ProjectName";
		ddlProjectName.DataValueField = "P_ProjID";
		ddlProjectName.DataBind();
		ddlProjectName.Items.Insert(0, new ListItem("----请选择项目名称----"));
		//string projName = DBHelper.DBHelper.ExecuteScalar("select U_ProjectName from tb_UserInfo where U_Department='" + departmentname + "'").ToString();
	}

	private void BindData()
	{
		string departmentname = Request.QueryString["departmentname"].ToString();
		tbModifyDepartment.Text = departmentname;
	}

	protected void btnModifyDep_Click(object sender, EventArgs e)
	{
		string departmentname = Request.QueryString["departmentname"].ToString();
		if(ddlProjectName.SelectedIndex == 0)
		{
			Page.ClientScript.RegisterStartupScript(this.GetType(), "ServiceManHistoryButtonClick", "<script>alert('请选择项目名称！！！');</script>");
		}
		else
		{
			string getDepName = tbModifyDepartment.Text.Trim().ToString();
			string getProjName = ddlProjectName.SelectedItem.Text.ToString();
			int projID = Convert.ToInt32(DBHelper.DBHelper.ExecuteScalar("select P_ProjID from tb_ProjectName where P_ProjectName='" + getProjName + "'"));
			string sqlUpdate = "update tb_Department set D_DepartmentName='" + getDepName + "', D_DepartmentProID='" + projID + "' where D_DepartmentName='" + departmentname + "'";
			DBHelper.DBHelper.ExectueNonQuery(sqlUpdate);
			Response.Write("<script>alert('部门信息更新成功！！！');window.close();window.opener.parent.location.href='adminPage.aspx';</script>");
		}
	}
}