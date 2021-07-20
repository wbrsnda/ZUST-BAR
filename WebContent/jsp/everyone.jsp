<%@ page  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有人</title>
<link rel="icon" href="../image/icon.jpg" type="image/x-icon">
<!-- 显示所有用户的页面 -->
<link rel="icon" href="../image/icon.jpg" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/init.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/star.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/attention.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/page2.css">
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
									<form action="${pageContext.request.contextPath}/EveryoneListServlet?method=search_users&currentPage=1" id="search_action" method="post">
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
					<!-- 放置个人头像和信息 -->
					<div id="main_content-left-top">
						<div>
							<h1 style="margin-bottom: 20px;">所有人的列表</h1>
						</div>
						<!-- 展示所有人的信息列表 --分页列表---包含模糊搜索的功能-->
						<div >
						 	<c:forEach  items="${requestScope.p.objects}" var="u">
						 		<!-- 每一行的显示 -->
						 		<div class="users_info_list">
						 			<!-- 其他人的头像 -->
						 			<div id="everyone_list_img">
						 				<img alt="用户头像" src="<c:url value="${u.portrait}"/>" width=60px height=60px id="everyone_list_portrait">
						 			</div>
						 			<!--其他人的昵称和个性签名  -->
						 			<div id="everyone_list_info">
							 			<p id="everyone_list_nickname">${u.nickname} </p>
							 			<p id="everyone_list_signature">${u.signature}</p>
						 			</div>
						 			<!-- 用户具体操作 -->
						 			<div id="everyone_list_operation">
										<!-- 私信的发送功能 -->
										<!-- 跳转到私信的详情---所有有关双方的私信 -->
										<a href="${pageContext.request.contextPath}/PrivateMailServlet?method=privatemail_show&to_user_id=${u.userId}&nickname=${u.nickname}" target="_blank" style="font-family:STHupo;color:#551A8B;">
											发私信
										</a>
						 				<!-- 按钮显示的判断 -->
						 					<!-- 关注按钮 -->
						 				<c:set var="s" value = "${u.status}" scope="session"></c:set>
						 				<c:choose>
										       <c:when test="${sessionScope.s==0}">
										              <a href="${pageContext.request.contextPath}/EveryoneListServlet?pre_method=attention&method=everyone_list&toUserId=${u.userId}&currentPage=1" class="operation">关注</a>
										       </c:when>
										       <c:when test="${sessionScope.s==1}">
										               <a href="${pageContext.request.contextPath}/EveryoneListServlet?pre_method=unfollow&method=everyone_list&toUserId=${u.userId}&currentPage=1" class="operation">取消关注</a>
										       </c:when>
												<c:when test="${sessionScope.s==2}">
										               <a href="${pageContext.request.contextPath}/EveryoneListServlet?pre_method=unfollow&method=everyone_list&toUserId=${u.userId}&currentPage=1" class="operation">取消关注</a>
										       </c:when>
										       	<c:when test="${sessionScope.s==3}">
										             	黑名单
										       </c:when>
										       <c:otherwise>
										       </c:otherwise>
										</c:choose>
						 					<!-- 黑名单按钮 -->
						 				<c:choose>		
										       <c:when test="${sessionScope.s==0}">
												<!-- 先insert 再update -->			
										         <a href="${pageContext.request.contextPath}/EveryoneListServlet?pre_method=black_without_record&method=everyone_list&toUserId=${u.userId}&currentPage=${requestScope.p.currentPage}" class="operation">拉黑</a>
										       </c:when>
										        <c:when test="${sessionScope.s==1}">
												<!-- update -->			
										         <a href="${pageContext.request.contextPath}/EveryoneListServlet?pre_method=black_on_record&method=everyone_list&toUserId=${u.userId}&currentPage=${requestScope.p.currentPage}" class="operation">拉黑</a>
										       </c:when>
										         <c:when test="${sessionScope.s==2}">
												<!-- update -->			
										         <a href="${pageContext.request.contextPath}/EveryoneListServlet?pre_method=black_on_record&method=everyone_list&toUserId=${u.userId}&currentPage=${requestScope.p.currentPage}" class="operation">拉黑</a>
										       </c:when>
										       <c:when test="${sessionScope.s==3}">
												<!-- delete -->
										             <a href="${pageContext.request.contextPath}/EveryoneListServlet?pre_method=cancel_black&method=everyone_list&toUserId=${u.userId}&currentPage=${requestScope.p.currentPage}" class="operation">取消拉黑</a>
										       </c:when>
										       <c:otherwise>
										       </c:otherwise>
									  </c:choose>
						 		  </div>
						 		</div>
						 	</c:forEach>
						</div>
						 <!-- 分页选择链接 -->
						 <c:if test="${requestScope.p.totalPage!=0}">
							 <div id="paging">
							 		<span1 id="page_number">
									当前第 ${requestScope.p.currentPage} 页，总共 ${requestScope.p.totalPage} 页             
									</span1>
									<a href="${pageContext.request.contextPath}/EveryoneListServlet?method=${requestScope.method}&currentPage=1" id="first_page" class="page_contrller">首页</a>
									<!-- 利用el表达式的三目运算符进行判断 -->
									<a href="${pageContext.request.contextPath}/EveryoneListServlet?method=${requestScope.method}&currentPage=${(requestScope.p.currentPage==1)?1:requestScope.p.currentPage-1}" id="pervious_page"  class="page_contrller">上一页</a>
									<a href="${pageContext.request.contextPath}/EveryoneListServlet?method=${requestScope.method}&currentPage=${(requestScope.p.currentPage==requestScope.p.totalPage)?requestScope.p.totalPage:requestScope.p.currentPage+1}" id="next_page"  class="page_contrller">下一页</a>
									<a href="${pageContext.request.contextPath}/EveryoneListServlet?method=${requestScope.method}&currentPage=${requestScope.p.totalPage}" id="last_page"  class="page_contrller">尾页</a>
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