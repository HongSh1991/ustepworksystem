<%@ Page Language="C#" AutoEventWireup="true" CodeFile="employeeAllocation.aspx.cs" Inherits="employee_employeeAllocation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>项目任务分配</title>
	<link rel="stylesheet" href="../res/layui/css/layui.css" type="text/css" />
	<link rel="stylesheet" href="../res/css/global.css" type="text/css" />
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
					<a href="#">
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
						<div class="layui-tab-item layui-show">
							<div style="text-align-last: center; margin-top:-2%">
								test
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
		layui.use('element', function () {
			var $ = layui.jquery
				, element = layui.element;
		});
	</script>
</body>
</html>
