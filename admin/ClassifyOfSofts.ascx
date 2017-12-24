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
</div>