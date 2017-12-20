<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login_login" %>
<%@ Register Src="~/userascx/loginheader.ascx" TagName="loginheader" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	<title>用户登入</title>
	<link rel="stylesheet" href="../layui/css/layui.css" type="text/css" />
	<link rel="stylesheet" href="../res/layui/css/layui.css" type="text/css" />
	<link rel="stylesheet" href="../res/css/global.css" type="text/css" />
</head>
<body>
	<div class="fly-header layui-bg-black">
		<div class="layui-container">
			<div class="layui-logo" style="color:aquamarine; font-size:2.4em; font-family:华文行楷; padding-top:1.2%;">禹步工单系统</div>
			<ul class="layui-nav fly-nav layui-hide-xs">
				<li class="layui-nav-item layui-this"></li>
				<li class="layui-nav-item"></li>
				<li class="layui-nav-item"></li>
			</ul>

			<ul class="layui-nav fly-nav-user">
				<!-- 未登入的状态 -->
				<li class="layui-nav-item">
					<a class="iconfont icon-touxiang layui-hide-xs" href="login.aspx"></a>
				</li>
				<li class="layui-nav-item">
					<a href="login.aspx">登入</a>
				</li>
				<li class="layui-nav-item"></li>
				<li class="layui-nav-item layui-hide-xs"></li>
				<li class="layui-nav-item layui-hide-xs"></li>
			</ul>
		</div>
	</div>

	<div class="layui-container fly-marginTop">
		<div class="fly-panel fly-panel-user" pad20 style="padding-left:34%; padding-right:36.2%">
			<div class="layui-tab layui-tab-brief" lay-filter="user">
				<ul class="layui-tab-title">
					<li class="layui-this">禹步工单入口</li>
				</ul>
				<div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
					<div class="layui-tab-item layui-show">
						<div class="layui-form layui-form-pane">
							<form id="form1" runat="server">
								<div class="layui-form-item">
									<label for="L_email"  class="layui-form-label" style="font-size: 11pt">用户名:</label>
									<div class="layui-input-inline">
										<asp:TextBox ID="tbUserName" TextMode="SingleLine" runat="server" placeholder="请输入用户名" required lay-verify="required" autocomplete="off" CssClass="layui-input" Width="240px" BorderColor="LightGray"></asp:TextBox>
									</div>
								</div>
								<div class="layui-form-item">
									<label for="L_pass" class="layui-form-label" style="font-size: 11pt">密&nbsp;&nbsp;&nbsp;&nbsp;码:</label>
									<div class="layui-input-inline">
										<asp:TextBox ID="tbPassWord" TextMode="Password" runat="server" placeholder="请输入密码" required lay-verify="required" autocomplete="off" CssClass="layui-input" Width="240px" BorderColor="LightGrey"></asp:TextBox>
									</div>
								</div>
								<div class="layui-form-item">
									<asp:Button ID="btnSubmit" runat="server" Text="登    录" CssClass="layui-btn buttonSty" Font-Size="11pt" lay-filter="formDemo" Width="350px" OnClick="btnSubmit_Click" />
								</div>
								<div class="layui-form-item">
									<asp:Label ID="lbAlert" runat="server" ForeColor="LightGray">Tips: 如果忘记密码，请联系管理员</asp:Label>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="fly-footer">
		<p>禹步信息 <asp:Label ID="lbTime" runat="server" Text=""></asp:Label> &copy; ustep. All rights reserved.</p>
	</div>
	<script src="layui/layui.js"></script>
	<script>
		//JavaScript代码区域
		layui.use(['layer', 'form', 'element'], function () {
			var layer = layui.layer,
				form = layui.form,
				element = layui.element;

			//监听提交
			form.on('submit(formDemo)', function (data) {
				layer.msg(JSON.stringify(data.field));
				return false;
			});
		});

		layui.cache.page = 'user';
	</script>
</body>
</html>
