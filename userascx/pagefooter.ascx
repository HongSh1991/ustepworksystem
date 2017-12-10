<%@ Control Language="C#" AutoEventWireup="true" CodeFile="pagefooter.ascx.cs" Inherits="userascx_pagefooter" %>

<link rel="stylesheet" href="../layui/css/layui.css" type="text/css" />

<div class="layui-footer" style="color:lightgray; background-color:#2F4056; position:absolute; bottom:0px; left:0px; width:100%;" >
	<table style="height:66px;width:100%; text-align:center;">
		<tr>
			<td>
				Copyright © 
				<asp:Label ID="lbTime" runat="server" Text=""></asp:Label>
				 ustep. All rights reserved.
			</td>
		</tr>
	</table>
</div>