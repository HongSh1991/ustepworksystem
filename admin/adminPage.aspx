﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminPage.aspx.cs" MaintainScrollPositionOnPostback="true" Inherits="admin_adminPage" %>
<%@ Register Src="~/admin/EmployeeInfo.ascx" TagName="EmployeeInfo" TagPrefix="uc1" %>
<%@ Register Src="~/userascx/pagefooter.ascx" TagName="pagefooter" TagPrefix="uc2" %>
<%@ Register Src="~/admin/Department.ascx" TagName="Department" TagPrefix="uc3" %>
<%@ Register Src="~/admin/ProjectList.ascx" TagName="ProjectList" TagPrefix="uc4" %>
<%@ Register Src="~/admin/comResClassify/FilesAndSoftsList.ascx" TagName="FilesAndSoftsList" TagPrefix="uc5" %>
<%@ Register Src="~/admin/ClassifyOfFiles.ascx" TagName="ClassifyOfFiles" TagPrefix="uc6" %>
<%@ Register Src="~/admin/ClassifyOfSofts.ascx" TagName="ClassifyOfSofts" TagPrefix="uc7" %>
<%@ Register Src="~/admin/projectAllocation/allocationList.ascx" TagName="allocationList" TagPrefix="uc8" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	<title>系统管理</title>
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
<body class="layui-layout-body">
	<form id="form1" runat="server" class="layui-form-pane">
		<div class="layui-layout layui-layout-admin">
			<div class="layui-header">
				<div class="layui-logo" style="color:aquamarine; font-family:华文行楷; font-size:18pt">禹步工单系统</div>
				<!-- 头部区域（可配合layui已有的水平导航） -->
				<ul class="layui-nav layui-layout-left">
					<%--<li class="layui-nav-item"><a href="">控制台</a></li>
					<li class="layui-nav-item"><a href="">商品管理</a></li>
					<li class="layui-nav-item"><a href="">用户</a></li>--%>
					<li class="layui-nav-item">
						<a href="javascript:;">新增员工信息</a>
						<dl class="layui-nav-child" style="font-weight: 600; font-size: 11pt">
							<dd>
								<asp:LinkButton ID="lbtnAddProjectName" runat="server" OnClick="lbtnAddProjectName_Click">[ 新增 ] 项目信息</asp:LinkButton>
							</dd>
							<dd>
								<asp:LinkButton ID="lbtnAddDepName" runat="server" OnClick="lbtnAddDepName_Click">[ 新增 ] 部门名称</asp:LinkButton>
							</dd>
							<dd>
								<asp:LinkButton ID="lbtnAddEmpoyee" runat="server" OnClick="lbtnAddEmpoyee_Click">[ 新增 ] 员工信息</asp:LinkButton>
							</dd>
						</dl>
					</li>
					<li class="layui-nav-item">
						<a href="javascript:;">新增公司资源</a>
						<dl class="layui-nav-child" style="font-weight: 600;">
							<dd>
								<asp:LinkButton ID="lbtnAddFilesClassify" runat="server" OnClick="lbtnAddFilesClassify_Click">[ 新增 ] 文档分类</asp:LinkButton>
							</dd>
							<dd>
								<asp:LinkButton ID="lbtnAddComFiles" runat="server" OnClick="lbtnAddComFiles_Click">[ 新增 ] 公司文档</asp:LinkButton>
							</dd>
							<dd>
								<asp:LinkButton ID="lbtnAddSoftClassify" runat="server" OnClick="lbtnAddSoftClassify_Click">[ 新增 ] 软件分类</asp:LinkButton>
							</dd>
							<dd>
								<asp:LinkButton ID="lbtnAddComSofts" runat="server" OnClick="lbtnAddComSofts_Click">[ 新增 ] 软件资源</asp:LinkButton>
							</dd>
						</dl>
					</li>
					<li class="layui-nav-item">
						<asp:LinkButton ID="lbtnAllocateProject" runat="server" OnClick="lbtnAllocateProject_Click">项目分配</asp:LinkButton>
					</li>
				</ul>
				<ul class="layui-nav layui-layout-right">
					<li class="layui-nav-item">
						<a href="javascript:;">
							<img alt="" src="../resources/images/admin.jpg" class="layui-nav-img" />
							<asp:Label ID="lbUserName" runat="server" Text=""></asp:Label>
						</a>
						<%--<dl class="layui-nav-child">
							<%--<dd>
								<a href=""><i class="layui-icon">&#xe612;</i>&nbsp;&nbsp;&nbsp;&nbsp;用户中心</a>
							</dd>
						</dl>--%>
					</li>
					<li class="layui-nav-item">
						<asp:LinkButton ID="lbtnExitSystem" runat="server" OnClick="lbtnExitSystem_Click">退出系统</asp:LinkButton>
					</li>
				</ul>
			</div>

			<div class="layui-side layui-bg-black">
				<div class="layui-side-scroll">
					<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
					<ul class="layui-nav layui-nav-tree" lay-filter="test">
						<li class="layui-nav-item layui-nav-itemed"><!--layui-nav-item layui-nav-itemed-->
							<a class="" href="javascript:;">员工信息管理</a>
							<dl class="layui-nav-child">
								<dd>
									<asp:LinkButton ID="lbtnEmployeeMana" runat="server" OnClick="lbtnEmployeeMana_Click">[ 删改查 ] 员工信息</asp:LinkButton>
								</dd>
								<dd>
									<asp:LinkButton ID="lbtnProMana" runat="server" OnClick="lbtnProMana_Click">[ 删改查 ] 项目信息</asp:LinkButton>
								</dd>
								<dd>
									<asp:LinkButton ID="lbtnDepMana" runat="server" OnClick="lbtnDepMana_Click">[ 删改查 ] 部门信息</asp:LinkButton>
								</dd>
							</dl>
						</li>
						<li class="layui-nav-item layui-nav-itemed">
							<a href="javascript:;">公司资源管理</a>
							<dl class="layui-nav-child">
								<dd>
									<asp:LinkButton ID="lbtnFilesAndSoftWareClassify" runat="server" OnClick="lbtnFilesAndSoftWareClassify_Click">[ 删改查 ] 文档 / 软件分类</asp:LinkButton>
								</dd>
								<dd>
									<asp:LinkButton ID="lbtnComFilesMana" runat="server" OnClick="lbtnComFilesMana_Click">[ 删改查 ] 公司文档</asp:LinkButton>
								</dd>
								<dd>
									<asp:LinkButton ID="lbtnComSoftWMana" runat="server" OnClick="lbtnComSoftWMana_Click">[ 删改查 ] 软件资源</asp:LinkButton>
								</dd>
							</dl>
						</li>
						<li class="layui-nav-item">
							<asp:LinkButton ID="lbtnAllocateList" runat="server" OnClick="lbtnAllocateList_Click">项目分配列表</asp:LinkButton>
						</li>
					</ul>
				</div>
			</div>

			<div class="layui-body">
				<!-- 内容主体区域 -->
				<!--[删改查]员工信息-->
				<div id ="display1" runat="server" style="padding: 1.2%;display:block; text-align-last:center">
					<uc1:EmployeeInfo ID="EmployeeInfo" runat="server" />
				</div>

				<!--[删改查]项目名称-->
				<div id ="display2" runat="server" style="padding: 1.2%;display:none; text-align-last:center">
					<uc4:ProjectList ID="ProjectList" runat="server" />
				</div>

				<!--[删改查]部门名称-->
				<div id ="display3" runat="server" style="padding: 1.2%;display:none; text-align-last:center">
					<uc3:Department ID="Department" runat="server" />
				</div>

				<!--[删改查]文档/软件分类-->
				<div id ="display4" runat="server" style="padding: 1.2%;display:none; text-align-last:center">
					<uc5:FilesAndSoftsList ID="FilesAndSoftsList" runat="server" />
				</div>

				<!--[删改查]公司文档-->
				<div id ="display5" runat="server" style="padding: 1.2%;display:none; text-align-last:center">
					<uc6:ClassifyOfFiles ID="ClassifyOfFiles" runat="server" />
				</div>

				<!--[删改查]软件资源-->
				<div id ="display6" runat="server" style="padding: 1.2%;display:none; text-align-last:center">
					<uc7:ClassifyOfSofts ID="ClassifyOfSofts" runat="server" />
				</div>

				<!--[删改查]软件资源-->
				<div id ="display7" runat="server" style="padding: 1.2%;display:none; text-align-last:center">
					<uc8:allocationList ID="allocationList" runat="server" />
				</div>
			</div>
  
			<div class="layui-footer" style="color:gray; ">
				<!-- 底部固定区域 -->
				<uc2:pagefooter ID="pagefooter" runat="server" />
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
