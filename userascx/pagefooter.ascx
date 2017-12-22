<%@ Control Language="C#" AutoEventWireup="true" CodeFile="pagefooter.ascx.cs" Inherits="userascx_pagefooter" %>

<link rel="stylesheet" href="../layui/css/layui.css" type="text/css" />

<div style="color:gray; /*background-color:#2F4056;*/ width:100%; height:100%;" >
	<table style="height:100%;width:100%; text-align:center;">
		<tr>
			<td style="height:100%; width:100%; color:gray;">
				Copyright &copy; 
				<asp:Label ID="lbTime" runat="server" Text=""></asp:Label>
				 ustep. All rights reserved.
			</td>
		</tr>
	</table>
</div>