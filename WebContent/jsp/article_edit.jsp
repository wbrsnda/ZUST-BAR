<!-- 文本编辑页面--生成文章以及编辑已完成的文章 -->
<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>写文章</title>
<link rel="icon" href="../image/icon.jpg" type="image/x-icon">
<!-- 样式初始化 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/init.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/star.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/edit.css">
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript">
/*记录用户选择单选栏的内容*/
/*   $(document).ready(function(){
		  $("#groups-selectbox").click(function(){
		   	alert($('select#groups-selectbox').find('option:selected').text());
		});
	}); */
  /*记录用户选择单选栏的所有内容--放到数组中*/
    var selectArray = new Array();  //定义数组
	 $(document).ready(function(){
		       $("#groups-selectbox option").each(function(){  //遍历所有option
		            var txt = $(this).val();   //获取option值对应
		            if(txt!=''){
		                 selectArray.push(txt);  //添加到数组中
		            }
		       })
	 });
	//定义全局变量
	var selectChoice = null;
	/*记录用户选择单选栏的内容*/
   	$(document).ready(function(){
			  $("#groups-selectbox").click(function(){
				  //用户当前选择的内容
				  selectChoice = $('select#groups-selectbox').find('option:selected').val();
				//将得到的单选栏选项的值赋给隐藏的input框
				document.getElementById("selectS").value = selectChoice;
			  });
		});
</script>
</head>
<body>
<div class="stars">
	<span></span><span></span>
<!-- 导航栏外盒子 -->
	<div id="nav">
	<!-- 导航栏内盒子 -->
		<div id="nav-inner">
			<!-- 放置logo的地方 -->
			<div id="nav-logo">
					<img alt="文章编辑-logo" src="<c:url value="/image/logo1.png"/>" width=175px  height=58px >
			</div>
			<!-- 写文章的这三个字，当做导航栏标头 -->
			<div id="nav-label-div">
				<h1 class="nav-label">
				     写文章
				 </h1>
			</div>
					<span></span><span></span><span></span>
					<span></span><span></span>
			<!-- 下一步，即跳转到弹窗功能--进行分组选择 -->
			<div class="editor-button-submit-div">
				<a href="javascript:void(0);" class="editor-button-submit" onclick="transform();">下一步</a>
			</div>
		</div>
	</div>		
	<!-- 文章编辑的地方-->
		<div id="article">
			<div id = "content">
				<!-- 最基本的文本编辑地方--三个小布局的外盒子 -->
				<div id ="editor-element">
					<!--1- 设置文章标题 -->
					<div class="editor-title" >
						<textarea class="editor-input" id="edit-textarea"  tabindex="1" maxlength="100" placeholder="添加标题" rows="1" style="resize: none; overflow: hidden; height: 30px;"></textarea>
					</div>
					<span></span><span></span><span></span>
					<span></span><span></span><span></span>
					<span></span><span></span>
				<!-- 文章编辑处 -->
				<div id="edit-article">
					<!--2- 文章编辑的按钮 -->
					<div id="controller-area">
								<!-- 撤销重做 -->
					            <a href="#" class='util-btn btn-back' data-command='undo' onclick="changeStyle(this.dataset)">撤销</a>
					            <a href="#" class='util-btn btn-redo' data-command='redo' onclick="changeStyle(this.dataset)">重做</a>
								<!-- 对文字的操作 -->
								<a href="#" class='util-btn btn-blacken' data-command='bold' onclick="changeStyle(this.dataset)">加黑</a>
								<a href="#" class='util-btn btn-underline' data-command='underline' onclick="changeStyle(this.dataset)">下划线</a>
								<a href="#" class='util-btn btn-italic' data-command='italic' onclick="changeStyle(this.dataset)">斜体</a>
					            <a href="#" class='util-btn btn-strike-through' data-command='strikeThrough' onclick="changeStyle(this.dataset)">删除线</a>
								<!-- 对字体小标题的操作 -->
					           <a href="#" class='util-btn btn-little-title' data-command='fontSize' data-value="4" onclick="changeStyle(this.dataset)">小标题</a>
					        	<a href="#" class='util-btn btn-strike-through' data-command='insertHorizontalRule' onclick="changeStyle(this.dataset)">分割线</a>
								<a href="#" class='util-btn' onclick="document.getElementById('photo').click()" >图片</a>
						<span></span><span></span><span></span>
						<span></span><span></span><span></span>
						<span></span><span></span><span></span>
						<span></span><span></span><span></span>
						<span></span><span></span>
					</div>
					<!--3- 写文章的背景 -->
					<div id="edit-background" >
						<!-- 写文章的地方，装有HTML代码 -->
					   <div id='edit-area' contenteditable="true" >
					   </div>
					</div>	
				</div>
					<span></span><span></span><span></span>
			<!-- 隐藏表单的地方 -->
			 <!-- 对图片的操作 -->	
					<div class="btn-group">
					     <form id="Upload_form" method="post" enctype="multipart/form-data" > 
							<input type="file" id="photo" name = "photo"  onchange="uploadUrl()"  style="display: none;">
						</form>
					</div>
				<form action="${pageContext.request.contextPath}/ArticleEditServlet?method=edit_article" method="post" id="onSubmit" style="display: none;">
					<div>
						<!-- 隐藏表单，用于传输数据-文章标题处--即textarea -->
						<input type="hidden" id="edit-title" name = "title" value="" placeholder="写标题">
						<!-- 隐藏的表单，用于传输HTML代码 -->
					    <input type="hidden" name="transfer" value="" id="transfer">
					    <!-- 隐藏的表单，用于传输文章的分类---装有单选栏的一个选项 -->
					    <input type="hidden" name="groups" value="" id="groups">
					    <!-- 隐藏表单，三个输入框的值 -->
					    <input type="hidden" name="a" value="" id="inputA">
					    <input type="hidden" name="b" value="" id="inputB">
					    <input type="hidden" name="c" value="" id="inputC">
					     <!-- 隐藏的表单，装有单选栏的一个选项 -->
					    <input type="hidden" name="s" value="" id="selectS">
					    <!-- 放进去文章的id值-不存在的为null或者为空 -->
					    <input type="hidden" name="article-id" value="" class="article-id">
					    <!-- 请求服务器的方式 -->
					    <!-- <input type="hidden" name="method" value="" class="method"> -->
					</div>
				</form>
				</div>
			</div>
		</div>
	<span></span><span></span><span></span>
	<span></span><span></span><span></span>
	<span></span><span></span><span></span>
	<span></span>
<!-- 弹窗功能--实现文章分组的选择和填写以及文章的提交 -->
<!-- 先是隐藏状态，然后通过JS代码进行显示和关闭的操作 -->
<!-- 整个页面的根盒子 -->
	<div id ="groups-wrapper" style="display:none ;">
		<span></span><span></span><span></span>
	</div>
		<!-- 用户操作的地方 -->
		<div id = "groups-content" style="display: none;">
				<!-- 分组的说明 -->
				<div id = "groups-state">
					<h3 id = "groups-state-details">给你的文章添加分组</h3>
					<a href="javascript:void(0);" onclick="transform()" id="back-edit-href">X</a>
				</div>
				<!-- 分组的表单 -->
				<form action="${pageContext.request.contextPath}/ArticleShowServlet?method=article_show&article_id=${a.articleId}"  id = "groups-form">
						<div id="groups-input-wrapper">
							<div id="groups-input-container">
								<!-- 给用户填写要分组的名称 --禁止输入空格-->
								<div id="groups-input-value">
								<div class="groups-input-place-div">
									<input type="text" value="" placeholder="      添加分组" class="groups-input-place"  id = "input-place-A"  onchange="isRepeat('input-place-A')" onkeyup="this.value=this.value.replace(/\s+/g,'')">
								</div>
								<div class="groups-input-place-div">
									<input type="text" value="" placeholder="      添加分组" class="groups-input-place"   id = "input-place-B" onchange="isRepeat('input-place-B')" onkeyup="this.value=this.value.replace(/\s+/g,'')">
								</div>
								<div class="groups-input-place-div">
									<input type="text" value="" placeholder="      添加分组" class="groups-input-place" id = "input-place-C"  onchange="isRepeat('input-place-C')" onkeyup="this.value=this.value.replace(/\s+/g,'')">
								</div>
								</div>
							</div>
							<span></span><span></span><span></span>
							<div>
							<!-- 只能选一个多选框 -->
								<select size="10" id="groups-selectbox" >
									  <option value="天文" class="groups-selectbox-option">天文</option>
									  <option value="读书" class="groups-selectbox-option">读书</option>
									  <option value="美食" class="groups-selectbox-option">美食</option>
									  <option value="NBA" class="groups-selectbox-option">NBA</option>
									  <option value="社会热点" class="groups-selectbox-option">社会热点</option>
									  <option value="科技" class="groups-selectbox-option">科技</option>
									  <option value="情感" class="groups-selectbox-option">情感</option>
									  <option value="电影" class="groups-selectbox-option">电影</option>
									  <option value="音乐" class="groups-selectbox-option">音乐</option>
									  <option value="其他" class="groups-selectbox-option">其他</option>
								</select>
							</div>
							<span></span><span></span><span></span>
							<div id="groups-submit-btns">
								<a href="javascript:void(0);" onclick="transform()" id="back-edit">返回</a>
								<!-- 进行文章内容和用户所选文章分类提交表单信息 -->
								<a href="javascript:void(0);" onclick="formSubmit()"  id="groups-form-submit">提交</a>
								<%-- --%>
							</div>
						</div>
				</form>
		</div>
</div>
 <!-- JS代码--文章编辑完成的弹窗 -->
 <script type="text/javascript">
	//三个input框的内容信息的比较
	//切换窗口的按钮功能
    function transform() {
    	var ic = isCan();
		if(ic===false)
		{
			return;
		} 
        var groupWindow = document.getElementById('groups-wrapper');
        groupWindow.style.display = (groupWindow.style.display === 'none') ? 'block' : 'none';
        var groupContent = document.getElementById('groups-content');
        groupContent.style.display = (groupContent.style.display === 'none') ? 'block' : 'none';
    }
</script>
<!-- JS代码--文章编辑页面 -->			 
<script type="text/javascript">
	//文章编辑器的按钮功能
	const changeStyle = data=>{ 
		   data.value ? document.execCommand(data.command, false, data.value) : document.execCommand(data.command, false, null)
		}
	//若作者未填写标题或者文章内容，进行弹窗提醒
	//文章编写是否符合要求
	function isCan(){
		//拿到文章的标题
		var title = $("#edit-textarea").val();
		//拿到文章的内容
		var content = $("#edit-area").html();
		if(title==="null"||title==="")
		{
			alert("文章标题不能为空");
			return false;	
		}
		if(content==="null"||content==="")
		{
			alert("文章内容不能为空");
			return false;	
		}
		return true;
	}
	//进行隐藏表单的提交(onSubmit)--提交HTML代码
	function formSubmit(){
		/*拿到div中的html代码-*/
	 	var x=document.getElementById("edit-area"); 
		document.getElementById("transfer").value=x.innerHTML;
		//拿到文章的标题的值---用value获取textarea的值
		var y = document.getElementById("edit-textarea");
		document.getElementById("edit-title").value = y.value;
		//拿到文章的分类名--3个input框中的值
		var a = document.getElementById("input-place-A");
		var b = document.getElementById("input-place-B");
		var c = document.getElementById("input-place-C");
		//放进去a,b,c
		document.getElementById("inputA").value = a.value;
		document.getElementById("inputB").value = b.value;
		document.getElementById("inputC").value = c.value;
		//请求服务器的方式--默认赋值
		//提交表单
		document.getElementById('onSubmit').submit();	
	}
	/*加载图片---要用存放图片地址的方式，不然有损数据库性能*/
	// 原生JS实现AJAX 
	function uploadUrl(){
		//直接把整个Form表单内容塞到FormData对象里面--要放在方法里面 
		var formElement = document.getElementById("Upload_form");
		var formData = new FormData(formElement);
		//请求的方法名
		formData.append('method','getUrl');
		/* 异步方式 */
		xmlHttpRequest = new XMLHttpRequest();
		/* 设置xmlHttpRequest对象的回调函数 */
		xmlHttpRequest.onreadystatechange = callback ;
		// 异步方式为true
		xmlHttpRequest.open("post","UploadServlet",true);
		/* 
		//设置post方式的头信息--文件上传application/x-www-form-urlencoded  multipart/form-data --文件上传不能加这个标头设置
		xmlHttpRequest.setRequestHeader("Content-Type"," multipart/form-data"); */
		/* 
		/* 发送--键值对 */
		console.log("formData"+formData);
		xmlHttpRequest.send(formData);
	}
	//定义回调函数
	function callback(){
		if(xmlHttpRequest.readyState === 4 && xmlHttpRequest.status === 200 )
		{//接收服务端返回的数据
			//返回图片的地址URL
			var url = xmlHttpRequest.responseText ; //设置服务器返回值的类型是String格式
			/*设置插入图片水平居中，并且限制其最大宽度*/
			var t =  '<div id="editor-img-insert" style="display: table;margin: 15px auto;">'+'<br>'+'<br>' +
						'<img alt= " 图片 " src = " ' +  url + '"style = "max-width:590px;" >'
					+'</div>' 
					+'<br>'+'</br>'
					;
			//自定义的img标签
			document.getElementById("edit-area").innerHTML = document.getElementById("edit-area").innerHTML + t;
			//调用增加图片的函数
			 document.execCommand("insertImage", false, url);
		}
	}
	//3个input框中的内容的信息的比较--是否重复
	function isRepeat(inputId){
		//
		var a = document.getElementById("input-place-A").value;
		var b = document.getElementById("input-place-B").value;
		var c = document.getElementById("input-place-C").value;
		for (var i=0;i<selectArray.length;i++)
			{
				if(document.getElementById(inputId).value===selectArray[i])
					{
						document.getElementById(inputId).value="";
						alert("分组名重复!!!");
					}
			}
		//3个input框是否重复
		if(
				(
						( a===b || a===c||b===c )&&( (a!=="" && b!=="" && c==="" )|| (a!=="" && b==="" && c!=="" ) || (a==="" && b!=="" && c!=="" ) )
				)
			||	(
						( a===b || a===c||b===c )&&( ( a!=="" && b!=="" && c!=="" ) ) 
				)
			)
		{
			alert("分组名重复!!");
			document.getElementById(inputId).value="";
		}
		
	} 
</script>
</body>
</html>