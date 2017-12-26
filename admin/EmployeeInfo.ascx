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

<blockquote style="position: absolute; top: 0.8%">[ 删改查 ] 员工信息</blockquote>
<hr class="layui-bg-green">
<div>
	<div class="layui-form-item">
		<label class="layui-form-label">用户名:</label>
		<div class="layui-input-inline">
			<asp:TextBox ID="tbSearchUserName" runat="server" placeholder="请输入用户名" autocomplete="off" CssClass="layui-input"></asp:TextBox>
		</div>

		<%--<label class="layui-form-label">项目名称:</label>
		<div class="layui-input-inline">
			<asp:DropDownList ID="ddlProjectName" runat="server" OnSelectedIndexChanged="ddlProjectName_SelectedIndexChanged" AutoPostBack="True" ForeColor="Gray" CssClass="ddl">
			</asp:DropDownList>
		</div>--%>

		<label class="layui-form-label">所属部门:</label>
		<div class="layui-input-inline">
			<asp:DropDownList ID="ddlDepartment" runat="server" ForeColor="Gray" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged" AutoPostBack="true" CssClass="ddl">
			</asp:DropDownList>
		</div>

		<div class="layui-input-inline">
			<asp:Button ID="btnSearch" runat="server" Text="查询用户" CssClass="layui-btn" OnClick="btnSearch_Click" />
			<asp:Button ID="btnReset" runat="server" Text="重			置" CssClass="layui-btn" OnClick="btnReset_Click" />
		</div>
	</div>
	<asp:GridView ID="gvUser" runat="server" OnPageIndexChanging="gvUser_PageIndexChanging" OnRowDataBound="gvUser_RowDataBound" OnRowCommand="gvUser_RowCommand" AutoGenerateColumns="False" AllowPaging="true" PageSize="10" CssClass="layui-table">
		<Columns>
			<asp:TemplateField HeaderText="序号" ItemStyle-Width="4.6%">
				<ItemStyle HorizontalAlign="Center" />
				<HeaderStyle HorizontalAlign="Center" Width="4.6%" />
			</asp:TemplateField>
			<asp:BoundField DataField="U_UserName" HeaderText="用户名" ItemStyle-Width="8%" HeaderStyle-HorizontalAlign="Center" />
			<asp:BoundField DataField="U_ChineseName" HeaderText="姓名" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" />
			<asp:BoundField DataField="U_Department" HeaderText="部门" HeaderStyle-HorizontalAlign="Center" />
			<%--<asp:BoundField DataField="U_ProjectName" HeaderText="项目名称" ItemStyle-Width="44.2%" HeaderStyle-HorizontalAlign="Center" />--%>
			<asp:BoundField DataField="U_Contact" HeaderText="联系方式" ItemStyle-Width="12%" HeaderStyle-HorizontalAlign="Center" />
			<asp:TemplateField HeaderText="编辑" ItemStyle-Width="4.6%">
				<ItemTemplate>
					<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/resources/images/edit2.png" Height="21" Width="21" CommandName="Ed" CommandArgument='<%#Eval("U_UserName") %>'></asp:ImageButton>
				</ItemTemplate>
				<ItemStyle HorizontalAlign="Center" />
				<HeaderStyle HorizontalAlign="Center" Width="4.6%" />
			</asp:TemplateField>
			<asp:TemplateField HeaderText="删除" ItemStyle-Width="4.6%">
				<ItemTemplate>
					<asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/resources/images/delete1.png" Height="21" Width="21" CommandName="De" CommandArgument='<%#Eval("U_UserName") %>'></asp:ImageButton>
				</ItemTemplate>
				<ItemStyle HorizontalAlign="Center" />
				<HeaderStyle HorizontalAlign="Center" Width="4.6%" />
			</asp:TemplateField>
		</Columns>
		<HeaderStyle HorizontalAlign="Center" BackColor="#2F4056" ForeColor="White" Height="36px" Font-Size="10pt" />
		<RowStyle HorizontalAlign="Center" Font-Size="10pt" />
	</asp:GridView>
</div>
