using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_projectAllocation_projAllocation : System.Web.UI.Page
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
		//绑定项目名称
		string sqlBindProject = "select * from tb_ProjectName";
		if(DBHelper.DBHelper.ExecuteDataTable(sqlBindProject).Rows.Count > 0)
		{
			ddlProjectName.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlBindProject);
			ddlProjectName.DataTextField = "P_ProjectName";
			ddlProjectName.DataValueField = "P_ProjID";
			ddlProjectName.DataBind();
			ddlProjectName.Items.Insert(0, new ListItem("----请选择项目名称----"));
		}

		//绑定项目负责人
		string sqlBindUser = "select * from tb_UserInfo";
		if(DBHelper.DBHelper.ExecuteDataTable(sqlBindUser).Rows.Count > 0)
		{
			ddlProjectCharge.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlBindUser);
			ddlProjectCharge.DataTextField = "U_ChineseName";
			ddlProjectCharge.DataValueField = "U_ID";
			ddlProjectCharge.DataBind();
			ddlProjectCharge.Items.Insert(0, new ListItem("----请选择负责人----"));
		}
	}

	protected void btnSave_Click(object sender, EventArgs e)
	{
		string getProjectName = ddlProjectName.SelectedItem.Text.ToString();
		string getProjectUserCharge = ddlProjectCharge.SelectedItem.Text.ToString();
		string getProjectTips = tbProjectTips.Text.Trim().ToString();
		string getFilesPath = DBHelper.DBHelper.ExecuteScalar("select P_ProjectFilesUrl from tb_ProjectName where P_ProjectName='" + getProjectName + "'").ToString();

		string sqlInsert = "insert into tb_AdminToProjMan(ATPM_ProjectName, ATPM_ChargeUserName, ATPM_ProjectTips, ATPM_ProjectPath)values('" + getProjectName + "', '" + getProjectUserCharge + "', '" + getProjectTips + "', '" + getFilesPath + "')";
		DBHelper.DBHelper.ExecuteScalar(sqlInsert);
		Page.ClientScript.RegisterStartupScript(this.GetType(), "ServiceManHistoryButtonClick", "<script>alert('项目分配成功！！！');window.close();window.opener.location.href='/admin/adminPage.aspx';</script>");
	}
}