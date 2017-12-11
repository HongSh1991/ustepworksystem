﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminPage.aspx.cs" Inherits="admin_adminPage" %>
<%@ Register Src="~/userascx/adminheader.ascx" TagName="adminheader" TagPrefix="uc1" %>
<%@ Register Src="~/userascx/pagefooter.ascx" TagName="pagefooter" TagPrefix="uc2" %>
<%@ Register Src="~/admin/departmentAndPost.ascx" TagName="departmentAndPost" TagPrefix="uc3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
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
		<div align="center" style="height:72.8%; width:100%; top:16%;">
			<table style="width:100%; height:100%">
				<tr>
					<td>
						<aside style="height:72.8%; width:15%; left:6%; right:0.5%; padding-top:0.1%; position:absolute;">
							<div style="height:28%;">
								<div align="center" style="line-height:42px; background-color:#2F4056; color:whitesmoke; padding-top:2%; font-size:12pt">
									用户信息
								</div>
								<div style=" border-style:dashed; border-width:thin; height:90%; width:96%; margin-left:2%">
									<div class="layui-form-item" style="margin-top:3.2%; border-top-style:dashed; border-top-width:thin; border-bottom-style:dashed; border-bottom-width:thin;">
										<label style="font-size:11pt; line-height:42px; margin-left:12%">用户名:</label>
										<asp:Label ID="lbChineseName" runat="server" style="font-size:11pt; margin-left:3.6%; text-decoration:underline" ></asp:Label>
									</div>
									<div class="layui-form-item" style="margin-top:-4%; border-top-style:dashed; border-top-width:thin; border-bottom-style:dashed; border-bottom-width:thin;">
										<label style="font-size:11pt; line-height:42px; margin-left:12%">部&nbsp;&nbsp;&nbsp;&nbsp;门:</label>
										<asp:Label ID="lbDepartment" runat="server" style="font-size:11pt; margin-left:8%; text-decoration:underline" ></asp:Label>
									</div>
									<div class="layui-form-item" style="margin-top:-4%; border-top-style:dashed; border-top-width:thin; border-bottom-style:dashed; border-bottom-width:thin;">
										<label style="font-size:11pt; line-height:42px; margin-left:12%">职&nbsp;&nbsp;&nbsp;&nbsp;务:</label>
										<asp:Label ID="lbJob" runat="server" style="font-size:11pt; margin-left:6%; text-decoration:underline" ></asp:Label>
									</div>
								</div>
							</div>
							<div style="height:72%;">
								<div align="center" style="line-height: 42px; background-color: #2F4056; color: whitesmoke; padding-top:2%; font-size:12pt">
									最新工单
								</div>
								<div style=" border-style:dashed; border-width:thin; height:90%; width:96%; margin-left:2%">
									
								</div>
							</div>
						</aside>
						<div style="height:72.8%; width:72%; left:21.5%; right:6%; position:absolute;">
							<div class="layui-tab layui-tab-card" style="height:98%;">
								<ul class="layui-tab-title">
									<li class="layui-this">[删改查]员工信息</li>
									<li>[增删改]部门/职务</li>
									<li>[删改查]公司文档/软件资源</li>
									<li>[新增]员工信息</li>
									<li>[新增]公司文档/软件资源</li>
								</ul>
								<div class="layui-tab-content">
									<!--[删改查]员工信息-->
									<div class="layui-tab-item layui-show">
										<div class="layui-form-item">
											<label class="layui-form-label">用户名:</label>
											<div class="layui-input-inline">
												<asp:TextBox ID="tbSearchUserName" runat="server" required lay-verify="required" placeholder="请输入用户名" autocomplete="off" CssClass="layui-input"></asp:TextBox>
											</div>

											<label class="layui-form-label">所属部门:</label>
											<div class="layui-input-inline">
												<asp:DropDownList ID="ddlSearchDepartment" runat="server" AutoPostBack="True" CssClass="ddl">
												</asp:DropDownList>
											</div>

											<label class="layui-form-label">职务:</label>
											<div class="layui-input-inline">
												<asp:DropDownList ID="ddlSearchRole" runat="server" AutoPostBack="True" CssClass="ddl">
												</asp:DropDownList>
											</div>
											<asp:Button ID="btnSearch" runat="server" Text="查询用户" CssClass="layui-btn" />
										</div>
										<asp:GridView ID="gvUser" runat="server" OnRowEditing="gvUser_RowEditing" OnRowUpdating="gvUser_RowUpdating" OnRowDeleting="gvUser_RowDeleting" OnRowCancelingEdit="gvUser_RowCancelingEdit" OnPageIndexChanging="gvUser_PageIndexChanging" OnRowDataBound="gvUser_RowDataBound" AutoGenerateColumns="False" AllowPaging="true" PageSize="10" CssClass="layui-table">
											<Columns>
												<asp:TemplateField HeaderText="序号" ItemStyle-Width="30px">
													<ItemStyle HorizontalAlign="Center" />
													<HeaderStyle HorizontalAlign="Center" Width="30px" />
												</asp:TemplateField>
												<asp:BoundField DataField="U_UserName" HeaderText="用户名" ItemStyle-Width="100px" />
												<asp:BoundField DataField="U_ChineseName" HeaderText="姓名" ItemStyle-Width="120px" />
												<asp:BoundField DataField="U_Department" HeaderText="部门" ItemStyle-Width="120px" />
												<asp:BoundField DataField="U_Job" HeaderText="职务" ItemStyle-Width="160px" />
												<asp:BoundField DataField="U_Contact" HeaderText="联系方式" ItemStyle-Width="120px" />
												<asp:CommandField HeaderText="编辑" ControlStyle-CssClass="layui-btn layui-btn-sm" ShowEditButton="true" ControlStyle-Width="60px" />
												<asp:CommandField HeaderText="删除" ControlStyle-CssClass="layui-btn layui-btn-danger layui-btn-sm" ShowDeleteButton="true" ControlStyle-Width="60px" />
											</Columns>
											<HeaderStyle HorizontalAlign="Center" BackColor="#2F4056" ForeColor="White" Height="42px" />
											<RowStyle HorizontalAlign="Center" />
										</asp:GridView>
									</div>

									<!--[删改查]部门/职务-->
									<div class="layui-tab-item">
										<div class="site-text site-block" style="position: absolute; width: 47%; height:100%; border-right-style: dashed; border-right-width:thin;">
											<div class="layui-form-item">
												<label class="layui-form-label">部门名称:</label>
												<div class="layui-input-inline">
													<asp:TextBox ID="tbAddDepartment" runat="server" required lay-verify="required" placeholder="请输入部门名称" autocomplete="off" CssClass="layui-input"></asp:TextBox>
												</div>
												<div align="left">
													<asp:Button ID="btnSaveDep" runat="server" Text="新增部门" CssClass="layui-btn" OnClick="btnSaveDep_Click" />
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

									<!--[删改查]公司文档/软件资源-->
									<div class="layui-tab-item">
										
									</div>

									<!--[新增]员工信息-->
									<div class="layui-tab-item" style="width:72%; margin-left:15%">
										<div class="layui-form-item" style="margin-left: 16%; margin-right: 18%; margin-top: 12px;">
											<label class="layui-form-label" style="text-align: right">用户名:</label>
											<div class="layui-input-block">
												<asp:TextBox ID="tbUserName" runat="server" required lay-verify="required" placeholder="请输入用户名" autocomplete="off" CssClass="layui-input"></asp:TextBox>
											</div>
										</div>
										<div class="layui-form-item" style="margin-left: 16%; margin-right: 18%">
											<label class="layui-form-label" style="text-align: right">密&nbsp;&nbsp;&nbsp;&nbsp;码:</label>
											<div class="layui-input-block">
												<asp:TextBox ID="tbPassWord" runat="server" required lay-verify="required" placeholder="请输入密码" autocomplete="off" CssClass="layui-input"></asp:TextBox>
											</div>
										</div>
										<div class="layui-form-item" style="margin-left: 16%; margin-right: 18%">
											<label class="layui-form-label" style="text-align: right">中文名:</label>
											<div class="layui-input-block">
												<asp:TextBox ID="tbChineseName" runat="server" required lay-verify="required" placeholder="请输入中文名" autocomplete="off" CssClass="layui-input" TextMode="SingleLine"></asp:TextBox>
											</div>
										</div>
										<div class="layui-form-item" style="margin-left: 16%; margin-right: 18%">
											<label class="layui-form-label" style="text-align: right">权&nbsp;&nbsp;&nbsp;&nbsp;限:</label>
											<div class="layui-input-block">
												<input type="radio" name="role" runat="server" value="1" title="系统操作员" checked="true" />
												<input type="radio" name="role" runat="server" value="2" title="普通用户" />
												<%--<asp:RadioButtonList ID="rblRole" runat="server" RepeatDirection="Horizontal" Width="180px" CellPadding="4">
													<asp:ListItem Value="1" Selected="True">系统操作员</asp:ListItem>
													<asp:ListItem Value="2">普通用户</asp:ListItem>
												</asp:RadioButtonList>--%>
											</div>
										</div>
										<div class="layui-form-item" style="margin-left: 16%; margin-right: 18%">
											<label class="layui-form-label" style="text-align: right">职&nbsp;&nbsp;&nbsp;&nbsp;务:</label>
											<div class="layui-input-block">
												<asp:DropDownList ID="ddlJob" runat="server" AutoPostBack="True"></asp:DropDownList>
											</div>
										</div>
										<div class="layui-form-item" style="margin-left: 16%; margin-right: 18%">
											<label class="layui-form-label" style="text-align: right">岗&nbsp;&nbsp;&nbsp;&nbsp;位:</label>
											<div class="layui-input-block">
												<asp:DropDownList ID="ddlDepartment" runat="server" AutoPostBack="True"></asp:DropDownList>
											</div>
										</div>
										<div class="layui-form-item" style="margin-left: 16%; margin-right: 18%">
											<label class="layui-form-label" style="text-align: right">联系方式:</label>
											<div class="layui-input-block">
												<asp:TextBox ID="tbContact" runat="server" required lay-verify="required" placeholder="请输入联系方式" autocomplete="off" CssClass="layui-input" TextMode="Phone"></asp:TextBox>
											</div>
										</div>
										<div class="layui-form-item" style="margin-left: 16%; margin-right: 18%">
											<label class="layui-form-label" style="text-align: right">入职时间:</label>
											<div class="layui-input-block">
												<asp:TextBox ID="tbDate" runat="server" required lay-verify="required" placeholder="请输入入职时间" autocomplete="off" CssClass="layui-input" TextMode="Date"></asp:TextBox>
											</div>
										</div>
										<div class="layui-form-item" style="margin-left: 16%; margin-right: 18%">
											<asp:Button ID="btnSave" runat="server" Text="保存人员信息" CssClass="layui-btn" OnClick="btnSave_Click" />
											<button type="reset" class="layui-btn">重置</button>
										</div>
									</div>

									<!--[新增]公司文档/软件资源-->
									<div class="layui-tab-item">
										
									</div>
								</div>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div style="height:4%; width:100%; position:absolute; bottom:0; left:0; top:96%;">
			<uc2:pagefooter ID="pagefooter" runat="server" />
		</div>
	</form>

	<script src="../layui/layui.js"></script>
	<script>
		//JavaScript代码区域
		layui.use(['form', 'element'], function () {
			var form = layui.form,
				element = layui.element;
		});
	</script>
</body>
</html>
