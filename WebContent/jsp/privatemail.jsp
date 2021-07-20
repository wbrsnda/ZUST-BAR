<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的私信</title>
<link rel="icon" href="../image/icon.jpg" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/init.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/star.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/page2.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/privatemail.css">
<!-- 私信的消息列表 -->
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
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
					<%--私信的信息列表 --%>
					<div id="main_content-left-top">
					<!-- 私信的标题 -->
					 <div >
							<h1  style="margin-bottom: 20px;">我的私信</h1>
					</div>
						<div >
						 	<c:forEach  items="${requestScope.p.objects}" var="a" varStatus="status">
								<!-- 私信每一项的内容 -->
							    <div class="item">
									<!--私信发送者的头像和昵称 -->
									<div class="header" >
										<!--发送者的头像---左半部分 -->
										 <div class="author-img" >
											<a href="javascript:void(0);" target="_blank" id="img_a">
												<img alt="发送者头像" src="<c:url value="${a.fromUserImg}"/>" id = "fromUserImg_img">
											</a>
										</div>
										<!--每一项的右半部分 -->						   
										<div class="right_part">	
								        	<!--每一项的右半上部分 -->		
								            <div class="right_up_part">
												<!--发送者的昵称-->
												<a href="javascript:void(0);" target="_blank" id="from_user_nickname" >
													${a.fromUserNick}
												</a>
								                <!--发送的时间-->
									             <a href="#" target="_blank" id="chat_time"  >
													${a.chatTime}
												 </a>
								    		</div>
								    		<!--每一项的右半下部分 -->		
								    		<!--私信内容预览-->
								    		<div  class="right_down_part">	
												<!-- 跳转到私信的详情---所有有关双方的私信 -->
												<a href="${pageContext.request.contextPath}/PrivateMailServlet?method=privatemail_show&to_user_id=${a.fromUserId}&nickname=${a.fromUserNick}" target="_blank" style="color:black">
												    ${a.chatMsg}
												</a>
											</div>
										</div>
									</div>	
								</div>
								 <br>	
								 <hr>					
						 	</c:forEach>
						</div>
					</div>
						 <!-- 分页选择链接    /iDouBan/ArticleListServlet?method=article_list -->
						 <div id="paging">
						 		<span1 id="page_number">
								当前第 ${requestScope.p.currentPage} 页，总共 ${requestScope.p.totalPage} 页             
								</span1>
								<a href="${pageContext.request.contextPath}/PrivateMailServlet?method=${requestScope.method}&currentPage=1" id="first_page" class="page_contrller">首页</a>
								<!-- 利用el表达式的三目运算符进行判断 -->
								<a href="${pageContext.request.contextPath}/PrivateMailServlet?method=${requestScope.method}&currentPage=${(requestScope.p.currentPage==1)?1:requestScope.p.currentPage-1}" id="pervious_page"  class="page_contrller">上一页</a>
								<a href="${pageContext.request.contextPath}/PrivateMailServlet?method=${requestScope.method}&currentPage=${(requestScope.p.currentPage==requestScope.p.totalPage)?requestScope.p.totalPage:requestScope.p.currentPage+1}" id="next_page"  class="page_contrller">下一页</a>
								<a href="${pageContext.request.contextPath}/PrivateMailServlet?method=${requestScope.method}&currentPage=${requestScope.p.totalPage}" id="last_page"  class="page_contrller">尾页</a>
						 </div>
					</div>
					<div id="main_content-left-centre">
					</div>
					<div id="main_content-right">
					</div>
				</div>
		</div>
</body>
</html>