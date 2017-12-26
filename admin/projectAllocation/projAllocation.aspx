<%@ Page Language="C#" AutoEventWireup="true" CodeFile="projAllocation.aspx.cs" Inherits="admin_projectAllocation_projAllocation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	<title>项目分配</title>
	<link rel="stylesheet" href="../../layui/css/layui.css" type="text/css" />
	<link rel="stylesheet" href="../../StyleSheet.css" type="text/css" />
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
		<div class="layui-form-item" style="margin-left: 16%; margin-right: 16%; margin-top:32px;">
			<label class="layui-form-label">项目名称</label>
			<div class="layui-input-block">
				<asp:DropDownList ID="ddlProjectName" runat="server" CssClass="ddl"></asp:DropDownList>
			</div>
		</div>
		<div class="layui-form-item" style="margin-left: 16%; margin-right: 16%;">
			<label class="layui-form-label">项目负责人</label>
			<div class="layui-input-block">
				<asp:DropDownList ID="ddlProjectCharge" runat="server" CssClass="ddl"></asp:DropDownList>
			</div>
		</div>
		<div class="layui-form-item layui-form-text" style="margin-left: 16%; margin-right: 16%;">
			<label class="layui-form-label">项目说明</label>
			<div class="layui-input-block">
				<asp:TextBox ID="tbProjectTips" runat="server" placeholder="填写对项目的一些说明~" TextMode="MultiLine" CssClass="layui-textarea"></asp:TextBox>
			</div>
		</div>
		<div class="layui-form-item" style="margin-left: 16%; margin-right: 16%;"><%--style="margin-left: 16%; margin-right: 16%;"--%>
			<asp:Button ID="btnSave" runat="server" Text="确认分配项目" CssClass="layui-btn" OnClick="btnSave_Click" />
			<asp:Label ID="lbShowTips" runat="server" Text="" ForeColor="Red"></asp:Label>
		</div>
	</form>
</body>
</html>
