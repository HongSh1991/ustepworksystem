<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addDep.aspx.cs" Inherits="admin_addDep" %>
<%@ Register Src="~/userascx/adminheader.ascx" TagName="adminheader" TagPrefix="uc1" %>
<%@ Register Src="~/userascx/pagefooter.ascx" TagName="pagefooter" TagPrefix="uc2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
	<link rel="stylesheet" href="../layui/css/layui.css" type="text/css" />
	<link rel="stylesheet" href="../StyleSheet.css" type="text/css" />
	<style type="text/css">
		.button {
			cursor: pointer;
		}

		/*让div内容居中*/
		.rdCss {
			height: 38px;
			width: 42.1%;
			line-height: 38px;
			overflow: hidden;
		}
		.ddl {
			height: 38px;
			width: 190px;
			cursor: pointer;
			color: gray;
			text-align: center;
			padding-left: 6px;
			border-right: Gainsboro 1px solid;
			border-top: Gainsboro 1px solid;
			border-left: Gainsboro 1px solid;
			border-bottom: Gainsboro 1px solid;
		}
	</style>
</head>
<body style="overflow-x:hidden; overflow-y:hidden; margin:auto; height:auto; width:auto;">
	<form id="form1" runat="server" class="layui-form layui-form-pane">
		<div style="height:16%; width:100%;">
			<uc1:adminheader ID="adminheader" runat="server" />
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">部门名称:</label>
			<div class="layui-input-inline">
				<asp:TextBox ID="tbAddDep" runat="server" required lay-verify="required" placeholder="请输入用户名" autocomplete="off" CssClass="layui-input"></asp:TextBox>
			</div>
			<asp:Button ID="btnAddDep" runat="server" Text="新增部门" CssClass="layui-btn" OnClick="btnAddDep_Click" />
		</div>
		<!--[删改查]部门/职务-->
		<div class="layui-tab-item">
			<div class="site-text site-block" style="position: absolute; width: 47%; height: 100%; border-right-style: dashed; border-right-width: thin;">
				<div class="layui-form-item">
					<label class="layui-form-label">部门名称:</label>
					<div class="layui-input-inline">
						<asp:TextBox ID="tbAddDepartment" runat="server" required lay-verify="required" placeholder="请输入部门名称" autocomplete="off" CssClass="layui-input"></asp:TextBox>
					</div>
					<div align="left">
						<asp:Button ID="btnSaveDep" runat="server" Text="查询部门" CssClass="layui-btn" OnClick="btnSaveDep_Click" />
					</div>
				</div>
				<asp:GridView ID="gvDepartment" runat="server" OnRowEditing="gvDepartment_RowEditing" OnRowUpdating="gvDepartment_RowUpdating" OnRowDeleting="gvDepartment_RowDeleting" OnRowCancelingEdit="gvDepartment_RowCancelingEdit" OnPageIndexChanging="gvDepartment_PageIndexChanging" OnRowDataBound="gvDepartment_RowDataBound" AutoGenerateColumns="False" AllowPaging="true" PageSize="10" CssClass="layui-table">
					<Columns>
						<asp:BoundField DataField="D_DepID" HeaderText="序号" ItemStyle-Width="30px" />
						<asp:BoundField DataField="D_DepartmentName" HeaderText="部门名称" />
						<asp:CommandField HeaderText="编辑" ControlStyle-CssClass="layui-btn layui-btn-sm" ShowEditButton="true" ControlStyle-Width="60px" />
						<asp:CommandField HeaderText="删除" ControlStyle-CssClass="layui-btn layui-btn-danger layui-btn-sm" ShowDeleteButton="true" ControlStyle-Width="60px" />
					</Columns>
					<HeaderStyle HorizontalAlign="Center" BackColor="#2F4056" ForeColor="White" Height="42px" />
					<RowStyle HorizontalAlign="Center" />
				</asp:GridView>
			</div>
			<div style="position: absolute; width: 48%; margin-right: 2%;">
			</div>
		</div>
	</form>
</body>
</html>
