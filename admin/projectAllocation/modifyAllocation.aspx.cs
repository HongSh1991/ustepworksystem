using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_projectAllocation_modifyAllocation : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if(!IsPostBack)
		{
			BindData();
			BindSessionData();
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

	private void BindSessionData()
	{
		string getName = Request.QueryString["allocationname"].ToString();
		if (getName != null)
		{
			ddlProjectName.Items.Insert(0, new ListItem(getName));
		}

		string bindProjectCharge = DBHelper.DBHelper.ExecuteScalar("select ATPM_ChargeUserName from tb_AdminToProjMan where ATPM_ProjectName='" + getName + "'").ToString();
		ddlProjectCharge.Items.Insert(0, new ListItem(bindProjectCharge));
	}

	protected void btnSave_Click(object sender, EventArgs e)
	{
		string getName = Request.QueryString["allocationname"].ToString();
		string getProjectName = ddlProjectName.SelectedItem.Text.ToString();
		string getProjectUserCharge = ddlProjectCharge.SelectedItem.Text.ToString();
		string getProjectTips = tbProjectTips.Text.Trim().ToString();
		string getFilesPath = DBHelper.DBHelper.ExecuteScalar("select P_ProjectFilesUrl from tb_ProjectName where P_ProjectName='" + getProjectName + "'").ToString();

		string sqlUpdate = "update tb_AdminToProjMan set ATPM_ProjectName='" + getProjectName + "', ATPM_ChargeUserName='" + getProjectUserCharge + "', ATPM_ProjectTips='" + getProjectTips + "', ATPM_ProjectPath='" + getFilesPath + "' where ATPM_ProjectName= '" + getName + "'";
		DBHelper.DBHelper.ExecuteScalar(sqlUpdate);
		Page.ClientScript.RegisterStartupScript(this.GetType(), "ServiceManHistoryButtonClick", "<script>alert('项目分配修改成功！！！');window.close();window.opener.location.href='/admin/adminPage.aspx';</script>");
	}
}