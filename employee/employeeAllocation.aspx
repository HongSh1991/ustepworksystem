<%@ Page Language="C#" AutoEventWireup="true" CodeFile="employeeAllocation.aspx.cs" Inherits="employee_employeeAllocation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>项目任务分配</title>
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
	</style>
</head>
<body>
	<form id="form1" runat="server" class="layui-form-pane">
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

		<div class="layui-container fly-marginTop fly-user-main">
			<ul class="layui-nav layui-nav-tree layui-inline">
				<li class="layui-nav-item">
					<a href="employeeDefault.aspx">
						<i class="layui-icon">&#xe68e;</i>
						我的主页
					</a>
				</li>
				<li class="layui-nav-item">
					<a href="employeePage.aspx">
						<i class="layui-icon">&#xe612;</i>
						用户中心
					</a>
				</li>
				<li class="layui-nav-item layui-this">
					<a href="employeeAllocation.aspx">
						<i class="layui-icon">&#xe63c;</i>
						项目任务分配 / 进度
					</a>
				</li>
				<li class="layui-nav-item">
					<a href="projectChargerCheck.aspx">
						<i class="layui-icon">&#x1005;</i>
						任务审批
					</a>
				</li>
				<li class="layui-nav-item">
					<a href="employeeBack.aspx">
						<i class="layui-icon">&#xe63a;</i>
						项目反馈
					</a>
				</li>
			</ul>

			<div class="site-tree-mobile layui-hide">
				<i class="layui-icon">&#xe602;</i>
			</div>
			<div class="site-mobile-shade"></div>

			<div class="site-tree-mobile layui-hide">
				<i class="layui-icon">&#xe602;</i>
			</div>
			<div class="site-mobile-shade"></div>


			<div class="fly-panel fly-panel-user" style="padding: 1.2%;">
				<blockquote class="layui-elem-quote" style="line-height: 10px!important;">项目任务分配 / 进度</blockquote>
				<div class="layui-tab layui-tab-brief">
					<ul class="layui-tab-title">
						<li class="layui-this">项目任务分配</li>
						<li>项目进度</li>
					</ul>
					<div class="layui-tab-content" style="padding: 20px 0;">
						<div class="layui-form layui-form-pane layui-tab-item layui-show">
							<div style="margin-top: -1%">
								<div class="layui-form-item">
									<label class="layui-form-label">项目名称</label>
									<div class="layui-input-inline">
										<asp:DropDownList ID="ddlProjectName" runat="server" CssClass="ddl" ForeColor="Gray"></asp:DropDownList>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">任务名称</label>
									<div class="layui-input-inline">
										<asp:TextBox ID="tbTaskName" runat="server" placeholder="请填写任务名称" CssClass="layui-input"></asp:TextBox>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">任务紧急度</label>
									<div class="layui-input-inline">
										<asp:DropDownList ID="ddlTaskRate" runat="server"></asp:DropDownList>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">指派给</label>
									<div class="layui-input-inline" style="line-height:36px">
										<asp:DropDownList ID="ddlAssginEmployee" runat="server" CssClass="ddl" ForeColor="Gray"></asp:DropDownList>
										<%--<asp:CheckBoxList ID="cblEmployee" runat="server" RepeatDirection="Horizontal" CellPadding="4" RepeatColumns="6" RepeatLayout="Table" TextAlign="Right"></asp:CheckBoxList>--%>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">完成时间</label>
									<div class="layui-input-inline">
										<asp:TextBox ID="tbDeadLine" runat="server" TextMode="Date" CssClass="layui-input"></asp:TextBox>
									</div>
								</div>
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label" style="padding-left:2.6%">任务详情</label>
									<div class="layui-input-block">
										<asp:TextBox ID="tbTaskDetails" runat="server" placeholder="填写对项目任务的一些说明~" TextMode="MultiLine" CssClass="layui-textarea"></asp:TextBox>
									</div>
								</div>
								<div class="layui-form-item">
									<asp:Button ID="btnAssignTask" runat="server" Text="指派任务" CssClass="layui-btn" OnClick="btnAssignTask_Click" />
								</div>
							</div>
						</div>
						<div class="layui-tab-item">
							<div style="text-align-last: center; margin-top:-2%">
								test1
							</div>
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
