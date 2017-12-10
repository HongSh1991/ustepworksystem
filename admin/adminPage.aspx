<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminPage.aspx.cs" Inherits="admin_adminPage" %>
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

		a:link {
			color: deepskyblue;
		}
		/* 未被访问的链接 */
		a:visited {
			color: deepskyblue;
		}
		/* 已被访问的链接 */
		a:hover {
			color: #ff6a00;
		}
		/* 鼠标指针移动到链接上 */
		a:active {
			color: darkorchid;
		}
		/* 正在被点击的链接 */
	</style>
</head>
<body style="overflow-x:hidden; overflow-y:auto; margin:auto">
	<form id="form1" runat="server" class="layui-form-pane">
		<div style="height:16%; width:100%; margin-top:0px;">
			<uc1:adminheader ID="adminheader" runat="server" />
		</div>
		<div class="layui-body" style="height:100%; width:100%">
			<table>
				<tr>
					<td>
						
					</td>
				</tr>
			</table>
		</div>
		<div class="layui-footer" style="height:4%; width:100%">
			<uc2:pagefooter ID="pagefooter" runat="server" />
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
