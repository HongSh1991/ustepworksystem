<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EmployeeInfo.ascx.cs" Inherits="admin_EmployeeInfo" %>

<style type="text/css">
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

<blockquote style="position:absolute; top:0.8%">[删改查]员工信息</blockquote>
<hr class="layui-bg-green">
<div>
	<div class="layui-form-item">
		<label class="layui-form-label">用户名:</label>
		<div class="layui-input-inline">
			<asp:TextBox ID="tbSearchUserName" runat="server" placeholder="请输入用户名" autocomplete="off" CssClass="layui-input"></asp:TextBox>
		</div>

		<label class="layui-form-label">所属部门:</label>
		<div class="layui-input-inline">
			<asp:DropDownList ID="ddlDepartment" runat="server" AutoPostBack="True" CssClass="ddl" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged" ForeColor="Gray">
			</asp:DropDownList>
		</div>

		<label class="layui-form-label">项目名称:</label>
		<div class="layui-input-inline">
			<asp:DropDownList ID="ddlProjectName" runat="server" AutoPostBack="True" CssClass="ddl" OnSelectedIndexChanged="ddlProjectName_SelectedIndexChanged" ForeColor="Gray">
			</asp:DropDownList>
		</div>

		<div class="layui-input-inline">
			<asp:Button ID="btnSearch" runat="server" Text="查询用户" CssClass="layui-btn" OnClick="btnSearch_Click" />
			<asp:Button ID="btnReset" runat="server" Text="重			置" CssClass="layui-btn" OnClick="btnReset_Click" />
		</div>
	</div>
	<asp:GridView ID="gvUser" runat="server" OnRowEditing="gvUser_RowEditing" OnRowUpdating="gvUser_RowUpdating" OnRowDeleting="gvUser_RowDeleting" OnRowCancelingEdit="gvUser_RowCancelingEdit" OnPageIndexChanging="gvUser_PageIndexChanging" OnRowDataBound="gvUser_RowDataBound" AutoGenerateColumns="False" AllowPaging="true" PageSize="10" CssClass="layui-table">
		<Columns>
			<asp:TemplateField HeaderText="序号" ItemStyle-Width="28px">
				<ItemStyle HorizontalAlign="Center" />
				<HeaderStyle HorizontalAlign="Center" Width="28px" />
			</asp:TemplateField>
			<asp:BoundField DataField="U_UserName" HeaderText="用户名" ItemStyle-Width="60px" HeaderStyle-HorizontalAlign="Center" />
			<asp:BoundField DataField="U_ChineseName" HeaderText="姓名" ItemStyle-Width="90px" HeaderStyle-HorizontalAlign="Center" />
			<asp:BoundField DataField="U_Department" HeaderText="部门" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" />
			<asp:BoundField DataField="U_ProjectName" HeaderText="项目名称" ItemStyle-Width="160px" HeaderStyle-HorizontalAlign="Center" />
			<asp:BoundField DataField="U_Contact" HeaderText="联系方式" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" />
			<asp:CommandField HeaderText="编辑" ControlStyle-CssClass="layui-btn layui-btn-sm" ShowEditButton="true" ControlStyle-Width="60px" />
			<asp:CommandField HeaderText="删除" ControlStyle-CssClass="layui-btn layui-btn-danger layui-btn-sm" ShowDeleteButton="true" ControlStyle-Width="60px" />
		</Columns>
		<HeaderStyle HorizontalAlign="Center" BackColor="#2F4056" ForeColor="White" Height="36px" />
		<RowStyle HorizontalAlign="Center" />
	</asp:GridView>
</div>