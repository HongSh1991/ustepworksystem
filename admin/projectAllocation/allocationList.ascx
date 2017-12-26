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
			<asp:DropDownList ID="ddlProjectName" runat="server" CssClass="ddl"></asp:DropDownList>
		</div>

		<label class="layui-form-label">项目负责人:</label>
		<div class="layui-input-inline">
			<asp:DropDownList ID="ddlProjectCharge" runat="server" CssClass="ddl"></asp:DropDownList>
		</div>

		<div class="layui-input-block" style="position:absolute; left:31%">
			<asp:Button ID="btnReset" runat="server" Text="重置" CssClass="layui-btn" OnClick="btnReset_Click" />
		</div>
	</div>
	<asp:GridView ID="gvAllocation" runat="server" OnPageIndexChanging="gvAllocation_PageIndexChanging" OnRowDataBound="gvAllocation_RowDataBound" OnRowCommand="gvAllocation_RowCommand" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" CssClass="layui-table">
		<Columns>
			<asp:TemplateField HeaderText="序号" ItemStyle-Width="4.6%">
				<ItemStyle HorizontalAlign="Center" />
				<HeaderStyle HorizontalAlign="Center" Width="4.6%" />
			</asp:TemplateField>

		</Columns>
	</asp:GridView>
</div>