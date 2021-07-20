# ZUST-BAR
第一章 项目背景和意义

研究现状：国外的微博在飞速发展的时候，国内的一些勇于创新的创业者们也开始尝试着创办了一些类似于微博的社交网站。2009年，伴随着智能移动终端的普及和新浪微博的正式开放，以及腾讯微博、搜狐微博等与之相伴随的发展，中国微博用户数量和月活跃用户数量均进入了一个爆炸式的增长期。“微博旨在随时随地发现新鲜事”，使得网络信息传播的时效性增强，传播速度变快。微博的“大V”等以扇形形式传播信息，使得他们的影响力和舆论领导力大大增强，事情的发酵只需要短短的时间。微博在中国大地上真正开始掀起一股热潮。如今，微博经历了多年的快速发展，现在已经进入了成熟期。尤其是移动互联网时代的来临，智能设备的普及使得越来越多的用户开始使用微博这种交流工具，微博已渐渐融入人们的生活，成为了主流媒介。 

意义：当下的微博，变成了资本博弈场，无法展现出最初的意义。新浪微博着重讲究通过明星引流，毫无疑问，微博现在大部分潜在的市场，都来自于追星。热搜榜单上出现更多的，都是一些八卦事件。正是因为这种趋向的出现，我觉得微博的表达没有当初那么自由了。不仅是现在的公众人物要谨言慎行，不能畅所欲言，连普通用户，也无法随心所欲。现代微博虽然表面上开放，但是在某种意义上，是更狭窄了。我们的产品旨在让用户能够畅所欲言，分享新鲜事。




第二章 系统分析
2.1 系统功能需求
(1)用户注册
用户可以通过注册界面输入相应的信息完成注册
(2)用户登录
用户可以在登录界面输入用户名和密码完成登录
(3)用户退出登录
用户可以在登录后在系统主界面选择退出登录
(4)用户修改个人信息
用户可以在个人主页界面修改信息
(5)用户写文章
用户可以在写文章界面上传文章
(6)用户修改文章
用户可以在我的文章界面修改文章
(7)用户查看所有用户的文章
用户可以在所有文章界面查看所有文章
(8)用户点赞、评论、收藏文章
用户可以在文章显示页面点赞、评论、收藏文章
(9)用户查看所有用户
用户可以在所有人页面查看所有用户
(10)用户关注其他用户
用户可以在所有人页面关注其他用户
(11)用户拉黑其他用户
用户可以在所有人页面拉黑其他用户
(12)用户给其他用户发私信
用户可以在所有人页面发私信给其他用户
(13)用户查找用户或文章
用户可以在系统主界面搜索框中查找用户或文章
(14)管理员查找用户删除用户
管理员可以在后台查找用户删除用户
(15)管理员查找文章删除文章
管理员可以在后台查找文章删除文章
2.2 系统技术需求
前端技术：html、Java Script、CSS、jquery
后端技术：tomacat、java、mysql
第三章 系统设计

1.系统架构图


2、项目技术环境
编程语言：Java
前端语言：JSP+HTML+CSS+JS+Ajax+Jquery
编程环境：IntelliJ IDEA 2020.3.2
数据库版本：Mysql 8.0.24
Tomcat版本：Tomcat 9.0.46
处理请求：Servlet
3、数据库设计
（1）CREATE TABLE `article_to_tag` (
  `middle_id` int NOT NULL AUTO_INCREMENT COMMENT '充当文章表和标签表之间的中间表',
  `article_id` int NOT NULL COMMENT '文章表的id',
  `tag_id` int NOT NULL COMMENT '标签表的id',
  PRIMARY KEY (`middle_id`) USING BTREE,
  KEY `article_id` (`article_id`) USING BTREE,
  KEY `article_to_tag_ibfk_2` (`tag_id`) USING BTREE,
  CONSTRAINT `article_to_tag_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `a_article` (`article_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `article_to_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `a_tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

（2）CREATE TABLE `a_article` (
  `article_id` int NOT NULL AUTO_INCREMENT COMMENT '文章id值',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章标题',
  `author` int NOT NULL COMMENT '文章作者id',
  `published_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '文章发表的时间',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章的内容（HTML）',
  `collection` int NOT NULL DEFAULT '0' COMMENT '文章收藏数',
  `share` int NOT NULL DEFAULT '0' COMMENT '文章转发数',
  `comment` int NOT NULL DEFAULT '0' COMMENT '文章评论数',
  `star` int NOT NULL DEFAULT '0' COMMENT '文章点赞数',
  `stick` int NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `page_view` int NOT NULL DEFAULT '0' COMMENT '浏览量',
  PRIMARY KEY (`article_id`) USING BTREE

) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

（3）CREATE TABLE `a_collection` (
  `collection_id` int NOT NULL AUTO_INCREMENT COMMENT '文章收藏表的id',
  `user_id` int NOT NULL COMMENT '进行收藏操作的用户',
  `article_id` int NOT NULL COMMENT '被收藏的文章id',
  PRIMARY KEY (`collection_id`) USING BTREE,
  KEY `article_id` (`article_id`) USING BTREE,
  CONSTRAINT `a_collection_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `a_article` (`article_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

（4）CREATE TABLE `a_comment` (
  `comment_id` int NOT NULL AUTO_INCREMENT COMMENT '文章评论表的id',
  `article_id` int NOT NULL COMMENT '被评论的文章的id',
  `user_id` int NOT NULL COMMENT '进行评论的用户id',
  `c_msg` varchar(800) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论的内容',
  `c_star` int NOT NULL DEFAULT '0' COMMENT '点赞数，默认为0',
  `c_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论的时间',
  PRIMARY KEY (`comment_id`) USING BTREE,
  KEY `aricle_id` (`article_id`) USING BTREE,
  CONSTRAINT `a_comment_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `a_article` (`article_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

（5）CREATE TABLE `a_reply` (
  `reply_id` int NOT NULL AUTO_INCREMENT COMMENT '对评论下进行回复的id',
  `comment_id` int NOT NULL COMMENT '被回复的评论id',
  `from_user_id` int NOT NULL COMMENT '发出回复的人的id值',
  `to_user_id` int NOT NULL COMMENT '接收回复的人的id值',
  `reply_msg` varchar(800) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复的内容',
  `reply_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '回复的时间',
  `r_star` int NOT NULL DEFAULT '0' COMMENT '回复的点赞数',
  PRIMARY KEY (`reply_id`) USING BTREE,
  KEY `comment_id` (`comment_id`) USING BTREE,
  CONSTRAINT `a_reply_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `a_comment` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

（6）CREATE TABLE `a_share` (
  `share_id` int NOT NULL AUTO_INCREMENT COMMENT '转发文章表的id值',
  `user_id` int NOT NULL COMMENT '进行转发的用户名的id值',
  `article_id` int NOT NULL COMMENT '被转发的文章的id值',
  PRIMARY KEY (`share_id`) USING BTREE,
  KEY `article_id` (`article_id`) USING BTREE,
  CONSTRAINT `a_share_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `a_article` (`article_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

（7）CREATE TABLE `a_star` (
  `star_id` int NOT NULL AUTO_INCREMENT COMMENT '点赞表的id',
  `type_id` int NOT NULL COMMENT '被点赞的对象id',
  `type` int NOT NULL COMMENT '被点赞的对象类型-1-文章 2-评论 3-回复',
  `user_id` int NOT NULL COMMENT '进行点赞的用户id',
  PRIMARY KEY (`star_id`) USING BTREE,
  KEY `a_star_ibfk_1` (`user_id`) USING BTREE,
  CONSTRAINT `a_star_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

（8）CREATE TABLE `a_tag` (
  `tag_id` int NOT NULL AUTO_INCREMENT COMMENT '文章分类表的id值',
  `tag_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章分类名',
  PRIMARY KEY (`tag_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

（9）CREATE TABLE `friend` (
  `friend_id` int NOT NULL AUTO_INCREMENT COMMENT '好友的id值',
  `from_user_id` int NOT NULL COMMENT 'a用户名id（该记录的发出者）',
  `to_user_id` int NOT NULL COMMENT 'b用户名id（该记录的接收者）',
  `status` int NOT NULL DEFAULT '1' COMMENT '1->a关注b 2->ab为好友（双向关注）3->b被a拉黑',
  PRIMARY KEY (`friend_id`) USING BTREE,
  KEY `to_user_id` (`to_user_id`) USING BTREE,
  KEY `from_user_id` (`from_user_id`) USING BTREE,
  CONSTRAINT `friend_ibfk_1` FOREIGN KEY (`to_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `friend_ibfk_2` FOREIGN KEY (`from_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

（10）CREATE TABLE `privatemail` (
  `privatemail_id` int NOT NULL AUTO_INCREMENT COMMENT '璞嗛偖琛ㄧ殑id',
  `from_user_id` int NOT NULL COMMENT '发出豆邮的用户的id',
  `to_user_id` int NOT NULL COMMENT '接收豆邮的用户的id',
  `chat_msg` varchar(800) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '豆邮的内容',
  `chat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '聊天的时间',
  `status` int NOT NULL DEFAULT '0' COMMENT '记录删除状态，0为双方都没有删除，1为豆邮发出者删除，2为豆邮接收者删除',
  `read` int NOT NULL DEFAULT '0' COMMENT '0为未读状态，1为已读状态',
  PRIMARY KEY (`privatemail_id`) USING BTREE,
  KEY `from_user_id` (`from_user_id`) USING BTREE,
  KEY `to_user_id` (`to_user_id`) USING BTREE,
  CONSTRAINT `privatemail_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `privatemail_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

（11）CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户名的id',
  `username` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名（通常为邮箱）',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码（MD5）',
  `gender` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mail` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0' COMMENT '用户的权限（0为普通用户，1为管理员）',
  `title_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '封号截止时间',
  `portrait` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'http://47.102.212.18/DouBan/image/default.png' COMMENT '用户头像（存储路径）',
  `signature` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '个性签名',
  `self_introduction` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '自我介绍',
  `nickname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '某某' COMMENT '昵称',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户地址',
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户注册时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
第四章 系统实现

1、登录注册模块（index选择注册或者登陆，实现注册功能，页面采用表单验证，注册成功录入信息至后台，密码采用MD5加密技术，实现用户信息验证登录功能，采用随机文本生成图片验证码）



2、个人信息模块（个人主页展示用户个人信息，账号管理界面实现头像图片上传功能，个人信息修改功能）


3、文章管理模块（分页显示浏览发现、所有文章、我的收藏、我的文章界面，点击文章标题显示文章全部内容，页面底部实现文章点赞、收藏、转发、评论功能，实现富文本编辑器功能，编辑并可发布文章并选择文章内容分类，实现文章内容及标题模糊搜索功能）







4、好友功能模块（所有人、我的关注、黑名单界面，实现分页显示所有用户、关注用户、拉黑用户（拉黑或被拉黑不能发私信）、发私信功能，实现用户名模糊搜索功能）




3 系统概要设计
3.1 系统总体功能
本项目为开发一个在线博客系统。使用实现用户简单的登录注册，个人信息管理，好友关系管理，文章管理等功能。
3.2 系统功能

4 系统详细设计与实现
4.1整体页面布局及背景美化
前端关键代码：
1.星空特效背景css
@charset "UTF-8";
/*星空特效*/
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
。。。。。。
2.功能页面导航栏等布局及背景css
/*放置主要的页面内容*/
#main_content{
   width: 800px;
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
header{
   height:74px;
   /* background-color:pink; */
   overflow:hidden;/*防止外边距合并的问题*/
   background-color: #edf4ed;/*设置背景颜色*/
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
   /* width:100px; */
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

4.2 个人信息管理模块
前端关键代码：
1.主页等背景css
@charset "UTF-8";

/*欢迎消息*/
#welcome_msg{
   font-family: "Adobe Arabic";
   font-weight: bold;
   margin-left:20px;
   font-size: 30px;
}
/*用户头像*/
#user_img{
   border-radius:5px;
   width:120px;
   height:100px;
   margin-left:20px;
   margin-top:20px;
}
/*用户信息*/
#user_info_show{
   MARGIN: 30px 20px;
   color: #111011;
   font-weight: bold;
   font-size: 20px;
   font-family: "Adobe Arabic"    ;
}


4.3好友关系管理模块
前端关键代码：
1.js实现黑名单列表禁止发私信
$(function(){
   var msg = '${requestScope.msg}';
         if( msg == "黑名单限制")
            {
               alert("不能与该用户进行私信的对话!!!\n可能您将其拉黑了，或者是您在他的黑名单中!!!");
            }
})

4.4文章管理模块
前端关键代码：
1.js实现富文本编辑器的文本样式修改
//切换窗口的按钮功能
   function transform() {
       var ic = isCan();
   if(ic===false)
   {
      return;
   } 
       var groupWindow = document.getElementById('groups-wrapper');
       groupWindow.style.display = (groupWindow.style.display == 'none') ? 'block' : 'none';
       var groupContent = document.getElementById('groups-content');
       groupContent.style.display = (groupContent.style.display == 'none') ? 'block' : 'none';
   }
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
   if(xmlHttpRequest.readyState == 4 & xmlHttpRequest.status == 200 )
   {//接收服务端返回的数据
      //返回图片的地址URL
      var url = xmlHttpRequest.responseText ; //设置服务器返回值的类型是String格式
      /*设置插入图片水平居中，并且限制其最大宽度*/
      var t =  '<div id="editor-img-insert" style="display: table;margin: 15px auto;">'+'<br>'+'<br>' +
               '<img src = " '  +  url + '"' +  'style = "max-width:590px;" '    +  '>' 
            +'</div>' 
            +'<br>'+'</br>'
            ;
      //自定义的img标签
      document.getElementById("edit-area").innerHTML = document.getElementById("edit-area").innerHTML + t;
      //调用增加图片的函数
      /* document.execCommand("insertImage", false, url); */
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
      || (
               ( a===b || a===c||b===c )&&( ( a!=="" && b!=="" && c!=="" ) ) 
         )
      )
   {
      alert("分组名重复!!");
      document.getElementById(inputId).value="";
   }
   
} 
2.显示文章js及ajax实现动态刷新、转发、点赞、评论等界面
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
//初始化的评论区
$(document).ready(function(){
   var currentPage = 1 ;
   $("#totalPage_num").innerText = totalPage ;
   toAjax(currentPage);
});
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
                        '                 <!-- 评论的每一项 -->'+
                     '                 <div class=\"comment-item\" id=\"'+obj.objects[i].commentId+'\" style=\"    display: flex;box-shadow: 0 0 black; \" >'+
                     '                     <!-- 评论人的头像 -->'+
                     '                     <div class=\"pic\" style=\"margin: 13px 6px;width: 70px;float: left;\">'+
                     '                            <img width=\"52\" height=\"52\" class="" src=\"${pageContext.request.contextPath}'+obj.objects[i].userComImg+'\" alt=\"用户头像\" style=\"margin: 2px 0px;    border-radius: 4px;\">'+
                     '                     </div>'+
                     '                     <div class="content report-comment" style="float: left;height: auto;width: 590px;margin: 11px 0px;">'+
                     '                         <div class="author">'+
                     '                            <!-- 评论时间 -->'+
                     '                             <span1 class="">'+obj.objects[i].comTime+'</span1>'+
                     '                                 <!--评论人的昵称-->' +                                   
                     '                             <a href="#" class="" style="color:black;margin: 0px 11px;">'+obj.objects[i].userComNick+'</a>'+
                     '                         </div>'+
                     '                 '+
                     '                         <!-- 评论的内容-->'+
                     '                         <p id=\"comment-msg\" style="margin: 10px 2px;height: auto;    line-height: 1.6;font-size: 13px;    width: 575px;word-wrap: break-word;overflow: hidden;">'+obj.objects[i].comMsg+
                     '                    <a href="#submit-confirm" class=\"reply_a\" id=\"'+obj.objects[i].commentId+'\"  style=\"color : grey;float: right;margin: 9px 2px;\">回复</a>'+
                     '                 <a href=\"ArticleShowServlet?pre_method=comment_star&method=article_show&comment_id='+obj.objects[i].commentId+'&article_id=${requestScope.article.articleId}\" class="comment_star_a" id="127" style="color : grey;float: right;margin: 9px 2px;">点赞('+obj.objects[i].comStar+')</a>'+
                     '                 </p>'+
                     '                     </div>'+
                     '<input type=\"hidden\"   value = \"'+obj.objects[i].commentId+'\">'+
                     '                 </div>'+
                     '';
                   }
               if( obj.objects[i].starStatus == 1  )
                  {
                   $comment = 
                           '                 <!-- 评论的每一项 -->'+
                        '                 <div class=\"comment-item\" id=\"'+obj.objects[i].commentId+'\" style=\"    display: flex;box-shadow: 0 0 black; \" >'+
                        '                     <!-- 评论人的头像 -->'+
                        '                     <div class=\"pic\" style=\"margin: 13px 6px;width: 70px;float: left;\">'+
                        '                            <img width=\"52\" height=\"52\" class="" src=\"${pageContext.request.contextPath}'+obj.objects[i].userComImg+'\" alt=\"用户头像\" style=\"margin: 2px 0px;    border-radius: 4px;\">'+
                        '                     </div>'+
                        '                     <div class="content report-comment" style="float: left;height: auto;width: 590px;margin: 11px 0px;">'+
                        '                         <div class="author">'+
                        '                            <!-- 评论时间 -->'+
                        '                             <span1 class="">'+obj.objects[i].comTime+'</span1>'+
                        '                                 <!--评论人的昵称-->' +                                   
                        '                             <a href="#" class="" style="color:black;margin: 0px 11px;">'+obj.objects[i].userComNick+'</a>'+
                        '                         </div>'+
                        '                 '+
                        '                         <!-- 评论的内容-->'+
                        '                         <p id=\"comment-msg\" style="margin: 10px 2px;height: auto;    line-height: 1.6;font-size: 13px;    width: 575px;word-wrap: break-word;overflow: hidden;">'+obj.objects[i].comMsg+
                        '                    <a href="#submit-confirm" class=\"reply_a\" id=\"'+obj.objects[i].commentId+'\"  style=\"color : grey;float: right;margin: 9px 2px;\">回复</a>'+
                        '                 <a href=\"ArticleShowServlet?pre_method=comment_star_cancel&method=article_show&comment_id='+obj.objects[i].commentId+'&article_id=${requestScope.article.articleId}\" class="comment_star_a" id="127" style="color : grey;float: right;margin: 9px 2px;">取消点赞('+obj.objects[i].comStar+')</a>'+
                        '                 </p>'+
                        '                     </div>'+
                        '<input type=\"hidden\"   value = \"'+obj.objects[i].commentId+'\">'+
                        '                 </div>'+
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

 


第五章 课程设计小结

项目开发遇到困难点：
1.实现富文章编辑器功能十分繁琐
2.Dao层接口设计
3.文件上传等路径编写问题导致404
4.界面布局样式耗时长

项目亮点：
1.页面整体较美观
2.注册密码采用MD5加密
3.项目原生实现富文本
4.手写数据库连接池
5.实现模糊搜索功能
6.原生js实现ajax加载评论部分 

心得体会：本次课程设计是由我们小组两人合作完成，通过这次课程设计使我们了解到我们有很多的不足，在程序调试的时候常常会因为几个错误而影响进度，这说明我们对知识的掌握还不够牢，在程序设计的过程中也暴露出了我们的诸多弊端，借这次课程设计的机会我们也认真的加以改正，为以后的学习打下坚实的基础。熟练的编程能力，对知识运用的及其创新和团队的合作精神是做好一个项目的基础。因此通过此次课程设计我们明显感觉到自身的不足，并希望以后能更加用心地运用所学知识和学习新的知识。
