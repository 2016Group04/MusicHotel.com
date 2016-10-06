 <%@ page language="java" import="java.util.*,com.po.User" pageEncoding="UTF-8"%>
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
					<a herf="getAll.action">专栏</a>
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
			
			
			<%
			
				if(user==null){
					
					%>
					<!-- 登录上之后出现的 -->
			<input type="hidden" id="hidden"/>
			<div id="loginAfter" style="display:none">
				<div id="message"></div>
				<div id="messageDetail" style="display:none">
					<!-- <div class="message">
						期刊 
					</div>
				
					<div id="bottom">
						查看全部消息
					</div> -->
					
					 <div class="wait"></div>
				</div>
				<div id="information">
					<img src="img/profile/default.jpg" width="16px" height="16px" id="touXiang"/>
					<label id="account">这是昵称</label>
					
				</div>
				
				<div id="operate" style="display:none">
						
					<div id="cc">
						<a href="getMyHotel.action"><label class="myLabel" id="my"></label>我的落网</a>

						<a><label class="myLabel" id="setting"></label>账号设置</a>
						<a href="logout.action"><label class="myLabel" id="logout"></label>退出</a>
					

					</div>
				</div>
			</div>
			
			
			<div id="loginAngRegiste" class="searchAfter">
				<span id="longinAregiste">注册/登录</span>

				<div id="all" style="display: none;">
					<div id="tip"><canvas id="mycanvas" width="8px" height="8px"></canvas></div>

					<div class="loginOrResite" id="loginOrResite">
						<!--登录框-->
						<div id="login">
							<div id="loginTop">
								<label class="label1">登录</label>
								<label class="label2">没有账号？<a>注册</a></label>
							</div>

							<div id="loginMiddle">
								<form action="#" method="post" id="loginForm">

									<div id="Email">
										<label>邮箱</label>
										<input type="text" id="email" title="请填写此字段"/>
									</div>

									<div id="Password">
										<label>密码</label>
										<input type="password" id="password"  title="请填写此字段"/>
									</div>

									<div id="tijiao">
										<a id="Submit" class="Submit">登录</a>
									</div>

									<div id="option">

										<div id="AutoLogin">
											<input type="checkbox" name="autoLogin" id="autoLogin" />
										</div>
										<label>下次自动登录</label>
										<label id="getBackPasseord">找回密码</label>
									</div>
								</form>

							</div>

							<div id="otherLogin">
								<a href="#" id="QQ"></a>
								<a href="#" id="DOU"></a>
								<a href="#" id="WEIBO"></a>
							</div>
						</div>
						<!--注册框-->
						<div id="registe" style="display: none;">
							<div id="registeTop">
								<label class="label1">注册</label>
								<label class="label2">返回登录</label>
							</div>

							<div id="registeMiddle">
								<form action="submit.action" method="post" id="submitForm" target="after">

									<div id="AccountRegiste">
										<label class="label1">昵称</label>
										<input type="text" id="accountRegiste" maxlength="14"/>
										<label class="labelTishi accountRegiste">14位以内中英文数字</label>
									</div>

									<div id="EmailRegiste">
										<label class="label1">邮箱</label>
										<input type="text" id="emailRegiste" />
										<label class="labelTishi emailRegiste">您的常用邮箱</label>
									</div>

									<div id="PasswordRegiste">
										<label class="label1">密码</label>
										<input type="password" id="passwordRegiste" maxlength="16"/>
										<label class="labelTishi passwordRegiste">6-16个字符</label>
									</div>

									<div id="AuthRegiste">
										<label class="label1">验证码</label>
										<input type="text" id="authRegiste" />
										<img src="${pageContext.request.contextPath}/JSP/RandomCodeServlet" width="80px" height="100%" id="imageCode" alt="看不清?点击换一张" onclick="changeImg()"/>
									</div>

									<div id="protocal">

										<div id="agreePro">
											<input type="checkbox" name="agree" id="agree" checked="checked"/>
										</div>
										<label>同意网站的</label>
										<a>《使用协议》</a>
									</div>

									<div id="register">
										<a id="Registe" class="Registe">注册</a>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
					
					<%
					
					
				}else{
					%>
					<!-- 登录上之后出现的 -->
			<input type="hidden" id="hidden"/>
			<div id="loginAfter">
				<div id="message"></div>
				<div id="messageDetail" style="display:none">
					<!-- <div class="message">
						期刊 
					</div>
				
					<div id="bottom">
						查看全部消息
					</div> -->
					
					 <div class="wait"></div>
				</div>
				<div id="information">
					<img src="img/profile/<%=user.getProfileImg() %>" width="16px" height="16px" id="touXiang"/>
					<label id="account"><%=user.getNickname() %></label>
					
				</div>
				
				<div id="operate" style="display:none">
						
					<div id="cc">
						<a href="getMyHotel.action"><label class="myLabel" id="my"></label>我的落网</a>

						<a><label class="myLabel" id="setting"></label>账号设置</a>
						<a href="logout.action"><label class="myLabel" id="logout"></label>退出</a>
					

					</div>
				</div>
			</div>
			
			
			<div id="loginAngRegiste" class="searchAfter" style="display:none">
				<span id="longinAregiste">注册/登录</span>

				<div id="all" style="display: none;">
					<div id="tip"><canvas id="mycanvas" width="8px" height="8px"></canvas></div>

					<div class="loginOrResite" id="loginOrResite">
						<!--登录框-->
						<div id="login">
							<div id="loginTop">
								<label class="label1">登录</label>
								<label class="label2">没有账号？<a>注册</a></label>
							</div>

							<div id="loginMiddle">
								<form action="#" method="post" id="loginForm">

									<div id="Email">
										<label>邮箱</label>
										<input type="text" id="email" title="请填写此字段"/>
									</div>

									<div id="Password">
										<label>密码</label>
										<input type="password" id="password"  title="请填写此字段"/>
									</div>

									<div id="tijiao">
										<a id="Submit" class="Submit">登录</a>
									</div>

									<div id="option">

										<div id="AutoLogin">
											<input type="checkbox" name="autoLogin" id="autoLogin" />
										</div>
										<label>下次自动登录</label>
										<label id="getBackPasseord">找回密码</label>
									</div>
								</form>

							</div>

							<div id="otherLogin">
								<a href="#" id="QQ"></a>
								<a href="#" id="DOU"></a>
								<a href="#" id="WEIBO"></a>
							</div>
						</div>
						<!--注册框-->
						<div id="registe" style="display: none;">
							<div id="registeTop">
								<label class="label1">注册</label>
								<label class="label2">返回登录</label>
							</div>

							<div id="registeMiddle">
								<form action="submit.action" method="post" id="submitForm" target="after">

									<div id="AccountRegiste">
										<label class="label1">昵称</label>
										<input type="text" id="accountRegiste" maxlength="14"/>
										<label class="labelTishi accountRegiste">14位以内中英文数字</label>
									</div>

									<div id="EmailRegiste">
										<label class="label1">邮箱</label>
										<input type="text" id="emailRegiste" />
										<label class="labelTishi emailRegiste">您的常用邮箱</label>
									</div>

									<div id="PasswordRegiste">
										<label class="label1">密码</label>
										<input type="password" id="passwordRegiste" maxlength="16"/>
										<label class="labelTishi passwordRegiste">6-16个字符</label>
									</div>

									<div id="AuthRegiste">
										<label class="label1">验证码</label>
										<input type="text" id="authRegiste" />
										<img src="${pageContext.request.contextPath}/JSP/RandomCodeServlet" width="80px" height="100%" id="imageCode" alt="看不清?点击换一张" onclick="changeImg()"/>
									</div>

									<div id="protocal">

										<div id="agreePro">
											<input type="checkbox" name="agree" id="agree" checked="checked"/>
										</div>
										<label>同意网站的</label>
										<a>《使用协议》</a>
									</div>

									<div id="register">
										<a id="Registe" class="Registe">注册</a>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
					
					<%
					
				}
			%>
			
		</div>
		<script src="js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/top.js" type="text/javascript" charset="utf-8"></script>
	</body>

</html>
