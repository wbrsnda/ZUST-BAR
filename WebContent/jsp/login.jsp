<%@ page contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
<link rel="icon" href="../image/icon.jpg" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/init.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
<form action="${pageContext.request.contextPath}/LoginServlet" method="post" id="login_form">
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
		if(username.value === ""){
			uname_check.style.display="block";
			name.style.position="relative";
			pwd.style.position="relative";
			verify.style.position="relative";
			func.style.position="relative";
		}else if(password.value === ""){
			upwd_check.style.display="block";
			pwd.style.position="relative";
			verify.style.position="relative";
			func.style.position="relative";
		}else if(code.value === ""){
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
		if(errorMsg.innerHTML.length=== 0||errorMsg.innerHTML===""){

		}
		else {
			if(errorMsg.innerHTML==="验证码输入错误!"){
				verify_check.style.display="block";
				verify_text.innerHTML=errorMsg.innerHTML;
				verify.style.position="relative";
				func.style.position="relative";
			}
			if(errorMsg.innerHTML==="密码错误!"){
				upwd_check.style.display="block";
				pwd_text.innerHTML=errorMsg.innerHTML;
				pwd.style.position="relative";
				verify.style.position="relative";
				func.style.position="relative";
			}
			if(errorMsg.innerHTML==="该用户名不存在"){
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

