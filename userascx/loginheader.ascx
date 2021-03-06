﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="loginheader.ascx.cs" Inherits="userascx_loginheader" %>

<script src="../Resources/Common/js/jquery-1.12.3.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="../layui/css/layui.css" />
<script type="text/javascript">
	window.onload = function () {
		function getNowTime() {
			var date = new Date();

			return date.getFullYear() + "年"
				+ (date.getMonth() + 1) + "月"
				+ date.getDate() + "日"
				+ " "
				+ date.getHours() + "时"
				+ date.getMinutes() + "分"
				+ date.getSeconds() + "秒";
		}

		setInterval(function () {
			document.getElementById("showTime").innerHTML = "北京时间: " + getNowTime();
		}, 1000);
	}
</script>

<div style="width:100%; height:21%">
	<div style="position: absolute; top: 0px; left: 0px; height:15%; width:100%;background-color:MidnightBlue">
		<table style="height:100%; width:100%;">
			<tr>
				<td align="center" style="width: 100%; height:100%">
					<div style="width:100%;">
							<span style="font-size:4.2em; font-family:华文新魏; text-align:center; font-weight:600; text-shadow:3px 4px 2px #333; color:whitesmoke">禹步工单系统</span>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<ul class="layui-nav" style="width: 100%; background-color:#2F4056; font-size:larger; height:6%; position:absolute; left:0; top:15%;">
		<li class="layui-nav-item" style="position:absolute; left:2%; font-size:12pt;">
			<p id="showTime">北京时间：</p>
		</li>
	</ul>
</div>