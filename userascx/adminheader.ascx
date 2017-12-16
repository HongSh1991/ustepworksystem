<%@ Control Language="C#" AutoEventWireup="true" CodeFile="adminheader.ascx.cs" Inherits="userascx_adminheader" %>

<script src="../Resources/Common/js/jquery-1.12.3.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="../layui/css/layui.css" />
<style type="text/css">
	.linkbutton{
		margin-left:0%;
		column-width:64px;
		text-decoration:none;
	}
</style>

<div style="height:21%">
	<div style="position: absolute; top: 0px; left: 0px; height:15%; width:100%;" class="layui-bg-blue">
		<table style="height:100%; width:100%;">
			<tr>
				<td align="center" style="width: 100%; height:100%">
					<div style="width:100%;">
							<span style="font-size:4.2em; font-family:华文新魏; text-align:center; font-weight:600; text-shadow:3px 4px 2px #333; color:whitesmoke">禹步工单系统</span>
					</div>
					<%--<img alt="" src="../resources/images/header.png" />--%>
				</td>
			</tr>
		</table>
	</div>
	<ul class="layui-nav" style="width: 100%; background-color:#2F4056; font-size:larger; height:6%; position:absolute; left:0; top:15%;">
		<li class="layui-nav-item" style="position:absolute; right:7.2%; top:8%; margin-right:1.1%;">
			<asp:LinkButton ID="lbUserManager" runat="server" Font-Size="11.4pt">信息管理</asp:LinkButton>
			<dl class="layui-nav-child">
				<dd>
					<asp:LinkButton ID="lbAddDepartmentAndPost" runat="server" OnClick="lbAddDepartmentAndPost_Click">[增删改查]部门/职务</asp:LinkButton></dd>
				<dd>
					<asp:LinkButton ID="lbAddUserInfo" runat="server" OnClick="lbAddUserInfo_Click">[新增]员工信息</asp:LinkButton></dd>
				<dd>
					<asp:LinkButton ID="lbAddMaterialAndSoft" runat="server" OnClick="lbAddMaterialAndSoft_Click">[增删改查]公司文档/软件资源</asp:LinkButton></dd>
			</dl>
		</li>
		<li class="layui-nav-item" style="position:absolute; right:1.2%; top:8%;">
			<asp:LinkButton ID="lbtnExitSystem" runat="server" Font-Size="11.4pt" CssClass="linkbutton" OnClick="lbtnExitSystem_Click">退出系统</asp:LinkButton>
		</li>
	</ul>
</div>
