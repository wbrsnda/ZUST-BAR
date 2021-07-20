<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我关注的人</title>
<link rel="icon" href="../image/icon.jpg" type="image/x-icon">
<!-- 显示我关注的人的页面 -->
		<style type="text/css">
		/*样式初始化*/
		*{
			margin:0;
			padding:0;/*清除内外边距*/
		}
		ul{
			list-style:none;/*去掉列表中的样式的小点*/
		}
		a{
			color:#FFFFFF;
			text-decoration: none;/*取消下划线*/
		}        
		input{
			border:0;/*将input的边框改为0*/
			box-sizing:border-box;/*CSS3盒子模型 border和padding都包含到width中*/
		}
		/*放置主要的页面内容*/
		#main_content{
			width: 800px;
			height: 1100px;
			border-radius: 5px;
			margin: auto 239px;
			background-color: #e1dbdb;
			opacity: 0.5;
		}
		/*页面的主要布局*/
		#main_content-left-top{
			margin: 40px;
		}
		#first_menu{
			height:45px;
			background-color: black;
			border-top:5px solid #151313;/* 上边框 */
			border-bottom: 5px solid #151313;/* 下边框 */
		}
		#first_menu a{
			float:right;/*右对齐*/
			font-family: STHupo;/*字体*/
			color:#d5d5d5;
			text-decoration:none;/*取消下划线*/
			/* width:100px; */
			padding:15px 15px;/*上下是0，左右是15*/
			height:10px;
			line-height:10px;/*行高等于高度可以文字垂直居中*/
			font-size: 20px;
			display:inline-block;/*显示成盒子大小*/
		}
		#first_menu a:hover{/*鼠标经过a链接*/
			background-color: #240223;
		}
		/*带有图标的第二个导航栏*/
		#second{
			height:74px;
			/* background-color:pink; */
			overflow:hidden;/*防止外边距合并的问题*/
			background-color: #121312;/*设置背景颜色*/
			margin-bottom:50px;/*下方的空白处*/
		}
		#second_menu{
			width: 1040px;
			height:58px;
			/* background-color: blue; */
			margin:8px auto;
		}
		/*让图标左浮动*/
		.logo{
			float:left;
			margin-right:50px;/*与右边的选项框相距50个像素*/
		}
		/*导航栏的选项*/
		.navbar{
			float:left;
			height:30px;
			line-height:30px;/*行高会继承 父类*/
			margin: 15px 0 0 0;/*设置外边距*/

		}
		/*导航栏中的具体选项*/
		.navbar li{
			float:left;/*使排列成一行*/
		}
		.navbar li a{
			font-family: STHupo;/*字体*/
			color: #e6efe6;
			text-decoration:none;/*取消下划线*/
			padding:0 15px;/*上下是0，左右是15*/
			height:30px;
			line-height:30px;/*行高等于高度可以文字垂直居中*/
			display:inline-block;/*显示成盒子大小*/
		}
		.navbar li a:hover{/*鼠标经过a链接*/
			background-color: #74099a;/*显示的颜色*/
		}
		/*搜索框外框部分--用来使搜索框排列在一行*/
		.search{
			float:right;
			height:30px;
			line-height:30px;/*行高会继承 父类*/
			margin-left:0;/*与左边的logo相距50个像素*/
			margin-top:15px;/*与顶部边相距15个像素*/
			border:1px solid #E1E9E1;/*设置边框边界的大小和颜色*/
		}
		/*搜索栏*/
		.search input[type=text]{/*选择type属性为text的文本框,无搜索键*/
			/* background-color: blue; */
			width:180px;
			height:30px;
			padding-left:15px;/*搜索框中的文字与左保持20px距离*/
			font-family: STHupo;
			float:left;
		}
		.search input[type=submit]{/*搜索的按钮*/
			width:31px;
			height:30px;
			float:left;
			background-color: grey;
			color: black;
			font-size: 25px;
			line-height: 30px;
			font-weight: bold;
			background-size:15px 15px;
		}
		/*我关注的人的信息*/
		.users_info_list{
			width: 750px;
			height:80px;
			background-color: #ffffff;
			margin-left:0;
			border:1px solid #7f068d;/*设置边框边界的大小和颜色*/
		}
		/*其他人的头像*/
		#everyone_list_portrait{
		margin-top:10px;
		margin-left:5px;
		}
		/*使得两个div在同一行*/
		#everyone_list_img{
		float:left;
		}
		/*我关注的人的基本信息*/
		#everyone_list_info{
		float:left;
		}
		/*用户操作的按钮*/
		#everyone_list_operation{
			margin-right: 24px;
			margin-top: 37px;
			float: right;
			color:#551A8B;
			font-family:STHupo;
		}
		/*--昵称和个性签名*/
		#everyone_list_nickname{
		margin-top:10px;
		margin-left:10px;
		font-family: "Adobe Arabic";/*字体*/
		color:#551A8B;
			font-size: 22px;
		}
		#everyone_list_signature{
		margin-top:10px;
		margin-left:10px;
		font-family: "Adobe Arabic";/*字体*/
		color: #551A8B;
			font-size: 22px;
		}
		/*用户操作超链接*/
		.operation{
			font-family: STHupo;
			color:#551A8B;
		}
		/*分页选项的布局*/
		#paging{
		float:right;
		margin-top:10px;
		margin-right:10px;
		}
		/*分页的文字说明*/
		#page_number{
			margin-right:20px;
		}
		/*分页的超链接*/
		.page_contrller{
		color:black;
		background-color:orange;
		}
		html{
			margin: 0;
			padding: 0;
			width: 100%;
			height: 100%;
		}
		body{
			background:black;
			margin: 0;
			padding: 0;
			width: 100%;
			height: 100%;
		}
		.stars{
			position: relative;
			width: 100%;
			height: 100%;
		}
		.stars span{
			display: inline-block;
			position: absolute;
			width: 5px;
			height: 5px;
			background-color: white;
			transform: rotate(45deg);
			/* 使星星模糊一点 */
			opacity: 0.2;
			/* 动画名称 动画时间  速度  开始时间 次数 */
			animation: blinking 1s linear var(--d) infinite;
		}
		/* blinking : 闪烁 */
		@keyframes blinking{
			0%,100%{
				opacity: 0.2;
			}
			50%{
				/* 星星大小放大 1.5倍 ，旋转45度成菱形 */
				transform: scale(1.5) rotate(45deg);
				opacity: 1;
			}
		}
		.stars span:nth-child(1){
			top: 10%;
			left: 10%;
			--d: 10s;
		}
		.stars span:nth-child(2){
			top: 20%;
			left: 20%;
			--d: 6s;
		}
		.stars span:nth-child(3){
			top: 30%;
			left: 30%;
			--d: 5s;
		}
		.stars span:nth-child(4){
			top: 10%;
			margin-left: 40%;
			--d: 4s;
		}
		.stars span:nth-child(5){
			top: 40%;
			left: 60%;
			--d: 7s;
		}
		.stars span:nth-child(6){
			top: 30%;
			left: 80%;
			--d: 9s;
		}
		.stars span:nth-child(7){
			top: 40%;
			left: 20%;
			--d: 8s;
		}
		.stars span:nth-child(8){
			top: 50%;
			left: 40%;
			--d: 15s;
		}
		.stars span:nth-child(9){
			top: 60%;
			left: 70%;
			--d: 14s;
		}
		.stars span:nth-child(10){
			top: 80%;
			left: 50%;
			--d: 11s;
		}
		.stars span:nth-child(11){
			top: 75%;
			left: 23%;
			--d: 20s;
		}
		.stars span:nth-child(12){
			top: 55%;
			left: 4%;
			--d: 24s;
		}
		.stars span:nth-child(13){
			top: 36%;
			left: 26%;
			--d: 8s;
		}
		.stars span:nth-child(14){
			top: 93%;
			left: 18%;
			--d: 3s;
		}
		.stars span:nth-child(15){
			top: 58%;
			left: 68%;
			--d: 2.6s;
		}
		.stars span:nth-child(16){
			top: 64%;
			left: 86%;
			--d: 1.5s;
		}
		.stars span:nth-child(17){
			top: 6%;
			left: 78%;
			--d: 3.5s;
		}
		.stars span:nth-child(18){
			top: 13%;
			left: 58%;
			--d: 6s;
		}
		.stars span:nth-child(19){
			top: 50%;
			left: 50%;
			--d: 8s;
		}
		.stars span:nth-child(20){
			top: 88%;
			left: 88%;
			--d: 7s;
		}
		</style>
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
									<form action="${pageContext.request.contextPath}/FriendListServlet?method=search_attention&currentPage=1" id="search_action" method="post">
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
						<div >
							<h1  style="margin-bottom: 20px;">我关注的人</h1>
						</div>
						<!-- 展示我关注的人的信息列表 --分页列表---包含模糊搜索的功能-->
						<div >
						 	<c:forEach  items="${requestScope.p.objects}" var="u">
						 		<!-- 每一行的显示 -->
						 		<div class="users_info_list">
						 			<!--我关注的人的头像 -->
						 			<div id="everyone_list_img">
						 				<img alt="用户头像" src="<c:url value="${u.portrait}"/>" width=60px height=60px id="everyone_list_portrait">
						 			</div>
						 			<!--我关注的人的昵称和个性签名  -->
						 			<div id="everyone_list_info">
							 			<p id="everyone_list_nickname">${u.nickname} </p>
							 			<p id="everyone_list_signature">${u.signature}</p>
						 			</div>
						 			<!-- 用户具体操作 -->
						 			<div id="everyone_list_operation">
										<!-- 私信的发送功能 -->
										<a href="${pageContext.request.contextPath}/PrivateMailServlet?method=privatemail_show&to_user_id=${u.userId}&nickname=${u.nickname}" target="_blank" style="font-family:STHupo;color:#551A8B;">
											发私信
										</a>
						 				<a href="${pageContext.request.contextPath}/FriendListServlet?pre_method=unfollow&method=attention_list&toUserId=${u.userId}&currentPage=${requestScope.p.currentPage}" class="operation">
											取消关注
										</a>
						 				<a href="${pageContext.request.contextPath}/FriendListServlet?pre_method=black_on_record&method=attention_list&toUserId=${u.userId}&currentPage=${requestScope.p.currentPage}" class="operation">
											拉黑
										</a>
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
									<a href="${pageContext.request.contextPath}/FriendListServlet?method=${requestScope.method}&currentPage=1" id="first_page" class="page_contrller">首页</a>
									<!-- 利用el表达式的三目运算符进行判断 -->
									<a href="${pageContext.request.contextPath}/FriendListServlet?method=${requestScope.method}&currentPage=${(requestScope.p.currentPage==1)?1:requestScope.p.currentPage-1}" id="pervious_page"  class="page_contrller">上一页</a>
									<a href="${pageContext.request.contextPath}/FriendListServlet?method=${requestScope.method}&currentPage=${(requestScope.p.currentPage==requestScope.p.totalPage)?requestScope.p.totalPage:requestScope.p.currentPage+1}" id="next_page"  class="page_contrller">下一页</a>
									<a href="${pageContext.request.contextPath}/FriendListServlet?method=${requestScope.method}&currentPage=${requestScope.p.totalPage}" id="last_page"  class="page_contrller">尾页</a>
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