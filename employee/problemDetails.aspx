<%@ Page Language="C#" AutoEventWireup="true" CodeFile="problemDetails.aspx.cs" Inherits="employee_problemDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>问题详情页</title>
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
			/*text-align:right;
			position:absolute;
			right:1.6%;*/
			line-height:36px;
			padding-left:1.2%;
			font-size:10pt;
		}
	</style>
</head>
<body>
	<form id="form1" runat="server" class="layui-form">
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
			<div class="fly-panel fly-panel-user" style="padding: 1.2%;">
				<blockquote class="layui-elem-quote" style="line-height: 10px!important;">反馈问题详情页</blockquote>
				<div class="layui-tab layui-tab-brief layui-form-pane">
					<div class="layui-form-item">
						<label class="layui-form-label">问题名称:</label>
						<div class="layui-input-block">
							<asp:Label ID="lbProblemName" runat="server" CssClass="lb" Font-Bold="true"></asp:Label>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">所属项目:</label>
						<div class="layui-input-block">
							<asp:Label ID="lbProjectName" runat="server" CssClass="lb"></asp:Label>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">对应任务:</label>
						<div class="layui-input-block">
							<asp:Label ID="lbTaskName" runat="server" CssClass="lb"></asp:Label>
						</div>
					</div>
					<div class="layui-form-item layui-form-text">
						<label class="layui-form-label" style="padding-left:2.1%">问题详情:</label>
						<div class="layui-input-block">
							<asp:Label ID="lbProblemDetails" runat="server" CssClass="layui-textarea"></asp:Label>
						</div>
					</div>
					<div id="showDiv" runat="server" style="display:none">
						<hr class="layui-bg-green" />
						<asp:DataList ID="dlReply" runat="server" RepeatDirection="Vertical">
							<ItemTemplate>
								<div class="layui-form-item">
									<asp:Label ID="lbReplyer" runat="server" CssClass="layui-form-label" Text='<%#Eval("PR_ReplyEmployee") %>'></asp:Label>
									<div class="layui-input-block">
										<asp:Label ID="lbReply" runat="server" TextMode="MultiLine" CssClass="layui-textarea" Text='<%#Eval("PR_ProblemReply") %>'></asp:Label>
									</div>
									<div class="layui-form-text" style="text-align-last:right;">
										<asp:Label ID="lbReplyTime" runat="server" Text='<%#Eval("PR_ReplyTime") %>'></asp:Label>
									</div>
								</div>
							</ItemTemplate>
						</asp:DataList>
					</div>
					<div id="controlDiv" runat="server">
						<hr class="layui-bg-green" />
						<div class="layui-form-item layui-form-text">
							<label class="layui-form-label" style="padding-left: 2.1%">发表回复:</label>
							<div class="layui-input-block">
								<asp:TextBox ID="tbReply" runat="server" TextMode="MultiLine" required lay-verify="required" CssClass="layui-textarea"></asp:TextBox>
							</div>
						</div>
						<div class="layui-form-item">
							<asp:Button ID="btnReply" runat="server" Text="回复" CssClass="layui-btn" OnClick="btnReply_Click" />
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
