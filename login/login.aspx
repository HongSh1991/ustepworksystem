<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login_login" %>
<%@ Register Src="~/userascx/loginheader.ascx" TagName="loginheader" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	<title>用户登入</title>
	<link rel="stylesheet" href="../layui/css/layui.css" type="text/css" />
	<link rel="stylesheet" href="../layui/css/global.css" type="text/css" />
</head>
<body>
	<div class="fly-header layui-bg-black">
		<div class="layui-container">
			<a class="fly-logo" href="/">
				<%--<img src="../../res/images/logo.png" alt="layui">--%>
			</a>
			<ul class="layui-nav fly-nav layui-hide-xs">
				<li class="layui-nav-item layui-this">
					<%--<a href="/"><i class="iconfont icon-jiaoliu"></i>交流</a>--%>
				</li>
				<li class="layui-nav-item">
					<%--<a href="../case/case.html"><i class="iconfont icon-iconmingxinganli"></i>案例</a>--%>
				</li>
				<li class="layui-nav-item">
					<%--<a href="http://www.layui.com/" target="_blank"><i class="iconfont icon-ui"></i>框架</a>--%>
				</li>
			</ul>

			<ul class="layui-nav fly-nav-user">
				<!-- 未登入的状态 -->
				<li class="layui-nav-item">
					<a class="iconfont icon-touxiang layui-hide-xs" href="user/login.html"></a>
				</li>
				<li class="layui-nav-item">
					<a href="user/login.html">登入</a>
				</li>
				<li class="layui-nav-item">
					<a href="user/reg.html">注册</a>
				</li>
				<li class="layui-nav-item layui-hide-xs">
					<a href="/app/qq/" onclick="layer.msg('正在通过QQ登入', {icon:16, shade: 0.1, time:0})" title="QQ登入" class="iconfont icon-qq"></a>
				</li>
				<li class="layui-nav-item layui-hide-xs">
					<a href="/app/weibo/" onclick="layer.msg('正在通过微博登入', {icon:16, shade: 0.1, time:0})" title="微博登入" class="iconfont icon-weibo"></a>
				</li>
			</ul>
		</div>
	</div>

	<div class="layui-container fly-marginTop">
		<div class="fly-panel fly-panel-user" pad20>
			<div class="layui-tab layui-tab-brief" lay-filter="user">
				<ul class="layui-tab-title">
					<li class="layui-this">登入</li>
				</ul>
				<div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
					<div class="layui-tab-item layui-show">
						<div class="layui-form layui-form-pane">
							<form id="form1" runat="server">
								<div class="layui-form-item">
									<label class="layui-form-label" style="font-size: 11pt">用户名:</label>
									<div class="layui-input-inline">
										<asp:TextBox ID="tbUserName" TextMode="SingleLine" runat="server" placeholder="请输入用户名" required lay-verify="required" autocomplete="off" CssClass="layui-input" Width="240px" BorderColor="LightGray"></asp:TextBox>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label" style="font-size: 11pt">密&nbsp;&nbsp;&nbsp;&nbsp;码:</label>
									<div class="layui-input-inline">
										<asp:TextBox ID="tbPassWord" TextMode="Password" runat="server" placeholder="请输入密码" required lay-verify="required" autocomplete="off" CssClass="layui-input" Width="240px" BorderColor="LightGrey"></asp:TextBox>
									</div>
								</div>
								<div class="layui-input-block">
									<asp:Button ID="btnSubmit" runat="server" Text="登    录" CssClass="layui-btn buttonSty" Font-Size="11pt" lay-filter="formDemo" Width="350px" OnClick="btnSubmit_Click" />
								</div>
								<div align="left" class="layui-form-item" style="margin-left: 24.8%">
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
		<p><a href="http://fly.layui.com/" target="_blank">Fly社区</a> 2017 &copy; <a href="http://www.layui.com/" target="_blank">layui.com 出品</a></p>
		<p>
			<a href="http://fly.layui.com/jie/3147/" target="_blank">付费计划</a>
			<a href="http://www.layui.com/template/fly/" target="_blank">获取Fly社区模版</a>
			<a href="http://fly.layui.com/jie/2461/" target="_blank">微信公众号</a>
		</p>
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
