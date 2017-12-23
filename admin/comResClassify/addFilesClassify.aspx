<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addFilesClassify.aspx.cs" Inherits="admin_comResClassify_addFilesClassify" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	<title>新增文件分类</title>
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
			width: 202px;
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
			<div class="layui-form-item" style="margin-left: 16%; margin-right: 16%; margin-top: 12px;">
				<label class="layui-form-label" style="text-align: right">文件分类:</label>
				<div class="layui-input-block">
					<asp:TextBox ID="tbAddFilesClassify" runat="server" required lay-verify="required" placeholder="请输入文件分类名称" autocomplete="off" CssClass="layui-input"></asp:TextBox>
				</div>
			</div>
			<div class="layui-form-item" style="margin-left: 16%; margin-right: 16%;">
				<asp:Button ID="btnAddFilesClassify" runat="server" Text="添加文件分类" CssClass="layui-btn" Width="310px" OnClick="btnAddFilesClassify_Click" />
			</div>
		</div>
	</form>
</body>
</html>
