<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册</title>
<link rel="icon" href="../image/icon.jpg" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/register.css">
</head>
<body>
<div class="re_div">
	<div class="cLeft">
		<p id="p1">新用户注册</p>
		<p id="p2">USER REGISTER</p>
	</div>
	<form action="${pageContext.request.contextPath}/RegisterServlet" method="POST" onsubmit="return Check()" class="cCenter">
		<table>
			<tr>
				<!-- 用户名表单验证 -->
				<td class="td_left"><label for="uname">用户名</label></td>
				<td class="td_center"><input type = "text" id="uname" name ="uname" placeholder="请输入用户名" onblur="usernameCheck()"/></td>
				<td class="td_right"><label for="uname" id="unameC"></label></td>
			</tr>
			<tr>
				<td class="td_left"><label for="upwd">密码</label></td>
				<td class="td_center"><input type = "password"  id="upwd" name ="upwd" placeholder="请输入密码" onblur="passwordCheck()"/></td>
				<td class="td_right"><label for="upwd" id="upwdC"></label></td>
			</tr>
			<tr>
				<td class="td_left"><label for="upwd1">确认密码</label></td>
				<td class="td_center"><input type = "password"  id="upwd1" name ="upwd1" placeholder="请再次输入密码"  onblur="re_passwordCheck()"/></td>
				<td class="td_right"><label for="upwd1" id="upwd1C"></label></td>
			</tr>
			<tr>
				<td class="td_left"><label for="mail">Email</label></td>
				<td class="td_center"><input type = "text" id="mail" name ="mail" placeholder="请输入邮箱" onblur="emailCheck()" /></td>
				<td class="td_right"><label for="mail" id="mailC"></label></td>
			</tr>
			<tr>
				<td class="td_left"><label for="phone">手机号</label></td>
				<td class="td_center"><input type="text" name="phone" id="phone" placeholder="请输入手机号" onblur="phoneCheck()"></td>
				<td class="td_right"><label for="phone" id="phoneC"></label></td>
			</tr>
			<tr>
				<td class="td_left"><label>性别</label></td>
				<td class="td_center">
					<input type="radio" name="gender" value="male"> 男
					<input type="radio" name="gender" value="female"> 女
				</td>
				<td class="td_right"><label id="genderC"></label></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type = "submit" id="entry" value = "注册"></td>
			</tr>
			<tr>
				<td class="td_left"><label></label></td>
				<td class="td_center"><p id="p3">已有账号?<a href="<c:url value="/jsp/login.jsp"/>">立即登录</a></p></td>
			</tr>
		</table>
		<!-- 表单输入数据给后台，返回的错误的消息提示功能 -->
		<div id="msg" class="register_level">
			<!-- 提示信息 -->
			<p color="red" id="errorMsg">${requestScope.errorMsg}</p>
		</div>
</form>
</div>
<!-- js代码 -->
<script type = "text/javascript">
	var usernameCheck=function(){
		var judge=true;
		var uname=document.getElementById("uname");
		var unameC=document.getElementById("unameC");
		if(uname.value.length===0){
			unameC.innerHTML="请输入用户名";
			judge=false
		}
		if(judge===true){
			unameC.innerHTML="";
		}
		return judge;
	};
	var passwordCheck=function(){
		var judge=true;
		var upwd=document.getElementById("upwd");
		var upwdC=document.getElementById("upwdC");
		var rule=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/;
		var ru=new RegExp(rule);
		if(!ru.test(upwd.value)){
			upwdC.innerHTML="请输入6-20个字母、数字、下划线 作为密码";
			judge=false;
		}
		if(judge===true){
			upwdC.innerHTML="";
		}
		return judge;
	};
	var re_passwordCheck=function(){
		var judge=true;
		var upwd=document.getElementById("upwd");
		var upwd1=document.getElementById("upwd1");
		var upwd1C=document.getElementById("upwd1C");
		if(upwd1.value.length===0){
			upwd1C.innerHTML="请再次输入密码";
			judge=false;
		}
		if(upwd1.value!==upwd.value){
			upwd1C.innerHTML="与输入的密码不一致";
			judge=false;
		}
		if(judge===true){
			upwd1C.innerHTML="";
		}
		return judge;
	}

	var emailCheck=function(){
		var judge=true;
		var mail=document.getElementById("mail");
		var emailC=document.getElementById("mailC");
		var rule=/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
		var ru=new RegExp(rule);
		if(mail.value.length===0){
			mailC.innerHTML="请输入邮箱地址";
			judge=false;
		}
		else{
			if(!ru.test(mail.value)){
				mailC.innerHTML="邮箱地址有误";
				judge=false;
			}
		}
		if(judge===true){
			mailC.innerHTML="";
		}
		return judge;
	};
	var phoneCheck=function(){
		var judge=true;
		var phone=document.getElementById("phone");
		var phoneC=document.getElementById("phoneC");
		var rule=/^1[3|4|5|7|8][0-9]{9}$/;
		var ru=new RegExp(rule);
		if(phone.value.length===0){
			phoneC.innerHTML="请输入电话号码";
			judge=false;
		}
		else{
			if(!ru.test(phone.value)){
				phoneC.innerHTML="电话号码有误";
				judge=false;
			}
		}
		if(judge===true){
			telC.innerHTML="";
		}
		return judge;
	};
	var genderCheck=function(){
		var judge=false;
		var gender=document.getElementsByName("gender");
		var genderC=document.getElementById("genderC");
		for(var i=0;i<gender.length;i++){
			if(gender[i].checked){
				alert(gender[i].value);
				judge=true;
			}
		}
		if(judge===false){
			genderC.innerHTML="请选择性别";
		}
		else{
			genderC.innerHTML="";
		}
		return judge;
	};
	var Check=function(){
		if(usernameCheck()&&passwordCheck()&&re_passwordCheck()&&emailCheck()&&phoneCheck()&&genderCheck()){
			return false;
		}
		else{
			usernameCheck();
			passwordCheck();
			re_passwordCheck();
			emailCheck();
			phoneCheck();
			genderCheck();
			return false;
		}
	};
	window.onload=function () {
		var errorMsg=document.getElementById("errorMsg");
		var unameC=document.getElementById("unameC");
		if (errorMsg.innerHTML.length === 0||errorMsg.innerHTML === ""){
		}
		else {
			if(errorMsg.innerHTML === "用户名重复"){
				unameC.innerHTML=errorMsg.innerHTML;
				errorMsg.style.display="none";
			}
		}
	}
</script>
</body>
</html>