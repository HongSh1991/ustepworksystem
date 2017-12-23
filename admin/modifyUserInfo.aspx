<%@ Page Language="C#" AutoEventWireup="true" CodeFile="modifyUserInfo.aspx.cs" Inherits="admin_modifyUserInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	<title>修改员工信息</title>
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
	<base id="baseB" runat="server" target="_self"/>
</head>
<body>
	<form id="form1" runat="server" class="layui-form-pane">
		<div class="site-text site-block">
			<div class="layui-form-item" style="margin-left: 16%; margin-right: 18%; margin-top: 12px;">
				<label class="layui-form-label" style="text-align: right">用户名:</label>
				<div class="layui-input-block">
					<asp:TextBox ID="tbUserName" runat="server" placeholder="请输入用户名" autocomplete="off" CssClass="layui-input"></asp:TextBox>
				</div>
			</div>
			<div class="layui-form-item" style="margin-left: 16%; margin-right: 18%">
				<label class="layui-form-label" style="text-align: right">中文名:</label>
				<div class="layui-input-block">
					<asp:TextBox ID="tbChineseName" runat="server" placeholder="请输入中文名" autocomplete="off" CssClass="layui-input" TextMode="SingleLine"></asp:TextBox>
				</div>
			</div>
			<div class="layui-form-item" style="margin-left: 16%; margin-right: 18%">
				<label class="layui-form-label" style="text-align: right">部门名称:</label>
				<div class="layui-input-block">
					<asp:TextBox ID="tbDepName" runat="server" placeholder="请输入部门名称" autocomplete="off" CssClass="layui-input" TextMode="SingleLine"></asp:TextBox>
				</div>
			</div>
			<div class="layui-form-item" style="margin-left: 16%; margin-right: 18%">
				<label class="layui-form-label" style="text-align: right">项目名称:</label>
				<div class="layui-input-block">
					<asp:TextBox ID="tbProjName" runat="server" placeholder="请输入项目名称" autocomplete="off" CssClass="layui-input" TextMode="SingleLine"></asp:TextBox>
				</div>
			</div>
			<div class="layui-form-item" style="margin-left: 16%; margin-right: 18%">
				<label class="layui-form-label" style="text-align: right">联系方式:</label>
				<div class="layui-input-block">
					<asp:TextBox ID="tbContact" runat="server" placeholder="请输入联系方式" autocomplete="off" CssClass="layui-input" TextMode="Phone"></asp:TextBox>
				</div>
			</div>
			<div class="layui-form-item" style="margin-left: 16%; margin-right: 18%">
				<asp:Button ID="btnUpdate" runat="server" Text="确认修改" CssClass="layui-btn" OnClick="btnUpdate_Click" />
			</div>
		</div>
	</form>
</body>
</html>
