<%@ page  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>welcome</title>
<link rel="icon" href="../image/icon.jpg" type="image/x-icon">
    <style type="text/css">
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
        h1{
            background: #000;
            color:white;
            font-size:68px;
            font-family:STHupo;
            text-align:center;
            height: min-content;
        }
        a{
            font-family: STHupo;
            outline: none;
            text-decoration:none;
            font-weight: bold;
            font-size:28px;
            color: #551A8B;
        }
        #a1{
            position:absolute;
            top:300px;
            left:150px;
        }
        #a2{
            position:absolute;
            top:300px;
            right:150px;
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
<body>
<h1>Welcome.</h1>
<div class="stars">
    <span></span><span></span><span></span>
    <span></span><span></span><span></span>
    <span></span><span></span><span></span>
    <span></span><span></span><span></span>
    <span></span><span></span><span></span>
    <span></span><span></span><span></span>
    <span></span><span></span>
    <div id="a1"><a href="<c:url value="/jsp/register.jsp"/>">注册账号</a></div>
    <div id="a2"><a href="<c:url value="/jsp/login.jsp"/>">已有账号?立即登录</a></div>
</div>
</body>
</html>