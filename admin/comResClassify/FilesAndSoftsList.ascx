<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FilesAndSoftsList.ascx.cs" Inherits="admin_comResClassify_FilesAndSoftsList" %>

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

<blockquote style="position: absolute; top: 0.8%">[ 删改查 ] 文档 / 软件分类</blockquote>
<hr class="layui-bg-green">
<div style="width:47.6%; height:94%;position:absolute; left:0;top:5%; padding-left:1.2%">
	<asp:GridView ID="gvFilesList" runat="server" OnPageIndexChanging="gvFilesList_PageIndexChanging" OnRowDataBound="gvFilesList_RowDataBound" OnRowCommand="gvFilesList_RowCommand" AutoGenerateColumns="false" AllowPaging="true" PageSize="11" CssClass="layui-table">
		<Columns>
			<asp:TemplateField HeaderText="序号" ItemStyle-Width="9.2%">
				<ItemStyle HorizontalAlign="Center" />
				<HeaderStyle HorizontalAlign="Center" Width="9.2%" />
			</asp:TemplateField>
			<asp:BoundField DataField="FC_ClassifyName" HeaderText="文档分类名称" />
			<asp:TemplateField HeaderText="删除" ItemStyle-Width="9.2%">
				<ItemTemplate>
					<asp:ImageButton ID="ImageButtonFiles" runat="server" ImageUrl="~/resources/images/delete1.png" Height="21" Width="21" CommandName="De" CommandArgument='<%#Eval("FC_ClassifyName") %>'></asp:ImageButton>
				</ItemTemplate>
				<ItemStyle HorizontalAlign="Center" />
				<HeaderStyle HorizontalAlign="Center" Width="9.2%" />
			</asp:TemplateField>
		</Columns>
		<HeaderStyle HorizontalAlign="Center" BackColor="#2F4056" ForeColor="White" Height="42px" />
		<RowStyle HorizontalAlign="Center" />
	</asp:GridView>
</div>
<div style="position:absolute; top:5%; left:48.8%; right:48.8%; margin-left:1.2%;height:94%;width:0.1%;border-left-style:dashed; border-left-width:thin; "></div>
<div style="width:47.6%; height:94%; position:absolute; right:0;top:5%; padding-right:1.2%">
	<asp:GridView ID="gvSoftsList" runat="server" OnPageIndexChanging="gvSoftsList_PageIndexChanging" OnRowDataBound="gvSoftsList_RowDataBound" OnRowCommand="gvSoftsList_RowCommand" AutoGenerateColumns="false" AllowPaging="true" PageSize="11" CssClass="layui-table">
		<Columns>
			<asp:TemplateField HeaderText="序号" ItemStyle-Width="9.2%">
				<ItemStyle HorizontalAlign="Center" />
				<HeaderStyle HorizontalAlign="Center" Width="9.2%" />
			</asp:TemplateField>
			<asp:BoundField DataField="SC_ClassifyName" HeaderText="软件分类名称" />
			<asp:TemplateField HeaderText="删除" ItemStyle-Width="9.2%">
				<ItemTemplate>
					<asp:ImageButton ID="ImageButtonSoft" runat="server" ImageUrl="~/resources/images/delete1.png" Height="21" Width="21" CommandName="De" CommandArgument='<%#Eval("SC_ClassifyName") %>'></asp:ImageButton>
				</ItemTemplate>
				<ItemStyle HorizontalAlign="Center" />
				<HeaderStyle HorizontalAlign="Center" Width="9.2%" />
			</asp:TemplateField>
		</Columns>
		<HeaderStyle HorizontalAlign="Center" BackColor="#2F4056" ForeColor="White" Height="42px" />
		<RowStyle HorizontalAlign="Center" />
	</asp:GridView>
</div>