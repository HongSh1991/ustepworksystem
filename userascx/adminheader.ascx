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
	<div style="position: absolute; top: 0px; left: 0px; height:15%; width:100%;background-color:MidnightBlue">
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
		<li class="layui-nav-item" style="position: absolute; left: 31.8%; top: 8%; margin-right: 1.1%;">
			<asp:LinkButton ID="lbtnUserInfoManager" runat="server" Font-Size="10pt">[删改查]员工信息</asp:LinkButton>
		</li>
		<li class="layui-nav-item" style="position: absolute; left: 22.2%; top: 8%; margin-right: 1.1%;">
			<asp:LinkButton ID="lbtnProDepManager" runat="server" Font-Size="10pt">[删改查]项目名称/部门</asp:LinkButton>
		</li>
		<li class="layui-nav-item" style="position: absolute; left: 14.6%; top: 8%; margin-right: 1.1%;">
			<asp:LinkButton ID="lbtnComFiles" runat="server" Font-Size="10pt">[删改查]公司文档</asp:LinkButton>
		</li>
		<li class="layui-nav-item" style="position: absolute; left: 6.8%; top: 8%; margin-right: 1.1%;">
			<asp:LinkButton ID="lbtnSoftWares" runat="server" Font-Size="10pt">[删改查]软件资源</asp:LinkButton>
		</li>
		<li class="layui-nav-item" style="position:absolute; left:1.2%; top:8%; margin-right:1.1%;">
			<asp:LinkButton ID="lbUserManager" runat="server" Font-Size="10pt">新增信息</asp:LinkButton>
			<dl class="layui-nav-child" style="font-weight:600;">
				<dd>
					<asp:LinkButton ID="lbAddDepartmentAndPost" runat="server" OnClick="lbAddDepartmentAndPost_Click">[新增] 项目名称 / 部门</asp:LinkButton></dd>
				<dd>
					<asp:LinkButton ID="lbAddUserInfo" runat="server" OnClick="lbAddUserInfo_Click">[新增] 员工信息</asp:LinkButton></dd>
				<dd>
					<asp:LinkButton ID="lbAddMaterialAndSoft" runat="server" OnClick="lbAddMaterialAndSoft_Click">[新增] 公司文档 / 软件资源</asp:LinkButton></dd>
			</dl>
		</li>
		<li class="layui-nav-item" style="position:absolute; left:39.2%; top:8%;">
			
		</li>
	</ul>
</div>
