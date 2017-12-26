<%@ Control Language="C#" AutoEventWireup="true" CodeFile="allocationList.ascx.cs" Inherits="admin_projectAllocation_allocationList" %>

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

<blockquote style="position: absolute; top: 0.8%">项目分配列表</blockquote>
<hr class="layui-bg-green">
<div>
	<div class="layui-form-item">
		<label class="layui-form-label">项目名称:</label>
		<div class="layui-input-inline">
			<asp:DropDownList ID="ddlProjectName" runat="server" CssClass="ddl" OnSelectedIndexChanged="ddlProjectName_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
		</div>

		<label class="layui-form-label">项目负责人:</label>
		<div class="layui-input-inline">
			<asp:DropDownList ID="ddlProjectCharge" runat="server" CssClass="ddl" OnSelectedIndexChanged="ddlProjectCharge_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
		</div>
	</div>
	<asp:GridView ID="gvAllocation" runat="server" OnPageIndexChanging="gvAllocation_PageIndexChanging" OnRowDataBound="gvAllocation_RowDataBound" OnRowCommand="gvAllocation_RowCommand" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" CssClass="layui-table">
		<Columns>
			<asp:TemplateField HeaderText="序号" ItemStyle-Width="4.6%">
				<ItemStyle HorizontalAlign="Center" />
				<HeaderStyle HorizontalAlign="Center" Width="4.6%" />
			</asp:TemplateField>
			<asp:BoundField DataField="ATPM_ProjectName" HeaderText="项目名称" />
			<asp:BoundField DataField="ATPM_ChargeUserName" HeaderText="项目负责人" ItemStyle-Width="12%" />
			<asp:TemplateField HeaderText="编辑" ItemStyle-Width="4.6%">
				<ItemTemplate>
					<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/resources/images/edit2.png" Height="21" Width="21" CommandName="Ed" CommandArgument='<%#Eval("ATPM_ProjectName") %>'></asp:ImageButton>
				</ItemTemplate>
				<ItemStyle HorizontalAlign="Center" />
				<HeaderStyle HorizontalAlign="Center" Width="4.6%" />
			</asp:TemplateField>
			<asp:TemplateField HeaderText="删除" ItemStyle-Width="4.6%">
				<ItemTemplate>
					<asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/resources/images/delete1.png" Height="21" Width="21" CommandName="De" CommandArgument='<%#Eval("ATPM_ProjectName") %>'></asp:ImageButton>
				</ItemTemplate>
				<ItemStyle HorizontalAlign="Center" />
				<HeaderStyle HorizontalAlign="Center" Width="4.6%" />
			</asp:TemplateField>
		</Columns>
		<HeaderStyle HorizontalAlign="Center" BackColor="#2F4056" ForeColor="White" Height="42px" />
		<RowStyle HorizontalAlign="Center" Height="42px" />
	</asp:GridView>
</div>