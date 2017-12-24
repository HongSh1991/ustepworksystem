<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ClassifyOfFiles.ascx.cs" Inherits="admin_ClassifyOfFiles" %>

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
		<label class="layui-form-label">文档名称:</label>
		<div class="layui-input-inline">
			<asp:TextBox ID="tbFilesName" runat="server" required lay-verify="required" placeholder="请输入文档名称" autocomplete="off" CssClass="layui-input"></asp:TextBox>
		</div>
		<label class="layui-form-label">分类名称:</label>
		<div class="layui-input-inline">
			<asp:DropDownList ID="ddlClassifyName" runat="server" OnSelectedIndexChanged="ddlClassifyName_SelectedIndexChanged" AutoPostBack="True" ForeColor="Gray" CssClass="ddl">
			</asp:DropDownList>
		</div>
		<div class="layui-input-inline">
			<asp:Button ID="btnSearch" runat="server" Text="查询文档" CssClass="layui-btn" OnClick="btnSearch_Click" />
			<asp:Button ID="btnReset" runat="server" Text="重			置" CssClass="layui-btn" OnClick="btnReset_Click" />
		</div>
	</div>
	<asp:GridView ID="gvFilesList" runat="server" OnPageIndexChanging="gvFilesList_PageIndexChanging" OnRowDataBound="gvFilesList_RowDataBound" OnRowCommand="gvFilesList_RowCommand" AutoGenerateColumns="False" AllowPaging="true" PageSize="10"  CssClass="layui-table">
		<Columns>
			<asp:TemplateField HeaderText="序号" ItemStyle-Width="4.6%">
				<ItemStyle HorizontalAlign="Center" />
				<HeaderStyle HorizontalAlign="Center" Width="4.6%" />
			</asp:TemplateField>
			<asp:BoundField DataField="CF_FilesName" HeaderText="文档名称" />
			<asp:BoundField DataField="CF_FilesClassify" HeaderText="分类名称" />
			<asp:TemplateField HeaderText="下载" ItemStyle-Width="4.6%">
				<ItemTemplate>
					<asp:ImageButton ID="ImageButton0" runat="server" ImageUrl="~/resources/images/download.png" Height="21" Width="21" CommandName="Dl" CommandArgument='<%#Eval("CF_FilesName") %>'></asp:ImageButton>
				</ItemTemplate>
				<ItemStyle HorizontalAlign="Center" />
				<HeaderStyle HorizontalAlign="Center" Width="4.6%" />
			</asp:TemplateField>
			<asp:TemplateField HeaderText="编辑" ItemStyle-Width="4.6%">
				<ItemTemplate>
					<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/resources/images/edit2.png" Height="21" Width="21" CommandName="Ed" CommandArgument='<%#Eval("CF_FilesName") %>'></asp:ImageButton>
				</ItemTemplate>
				<ItemStyle HorizontalAlign="Center" />
				<HeaderStyle HorizontalAlign="Center" Width="4.6%" />
			</asp:TemplateField>
			<asp:TemplateField HeaderText="删除" ItemStyle-Width="4.6%">
				<ItemTemplate>
					<asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/resources/images/delete1.png" Height="21" Width="21" CommandName="De" CommandArgument='<%#Eval("CF_FilesName") %>'></asp:ImageButton>
				</ItemTemplate>
				<ItemStyle HorizontalAlign="Center" />
				<HeaderStyle HorizontalAlign="Center" Width="4.6%" />
			</asp:TemplateField>
		</Columns>
		<HeaderStyle HorizontalAlign="Center" BackColor="#2F4056" ForeColor="White" Height="42px" />
		<RowStyle HorizontalAlign="Center" />
	</asp:GridView>
</div>
