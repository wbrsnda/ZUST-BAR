<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的主页</title>
<link rel="icon" href="../image/icon.jpg" type="image/x-icon">
	<!-- 我的页面的样式 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/init.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/my_page.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/star.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
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
			<!-- 第二个导航栏 -->
			<header id="second">
					<nav  id="second_menu">
						<!-- logo部分 -->
							<div class="logo">
							 	<img alt="logo" src="<c:url value="/image/logo1.png"/>" width=175px height=58px>
							</div>
						<!-- 导航栏部分_可选择部分 -->
							<div class="navbar">
								<ul>
									<li><a href="<c:url value="/jsp/my_page.jsp"/>">个人主页</a></li>
									<li><a href="${pageContext.request.contextPath}/ArticleListServlet?method=article_list">浏览发现</a></li>
								</ul>	
							</div>
							<!-- 搜索框部分 -->
							<div class="search">
									<form action="">
										<!-- placeholder占位符 -->
										<input type="text" placeholder="搜索你感兴趣的内容和人">
										<!-- placeholder--默认显示值 -->
										<input  type="submit" value="→">
									</form>
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
								 <img src="<c:url value="${sessionScope.userInfo.portrait}"/>"  alt="我的头像" id="user_img"/><br/>
							 	<label id="welcome_msg">
						        	 ${sessionScope.userInfo.username}<br/>
						     	</label>
							 </div>
							<!-- 个人信息 -->
							<div id="user_info_show">
								<label>个人信息</label><br/>
								<label id="name1">昵称：${sessionScope.userInfo.nickname}</label><br/>
								<label id="gender1">性别：${sessionScope.userInfo.gender}</label><br/>
								<label id="mail1">邮箱：${sessionScope.userInfo.mail}</label><br/>
								<label id="phone1">电话：${sessionScope.userInfo.phone}</label><br/>
								<label id="signature1">个性签名：${sessionScope.userInfo.signature}</label><br/>
								<label id="introduce1">自我介绍：${sessionScope.userInfo.selfIntroduc}</label><br/>
								<label id="address1">地址：${sessionScope.userInfo.address}</label>
							 </div>
							 <br>
						</div>
						<div id="main_content-left-centre">
					</div>
				</div>
				<div id="main_content-right">
				</div>
			</div>
		</div>
		</body>
</html>