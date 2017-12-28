<%@ Page Language="C#" AutoEventWireup="true" CodeFile="projectChargerCheck.aspx.cs" Inherits="employee_projectChargerCheck" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>项目任务审批</title>
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
								<a href="#"><i class="layui-icon">&#xe63c;</i>反馈汇总</a>
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
				<li class="layui-nav-item">
					<a href="employeeAllocation.aspx">
						<i class="layui-icon">&#xe63c;</i>
						项目任务分配 / 进度
					</a>
				</li>
				<li class="layui-nav-item layui-this">
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
				<blockquote class="layui-elem-quote" style="line-height: 10px!important;">项目任务审批</blockquote>
				<div class="layui-tab layui-tab-brief">
					<ul class="layui-tab-title">
						<li class="layui-this">待审批任务列表</li>
					</ul>
					<div class="layui-tab-content" style="padding: 20px 0;">
						<div class="layui-form layui-form-pane layui-tab-item layui-show">
							<div style="margin-top: -1%; text-align-last:center">
								<asp:GridView ID="gvApprovalList" runat="server" OnPageIndexChanging="gvApprovalList_PageIndexChanging" OnRowDataBound="gvApprovalList_RowDataBound" OnRowCommand="gvApprovalList_RowCommand" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" CssClass="layui-table" ShowHeaderWhenEmpty="true">
									<Columns>
										<asp:TemplateField HeaderText="序号" ItemStyle-Width="6.8%">
											<ItemStyle HorizontalAlign="Center" />
											<HeaderStyle HorizontalAlign="Center" Width="6.8%" />
										</asp:TemplateField>
										<asp:BoundField DataField="TS_TaskName" HeaderText="任务名称" />
										<asp:BoundField DataField="TS_ProjectName" HeaderText="项目名称" />
										<asp:TemplateField HeaderText="审批任务" ItemStyle-Width="12%">
											<ItemTemplate>
												<asp:ImageButton ID="ImageButton0" runat="server" ImageUrl="~/resources/images/approval.png" Height="21" Width="21" CommandName="Approval" CommandArgument='<%#Eval("TS_TaskName") %>'></asp:ImageButton>
											</ItemTemplate>
											<ItemStyle HorizontalAlign="Center" />
											<HeaderStyle HorizontalAlign="Center" Width="12%" />
										</asp:TemplateField>
									</Columns>
									<HeaderStyle HorizontalAlign="Center" BackColor="#f2f2f2" ForeColor="black" Height="32px" />
									<RowStyle HorizontalAlign="Center" Height="32px" />
								</asp:GridView>
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
