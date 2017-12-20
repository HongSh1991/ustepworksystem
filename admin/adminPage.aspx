<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminPage.aspx.cs" MaintainScrollPositionOnPostback="true" Inherits="admin_adminPage" %>
<%@ Register Src="~/userascx/adminheader.ascx" TagName="adminheader" TagPrefix="uc1" %>
<%@ Register Src="~/userascx/pagefooter.ascx" TagName="pagefooter" TagPrefix="uc2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	<title></title>
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
			width: 190px;
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
</head>
<body class="layui-layout-body">
	<form id="form1" runat="server" class="layui-form layui-form-pane">
		<div class="layui-layout layui-layout-admin">
			<div class="layui-header">
				<div class="layui-logo">禹步工单系统</div>
				<!-- 头部区域（可配合layui已有的水平导航） -->
				<ul class="layui-nav layui-layout-left">
					<li class="layui-nav-item"><a href="">控制台</a></li>
					<li class="layui-nav-item"><a href="">商品管理</a></li>
					<li class="layui-nav-item"><a href="">用户</a></li>
					<li class="layui-nav-item">
						<a href="javascript:;">其它系统</a>
						<dl class="layui-nav-child">
							<dd><a href="">邮件管理</a></dd>
							<dd><a href="">消息管理</a></dd>
							<dd><a href="">授权管理</a></dd>
						</dl>
					</li>
				</ul>
				<ul class="layui-nav layui-layout-right">
					<li class="layui-nav-item">
						<a href="javascript:;">
							<img src="http://t.cn/RCzsdCq" class="layui-nav-img">
							贤心
						</a>
						<dl class="layui-nav-child">
							<dd><a href="">基本资料</a></dd>
							<dd><a href="">安全设置</a></dd>
						</dl>
					</li>
					<li class="layui-nav-item"><a href="">退了</a></li>
				</ul>
			</div>

			<div class="layui-side layui-bg-black">
				<div class="layui-side-scroll">
					<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
					<ul class="layui-nav layui-nav-tree" lay-filter="test">
						<li class="layui-nav-item layui-nav-itemed">
							<a class="" href="javascript:;">所有商品</a>
							<dl class="layui-nav-child">
								<dd><a href="javascript:;">列表一</a></dd>
								<dd><a href="javascript:;">列表二</a></dd>
								<dd><a href="javascript:;">列表三</a></dd>
								<dd><a href="">超链接</a></dd>
							</dl>
						</li>
						<li class="layui-nav-item">
							<a href="javascript:;">解决方案</a>
							<dl class="layui-nav-child">
								<dd><a href="javascript:;">列表一</a></dd>
								<dd><a href="javascript:;">列表二</a></dd>
								<dd><a href="">超链接</a></dd>
							</dl>
						</li>
						<li class="layui-nav-item"><a href="">云市场</a></li>
						<li class="layui-nav-item"><a href="">发布商品</a></li>
					</ul>
				</div>
			</div>
		
	</form>

	<script src="../layui/layui.js"></script>
	<script>
		//JavaScript代码区域
		layui.use(['form', 'element'], function () {
			var form = layui.form,
				element = layui.element;
		});
	</script>
</body>
</html>
