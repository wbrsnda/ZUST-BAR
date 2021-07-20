<%@ page  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文章内容</title>
<link rel="icon" href="../image/icon.jpg" type="image/x-icon">
<!-- 
	文章的显示页面
	   --用户查看自己的文章
	   --用户查看收藏的文章
	   --用户查看自己分享的文章
			--分用户
				--自己
				--他人	
	-->
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<!-- 显示文章列表的页面 -->
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
		body{
			background-color: #FFFFFF;/*整个页面的背景色*/
		}
		/*放置主要的页面内容*/
		#main_content{
			width: 800px;
			height: 1800px;
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
			width:180px;
			height:30px;
			padding-left:15px;/*搜索框中的文字与左保持20px距离*/
			font-family: serif;
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
		/*分页选项的布局*/
		#paging{
		float:right;
		margin-top:10px;
		margin-right:10px;
		}
		/*分页的文字说明*/
		#page_number{
			color: black;
			margin-right:20px;
		}
		/*分页的超链接*/
		.page_contrller{
			color: white;
		    background-color: orange;
		    border-radius: 5px;
		    padding: 3px;
		}
/*************************************************/
/*具体功能的界面设计*/
/*文章列表每一行的标头*/
.header{
    margin-top: 5px;
}
/*作者的头像*/
.author-img{
	margin-top: 10px;
border-radius: 4px;
}
/*作者的昵称*/
#author-nickname{
}
/*文章标题*/
.title{
    height: 20px;
    margin-bottom: 5px;
    margin-top: 5px; 
}
/*中间部分*/
.middle{
	height: auto;
}
/*文章主题部分*/
.article-main-content{
    height: auto;
}
/*文章主题---充当要被撑开的父盒子*/
.content{
    width: 675px;
	height: auto;
}
/*文章内部具体修改*/
/*文章的标头*/
/*作者的头像*/
/*文章发表时间*/
#author-publishedTime{
    margin: 5px 0 1px 26px;
    color: black;
    font-size: 14px;
}
/*按钮的布局*/
.bottom_inner_div{
    height: 50px;
}
/*用户可点击的按钮--用户互动*/
.user_operation_btn{
    color: grey;
    float: right;
    margin: 23px 9px;
}
/*按钮组*/
.bottom{
    margin-left: 270px;
    margin-top: 60px;
    width: 400px;
    margin-bottom: 20px;
}
/*评论区的布局*/
#main_content-left-centre{
    height: auto;
    width: 675px;
}
/*文本框*/
textarea{
    width: 98%;
    height: 140px;
}
/*评论区分页的选项*/
#paging{
    width: auto;
    border: 1px solid #80808029;
    border-radius: 35px;
    float: right;
    margin-right: 0;
    margin-bottom: 25px;
    margin-top: 57px;
    padding: 8px 14px;
    background-color: #fdfcf9;
}
/*提交按钮*/
#submit_btn{
    height: 27px;
    color: #000000;
    width: 52px;
    border-radius: 3px;
    background-color: white;
	border:1px solid #551A8B;
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
					<%--文章的显示 --%>
					<div id="main_content-left-top">
						<div >
							<h1  style="margin-bottom: 20px;">${requestScope.article.title}</h1>
						</div>
						<!-- 展示文章的信息列表 -->
						<div >
								<!--文章的具体每一行的内容 -->
									<div class="item">
										<!--文章作者的头像和昵称 -->
								        <div class="header">
								        	<!--作者的头像 -->
								            <div class="author-img">
								                <a href="#"  id="author-img-a" style="margin: 5px 0px 5px 5px;">
								                	<img src="<c:url value="${requestScope.article.authorImg}"/>" style="width: 32px;height: 32px;border-radius: 4px;">
								                </a>
									            <!--作者的昵称 -->
									             <a href="#"  id="author-nickname" style="margin: 5px 0 5px 5px;color:black;">
									            	${requestScope.article.authorNick} 
									            </a>
									            <!-- 文章的发表时间 -->
									            <a href="#"  id="author-publishedTime" style="margin: 5px 0 5px 5px;color:black;">
									            	${requestScope.article.publishedTime}
									            </a>
								            </div>
								        </div>
										<!--中间的主要内容 -->
										<div class="middle">
									        <!---文章的内容--省略 -->
									        <div class="content">
									        	<!--文章的标题 -->
											     <div class="title">
											     		<!--文章跳转链接 -->
												        <a href="${pageContext.request.contextPath}/ArticleShowServlet?method=article_show&article_id=${a.articleId}" target="_blank" style="color:black">
												        </a>
											      </div>
											      <p>
											      		<a href="" target="_blank">
											      				<!-- 此处放内容 -->
											      			</a>
											      			<!--借助EL表达式中的特殊用法 status.count -->
											      		<div id='container' class="article-main-content" style="font-size : 14px;" >
											      			${requestScope.article.content}
											      		</div>
												<p>
											</div>
											
										</div>
										<!--底部的按钮组--显示 -->
								        <div class="bottom">
									        <div class = "bottom_inner_div">
									        <!-- 文章点赞 -->
									        <c:if test="${requestScope.starStatus == '已点赞文章' }"> 
											  <a href="${pageContext.request.contextPath}/ArticleShowServlet?pre_method=article_star_cancel&method=article_show&article_id=${requestScope.article.articleId}" class="user_operation_btn" id="" >${requestScope.article.starNum}取消点赞</a>
											</c:if> 
									        <c:if test="${requestScope.starStatus == '未点赞文章' }"> 
											  <a href="${pageContext.request.contextPath}/ArticleShowServlet?pre_method=article_star&method=article_show&article_id=${requestScope.article.articleId}" class="user_operation_btn" id="" >${requestScope.article.starNum}点赞</a>
											</c:if> 
									         <!-- 文章收藏 -->
									        <c:if test="${requestScope.collectionStatus == '已收藏文章' }"> 
											  <a href="${pageContext.request.contextPath}/ArticleShowServlet?pre_method=article_collection_cancel&method=article_show&article_id=${requestScope.article.articleId}" class="user_operation_btn" id="" >${requestScope.article.collectionNum}取消收藏</a>
											</c:if> 
									        <c:if test="${requestScope.collectionStatus == '未收藏文章' }"> 
											  <a href="${pageContext.request.contextPath}/ArticleShowServlet?pre_method=article_collection&method=article_show&article_id=${requestScope.article.articleId}" class="user_operation_btn" id="" >${requestScope.article.collectionNum}收藏</a>
											</c:if> 
									        <!-- 文章转发-->
									        <c:if test="${requestScope.shareStatus == '已转发文章' }"> 
											  <a href="${pageContext.request.contextPath}/ArticleShowServlet?pre_method=article_share_cancel&method=article_show&article_id=${requestScope.article.articleId}" class="user_operation_btn" id="" >${requestScope.article.shareNum}取消转发</a>
											</c:if> 
									        <c:if test="${requestScope.shareStatus == '未转发文章' }"> 
											  <a href="${pageContext.request.contextPath}/ArticleShowServlet?pre_method=article_share&method=article_show&article_id=${requestScope.article.articleId}" class="user_operation_btn" id="" >${requestScope.article.shareNum}转发</a>
											</c:if>
									         <a href="javascript:void(0);" class="user_operation_btn" id="" >${requestScope.article.commentNum}回应</a>
									        </div>
								        </div>
								    </div>
						</div>
					</div>
					<!-- 评论区 -->
					<div id="main_content-left-centre">
						<hr>
						<div>
						</div>
						<!-- 这里属于评论区 -->
						<!-- 文章的评论区 --分页列表--->
				        <!-- 评论的每一项 --> 
				         <div  id="comment-code">
				         </div>
				          <!-- 设置锚点 -->
					           <a href="#" id="submit-confirm"></a>
				         <!-- 评论编辑区 -->
				         <h2>
						        你的回应
						            &nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·
						 </h2>
						 <!-- 用户进行回复时出现的提示和取消回复的操作 -->
						 <div>
							 <!-- 说明用户要回复的人的昵称 -->
							 <span1 id="reply_to_user_com_nick">
							 	回复:
							 </span1>
							<a href="javascript:void(0);" id="cancel_reply" style="color: #C5751F;" >取消回复</a>
						 </div>
				         <div class="comment-form-div" >
				          	<%---回复-- 隐藏表单 --%>
							<form action="${pageContext.request.contextPath}/ArticleShowServlet?pre_method=reply_content&method=article_show&article_id=${requestScope.article.articleId}" id="replySubmit" name="reply_form" method="post" >
					          	<%--隐藏表单--用来传输文本框的内容--content --%>
					            <input type="hidden" name="content" id="reply_content" value="">
					            <%--隐藏表单--评论的id --%>
					              <input type="hidden" name="comment_id" id="reply_comment_id" value="">
					              <!-- 被回复的回复区中的用户id -->
					              <input type="hidden" name="reply_to_use_id" id="reply_to_use_id" value="">
							</form>
							<%--评论--隐藏表单 --%>	
					        <form action="${pageContext.request.contextPath}/ArticleShowServlet?pre_method=comment_content&method=article_show&article_id=${requestScope.article.articleId}" id="onSubmit" name="comment_form" method="post" >
					        	<!-- 发表评论的文本框 -->
					          <div class="item">
					              <textarea name="comment-place" required  id="comment-textarea" rows="4" cols="64"></textarea>
					              <br>
					          </div>
					          	<%--隐藏表单--用来传输文本框的内容--content --%>
					            <input type="hidden" name="content" id="content" value="">
					        </form>
					        <%--隐藏表单--提交 --%>
					        	<div class="submit-confirm">
					          		<span1>
					                	<button onclick="formSubmit()" id="submit_btn">确定</button>
					                </span1>
					           </div>
					     </div>
					     <!-- 分页选择链接    /iDouBan/ArticleListServlet?method=article_list -->
						 <div id="paging">
						 		<span1 id="page_number">
								当前第 <strong > <span1 id ="currentPage_num"> </span1> </strong> 页，总共 <strong > <span1 id="totalPage_num"> </span1> </strong> 页
								</span1>
								<a href="javascript:void(0);" id="first_page" class="page_contrller">首页</a>
								<!-- 利用el表达式的三目运算符进行判断 -->
								<a href="javascript:void(0);" id="previous_page"  class="page_contrller">上一页</a>
								<a href="javascript:void(0);" id="next_page"  class="page_contrller">下一页</a>
								<a href="javascript:void(0);"  id="last_page" class="page_contrller">尾页</a>					
						 </div>
					</div>
				</div>
				<div id="main_content-right">
				</div>
			</div>
			</div>
	<script type="text/javascript">
	//定义一个全局变量，用来存放评论当前的页码
	var currentPage;
	//评论的总页数
	var totalPage;
	//用户选择的评论id
	var toCommentId = 0;
	//AJAX查询到的评论区的数据集合
	var obj ; 
	//被回复的用户的昵称
	var toUserComNick;
	//设置是否为回复状态
	var isReply = "no" ;
	//进行隐藏表单的提交(onSubmit)--提交评论或者回复的提交的字符串内容
	function formSubmit(){
		//用户评论区的文本框输入的值--评论或者回复的内容
		var y = document.getElementById("comment-textarea");
		//过滤掉script标签
		if( y.value !== filterScript(y.value) )
			{
				alert("你的输入中含有不合法的字符，请重新输入！");
			}
		var lastContent ;
		//将其代码进行转义，为了显示在评论中
		lastContent =  htmlEscape(y.value);
		//如果填入的数据为空
		if( isContentEmpty( lastContent ) )
			{
				//退出函数
				return ;
			}
		//用户填入的文本框内容---转义后存入数据库
		document.getElementById("content").value = lastContent ;
		//提交评论的表单
		if(isReply === "no")
		{
			alert("评论");
			document.getElementById("onSubmit").submit();
			return ;
		}	
		//回复
		else{
			//跳转到回复的表单提交
			replySubmit();
			document.getElementById("replySubmit").submit();
			return ;
		}
	}
/***************************************************/
	//表单验证
	//判空处理
	function isContentEmpty(yValue){
		//先进行非空判断
		v=$.trim(yValue);
        if(v==''||v==null)
        	{
        		alert("评论或者回复的内容不能为空");
        		//将空格清空
        		document.getElementById("comment-textarea").value="";
        		return true;
        	}
		return false;
	}
	//过滤script标签
	function filterScript(htmlStr){
			//匹配script标签
		    var reg=new RegExp("<.*?script[^>]*?>.*?(<\/.*?script.*?>)*","ig");
		    if(reg.test(htmlStr)){
		       return htmlStr.replace(/<.*?script[^>]*?>.*?(<\/.*?script.*?>)*/ig,'');
		    }
		return htmlStr ;
	}
	//HTML代码进行转义---用户填写的位置
	function htmlEscape(htmlStr) {
		 return htmlStr.replace(/[<>&"]/g,function(c){return {'<':'&lt;','>':'&gt;','&':'&amp;','"':'&quot;'}[c];});
	}
/***********************************************/
	//初始化的评论区
	$(document).ready(function(){
		var currentPage = 1 ;
		$("#totalPage_num").innerText = totalPage ;
		toAjax(currentPage);
	});
	//分页评论区的切换
	//首页
	$(document).ready(function(){
		$("#first_page").click(function(event){
			if(currentPage === 1){
				alert("已经是评论的首页了！");
				return ;
				}
			currentPage = 1;
			toAjax(currentPage);
		});
	});
	//上一页的点击事件，评论区的切换
	$(document).ready(function(){
		$("#previous_page").click(function(event){
			currentPage=currentPage==1?1:currentPage-1;
			toAjax(currentPage);
		});
	});
	//下一页的点击事件，评论区的切换
	$(document).ready(function(){
		$("#next_page").click(function(event){
			currentPage=currentPage==totalPage?totalPage:currentPage+1;
			toAjax(currentPage);
		});
	});
	//尾页的点击事件，评论区的切换
	$(document).ready(function(){
		$("#last_page").click(function(event){
			if(currentPage === totalPage){
				alert("已经是评论的尾页了！");
				return ;
				}
			if(totalPage===0){
				return ;
			}
			else{
				toAjax(totalPage);		
			}
		});
	});
	//展示页面数的地方
	function showNum( ){
		document.getElementById("currentPage_num").innerHTML = currentPage;
		document.getElementById("totalPage_num").innerHTML = totalPage;
		if( totalPage == 0)
			{
			document.getElementById("currentPage_num").innerHTML = 1;
			document.getElementById("totalPage_num").innerHTML = 1;
			}
	}
	//页面先加载完文章主题部分--然后通过ajax加载评论部分
	//原生JS实现AJAX 
	//封装要进行发送AJAX请求的函数---评论区专用
	function toAjax(c){
		//清空上一次的评论内容---用empty清空原来的评论区
		$("#comment-code").empty();
		/* 异步方式 */
		xmlHttpRequest = new XMLHttpRequest();
		/* 设置xmlHttpRequest对象的回调函数 */
		xmlHttpRequest.onreadystatechange = callback ;
		// 异步方式为false 同步处理---为了拿到值
		xmlHttpRequest.open("post","ArticleShowServlet",false);
		//设置post方式的头信息--文件上传application/x-www-form-urlencoded  multipart/form-data --文件上传不能加这个标头设置
		xmlHttpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		xmlHttpRequest.send("method=comment_show&article_id="+"${requestScope.article.articleId}"+"&currentPage="+c);
	}
	//定义回调函数
	function callback(){	
		if(xmlHttpRequest.readyState == 4 & xmlHttpRequest.status == 200 )
		{
			//接收服务端返回的数据
			//设置服务器返回值的类型是String格式--JSON字符串---JSON.parse将字符串转化为对象
			 obj = JSON.parse(xmlHttpRequest.responseText);
				 for (var i = 0; i<obj.objects.length;i++ ) {
					 	//该用户未点赞
						if( obj.objects[i].starStatus == 0 )
							 {
								 $comment = 
			            	 	'						<!-- 评论的每一项 -->'+
								'						<div class=\"comment-item\" id=\"'+obj.objects[i].commentId+'\" style=\"    display: flex;box-shadow: 0 0 black; \" >'+
								'						    <!-- 评论人的头像 -->'+
								'						    <div class=\"pic\" style=\"margin: 13px 6px;width: 70px;float: left;\">'+
								'						        	<img width=\"52\" height=\"52\" class="" src=\"${pageContext.request.contextPath}'+obj.objects[i].userComImg+'\" alt=\"用户头像\" style=\"margin: 2px 0px;    border-radius: 4px;\">'+
								'						    </div>'+
								'						    <div class="content report-comment" style="float: left;height: auto;width: 590px;margin: 11px 0px;">'+
								'						        <div class="author">'+
								'						        	<!-- 评论时间 -->'+
								'						            <span1 class="">'+obj.objects[i].comTime+'</span1>'+
								'                           		<!--评论人的昵称-->'	+												
								'						            <a href="#" class="" style="color:black;margin: 0px 11px;">'+obj.objects[i].userComNick+'</a>'+
								'						        </div>'+
								'						'+
								'						        <!-- 评论的内容-->'+
								'						        <p id=\"comment-msg\" style="margin: 10px 2px;height: auto;    line-height: 1.6;font-size: 13px;    width: 575px;word-wrap: break-word;overflow: hidden;">'+obj.objects[i].comMsg+
								'							<a href="#submit-confirm" class=\"reply_a\" id=\"'+obj.objects[i].commentId+'\"  style=\"color : grey;float: right;margin: 9px 2px;\">回复</a>'+
								'						<a href=\"ArticleShowServlet?pre_method=comment_star&method=article_show&comment_id='+obj.objects[i].commentId+'&article_id=${requestScope.article.articleId}\" class="comment_star_a" id="127" style="color : grey;float: right;margin: 9px 2px;">点赞('+obj.objects[i].comStar+')</a>'+
								'						</p>'+
								'						    </div>'+
								'<input type=\"hidden\"   value = \"'+obj.objects[i].commentId+'\">'+
								'						</div>'+
								'';
							 }
						if( obj.objects[i].starStatus == 1  )
							{
							 $comment = 
				            	 	'						<!-- 评论的每一项 -->'+
									'						<div class=\"comment-item\" id=\"'+obj.objects[i].commentId+'\" style=\"    display: flex;box-shadow: 0 0 black; \" >'+
									'						    <!-- 评论人的头像 -->'+
									'						    <div class=\"pic\" style=\"margin: 13px 6px;width: 70px;float: left;\">'+
									'						        	<img width=\"52\" height=\"52\" class="" src=\"${pageContext.request.contextPath}'+obj.objects[i].userComImg+'\" alt=\"用户头像\" style=\"margin: 2px 0px;    border-radius: 4px;\">'+
									'						    </div>'+
									'						    <div class="content report-comment" style="float: left;height: auto;width: 590px;margin: 11px 0px;">'+
									'						        <div class="author">'+
									'						        	<!-- 评论时间 -->'+
									'						            <span1 class="">'+obj.objects[i].comTime+'</span1>'+
									'                           		<!--评论人的昵称-->'	+												
									'						            <a href="#" class="" style="color:black;margin: 0px 11px;">'+obj.objects[i].userComNick+'</a>'+
									'						        </div>'+
									'						'+
									'						        <!-- 评论的内容-->'+
									'						        <p id=\"comment-msg\" style="margin: 10px 2px;height: auto;    line-height: 1.6;font-size: 13px;    width: 575px;word-wrap: break-word;overflow: hidden;">'+obj.objects[i].comMsg+
									'							<a href="#submit-confirm" class=\"reply_a\" id=\"'+obj.objects[i].commentId+'\"  style=\"color : grey;float: right;margin: 9px 2px;\">回复</a>'+
									'						<a href=\"ArticleShowServlet?pre_method=comment_star_cancel&method=article_show&comment_id='+obj.objects[i].commentId+'&article_id=${requestScope.article.articleId}\" class="comment_star_a" id="127" style="color : grey;float: right;margin: 9px 2px;">取消点赞('+obj.objects[i].comStar+')</a>'+
									'						</p>'+
									'						    </div>'+
									'<input type=\"hidden\"   value = \"'+obj.objects[i].commentId+'\">'+
									'						</div>'+
									'';
							}
							    $("#comment-code").append($comment);
	         }
				//拿到分页对应的当前页
				currentPage = obj.currentPage;
				//拿到总页数
				totalPage = obj.totalPage ;
				//调用回复区的方法
				toAjaxReply(currentPage);
				//设置当前页数和总页数
				if(totalPage != null )
				{	
					if( totalPage == 0)
					{
					currentPage = 1;
					totalPage = 0 ;
					}
				}
				//调用显示页数的函数
				showNum( );
		}
	}
	//封装要进行发送AJAX请求的函数---回复区专用
	function toAjaxReply(currentPage){
		//清空上一次的评论内容---用empty清空原来的回复区
		/* $("#comment-code").empty(); */
		/* 异步方式 */
		xmlHttpRequest = new XMLHttpRequest();
		/* 设置xmlHttpRequest对象的回调函数 */
		xmlHttpRequest.onreadystatechange = callbackReply ;
		// 异步方式为false 同步处理---为了拿到值
		xmlHttpRequest.open("post","ArticleShowServlet",false);
		//设置post方式的头信息--文件上传application/x-www-form-urlencoded  multipart/form-data --文件上传不能加这个标头设置
		xmlHttpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		//url为回复方式
		xmlHttpRequest.send("method=reply_show&article_id="+"${requestScope.article.articleId}"+"&currentPage="+currentPage);
	}
	//定义回调函数--回复
	function callbackReply(){	
		if(xmlHttpRequest.readyState == 4 & xmlHttpRequest.status == 200 )
		{
			//接收服务端返回的数据
			//设置服务器返回值的类型是String格式--JSON字符串---JSON.parse将字符串转化为对象
			 objReply = JSON.parse(xmlHttpRequest.responseText);  
			console.log(objReply);
			 var str = "";
			 	//遍历评论的全部元素
				 for (var i = 0; i < obj.objects.length;i++ ) {
					 	//遍历回复的所有元素
					 	for ( var  j = 0  ; j < objReply.objects.length ; j++ ) {
					 		//评论id值相同时
					 		if ( objReply.objects[j].commentId == obj.objects[i].commentId ){
							 $reply = 
		            	 	'						<!-- 回复的每一项 -->'+
							'						<div class=\"reply-item\" id=\"'+objReply.objects[j].commentId+'\" style=\"    display: flex;box-shadow: 0 0 black;margin-left: 56px;\" >'+
							'						    <!-- 回复人的头像 -->'+
							'						    <div class=\"pic\" style=\"margin: 13px 6px;width: 70px;float: left;\">'+
							'						        	<img width=\"52\" height=\"52\" class="" src=\"${pageContext.request.contextPath}'+objReply.objects[j].userReplyImg+'\" alt=\"用户头像\" style=\"margin: 2px 0px;    border-radius: 4px;\">'+
							'						    </div>'+
							'						    <div class="content report-comment" style="float: left;height: auto;width: 590px;margin: 11px 0px;">'+
							'						        <div class="author">'+
							'						        	<!-- 回复时间 -->'+
							'						            <span1 class="">'+objReply.objects[j].replyTime+'</span1>'+
							'                           		<!--评论人的昵称-->'	+												
							'						            <a href="#" class="" style="color:black;margin: 0px 11px;">'+objReply.objects[j].userReplyFromNick+'</a>'+
							'									 <span1 class="">回复</span1>'+
							'                                    <a href="#" class="" style="color:black;margin: 0px 11px;">'+objReply.objects[j].userReplyToNick+'</a>'+
							'						        </div>'+
							'						'+
							'						        <!-- 回复的内容-->'+
							'						        <p id=\"comment-msg\" style="margin: 10px 0px;height: auto;    line-height: 1.6;font-size: 13px;width: 530px;word-wrap: break-word;overflow: hidden;">'+objReply.objects[j].replyMsg+
							'							<a href=\"#submit-confirm\" class=\"reply_reply_a\" id=\"'+'&commentId&'+objReply.objects[j].commentId+'&userReplyToId&'+objReply.objects[j].userReplyFromId+'&userReplyFromNick&'+objReply.objects[j].userReplyFromNick+'&'+'\"  style=\"color : grey;float: right;margin: 9px 7px;\">回复</a>'+
							'						</p>'+
							'						    </div>'+
							'<input type=\"hidden\"   value = \"'+objReply.objects[j].commentId+'\">'+
							'						</div>'
							;
								    $("#"+obj.objects[i].commentId).after($reply);
					 		 }				
					 		else{}
					 	}
	         }
		}
	}
	//回复的表单提交
	function replySubmit(){
		//用户评论区的文本框输入的值--评论或者回复的内容
		var y = document.getElementById("comment-textarea");
		document.getElementById("reply_content").value = y.value;
		//评论的id
		document.getElementById("reply_comment_id").value = toCommentId ;
	}
	//回复的选择--用户的点击
	//先通过class找到对应的id---回复
	$(function(){
		$(document).on("click",".reply_a",function(){
			toCommentId = $(this).attr('id');
			console.log( "toCommentId" + toCommentId );
			//调用函数，找到评论id所对应的评论者的用户昵称
			getUserComNick();
		})
	})
	//先通过class找到对应的id---回复的回复
	$(function(){
		$(document).on("click",".reply_reply_a",function(){
			//包含了用户名+用户id+评论id的信息---正则表达式切割
			allInfoInId = $(this).attr('id');
			console.log( "allInfoInId" + allInfoInId );
			//调用函数,得到其中的信息
			getInfoInId(allInfoInId);
		})
	})
	//切割allInfoInId，得到其中的信息
	function getInfoInId( allInfoInId ){
		//进行字符串的截取
		var commentId = allInfoInId.match(/commentId&(\S*)&userReplyToId/)[1];
		var userReplyToId = allInfoInId.match(/userReplyToId&(\S*)&userReplyFromNick/)[1];
		var  userReplyToNick = allInfoInId.match(/userReplyFromNick&(\S*)&/)[1];
		//设置评论的id
		toCommentId = commentId ;
		document.getElementById("reply_to_use_id").value = userReplyToId ;
		toUserComNick = userReplyToNick;
		//设置昵称可见
		setUserComNick();
	}
	//for循环-->通过评论id找到所对应的评论者的用户昵称
	function getUserComNick(){
		for( var i = 0 ;i < obj.objects.length ; i++ )
		{
			//toCommentId的类型不是数字，是字符串
			//类型不同，但需比较的是两个元素的值是否相同，用 " == "
			if(toCommentId == obj.objects[i].commentId)
					{
						toUserComNick = obj.objects[i].userComNick;
						console.log( "toUserComNick" + toUserComNick);
						setUserComNick();					
					}
			}
	}
	//初始化为隐藏状态--被回复的人的昵称的div
	$(document).ready(function(){
		$("#reply_to_user_com_nick").parent().hide();
	});
	//设置被回复的人的昵称在前端选中后可见
	function setUserComNick(){
		//显示回复的div
		$("#reply_to_user_com_nick").parent().show();
		//被回复人的昵称
		$("#reply_to_user_com_nick").html("回复: "+toUserComNick);
		isReply = "yes" ;
	}
	//取消回复，将回复的div隐藏 ( 父节点 )
	$(document).ready(function(){
		$("#cancel_reply").click(function(event){
			//隐藏父节点的div
			 $("#reply_to_user_com_nick").parent().hide();
			//将得到的评论id设为空
			 toCommentId = "";
			 //设置为评论状态--no
			 isReply="no";
		});
	});
</script>
</body>
</html>