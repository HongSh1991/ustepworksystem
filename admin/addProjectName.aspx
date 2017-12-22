<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addProjectName.aspx.cs" Inherits="admin_addProjectName" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	<title>添加项目名称</title>
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
	<script src="../res/js/jquery-1.12.3-min.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$('#tbFilesPath').click(function () {
				$('#<%=fuFiles.ClientID %>').click();
			});
			//修改出现C:\fakepath\,使用internet选项--安全--自定义级别--将文件上载到服务器时包含本地目录路径..--点上启用
			$('#<%=fuFiles.ClientID %>').change(function () {
				$('#<%=tbFilesPath.ClientID %>').val($('#<%=fuFiles.ClientID %>').val());
			});
		});
	</script>
</head>
<body>
	<form id="form1" runat="server" class="layui-form-pane">
		<div class="site-text site-block">
			<div class="layui-form-item" style="margin-left: 16%; margin-right: 16%; margin-top: 12px;">
				<label class="layui-form-label" style="text-align: right">项目名称:</label>
				<div class="layui-input-block">
					<asp:TextBox ID="tbProjectName" runat="server" required lay-verify="required"  placeholder="请输入项目名称" autocomplete="off" CssClass="layui-input"></asp:TextBox>
				</div>
			</div>
			<div class="layui-form-item" style="margin-left: 16%; margin-right: 16%;">
				<label class="layui-form-label" style="text-align: right">文档路径:</label>
				<div class="layui-input-block">
					<asp:FileUpload ID="fuFiles" runat="server" />
					<asp:TextBox ID="tbFilesPath" runat="server" autocomplete="off" CssClass="layui-input"></asp:TextBox>
					<%--<input id="btnReadFiles" type="button" value="浏览..." class="layui-btn" />--%>
				</div>
			</div>
			<div class="layui-form-item" style="margin-left: 16%; margin-right: 16%;">
				<asp:Button ID="btnSave" runat="server" Text="添加项目信息" CssClass="layui-btn" Width="310px" OnClick="btnSave_Click" />
				<asp:Label ID="lbShowTips" runat="server" Text="" ForeColor="Red"></asp:Label>
			</div>
		</div>
	</form>
</body>
</html>
