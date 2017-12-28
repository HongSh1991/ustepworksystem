<%@ Page Language="C#" AutoEventWireup="true" CodeFile="approvalDialog.aspx.cs" Inherits="employee_approvalDialog" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>任务审批</title>
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
				<label class="layui-form-label">任务名称</label>
				<div class="layui-input-inline">
					<asp:Label ID="lbTaskName" runat="server"></asp:Label>
				</div>
			</div>
			<div class="layui-form-item" style="margin-left: 16%; margin-right: 16%; margin-top: 12px;">
				<label class="layui-form-label">所属项目</label>
				<div class="layui-input-inline">
					<asp:Label ID="lbProjectName" runat="server"></asp:Label>
				</div>
			</div>
			<div class="layui-form-item" style="margin-left: 16%; margin-right: 16%;">
				<label class="layui-form-label">员工姓名</label>
				<div class="layui-input-inline">
					<asp:Label ID="lbTaskEmployee" runat="server"></asp:Label>
				</div>
			</div>
			<div class="layui-form-item" style="margin-left: 16%; margin-right: 16%; margin-top: 12px;">
				<label class="layui-form-label">完成时间</label>
				<div class="layui-input-inline">
					<asp:Label ID="lbFinishedTime" runat="server"></asp:Label>
				</div>
			</div>
			<div class="layui-form-item layui-form-text" style="margin-left: 16%; margin-right: 16%;">
				<label class="layui-form-label">进度说明</label>
				<div class="layui-input-inline">
					<asp:Label ID="lbTaskProgressState" runat="server" CssClass="layui-textarea"></asp:Label>
				</div>
			</div>
			<div class="layui-form-item" style="margin-left: 16%; margin-right: 16%;">
				<label class="layui-form-label">是否通过</label>
				<div class="layui-input-inline">
					<asp:DropDownList ID="ddlPass" runat="server" CssClass="layui-input ddl">
						<asp:ListItem Value="0" Text="请选择"></asp:ListItem>
						<asp:ListItem Value="1" Text="通过"></asp:ListItem>
						<asp:ListItem Value="2" Text="不通过"></asp:ListItem>
					</asp:DropDownList>
				</div>
			</div>
			<div class="layui-form-item" style="margin-left: 16%; margin-right: 16%;">
				<asp:Button ID="btnApproval" runat="server" Text="审批任务" CssClass="layui-btn" OnClick="btnApproval_Click" />
			</div>
		</div>
	</form>
</body>
</html>
