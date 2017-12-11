<%@ Control Language="C#" AutoEventWireup="true" CodeFile="adminheader.ascx.cs" Inherits="userascx_adminheader" %>

<script src="../Resources/Common/js/jquery-1.12.3.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="../layui/css/layui.css" />
<style type="text/css">
	.linkbutton{
		margin-left:0%;
		column-width:32px;
		text-decoration:none;
	}
</style>

<div>
	<div style="margin-top: 0; position: absolute; top: 0px; left: 0px;">
		<table>
			<tr>
				<td style="width: 100%;">
					<img alt="" src="../resources/images/header.png" />
				</td>
			</tr>
		</table>
	</div>
	<ul class="layui-nav layui-header" style="width: 100%; margin-top:135px; background-color:#2F4056; font-size:larger">
		<li class="layui-nav-item" style="position:absolute; left:2%; top:8%; font-size:12pt">
			禹步工单系统
		</li>
		<%--<li class="layui-nav-item" style="position:absolute; right:11.5%; top:10%; ">
			<asp:Label ID="lbTips" runat="server" ForeColor="white" Font-Size="11.4pt"></asp:Label>
		</li>--%>
		<li class="layui-nav-item" style="position:absolute; right:4.5%; top:10%; margin-right:1.1%;">
			<asp:LinkButton ID="lbtnUserManager" runat="server" Font-Size="11.4pt" CssClass="linkbutton" OnClick="lbtnUserManager_Click">人员管理</asp:LinkButton>
		</li>
		<li class="layui-nav-item" style="position:absolute; right:0.5%; top:10%;">
			<asp:LinkButton ID="lbtnExitSystem" runat="server" Font-Size="11.5pt" CssClass="linkbutton" OnClick="lbtnExitSystem_Click">退出系统</asp:LinkButton>
		</li>
	</ul>
</div>
