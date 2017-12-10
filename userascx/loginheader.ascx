<%@ Control Language="C#" AutoEventWireup="true" CodeFile="loginheader.ascx.cs" Inherits="userascx_loginheader" %>

<script src="../Resources/Common/js/jquery-1.12.3.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="../layui/css/layui.css" />

<div style="width:100%">
	<div style="margin-top: 0; position: absolute; top: 0px; left: 0px; width:100%;">
		<table style="width:100%;">
			<tr>
				<td style="width: 100%;">
					<img alt="" src="../resources/images/header.png" />
				</td>
			</tr>
		</table>
	</div>
	<ul class="layui-nav layui-header" style="width: 100%; margin-top:135px; background-color:#2F4056; font-size:larger">
		<li class="layui-nav-item" style="position:absolute; right:2%; top:11%; font-size:12pt;">
			北京时间 <asp:Label ID="lbYear" runat="server"></asp:Label>年<asp:Label ID="lbMonth" runat="server"></asp:Label>月<asp:Label ID="lbDay" runat="server"></asp:Label>日 <asp:Label ID="lbWeekDay" runat="server"></asp:Label>
		</li>
	</ul>
</div>