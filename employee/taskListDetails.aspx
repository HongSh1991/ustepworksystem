<%@ Page Language="C#" AutoEventWireup="true" CodeFile="taskListDetails.aspx.cs" Inherits="employee_taskListDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>任务详情</title>
	<link rel="stylesheet" href="../res/layui/css/layui.css" type="text/css" />
	<link rel="stylesheet" href="../res/css/global.css" type="text/css" />
	<style type="text/css">
		.ddl {
			height: 38px;
			width: 190px;
			cursor: pointer;
			color: gray!important;
			text-align: center;
			padding-left: 6px;
			border-right: Gainsboro 1px solid;
			border-top: Gainsboro 1px solid;
			border-left: Gainsboro 1px solid;
			border-bottom: Gainsboro 1px solid;
		}
		.lb{
			text-align:left;
			font-size:10.6pt;
			line-height:12px;
			padding:6.6%;
		}
	</style>
</head>
<body>
	<form id="form1" runat="server">
		<div class="fly-header layui-bg-black">
			<div class="layui-container">
				<div class="layui-logo" style="color: aquamarine; font-size: 2.4em; font-family: 华文行楷; padding-top: 1.2%;">禹步工单系统</div>
				<ul class="layui-nav fly-nav layui-hide-xs">
					<li class="layui-nav-item layui-this"></li>
					<li class="layui-nav-item"></li>
					<li class="layui-nav-item"></li>
				</ul>

				<ul class="layui-nav fly-nav-user">
					<li class="layui-nav-item">
						<a href="javascript:;">
							<img alt="" src="../resources/images/admin.jpg" class="layui-nav-img" />
							<asp:Label ID="lbUserName" runat="server" Text=""></asp:Label>
						</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="employeePage.aspx"><i class="layui-icon">&#xe612;</i>用户中心</a>
							</dd>
							<dd>
								<a href="problemList.aspx"><i class="layui-icon">&#xe63c;</i>反馈汇总</a>
							</dd>
						</dl>
					</li>
					<li class="layui-nav-item">
						<asp:LinkButton ID="lbtnExitSystem" runat="server" OnClick="lbtnExitSystem_Click">退出系统</asp:LinkButton>
					</li>
					<li class="layui-nav-item"></li>
					<li class="layui-nav-item layui-hide-xs"></li>
					<li class="layui-nav-item layui-hide-xs"></li>
				</ul>
			</div>
		</div>

		<div class="layui-container fly-marginTop">
			<div class="fly-panel fly-panel-user" style="height:32px; padding-top:1.2%; padding-left:1.2%;color:#FF5722;">
				任务紧急度星级说明，一星为普通任务，二星为重要任务，三星为最重要任务
			</div>
			<div class="fly-panel fly-panel-user" style="padding: 1.2%;">
				<blockquote class="layui-elem-quote" style="line-height: 10px!important;">任务详情</blockquote>
				<div class="layui-tab layui-tab-brief layui-form-pane">
					<div class="layui-form-item">
						<label class="layui-form-label">任务名称:</label>
						<div class="layui-input-inline">
							<asp:Label ID="lbTaskName" runat="server" Width="172px" CssClass="lb"></asp:Label>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">所属项目:</label>
						<div class="layui-input-inline">
							<asp:Label ID="lbBelongsTo" runat="server" Width="172px" CssClass="lb"></asp:Label>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">任务星级:</label>
						<div class="layui-input-inline">
							<asp:Label ID="lbTaskRate" runat="server" class="layui-icon" Width="172px" Style="font-size: 11pt; color: red; padding: 5.4%;"></asp:Label>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">截止时间:</label>
						<div class="layui-input-inline">
							<asp:Label ID="lbTaskDeadLine" runat="server" Width="172px" CssClass="lb"><%#Eval("{0:yyyy年MM月dd日}") %></asp:Label>
						</div>
					</div>
					<div class="layui-form-item layui-form-text">
						<label class="layui-form-label" style="padding-left:2.1%">任务详细说明:</label>
						<div class="layui-input-block">
							<asp:Label ID="lbTaskDetails" runat="server" CssClass="layui-textarea"></asp:Label>
						</div>
					</div>
					<div id="controlDiv" runat="server">
						<hr class="layui-bg-green" />
						<blockquote class="layui-elem-quote" style="line-height: 10px!important;">暂存任务状态</blockquote>
						<div class="layui-form-item layui-form">
							<label class="layui-form-label">任务状态:</label>
							<div class="layui-input-inline">
								<asp:DropDownList ID="ddlTaskState" runat="server">
									<asp:ListItem>未进行</asp:ListItem>
									<asp:ListItem>进行中</asp:ListItem>
									<asp:ListItem>待审批</asp:ListItem>
								</asp:DropDownList>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">提交时间:</label>
							<div class="layui-input-inline">
								<asp:TextBox ID="tbSubmitTime" runat="server" TextMode="Date" CssClass="layui-input"></asp:TextBox>
							</div>
						</div>
						<div class="layui-form-item layui-form-text">
							<label class="layui-form-label" style="padding-left: 2.1%">状态说明:</label>
							<div class="layui-input-block">
								<asp:TextBox ID="tbTaskStatusState" runat="server" CssClass="layui-textarea" required lay-verify="required"  TextMode="MultiLine" placeholder="填写任务完成情况说明"></asp:TextBox>
							</div>
						</div>
						<div class="layui-form-item">
							<asp:Button ID="btnCommitTaskStatus" runat="server" Text="提交任务状态" CssClass="layui-btn" OnClick="btnCommitTaskStatus_Click" />
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="fly-footer">
			<p>禹步信息 <asp:Label ID="lbTime" runat="server" Text=""></asp:Label> &copy; ustep. All rights reserved.</p>
		</div>
	</form>

	<script src="../layui/layui.js"></script>
	<script>
		layui.use(['form', 'element'], function () {
			var $ = layui.jquery
				, element = layui.element
				, form = layui.form;
		});
	</script>
</body>
</html>
