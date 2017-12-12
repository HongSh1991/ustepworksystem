﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addEmployeeInfo.aspx.cs" Inherits="admin_addEmployeeInfo" %>

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
<body>
	<form id="form1" runat="server" class="layui-form layui-form-pane">
		<div class="site-text site-block">
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
	</form>
</body>
</html>
