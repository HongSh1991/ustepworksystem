<%@ Page Language="C#" AutoEventWireup="true" CodeFile="projManagerPage.aspx.cs" Inherits="projectmanager_projManagerPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	<title>欢迎你，项目经理</title>
	<link rel="stylesheet" href="../res/layui/css/layui.css" type="text/css" />
	<link rel="stylesheet" href="../res/css/global.css" type="text/css" />
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

		<div class="fly-panel fly-column">
			<div class="layui-container">
				<div class="fly-column-left layui-hide-xs" style="padding-left:1%; font-size:11pt; font-weight:500;">
					<a href="#" style="color:#009688;"><i class="layui-icon">&#xe612;</i>&nbsp;&nbsp;项目经理</a>
				</div>
				<div class="layui-hide-sm layui-show-xs-block" style="margin-top: -10px; padding-bottom: 10px; text-align: center;">
					<a href="#"><i class="layui-icon">&#xe612;</i>项目经理</a>
				</div>
				<ul class="layui-clear"></ul>
			</div>
		</div>

		<div class="layui-container fly-marginTop">
			<div class="fly-panel fly-panel-user" style="padding:1.2%;">
				<blockquote class="layui-elem-quote" style="line-height:10px!important; text-align:right!important;">项目列表</blockquote>
				<div style="text-align-last:center">
					<asp:GridView ID="gvProjectList" runat="server" OnPageIndexChanging="gvProjectList_PageIndexChanging" OnRowDataBound="gvProjectList_RowDataBound" OnRowCommand="gvProjectList_RowCommand" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" CssClass="layui-table">
						<Columns>
							<asp:TemplateField HeaderText="序号" ItemStyle-Width="5.4%">
								<ItemStyle HorizontalAlign="Center" />
								<HeaderStyle HorizontalAlign="Center" Width="5.4%" />
							</asp:TemplateField>
							<asp:BoundField DataField="U_ProjectName" HeaderText="项目名称" />
							<asp:TemplateField HeaderText="下载" ItemStyle-Width="5.4%">
								<ItemTemplate>
									<asp:ImageButton ID="ImageButton0" runat="server" ImageUrl="~/resources/images/download.png" Height="21" Width="21" CommandName="Dl" CommandArgument='<%#Eval("U_ProjectName") %>'></asp:ImageButton>
								</ItemTemplate>
								<ItemStyle HorizontalAlign="Center" />
								<HeaderStyle HorizontalAlign="Center" Width="5.4%" />
							</asp:TemplateField>
						</Columns>
						<HeaderStyle HorizontalAlign="Center" BackColor="#f2f2f2" ForeColor="black" Height="42px" />
						<RowStyle HorizontalAlign="Center" Height="50px" />
					</asp:GridView>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
