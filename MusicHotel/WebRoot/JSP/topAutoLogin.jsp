 <%@ page language="java" import="java.util.*,com.po.User" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>网站顶栏</title>
		<link rel="stylesheet" type="text/css" href="css/top.css" />
	</head>

	<body>
	
		<% 
			User user = (User)session.getAttribute("user");
		%>
		<!--一整个顶部栏-->
		<div id="wholeTop">
			<!--网站logo-->
			<div class="logo">
				<span id="logo"></span>

			</div>
			<!--选择进入什么模块-->
			<div id="yourSelection">
				<div class="selection">
					<a>期刊</a>
				</div>
				<div class="selection">
					<a>单曲</a>
				</div>
				<div class="selection">
					<a>专栏</a>
				</div>
				<div class="selection">
					<a>活动</a>
				</div>
				<div class="selection">
					<a>APP</a>
				</div>
			</div>
			<!--搜索框-->
			<div id="searchAll">
				<div id="search" class="search searchBlur">
					<span id="searchMirror"></span>
					<input type="text" name="searchEverything" id="searchEverything" style="display: none;" />
				</div>
			</div>
			
			<!-- 登录上之后出现的 -->
			<div id="loginAfter">
				<div id="message"></div>
				<div id="messageDetail" style="display:none">
					<div class="message">
						期刊 
					</div>
				
					<div id="bottom">
						查看全部消息
					</div>
				</div>
				<div id="information">
					<img src="img/profile/<%=user.getProfileImg()%>" width="16px" height="16px" id="touXiang"/>
					<label id="account"><%=user.getNickname()%></label>
					
				</div>
				
				<div id="operate" style="display:none">
						
					<div id="cc">
						<a><label class="myLabel" id="my"></label>我的落网</a>

						<a><label class="myLabel" id="setting"></label>账号设置</a>
						<a href="logout.action"><label class="myLabel" id="logout"></label>退出</a>
					

					</div>
				</div>
			</div>
			
		</div>
		<script src="js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/top.js" type="text/javascript" charset="utf-8"></script>
	</body>

</html>
