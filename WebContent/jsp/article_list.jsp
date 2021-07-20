<%@ page contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>文章列表</title>
	<link rel="icon" href="../image/icon.jpg" type="image/x-icon">
	<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
	<!-- 显示文章列表的页面 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/init.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/star.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/article_list.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/page.css">
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
			<form action="${pageContext.request.contextPath}/ArticleListServlet?method=search_article_list&currentPage=1" id="search_action" method="post">
				<!-- placeholder占位符 -->
				<input type="text" name="search_content" id="search_content" placeholder="搜索你感兴趣的内容和人">
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
		<%--文章的信息列表 --%>
		<div id="main_content-left-top">
			<!-- 标题的选择 -->
			<!-- 展示文章的信息列表 --分页列表---包含模糊搜索的功能-->
			<c:choose>
				<c:when test="${requestScope.msg=='我的文章'}">
					<div >
						<h1  style="margin-bottom: 20px;">我的文章</h1>
					</div>
				</c:when>
				<c:when test="${requestScope.msg=='所有文章'}">
					<div >
						<h1  style="margin-bottom: 20px;">文章列表</h1>
					</div>
				</c:when>
				<c:when test="${requestScope.msg=='我的收藏'}">
					<div >
						<h1  style="margin-bottom: 20px;">我的收藏</h1>
					</div>
				</c:when>
				<c:when test="${requestScope.msg=='在所有文章中的搜索结果'}">
					<div >
						<h1  style="margin-bottom: 20px;">所有文章</h1><h4>(搜索结果)</h4>
					</div>
				</c:when>
				<c:when test="${requestScope.msg=='在我的文章中的搜索结果'}">
					<div >
						<h1  style="margin-bottom: 20px;">我的文章</h1><h4>(搜索结果)</h4>
					</div>
				</c:when>
				<c:when test="${requestScope.msg=='我的收藏'}">
					<div >
						<h1  style="margin-bottom: 20px;">我的收藏</h1>
					</div>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
			<div >
				<c:forEach  items="${requestScope.p.objects}" var="a" varStatus="status">
					<!--文章的具体每一行的内容 -->
					<div class="item">
						<!--文章作者的头像和昵称 -->
						<div class="header">
							<!--作者的头像 -->
							<div class="author-img">
								<a href="${pageContext.request.contextPath}/ArticleShowServlet?method=article_show&article_id=${a.articleId}" target="_blank"  >
									<img src="<c:url value="${a.authorImg}"/>"  class="portrait">
								</a>
								<!--作者的昵称 -->
								<a href="${pageContext.request.contextPath}/ArticleShowServlet?method=article_show&article_id=${a.articleId}" target="_blank"  id="author-nickname" >${a.authorNick} </a>
							</div>
						</div>
						<!--中间的主要内容 -->
						<div class="middle">
							<!--文章中找第一张图片--充当封面 -->
							<div class="img">
								<a href="" target="_blank" class="cover">
								</a>
							</div>
							<!---文章的内容--省略 -->
							<div class="content">
								<!--文章的标题 -->
								<div class="title">
									标题：
									<!--文章跳转链接--跳到文章显示的页面 -->
									<a href="${pageContext.request.contextPath}/ArticleShowServlet?method=article_show&article_id=${a.articleId}" target="_blank" style="color:black" id="article-title">
											${a.title}
									</a>
								</div>
								<hr>
								<p>
									<a href="" target="_blank">
										<!-- 此处放内容 -->
									</a>
									<!--借助EL表达式中的特殊用法 status.count -->
								<div id='container${status.count}' class="article-main-content">
										${a.content}
								</div>
								<div class="publishedTime">${a.publishedTime}</div>
								<p>
							</div>

						</div>
						<!--底部的按钮组--显示 -->
						<div class="bottom">
							<div id="comment">${a.commentNum}回应</div>
							&nbsp;<div id="stars">${a.starNum}赞</div>
							&nbsp;<div id="share">${a.shareNum}转发</div>
						</div>
						<c:if test="${requestScope.msg=='我的文章'}">
							<div >
								<a href="${pageContext.request.contextPath}/ArticleListServlet?pre_method=delete_article&method=my_article_list&article_id=${a.articleId}" class="user_operation_btn" id="delete_article" style="color: red;"  onclick= "return confirm('你确定要删除这篇文章吗？删除之后将会永久删除，请慎重操作！！！')">删除</a>
							</div>
						</c:if>
						<c:if test="${requestScope.msg=='我的文章'}">
						</c:if>
					</div>
					<hr>
				</c:forEach>
			</div>
			<c:if test="${requestScope.p.totalPage!=0}">
				<!-- 分页选择链接    /iDouBan/ArticleListServlet?method=article_list -->
				<div id="paging">
							 		<span1 id="page_number">
									当前第 ${requestScope.p.currentPage} 页，总共 ${requestScope.p.totalPage} 页
									</span1>
					<a href="ArticleListServlet?method=${requestScope.method}&currentPage=1" id="first_page" class="page_controller">首页</a>
					<!-- 利用el表达式的三目运算符进行判断 -->
					<a href="ArticleListServlet?method=${requestScope.method}&currentPage=${(requestScope.p.currentPage==1)?1:requestScope.p.currentPage-1}" id="pervious_page"  class="page_controller">上一页</a>
					<a href="ArticleListServlet?method=${requestScope.method}&currentPage=${(requestScope.p.currentPage==requestScope.p.totalPage)?requestScope.p.totalPage:requestScope.p.currentPage+1}" id="next_page"  class="page_controller">下一页</a>
					<a href="ArticleListServlet?method=${requestScope.method}&currentPage=${requestScope.p.totalPage}" id="last_page"  class="page_controller">尾页</a>
				</div>
			</c:if>

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