<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ClassifyOfSofts.ascx.cs" Inherits="admin_ClassifyOfSofts" %>

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

<blockquote style="position: absolute; top: 0.8%">[ 删改查 ] 文档信息</blockquote>
<hr class="layui-bg-green">
<div>
	<div class="layui-form-item">
		<label class="layui-form-label">软件名称:</label>
		<div class="layui-input-inline">
			<asp:TextBox ID="tbSoftsName" runat="server" placeholder="请输入软件名称" autocomplete="off" CssClass="layui-input"></asp:TextBox>
		</div>
		<label class="layui-form-label">分类名称:</label>
		<div class="layui-input-inline">
			<asp:DropDownList ID="ddlClassifyName" runat="server" OnSelectedIndexChanged="ddlClassifyName_SelectedIndexChanged" AutoPostBack="True" ForeColor="Gray" CssClass="ddl">
			</asp:DropDownList>
		</div>
		<div class="layui-input-inline">
			<asp:Button ID="btnSearch" runat="server" Text="查询软件" CssClass="layui-btn" OnClick="btnSearch_Click" />
			<asp:Button ID="btnReset" runat="server" Text="重			置" CssClass="layui-btn" OnClick="btnReset_Click" />
		</div>
	</div>
	<asp:GridView ID="gvSoftsList" runat="server" OnPageIndexChanging="gvSoftsList_PageIndexChanging" OnRowDataBound="gvSoftsList_RowDataBound" OnRowCommand="gvSoftsList_RowCommand" AutoGenerateColumns="False" AllowPaging="true" PageSize="10" CssClass="layui-table">
		<Columns>
			<asp:TemplateField HeaderText="序号" ItemStyle-Width="4.6%">
				<ItemStyle HorizontalAlign="Center" />
				<HeaderStyle HorizontalAlign="Center" Width="4.6%" />
			</asp:TemplateField>
			<asp:BoundField DataField="CS_SoftName" HeaderText="文档名称" />
			<asp:BoundField DataField="CS_SoftClassify" HeaderText="分类名称" ItemStyle-Width="24%" />
			<asp:TemplateField HeaderText="下载" ItemStyle-Width="4.6%">
				<ItemTemplate>
					<asp:ImageButton ID="ImageButton0" runat="server" ImageUrl="~/resources/images/download.png" Height="21" Width="21" CommandName="Dl" CommandArgument='<%#Eval("CS_SoftName") %>'></asp:ImageButton>
				</ItemTemplate>
				<ItemStyle HorizontalAlign="Center" />
				<HeaderStyle HorizontalAlign="Center" Width="4.6%" />
			</asp:TemplateField>
			<asp:TemplateField HeaderText="编辑" ItemStyle-Width="4.6%">
				<ItemTemplate>
					<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/resources/images/edit2.png" Height="21" Width="21" CommandName="Ed" CommandArgument='<%#Eval("CS_SoftName") %>'></asp:ImageButton>
				</ItemTemplate>
				<ItemStyle HorizontalAlign="Center" />
				<HeaderStyle HorizontalAlign="Center" Width="4.6%" />
			</asp:TemplateField>
			<asp:TemplateField HeaderText="删除" ItemStyle-Width="4.6%">
				<ItemTemplate>
					<asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/resources/images/delete1.png" Height="21" Width="21" CommandName="De" CommandArgument='<%#Eval("CS_SoftName") %>'></asp:ImageButton>
				</ItemTemplate>
				<ItemStyle HorizontalAlign="Center" />
				<HeaderStyle HorizontalAlign="Center" Width="4.6%" />
			</asp:TemplateField>
		</Columns>
		<HeaderStyle HorizontalAlign="Center" BackColor="#2F4056" ForeColor="White" Height="42px" />
		<RowStyle HorizontalAlign="Center" Height="42px" />
	</asp:GridView>
</div>
