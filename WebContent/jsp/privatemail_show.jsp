<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>与${sessionScope.nickname}的私信</title>
<link rel="icon" href="../image/icon.jpg" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/init.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/star.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/page2.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/privatemail_show.css">
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
					<%--文章的显示 --%>
					<div id="main_content-left-top">
						<div >
							<h1   style="margin-bottom: 20px;">与${sessionScope.nickname}的私信</h1>
						</div>
					</div>
					</div>
					<!-- 对话区 -->
					<div id="main_content-left-centre">
						<hr>
						<div>
						</div>
						<!-- 私信的对话区 --分页列表--->
				        <!-- 私信的每一项 -->
				         <div  id="privatemail-code">
				         </div>
				          <!-- 设置锚点 -->
					           <a href="#" id="submit-confirm"></a>
				         <!-- 对话编辑区 -->
				         <h2>
						        你的回应
						            &nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·
						 </h2>
				         <div class="privatemail-form-div" >
							<%--对话--隐藏表单 --%>	
					        <form action="${pageContext.request.contextPath}/PrivateMailServlet?pre_method=privatemail_content&method=privatemail_show" id="onSubmit" name="privatemail_form" method="post" >
					        	<!-- 发表对话的文本框 -->
					          <div class="item">
					              <textarea name="privatemail-place" required  id="privatemail-textarea" rows="4" cols="64"  onKeyUp="checkMaxInput(this)" onKeyDown="checkMaxInput(this)"></textarea>
					              <br>
					          </div>
					          	<%--隐藏表单--用来传输文本框的内容--content --%>
					            <input type="hidden" name="content" id="content" value="">
								<%--隐藏表单，设置当前被回复的用户的Id --%>					            
					           <input type="hidden" name="to_user_id" id="to_user_id" value="">
					        </form>
					        <%--隐藏表单--提交 --%>
					        	<div class="submit-confirm">
					                	<button onclick="formSubmit()" id="submit_btn">确定</button>
					           </div>
					     </div>
					     <!-- 分页选择链接    /iDouBan/ArticleListServlet?method=article_list -->
						 <div id="paging">
						 		<span1 id="page_number">
								当前第 <strong > <span1 id ="currentPage_num"> </span1> </strong> 页，总共 <strong > <span1 id="totalPage_num"> </span1> </strong> 页
								</span1>
								<a href="#" id="first_page" class="page_contrller">首页</a>
								<!-- 利用el表达式的三目运算符进行判断 -->
								<a href="#" id="previous_page"  class="page_contrller">上一页</a>
								<a href="#" id="next_page"  class="page_contrller">下一页</a>
								<a href="#"  id="last_page" class="page_contrller">尾页</a>					
						 </div>
					</div>
				</div>
		</div>
				<div id="main_content-right">
				</div>
	<script type="text/javascript">
	//定义一个全局变量，用来存放对话当前的页码
	var currentPage;
	//对话的总页数
	var totalPage;
	//用于限制文本框的输入长度
	function checkMaxInput(txt)
	{ 
	       if (txt.value.length > 666)
	    	   {  
	    	   txt.value = txt.value.substring(0, 666);
	    	   alert("最大输入长度为666个字节!!!");
	    	   }
	       
	}
	//进行隐藏表单的提交(onSubmit)--提交对话或者回复的提交的字符串内容
	function formSubmit(){
		//用户对话区的文本框输入的值--对话或者回复的内容
		var y = document.getElementById("privatemail-textarea");

		//过滤掉script标签
		if( y.value !== filterScript(y.value) )
			{
				alert("你的输入中含有不合法的字符，请重新输入！");
			}
		var lastContent ;
		//将其代码进行转义，为了显示在对话中
		lastContent =  htmlEscape(y.value);
		//如果填入的数据为空
		if( isContentEmpty( lastContent ) )
			{
				//退出函数
				return ;
			}
		//用户填入的文本框内容---转义后存入数据库
		document.getElementById("content").value = lastContent ;
		//被对话的用户的id
		document.getElementById("to_user_id").value = ${requestScope.toUserId};
		//提交对话的表单
			document.getElementById("onSubmit").submit();
		}
/***************************************************/
	//表单验证
	//判空处理
	function isContentEmpty(yValue){
		//先进行非空判断
		v=$.trim(yValue);
        if(v===''||v==null)
        	{
        		alert("对话或者回复的内容不能为空");
        		//将空格清空
        		document.getElementById("privatemail-textarea").value="";
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
	//初始化的对话区
	$(document).ready(function(){
		var currentPage = 1 ;
		$("#totalPage_num").innerText = totalPage ;
		toAjax(currentPage);
	});
	//分页对话区的切换
	//首页
	$(document).ready(function(){
		$("#first_page").click(function(event){
			if(currentPage === 1){
				alert("已经是对话的首页了！");
				return ;
				}
			currentPage = 1;
			toAjax(currentPage);
		});
	});
	//上一页的点击事件，对话区的切换
	$(document).ready(function(){
		$("#previous_page").click(function(event){
			currentPage=currentPage===1?1:currentPage-1;
			toAjax(currentPage);
		});
	});
	//下一页的点击事件，对话区的切换
	$(document).ready(function(){
		$("#next_page").click(function(event){
			currentPage=currentPage===totalPage?totalPage:currentPage+1;
			toAjax(currentPage);

		});
	});
	//尾页的点击事件，对话区的切换
	$(document).ready(function(){
		$("#last_page").click(function(event){
			if(currentPage === totalPage){
				alert("已经是对话的尾页了！");
				return ;
				}
			if(totalPage===0){
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
		if( totalPage === 0)
			{	
			document.getElementById("currentPage_num").innerHTML = 1;
			document.getElementById("totalPage_num").innerHTML = 1;
			}
	}
	//页面先加载完文章主题部分--然后通过ajax加载对话部分
	//原生JS实现AJAX 
	//封装要进行发送AJAX请求的函数---对话区专用
	function toAjax(c){
		//清空上一次的对话内容---用empty清空原来的对话区
		$("#privatemail-code").empty();
		/* 异步方式 */
		xmlHttpRequest = new XMLHttpRequest();
		/* 设置xmlHttpRequest对象的回调函数 */
		xmlHttpRequest.onreadystatechange = callback ;
		// 异步方式为false 同步处理---为了拿到值
		xmlHttpRequest.open("post","PrivateMailServlet",true);
		//设置post方式的头信息--文件上传application/x-www-form-urlencoded  multipart/form-data --文件上传不能加这个标头设置
		xmlHttpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		xmlHttpRequest.send("method=privatemail_show_details&to_user_id="+"${requestScope.toUserId}"+"&currentPage="+c);
	}
	//定义回调函数
	function callback(){	
		if(xmlHttpRequest.readyState === 4 && xmlHttpRequest.status === 200 )
		{
			//接收服务端返回的数据
			//设置服务器返回值的类型是String格式--JSON字符串---JSON.parse将字符串转化为对象
			 obj = JSON.parse(xmlHttpRequest.responseText);  
				 for (var i = 0; i<obj.objects.length;i++ ) {
						 $privatemail =
	            	 	'						<!-- 对话的每一项 -->'+
						'						<div class=\"privatemail-item\" id=\"'+obj.objects[i].privatemailId+'\" style=\"    display: flex;box-shadow: 0 0 black; \" >'+
						'						    <!-- 对话人的头像 -->'+
						'						    <div class=\"pic\" style=\"margin: 13px 6px;width: 70px;float: left;\">'+
						'						        	<img width=\"52\" height=\"52\" src=\"${pageContext.request.contextPath}'+obj.objects[i].fromUserImg+'\" alt=\"用户头像\" style=\"margin: 2px 0px;    border-radius: 4px;\">'+
						'						    </div>'+
						'						    <div class="content report-privatemail" style="float: left;height: auto;width: 590px;margin: 11px 0px;">'+
						'						        <div class="author">'+
						'						        	<!-- 对话时间 -->'+
						'						            <span1 class="">'+obj.objects[i].chatTime+'</span1>'+
						'                           		<!--对话人的昵称-->'	+												
						'						            <a href="#" class="" style="color:black;margin: 0px 11px;">'+obj.objects[i].fromUserNick+'</a>'+
						'						        </div>'+
						'						'+
						'						        <!-- 对话的内容-->'+
						'						        <p id=\"privatemail-msg\" style="margin: 10px 2px;height: auto;    line-height: 1.6;font-size: 13px;    width: 575px;word-wrap: break-word;overflow: hidden;">'+obj.objects[i].chatMsg+
						'						</p>'+
						'						    </div>'+
						'<input type=\"hidden\"   value = \"'+obj.objects[i].doumailId+'\">'+
						'						</div>'+
						'';
							    $("#privatemail-code").prepend($privatemail);
	         }
				//拿到分页对应的当前页
				currentPage = obj.currentPage;
				//拿到总页数
				totalPage = obj.totalPage ;
				//设置当前页数和总页数
				if(totalPage != null )
				{	
					if( totalPage === 0)
					{
					currentPage = 1;
					totalPage = 0 ;
					}
				}
				//调用显示页数的函数
				showNum( );
		}
	}
</script>
</body>
</html>