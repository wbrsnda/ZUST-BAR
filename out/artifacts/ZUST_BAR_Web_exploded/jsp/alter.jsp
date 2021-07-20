<%@ page  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>账号管理</title>
<link rel="icon" href="../image/icon.jpg" type="image/x-icon">
<!-- 登录成功之后，进行个人信息的修改 -->
<!-- 导航栏 -->
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/alter.css">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/star.css">
</head>
		<!-- 个人信息的主页 -->
		<body>
		<div class="stars">
			<!-- 顶部的菜单栏 -->
			<nav id="first">
				<div id="first_menu">
					<!-- 跳到servlet，对用户的cookie进行注销 -->
				    <a  href="${pageContext.request.contextPath}/ClearLoginServlet">退出登录</a>
				    <!-- 相对于端口号的相对路径 -->
					<a  href="<c:url value="/jsp/alter.jsp"/>">账号管理</a>
					<a  href="<c:url value="/jsp/my_page.jsp"/>">个人主页</a>
					<a href="${pageContext.request.contextPath}/PrivateMailServlet?method=my_privatemail_list">私信</a>
					<a href="${pageContext.request.contextPath}/FriendListServlet?method=blacklist_list">黑名单</a>
					<a href="${pageContext.request.contextPath}/FriendListServlet?method=attention_list">我的关注</a>
					<!-- 先跳转servlet 查询第一页的所有人信息 -->
					<a href="${pageContext.request.contextPath}/EveryoneListServlet?method=everyone_list">所有人</a>
					<!-- 编辑文章 -->
					<a href="<c:url value="/jsp/article_edit.jsp"/>" target="_blank">写文章</a>
					<a href="${pageContext.request.contextPath}/ArticleListServlet?method=article_list">所有文章</a>
					<a href="${pageContext.request.contextPath}/ArticleListServlet?method=my_article_list" >我的文章</a>
					<a href="${pageContext.request.contextPath}/ArticleListServlet?method=my_collection_list">我的收藏</a>
				</div>
			</nav>
				<header  id="second1">
					<nav  id="second_menu">
					<!-- logo部分 -->
						<div class="logo">
							<img alt="logo" height=58px src="<c:url value="/image/logo1.png"/>" width=175px>
						</div>
					</nav>
				</header>
				<span></span><span></span><span></span>
				<span></span><span></span><span></span>
				<span></span><span></span><span></span>
				<span></span><span></span><span></span>
				<span></span><span></span><span></span>
				<span></span><span></span><span></span>
				<span></span><span></span>
		     		<!-- 显示主要内容的地方 -->
					<div id="main_content">
						<div id="main_content-left">
							<!-- 放置个人头像和信息 -->
							<div id="main_content-left-top">
								 <!-- 显示头像 -->
										 <div>
									        欢迎您： ${sessionScope.uname}<br/>
										 <img src="<c:url value="${sessionScope.userInfo.portrait}"/>"  alt="我的头像" width="120" height="100" /><br/>
										 </div>
										 <!-- 用户更换头像 -->
										  <div>
										  <form action="${pageContext.request.contextPath}/UploadServlet" method="post" enctype="multipart/form-data">
											选择文件：<input type="file" name="photo" value="" /><br/>
											 		  <input type="submit"  name = "修改" value="上传头像"/> 
											 </form>
										 </div>
										 <!-- 用作个人主页的信息展示 -->
										 <div>
											 <form action="${pageContext.request.contextPath}/MyPageServlet" method="post">
											 昵称：	  <input type = "text" name ="nickname" /><br/>
											 个性签名：<input type = "text" name ="signature" /><br/>
											 自我介绍：<input type = "text" name ="selfIntroduc" /><br/>
											 地址：	  <input type = "text" name ="address" /><br/>
									 	  			  <input type = "submit" value = "修改">
											 </form>
										 </div>
							</div>
							<div id="main_content-left-centre">
							</div>
						</div>
						<div id="main_content-right">
						</div>
					</div>
		</div>
         			登录成功 <br/>
</body>
</html>