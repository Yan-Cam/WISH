<%@page import="open.loginServlet"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, viewport-fit=cover">
<title>登陆</title>
<link rel="stylesheet" type="text/css"
	href="./ui/themes/default/easyui.css">
<!--引入CSS样式-->
<link rel="stylesheet" type="text/css" href="./ui/themes/icon.css">
<!--Icon引入-->
<!--汉化-->
<script type="text/javascript" src="./ui/jquery.min.js"></script>
<script type="text/javascript" src="./ui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="./ui/jquery.easyui.mobile.js"></script>
<script language="JavaScript" type="text/javascript" src="./ui/locale/easyui-lang-zh_CN.js"></script>
<style>
.top {
	z-index: 1;
	height: 3rem;
	background: white;
	display: flex;
	width: 100%;
	align-items: center;
	justify-content: center;
	position: fixed;
	top: 0;
	left: 0;
}

</style>
<title>登陆</title>
</head>
<body>
	<div class="top">
		<p style="font-size: 1.4rem; color: #585858;">用户登陆</p>
	</div>
	<div class="easyui-navpanel" style="margin-top: 2rem;">
		<div
			style="margin: 20px auto; width: 100px; height: 100px; border-radius: 100px; overflow: hidden;">
			<img src="./image/Add_User.svg"
				style="margin: 0; width: 100%; height: 100%">
		</div>
		<div style="padding: 0 20px">
			<form id="loginForm" method="post" action="">
				<div style="margin-bottom: 10px">
					<input id="username" name="username" class="easyui-textbox"
						data-options="prompt:'用户名',incoCls:'icon-man'"
						style="width: 100%; height: 38px"></input>
				</div>
				<div>
					<input id="password" name="password" class="easyui-passwordbox"
						data-options="prompt:'密码'" style="width: 100%; height: 38px"></input>
				</div>
				<div id="showMsg"
					style="padding: 5px 0; text-align: center; color: red"></div>
			</form>
			<div style="text-align: center; margin-top: 30px">
				<a  id="btn_login"
					class="easyui-linkbutton" style="width: 100%; height: 40px"> <span
					style="font-size: 16px">登录</span>
				</a>
			</div>
			<div style="text-align: center; margin-top: 30px">
				<a id="btn_register"
					class="easyui-linkbutton" style="width: 100%; height: 40px"> <span
					style="font-size: 16px">注册</span>
				</a>
			</div>

		</div>
	</div>
</body>
<script>
	$("#btn_login").on('click', () => {
		$("#loginForm").attr('action', 'loginServlet')
		$("#loginForm").submit() 
	})
	$("#btn_register").on('click', () => {
		$("#loginForm").attr('action', 'registerServlet')
		$("#loginForm").submit() 
	})
</script>
</html>
