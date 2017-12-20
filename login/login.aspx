<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login_login" %>
<%@ Register Src="~/userascx/loginheader.ascx" TagName="loginheader" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	<title></title>
	<link rel="stylesheet" href="../layui/css/layui.css" type="text/css" />
	<link rel="stylesheet" href="../StyleSheet.css" type="text/css" />
	<style type="text/css">
		.bodySty {
			background-image: url("../resources/images/bgLogin2.png");
			background-repeat: repeat;
		}

		.tableSty {
			border: 1px solid #696;
			padding: 60px 0;
			text-align: center;
			width: 72%;
			-webkit-border-radius: 8px;
			-moz-border-radius: 8px;
			border-radius: 8px;
			-webkit-box-shadow: #666 0px 0px 10px;
			-moz-box-shadow: #666 0px 0px 10px;
			box-shadow: #666 0px 0px 10px;
			background: #2F4056;
			behavior: url(/PIE.htc);
		}
		.buttonSty
		{
			font-size:11pt;
		}
	</style>
</head>
<body class="bodySty" style=" margin:auto; overflow-x:hidden;">
	<form id="form1" runat="server" class="layui-form-pane">
		<div style="height:21%; width:100%; margin-top:0px;">
			<uc1:loginheader ID="loginheader" runat="server" />
		</div>
		<div style="margin-top:14%; height:86%; width:100%;">
			<table class="tableSty" align="center" valign="middle" style="width:42%; margin-top:3.2%; height:86%;">
				<tr>
					<td style="width:100%; height:100%;">
						<div class="layui-form-item" style="height:160px;">
							<div style="height:72px;"></div>
							<span style="font-size:3.2em; font-family:华文新魏; font-weight:900; color:#fff">禹步工单系统入口</span>
						</div>
						<div class="layui-form-item" style="margin-left:25%;">
							<label class="layui-form-label" style="font-size:11pt">用户名:</label>
							<div class="layui-input-inline">
								<asp:TextBox ID="tbUserName" TextMode="SingleLine" runat="server" placeholder="请输入用户名" required lay-verify="required" autocomplete="off" CssClass="layui-input" Width="240px" BorderColor="LightGray" ></asp:TextBox>
							</div>
						</div>
						<div class="layui-form-item" style="margin-left:25%;">
							<label class="layui-form-label" style="font-size:11pt">密&nbsp;&nbsp;&nbsp;&nbsp;码:</label>
							<div class="layui-input-inline">
								<asp:TextBox ID="tbPassWord" TextMode="Password" runat="server" placeholder="请输入密码" required lay-verify="required" autocomplete="off" CssClass="layui-input" Width="240px" BorderColor="LightGrey" ></asp:TextBox>
							</div>
						</div>
						<div class="layui-form-item" style="margin-right:13.6%">
							<div class="layui-input-block">
								<asp:Button ID="btnSubmit" runat="server" Text="登    录" CssClass="layui-btn buttonSty" Font-Size="11pt" lay-filter="formDemo" Width="350px" OnClick="btnSubmit_Click" />
							</div>
						</div>
						<div align="left" class="layui-form-item" style="margin-left:24.8%">
							<asp:Label ID="lbAlert" runat="server" ForeColor="LightGray">Tips: 如果忘记密码，请联系管理员</asp:Label>
						</div>
						<%--<div class="layui-form-item">
							<div class="layui-input-block">
								<button type="reset" class="layui-btn" style="width:340px" >重    置</button>
							</div>
						</div>--%>
						<div style="height:96px;"></div>
					</td>
				</tr>
			</table>
		</div>
	</form>

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
	</script>
</body>
</html>
