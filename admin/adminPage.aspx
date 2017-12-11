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
	</style>
</head>
<body style="overflow-x:hidden; overflow-y:hidden; margin:auto; height:auto; width:auto;">
	<form id="form1" runat="server" class="layui-form">
		<div style="height:16%; width:100%;">
			<uc1:adminheader ID="adminheader" runat="server" />
		</div>
		<div align="center" style="height:72.8%; width:100%; top:16%;">
			<table style="width:100%; height:100%">
				<tr>
					<td>
						<aside style="height:72.8%; width:15%; left:6%; right:0.5%; padding-top:0.1%; position:absolute;">
							<div style="height:28%;">
								<div align="center" style="line-height:42px; background-color:#2F4056; color:whitesmoke; padding-top:2%; font-size:12pt">
									用户信息
								</div>
								<div style=" border-style:dashed; border-width:thin; height:90%; width:96%; margin-left:2%">
									<div class="layui-form-item" style="margin-top:3.2%; border-top-style:dashed; border-top-width:thin; border-bottom-style:dashed; border-bottom-width:thin;">
										<label class="layui-form-label" style="font-size:11pt;">用户名:</label>
										<asp:Label ID="lbChineseName" runat="server" class="layui-form-label" style="font-size:11pt; margin-left:-2%; text-decoration:underline" ></asp:Label>
									</div>
									<div class="layui-form-item" style="margin-top:-4%; border-top-style:dashed; border-top-width:thin; border-bottom-style:dashed; border-bottom-width:thin;">
										<label class="layui-form-label" style="font-size:11pt;">部&nbsp;&nbsp;&nbsp;&nbsp;门:</label>
										<asp:Label ID="lbDepartment" runat="server" class="layui-form-label" style="font-size:11pt; margin-left:-8%; text-decoration:underline" ></asp:Label>
									</div>
									<div class="layui-form-item" style="margin-top:-4%; border-top-style:dashed; border-top-width:thin; border-bottom-style:dashed; border-bottom-width:thin;">
										<label class="layui-form-label" style="font-size:11pt;">职&nbsp;&nbsp;&nbsp;&nbsp;务:</label>
										<asp:Label ID="lbJob" runat="server" class="layui-form-label" style="font-size:11pt; margin-left:-6%; text-decoration:underline" ></asp:Label>
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
						<div style="height:72.8%; width:72%; left:21.5%; right:6%; position:absolute;">
							<fieldset class="layui-elem-field layui-field-title" style="margin-top:12px;">
								<legend>
									<span style="font-size: 14pt">人员信息查询</span>
								</legend>
								<div class="layui-form-item">
									<label class="layui-form-label" style="text-align: right">用户名:</label>
									<div class="layui-input-inline">
										<asp:TextBox ID="tbSearchUserName" runat="server" required lay-verify="required" placeholder="请输入用户名" autocomplete="off" CssClass="layui-input"></asp:TextBox>
									</div>

									<label class="layui-form-label" style="text-align: right">所属部门:</label>
									<div class="layui-input-inline">
										<asp:DropDownList ID="ddlSearchDepartment" runat="server" AutoPostBack="True" CssClass="ddl" >
										</asp:DropDownList>
									</div>

									<label class="layui-form-label" style="text-align: right">用户角色:</label>
									<div class="layui-input-inline">
										<asp:DropDownList ID="ddlSearchRole" runat="server" AutoPostBack="True" CssClass="ddl" >
										</asp:DropDownList>
									</div>
									<asp:Button ID="btnSearch" runat="server" Text="查询用户" CssClass="layui-btn"/>
								</div>
							</fieldset>
							<asp:GridView ID="gvUser" runat="server" OnRowEditing="gvUser_RowEditing" OnRowUpdating="gvUser_RowUpdating" OnRowDeleting="gvUser_RowDeleting" OnRowCancelingEdit="gvUser_RowCancelingEdit" OnPageIndexChanging="gvUser_PageIndexChanging" OnRowDataBound="gvUser_RowDataBound" AutoGenerateColumns="False" AllowPaging="true" PageSize="10" CssClass="layui-table">
								<Columns>
									<asp:TemplateField HeaderText="序号" ItemStyle-Width="30px">
										<ItemStyle HorizontalAlign="Center" />
										<HeaderStyle HorizontalAlign="Center" Width="30px" />
									</asp:TemplateField>
									<asp:BoundField DataField="U_UserName" HeaderText="用户名" ItemStyle-Width="100px" />
									<asp:BoundField DataField="U_ChineseName" HeaderText="姓名"  ItemStyle-Width="120px" />
									<asp:BoundField DataField="U_Department" HeaderText="部门"  ItemStyle-Width="120px" />
									<asp:BoundField DataField="U_Job" HeaderText="职务" ItemStyle-Width="160px" />
									<asp:BoundField DataField="U_Contact" HeaderText="联系方式" ItemStyle-Width="120px" />
									<asp:CommandField HeaderText="编辑" ControlStyle-CssClass="layui-btn layui-btn-sm" ShowEditButton="true" ControlStyle-Width="60px" />
									<asp:CommandField HeaderText="删除" ControlStyle-CssClass="layui-btn layui-btn-danger layui-btn-sm" ShowDeleteButton="true" ControlStyle-Width="60px" />
								</Columns>
								<HeaderStyle HorizontalAlign="Center" BackColor="#2F4056" ForeColor="White" Height="42px" />
								<RowStyle HorizontalAlign="Center" />
							</asp:GridView>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div style="height:4%; width:100%; position:absolute; bottom:0; left:0; top:96%;">
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
