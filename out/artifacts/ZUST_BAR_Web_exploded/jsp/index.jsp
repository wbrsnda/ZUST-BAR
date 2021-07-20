<%@ page  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>welcome</title>
<link rel="icon" href="../image/icon.jpg" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/star.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css">
</head>
<body>
<h1>Welcome.</h1>
<div class="stars">
    <span></span><span></span><span></span>
    <span></span><span></span><span></span>
    <span></span><span></span><span></span>
    <span></span><span></span><span></span>
    <span></span><span></span><span></span>
    <span></span><span></span><span></span>
    <span></span><span></span>
    <div id="a1"><a href="<c:url value="/jsp/register.jsp"/>">注册账号</a></div>
    <div id="a2"><a href="<c:url value="/jsp/login.jsp"/>">已有账号?立即登录</a></div>
</div>
</body>
</html>