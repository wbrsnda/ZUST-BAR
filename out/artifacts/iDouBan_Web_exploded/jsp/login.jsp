<%@ page contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>登录</title>
	<link rel="icon" href="../image/icon.jpg" type="image/x-icon">
	<style type="text/css">
		/*样式初始化*/
		*{
			margin:0;
			padding:0;/*清除内外边距*/
		}
		ul{
			list-style:none;/*去掉列表中的样式的小点*/
		}
		a:link,a:visited{/*去掉下划线*/
			text-decoration:none;
		}
		/*绝对定位*/
		#login {
			background-color: #f8f8f8;
			width: 400px;
			height: 400px;
			float: right;
			margin-right: 425px;
			border-radius: 15px;
			border: 3px solid #551A8B;
			margin-top: 100px;
		}
		/*登录标题*/
		#header_h1{
			padding: 20px 128px;
			color: #111111;
			font-family: STHupo;
			text-align: center;
		}
		/*对表单元素中的input的输入框进行统一格式处理*/
		/*对齐中长方形*/
		#uname,#upwd {
			margin-bottom: 10px;
			outline: none;
			border-radius: 3px;
			border: 3px solid #551A8B;
			text-decoration: none;
			width: 300px;
			height: 42px;
			display: block;/*显示为块级元素，此元素前后会带有换行符*/
			color: black;
			font-size: 14px;
		}
		#uname,#upwd{/*输入框的初始化布局设置*/
			background-color:white;
			padding-left: 10px;
			border: 1px solid #551A8B;
		}
		#name{
			top: -34px;
		}
		#pwd{
			top: -34px;
		}
		#verify{
			top: -34px;
		}
		/*登录按钮的样式*/
		#entry{
			background-color: #0091ff;
			width: 300px;
			height: 42px;
			margin-bottom: 10px;
			margin-left:50px;
			outline: none;
			border-radius: 3px;
			text-decoration: none;
			border-style: none;
			font-size: 18px;
			font-family: STHupo;
		}
		/*输入框被点击时发生反应*/
		#uname:focus {
			background: white;/*输入框背景颜色*/
			border: 1px solid grey;/*边框大小和颜色*/
		}
		#upwd:focus {
			background: white;
			border: 1px solid grey;
		}
		#entry:hover{
			background: blue;
		}
		/*验证码的输入框*/
		#verify_code{
			padding-left: 10px;
			margin-bottom: 10px;
			vertical-align:middle;/*input img同一行的方法*/
			outline: none;
			border-radius: 3px;
			text-decoration: none;
			border-style: none;
			width: 200px;
			height: 42px;
			color: black;
			font-size: 14px;
		}
		/*验证码图片*/
		#verify_pic{
			margin-bottom: 10px;
			outline: none;
			border-radius: 3px;
			text-decoration: none;
			border-style: none;
			width: 85px;
			height: 42px;
			vertical-align:middle;
		}
		/*验证码一行*/
		.verify_inner{
			margin-bottom: 10px;
			outline: none;
			border-radius: 3px;
			text-decoration: none;
			border-style: none;
			width: 300px;
			height: 42px;
			color: black;
			font-size: 14px;
		}
		/*设置换验证码按钮的位置*/
		#btn{
			margin-left:45px;
			color:#220903;
			outline: none;
			border-radius: 3px;
			text-decoration: none;
			border-style: none;
			background-color: grey;
			font-family: STHupo;
			font-size: 15px;
		}
		/*div的设置统一长方形方块*/
		.login_level{
			width: 350px;
			height: 50px;
			margin-left:50px;
		}
		/*三个按钮*/
		#select{
			width: 350px;
			height: 30px;
			margin-left:50px;
		}
		/*底部两个链接的位置*/
		#login_bottom_find{
			margin-left: 50px;
			border-style: none;
			width: 300px;
			height: 42px;
			color: black;
			font-size: 14px;
		}
		#login_bottom_sign{
			margin-left:180px;
			border-style: none;
			width: 300px;
			height: 42px;
			font-size: 14px;
		}
		.b1{
			font-family: "Adobe Arabic";
			font-size: 14px;
			font-weight: bold;
		}
		.b2{
			font-family: "Adobe Arabic";
			font-size: 14px;
			font-weight: bold;
			color: black;
		}
		a:hover,a:active{
			color: #eb50d6;
		}
		input::placeholder {
			font-size: 14px;
			font-family: "Adobe Arabic";
			letter-spacing: 1px;
			color: grey;
			text-align: center;
		}
		body{
			background-image: url(../image/lo1.jpg);
			background-repeat:no-repeat;
			background-attachment:fixed;
			margin: 0;
			background-size:cover;
		}
		.mini_content_uname{
			display: none;
			position: relative;
			left: 260px;
			top: -30px;
			padding: 6px 13px 6px 10px;
			background: #fff;
			border-radius: 3px;
			border: 1px solid #ccc;
			width: 120px;
			height: 18px;
			font-size: 12px;
			text-align: center;
			box-shadow: 0 4px 20px 1px rgba(0,0,0,0.2);
			z-index: 2;
		}
		.mini_content_uname::after,.mini_content_uname::before{
			position:absolute;
			top: 100%;
			left: 50%;
			border: solid transparent;
			content: "";
			height: 0;
			width: 0;
		}
		.mini_content_uname::after{
			border-color: transparent;
			border-top-color: #f0fbff;
			border-width: 6px;
			margin-left: -6px;
		}
		.mini_content_uname::before{
			border-color: transparent;
			border-top-color: #c6c4bd;
			border-width: 8px;
			margin-left: -8px;
		}
		.mini_content_upwd{
			display: none;
			position: relative;
			left: 260px;
			top: -30px;
			padding: 6px 13px 6px 10px;
			background: #fff;
			border-radius: 3px;
			border: 1px solid #ccc;
			width: 120px;
			height: 18px;
			font-size: 12px;
			text-align: center;
			box-shadow: 0 4px 20px 1px rgba(0,0,0,0.2);
			z-index: 2;
		}
		.mini_content_upwd::after,.mini_content_upwd::before{
			position:absolute;
			top: 100%;
			left: 50%;
			border: solid transparent;
			content: "";
			height: 0;
			width: 0;
		}
		.mini_content_upwd::after{
			border-color: transparent;
			border-top-color: #f0fbff;
			border-width: 6px;
			margin-left: -6px;
		}
		.mini_content_upwd::before{
			border-color: transparent;
			border-top-color: #c6c4bd;
			border-width: 8px;
			margin-left: -8px;
		}
		.mini_content_verify{
			display: none;
			position: relative;
			left: 260px;
			top: -30px;
			padding: 6px 13px 6px 10px;
			background: #fff;
			border-radius: 3px;
			border: 1px solid #ccc;
			width: 120px;
			height: 18px;
			font-size: 12px;
			text-align: center;
			box-shadow: 0 4px 20px 1px rgba(0,0,0,0.2);
			z-index: 2;
		}
		.mini_content_verify::after,.mini_content_verify::before{
			position:absolute;
			top: 100%;
			left: 50%;
			border: solid transparent;
			content: "";
			height: 0;
			width: 0;
		}
		.mini_content_verify::after{
			border-color: transparent;
			border-top-color: #f0fbff;
			border-width: 6px;
			margin-left: -6px;
		}
		.mini_content_verify::before{
			border-color: transparent;
			border-top-color: #c6c4bd;
			border-width: 8px;
			margin-left: -8px;
		}
		.mini_text{
			height: 20px;
			width: 90px;
			float: left;
		}
		.close_mini{
			float: left;
			position: relative;
		}
		#func{
			top: -34px;
		}
	</style>
	<!-- 背景图片的设置 CSS-->
</head>

<body>
<form action="${pageContext.request.contextPath}/LoginServlet" method="post" id="login_form">
	<%-- <font color="red">${requestScope.message}</font> --%>
	<div id="login">
		<div ><h1 id="header_h1">登录</h1></div>
		<!-- 登录的长方形界面框 -->
		<div class="mini_content_uname" id="uname_check">
			<div class="mini_text" id="name_text">请输入用户名</div>
			<a href="javascript:void (0);" class="close_mini"  onclick="close_mini_content()">X</a>
		</div>
		<div id="name" class="login_level">
			<!-- 获取cookie中的对象的值 -->
			<input type="text" id="uname"   name="uname"  value="${cookie.uname.value}" placeholder="请输入用户名" onclick="close_mini_content()">
		</div>
		<div class="mini_content_upwd" id="upwd_check">
			<div class="mini_text" id="pwd_text">请输入密码</div>
			<a href="javascript:void (0);" class="close_mini" id="close_login" onclick="close_mini_content()">X</a>
		</div>
		<div id="pwd" class="login_level">
			<input type="password" id="upwd" name="upwd"  value="${cookie.upwd.value}"  placeholder="请输入密码" onclick="close_mini_content()">
		</div>
		<!-- 验证码的输入框 + 验证码图片 -->
		<div class="mini_content_verify" id="verify_check">
			<div class="mini_text" id="verify_text">请输入验证码</div>
			<a href="javascript:void (0);" class="close_mini" id="close_login2" onclick="close_mini_content()">X</a>
		</div>
		<div id="verify" class="login_level">
			<!-- 验证码-->
			<div class="verify_inner">
				<input type="text" name="image"  placeholder="请输入验证码" id="verify_code" onclick="close_mini_content()">
				<img alt="验证码" src="${pageContext.request.contextPath}/VerifyCodeServlet" width="80" height ="42" id="verify_pic">
			</div>
		</div>
		<div id="func">
			<div  id="select">
				<label class="b1">
					<input type="checkbox" name="auto" id="auto"/>自动登录
				</label>
				<label class="b1">
					<input type="checkbox" name="remember" value="" id="remember"/>记住密码
				</label>
				<label class="b1">
					<input type="button" value="看不清? 换一张" id="btn" style="cursor: pointer;">
				</label>
			</div>
			<div>
				<input type="button" onclick="check()" value="登录" id="entry" />
			</div>
			<!-- 自动登录的功能 -->
			<div>
				<a href="<c:url value="/jsp/register.jsp"/>" id="login_bottom_find"><label class="b2" >忘记密码</label></a>
				<a href="<c:url value="/jsp/register.jsp"/>" id="login_bottom_sign"><label class="b2" >注册账号</label></a>
			</div>
			<!-- 表单输入数据给后台，返回的错误的消息提示功能 -->
			<div id="msg" class="login_level">
				<!-- 提示信息 -->
				<p id="errorMsg" style="display: none;">${requestScope.errorMsg}</p>
				<%-- <!-- 提示信息 --><font color="red">${requestScope.imageMsg}</font> --%>
				<%--  <!-- 提示信息 --><font color="red">${requestScope.pwdError}</font> --%>
			</div>
		</div>
	</div>
</form>
<!--  自动登录按钮被点击后 非空判断  -->
<c:if test="${not empty cookie.auto.value}">
	<!-- 重定位到登陆界面 -->
	<c:redirect url="/jsp/alter.jsp" />
</c:if>
<!-- JS代码-->
<script type="text/javascript">
	//检查用户输入是否为空
	function check(){
		var username = document.getElementById("uname");
		var uname_check=document.getElementById("uname_check");
		var password = document.getElementById("upwd");
		var upwd_check=document.getElementById("upwd_check");
		var code = document.getElementById("verify_code");
		var verify_check=document.getElementById("verify_check");
		var name=document.getElementById("name");
		var pwd=document.getElementById("pwd");
		var verify=document.getElementById("verify");
		var func=document.getElementById("func");
		uname_check.style.display="none";
		upwd_check.style.display="none";
		verify_check.style.display="none";
		name.style.position="";
		pwd.style.position="";
		verify.style.position="";
		func.style.position="";
		if(username.value == ""){
			uname_check.style.display="block";
			name.style.position="relative";
			pwd.style.position="relative";
			verify.style.position="relative";
			func.style.position="relative";
		}else if(password.value == ""){
			upwd_check.style.display="block";
			pwd.style.position="relative";
			verify.style.position="relative";
			func.style.position="relative";
		}else if(code.value == ""){
			verify_check.style.display="block";
			verify.style.position="relative";
			func.style.position="relative";
		}else{
			document.forms[0].submit();
		}
	}
	function close_mini_content(){
		var uname_check=document.getElementById("uname_check");
		var upwd_check=document.getElementById("upwd_check");
		var verify_check=document.getElementById("verify_check");
		var name=document.getElementById("name");
		var pwd=document.getElementById("pwd");
		var verify=document.getElementById("verify");
		var func=document.getElementById("func");
		uname_check.style.display="none";
		upwd_check.style.display="none";
		verify_check.style.display="none";
		name.style.position="";
		pwd.style.position="";
		verify.style.position="";
		func.style.position="";
	}
	window.onload=function () {
		var errorMsg=document.getElementById("errorMsg");
		var uname_check=document.getElementById("uname_check");
		var upwd_check=document.getElementById("upwd_check");
		var verify_check=document.getElementById("verify_check");
		var name_text=document.getElementById("name_text");
		var pwd_text=document.getElementById("pwd_text");
		var verify_text=document.getElementById("verify_text");
		if(errorMsg.innerHTML.length== 0||errorMsg.innerHTML==""){

		}
		else {
			if(errorMsg.innerHTML=="验证码输入错误!"){
				verify_check.style.display="block";
				verify_text.innerHTML=errorMsg.innerHTML;
				verify.style.position="relative";
				func.style.position="relative";
			}
			if(errorMsg.innerHTML=="密码错误!"){
				upwd_check.style.display="block";
				pwd_text.innerHTML=errorMsg.innerHTML;
				pwd.style.position="relative";
				verify.style.position="relative";
				func.style.position="relative";
			}
			if(errorMsg.innerHTML=="该用户名不存在"){
				uname_check.style.display="block";
				name_text.innerHTML=errorMsg.innerHTML;
				name.style.position="relative";
				pwd.style.position="relative";
				verify.style.position="relative";
				func.style.position="relative";
			}
		}
	}
	//按钮点击，更改验证码的图片 动态获取img元素----不用重定位或者转发，在原页面实现验证码图片的转化
	document.getElementById("btn").onclick = function () {
		// 改变src，从而让浏览器发送请求到servlet
		//该方法先获取其标签img 再对应的是第一个标签（下标从0开始）
		//根据系统时间在点击之后改变验证码
		document.getElementsByTagName("img")[0].src =
				"/iDouBan_Web_exploded/VerifyCodeServlet?time=" + new Date().getTime();
	};
</script>
</body>
</html>

