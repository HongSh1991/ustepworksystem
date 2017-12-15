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
<body style="overflow-x:hidden; overflow-y:auto; margin:auto;">
	<form id="form1" runat="server" class="layui-form layui-form-pane">
		<div style="height:21%; width:100%;">
			<uc1:adminheader ID="adminheader" runat="server" />
		</div>
		<div style="height:68%; width:100%; top:22%; position:absolute; left:5.6%; right:5.6%">
			<table align="center" style="width:100%; height:100%">
				<tr>
					<td>
						<aside style="height:68%; width:15%; position:absolute; top:0; right:0.5%; left:0">
							<div style="height:28%;">
								<div align="center" style="line-height:42px; background-color:#2F4056; color:whitesmoke; font-size:12pt">
									用户信息
								</div>
								<div style=" border-style:dashed; border-width:thin; height:90%; width:96%; margin-left:2%">
									<div class="layui-form-item" style="margin-top:3.2%; border-top-style:dashed; border-top-width:thin; border-bottom-style:dashed; border-bottom-width:thin;">
										<label style="font-size:11pt; line-height:42px; margin-left:12%">用户名:</label>
										<asp:Label ID="lbChineseName" runat="server" style="font-size:11pt; margin-left:3.6%; text-decoration:underline" ></asp:Label>
									</div>
									<div class="layui-form-item" style="margin-top:-4%; border-top-style:dashed; border-top-width:thin; border-bottom-style:dashed; border-bottom-width:thin;">
										<label style="font-size:11pt; line-height:42px; margin-left:12%">部&nbsp;&nbsp;&nbsp;&nbsp;门:</label>
										<asp:Label ID="lbDepartment" runat="server" style="font-size:11pt; margin-left:8%; text-decoration:underline" ></asp:Label>
									</div>
									<div class="layui-form-item" style="margin-top:-4%; border-top-style:dashed; border-top-width:thin; border-bottom-style:dashed; border-bottom-width:thin;">
										<label style="font-size:11pt; line-height:42px; margin-left:12%">职&nbsp;&nbsp;&nbsp;&nbsp;务:</label>
										<asp:Label ID="lbJob" runat="server" style="font-size:11pt; margin-left:6%; text-decoration:underline" ></asp:Label>
									</div>
								</div>
							</div>
							<div style="height:72%;">
								<div align="center" style="line-height: 42px; background-color: #2F4056; color: whitesmoke; padding-top:2%; font-size:12pt">
									最新工单
								</div>
								<div style=" border-style:dashed; border-width:thin; height:90%; width:96%; margin-left:2%">
									
								</div>
							</div>
						</aside>
						<div style="height: 72.8%; width: 74.3%; margin-top:0.5%; position: absolute; left: 15.5%; right:0; top:0;">
							<!--[删改查]员工信息-->
							<div>
								<div class="layui-form-item">
									<label class="layui-form-label">用户名:</label>
									<div class="layui-input-inline">
										<asp:TextBox ID="tbSearchUserName" runat="server" required lay-verify="required" placeholder="请输入用户名" autocomplete="off" CssClass="layui-input"></asp:TextBox>
									</div>

									<label class="layui-form-label">所属部门:</label>
									<div class="layui-input-inline">
										<asp:DropDownList ID="ddlSearchDepartment" runat="server" AutoPostBack="True" CssClass="ddl">
										</asp:DropDownList>
									</div>

									<label class="layui-form-label">职务:</label>
									<div class="layui-input-inline">
										<asp:DropDownList ID="ddlSearchRole" runat="server" AutoPostBack="True" CssClass="ddl">
										</asp:DropDownList>
									</div>
									<asp:Button ID="btnSearch" runat="server" Text="查询用户" CssClass="layui-btn" />
								</div>
								<asp:GridView ID="gvUser" runat="server" OnRowEditing="gvUser_RowEditing" OnRowUpdating="gvUser_RowUpdating" OnRowDeleting="gvUser_RowDeleting" OnRowCancelingEdit="gvUser_RowCancelingEdit" OnPageIndexChanging="gvUser_PageIndexChanging" OnRowDataBound="gvUser_RowDataBound" AutoGenerateColumns="False" AllowPaging="true" PageSize="10" CssClass="layui-table">
									<Columns>
										<asp:TemplateField HeaderText="序号" ItemStyle-Width="30px">
											<ItemStyle HorizontalAlign="Center" />
											<HeaderStyle HorizontalAlign="Center" Width="30px" />
										</asp:TemplateField>
										<asp:BoundField DataField="U_UserName" HeaderText="用户名" ItemStyle-Width="100px" />
										<asp:BoundField DataField="U_ChineseName" HeaderText="姓名" ItemStyle-Width="120px" />
										<asp:BoundField DataField="U_Department" HeaderText="部门" ItemStyle-Width="120px" />
										<asp:BoundField DataField="U_ProjectName" HeaderText="项目名称" ItemStyle-Width="160px" />
										<asp:BoundField DataField="U_Contact" HeaderText="联系方式" ItemStyle-Width="120px" />
										<asp:CommandField HeaderText="编辑" ControlStyle-CssClass="layui-btn layui-btn-sm" ShowEditButton="true" ControlStyle-Width="60px" />
										<asp:CommandField HeaderText="删除" ControlStyle-CssClass="layui-btn layui-btn-danger layui-btn-sm" ShowDeleteButton="true" ControlStyle-Width="60px" />
									</Columns>
									<HeaderStyle HorizontalAlign="Center" BackColor="#2F4056" ForeColor="White" Height="42px" />
									<RowStyle HorizontalAlign="Center" />
								</asp:GridView>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div style="height:8%; width:100%; position:absolute; bottom:0; left:0;">
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
