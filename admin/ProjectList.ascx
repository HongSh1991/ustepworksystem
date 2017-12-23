<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProjectList.ascx.cs" Inherits="admin_ProjectList" %>

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

	a:link {
		color: deepskyblue;
	}
	/* 未被访问的链接 */
	a:visited {
		color: deepskyblue;
	}
	/* 已被访问的链接 */
	a:hover {
		color: #ff6a00;
	}
	/* 鼠标指针移动到链接上 */
	a:active {
		color: darkorchid;
	}
	/* 正在被点击的链接 */
</style>

<blockquote style="position: absolute; top: 0.8%">[删改查]项目信息</blockquote>
<hr class="layui-bg-green">
<div>
	<div class="layui-form-item">
		<label class="layui-form-label">项目名称:</label>
		<div class="layui-input-inline">
			<asp:TextBox ID="tbSearchProject" runat="server" placeholder="请输入项目名称" autocomplete="off" CssClass="layui-input"></asp:TextBox>
		</div>

		<div class="layui-input-inline">
			<asp:Button ID="btnSearchProj" runat="server" Text="查询项目" CssClass="layui-btn" OnClick="btnSearchProj_Click" />
			<asp:Button ID="btnReset" runat="server" Text="重置" CssClass="layui-btn" OnClick="btnReset_Click" />
		</div>
	</div>
	<asp:GridView ID="gvPeojectInfo" runat="server" OnPageIndexChanging="gvPeojectInfo_PageIndexChanging" OnRowDataBound="gvPeojectInfo_RowDataBound" OnRowCommand="gvPeojectInfo_RowCommand" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" CssClass="layui-table">
		<Columns>
			<asp:TemplateField HeaderText="序号" ItemStyle-Width="4.6%">
				<ItemStyle HorizontalAlign="Center" />
				<HeaderStyle HorizontalAlign="Center" Width="4.6%" />
			</asp:TemplateField>
			<asp:TemplateField HeaderText="项目名称">
				<ItemTemplate>
					<a href="/downLoadFiles.aspx?P_ProjectName='<%#Eval("P_ProjectName")%>'" target="_blank"><span style="font-weight:500"><%#Eval("P_ProjectName") %></span></a>
					<%--<asp:LinkButton ID="lbtnDownLoadProject" runat="server" CommandName="Dl" CommandArgument='<%#Eval("P_ProjectName") %>'><%#Eval("P_ProjectName") %></asp:LinkButton>--%>
				</ItemTemplate>
			</asp:TemplateField>
			<asp:TemplateField HeaderText="编辑" ItemStyle-Width="4.6%">
				<ItemTemplate>
					<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/resources/images/edit2.png" Height="21" Width="21" CommandName="Ed" CommandArgument='<%#Eval("P_ProjectName") %>'></asp:ImageButton>
				</ItemTemplate>
				<ItemStyle HorizontalAlign="Center" />
				<HeaderStyle HorizontalAlign="Center" Width="4.6%" />
			</asp:TemplateField>
			<asp:TemplateField HeaderText="删除" ItemStyle-Width="4.6%">
				<ItemTemplate>
					<asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/resources/images/delete1.png" Height="21" Width="21" CommandName="De" CommandArgument='<%#Eval("P_ProjectName") %>'></asp:ImageButton>
				</ItemTemplate>
				<ItemStyle HorizontalAlign="Center" />
				<HeaderStyle HorizontalAlign="Center" Width="4.6%" />
			</asp:TemplateField>
		</Columns>
		<HeaderStyle HorizontalAlign="Center" BackColor="#2F4056" ForeColor="White" Height="42px" />
		<RowStyle HorizontalAlign="Center" />
	</asp:GridView>
</div>