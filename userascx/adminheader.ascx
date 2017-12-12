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
		<li class="layui-nav-item" style="position:absolute; left:2%; top:8%; font-size:1.6em; font-family:华文新魏">
			禹步工单系统
		</li>
		<%--<li class="layui-nav-item" style="position:absolute; right:11.5%; top:10%; ">
			<asp:Label ID="lbTips" runat="server" ForeColor="white" Font-Size="11.4pt"></asp:Label>
		</li>--%>
		<li class="layui-nav-item" style="position:absolute; right:5.5%; top:10%; margin-right:1.1%;">
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
		<li class="layui-nav-item" style="position:absolute; right:0.5%; top:10%;">
			<asp:LinkButton ID="lbtnExitSystem" runat="server" Font-Size="11.5pt" CssClass="linkbutton" OnClick="lbtnExitSystem_Click">退出系统</asp:LinkButton>
		</li>
	</ul>
</div>
