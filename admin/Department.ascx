<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Department.ascx.cs" Inherits="admin_Department" %>

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

<blockquote style="position: absolute; top: 0.8%">[ 删改查 ] 部门信息</blockquote>
<hr class="layui-bg-green">
<div>
	<div class="layui-form-item">
		<label class="layui-form-label">部门名称:</label>
		<div class="layui-input-inline">
			<asp:TextBox ID="tbSearchDepartment" runat="server" placeholder="请输入部门名称" autocomplete="off" CssClass="layui-input"></asp:TextBox>
		</div>

		<div class="layui-input-inline">
			<asp:Button ID="btnSearchDep" runat="server" Text="查询部门" CssClass="layui-btn" OnClick="btnSearchDep_Click" />
			<asp:Button ID="btnReset" runat="server" Text="重置" CssClass="layui-btn" OnClick="btnReset_Click" />
		</div>
	</div>
	<asp:GridView ID="gvDepartment" runat="server" OnPageIndexChanging="gvDepartment_PageIndexChanging" OnRowDataBound="gvDepartment_RowDataBound" OnRowCommand="gvDepartment_RowCommand" AutoGenerateColumns="False" AllowPaging="true" PageSize="10" CssClass="layui-table">
		<Columns>
			<asp:TemplateField HeaderText="序号" ItemStyle-Width="4.6%">
				<ItemStyle HorizontalAlign="Center" />
				<HeaderStyle HorizontalAlign="Center" Width="4.6%" />
			</asp:TemplateField>
			<asp:BoundField DataField="D_DepartmentName" HeaderText="部门名称" />
			<asp:TemplateField HeaderText="编辑" ItemStyle-Width="4.6%">
				<ItemTemplate>
					<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/resources/images/edit2.png" Height="21" Width="21" CommandName="Ed" CommandArgument='<%#Eval("D_DepartmentName") %>'></asp:ImageButton>
				</ItemTemplate>
				<ItemStyle HorizontalAlign="Center" />
				<HeaderStyle HorizontalAlign="Center" Width="4.6%" />
			</asp:TemplateField>
			<asp:TemplateField HeaderText="删除" ItemStyle-Width="4.6%">
				<ItemTemplate>
					<asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/resources/images/delete1.png" Height="21" Width="21" CommandName="De" CommandArgument='<%#Eval("D_DepartmentName") %>'></asp:ImageButton>
				</ItemTemplate>
				<ItemStyle HorizontalAlign="Center" />
				<HeaderStyle HorizontalAlign="Center" Width="4.6%" />
			</asp:TemplateField>
		</Columns>
		<HeaderStyle HorizontalAlign="Center" BackColor="#2F4056" ForeColor="White" Height="42px" />
		<RowStyle HorizontalAlign="Center" />
	</asp:GridView>
</div>