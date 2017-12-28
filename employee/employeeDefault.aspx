<%@ Page Language="C#" AutoEventWireup="true" CodeFile="employeeDefault.aspx.cs" Inherits="employee_employeeDefault" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>我的主页</title>
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
			text-align:right;
			position:absolute;
			right:1.6%;
			font-size:9pt;
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

		<div class="layui-container fly-marginTop">
			<div class="fly-panel fly-panel-user" style="height:32px; padding-top:1.2%; padding-left:1.2%">
				此页面工单列表包含正常任务，系统Bug，临时加急任务等
			</div>
			<div class="fly-panel fly-panel-user" style="padding: 1.2%;">
				<blockquote class="layui-elem-quote" style="line-height: 10px!important;">个人工单列表</blockquote>
				<div class="layui-tab layui-tab-brief">
					<asp:GridView ID="gvTaskList" runat="server" OnPageIndexChanging="gvTaskList_PageIndexChanging" OnRowDataBound="gvTaskList_RowDataBound" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" ShowHeader="false" CssClass="layui-table" RowStyle-BorderStyle="Dashed" RowStyle-BorderWidth="1.6">
						<Columns>
							<asp:TemplateField HeaderText="序号" ItemStyle-Width="4.2%">
								<ItemStyle HorizontalAlign="Center" />
								<HeaderStyle HorizontalAlign="Center" Width="4.2%" />
							</asp:TemplateField>
							<asp:TemplateField HeaderText="任务名称/截止日期">
								<ItemTemplate>
									<a href="taskListDetails.aspx?taskname=<%#Eval("PM_TaskName") %>">
										<asp:Label ID="lbtasklist" runat="server" Text='<%#Eval("PM_TaskName") %>'></asp:Label>&nbsp;&nbsp;
										<asp:Label ID="lbfont" runat="server" class="layui-icon" style="font-size:8pt; color:red;" Text=""></asp:Label>
									</a>
									<asp:Label ID="lbDeadLine" runat="server" CssClass="lb">截止日期:<%#Eval("PM_DeadLine","{0:yyyy-MM-dd}") %></asp:Label>
								</ItemTemplate>
							</asp:TemplateField>
							<%--<asp:BoundField DataField="PM_TaskName" HeaderText="任务名称" />
							<asp:BoundField DataField="PM_DeadLine" HeaderText="截止日期" DataFormatString="{0:yyyy-MM-dd}" />--%>
						</Columns>
						<HeaderStyle />
						<RowStyle Height="42px" />
					</asp:GridView>
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
