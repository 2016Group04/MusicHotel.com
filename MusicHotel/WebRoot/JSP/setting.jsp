<%@ page language="java" import="java.util.*,com.po.User" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>我的账号设置</title>
		
		<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
		
		<link rel="stylesheet" href="css/top.css" />
		<style type="text/css">
			* {
				margin: 0;
				padding: 0;
			}
			
			body {
    font: 14px/22px Verdana,'微软雅黑','Microsoft YaHei',Helvetica,Arial;
    color: #2d2d2d;
}
			
			h1,
			h2,
			h3,
			h4 {
				font: 400 13px/1.5 Verdana, 微软雅黑, "Microsoft YaHei", Helvetica, Arial;
			}
			
			a {
				text-decoration: none;
				font-family: "Microsoft JhengHei";
				color: #2d2d2d;
			}
			
			.btn {
    border: 0;
    border-radius: 4px;
    cursor: pointer;
    display: inline-block;
    padding: 5px 10px;
}

.btn-positive {
    background: #dd5862;
    color: #FFF;
}

.btn-negative {
    background: #bdbdbd;
    color: #FFF;
}
			
			.clearfix:before,
			.clearfix:after {
				clear: both;
				display: table;
				content: "";
				line-height: 0;
			}
			
			.container {
				margin: 0 auto;
				width: 960px;
			}
			
			.setting {
				width: 620px;
			}
			
			.header .profile-title {
				font-size: 30px;
				margin-bottom: 40px;
			}
			
			.setting .nav {
				background-color: #f2f2f2;
				border-radius: 4px;
				padding: 10px 25px;
				margin-bottom: 10px;
			}
			
			.nav .nav-item {
				color: #7d7d7d;
				float: left;
				margin-right: 15px;
			}
			
			.nav .nav-item.actived {
				color: #dd5862;
			}
			
			.setting-row {
				margin: 20px 0;
				padding: 0 25px;
			}
			
			.setting-row:before,
			.setting-row:after {
				clear: both;
				display: table;
				content: "";
				line-height: 0;
			}
			
			.ln-setting-edit {
				color: #7d7d7d;
				margin-left: 5px;
			}
			
			.setting-email {
    float: left;
    width: 310px;
}

.helper {
    color: #7d7d7d;
}

.setting-row label {
    margin-right: 17px;
}

label input[type=radio], label input[type=checkbox] {
    display: inline-block;
    vertical-align: middle;
}

.container input[type=text], 
.container input[type=password], 
.container input[type=url], 
.container input[type=email] {
    border: 1px solid #e5e5e5;
    border-radius: 4px;
    height: 19px;
    line-height: 19px;
    padding: 3px 9px;
}

.setting-bottom {
    margin: 40px 0;
}

.setting-row .btn {
    margin-right: 8px;
}

.setting-row .valid-msg {
    margin-left: 15px;
    color: #dd5862;
    display: none;
}

.setting-sns-row {
    padding-left: 25px;
    border-bottom: 1px solid #e5e5e5;
    height: 29px;
    line-height: 31px;
    margin-top: 10px;
    padding-bottom: 10px;
}

.icon-uc-qq {
    display: inline-block;
    line-height: 1;
    vertical-align: middle;
    background-image: url(img/icon-misc.png);
    background-position: top left;
    background-repeat: no-repeat;
    height: 16px;
    width: 16px;
    background-position: 0 -100px;
}



.icon-share-weibo {
    display: inline-block;
    width: 20px;
    height: 20px;
    line-height: 1;
    vertical-align: middle;
    background-image: url(img/icon-common.png);
    background-position: top left;
    background-repeat: no-repeat;
    height: 16px;
    background-position: 0 -480px;
}

.icon-share-douban {
    display: inline-block;
    width: 20px;
    height: 20px;
    line-height: 1;
    vertical-align: middle;
    background-image: url(img/icon-common.png);
    background-position: top left;
    background-repeat: no-repeat;
    height: 16px;
    background-position: 0 -540px;
}

.icon-tweibo {
    display: inline-block;
    line-height: 1;
    vertical-align: middle;
    background-image: url(img/icon-player.png);
    background-position: top left;
    background-repeat: no-repeat;
    height: 12px;
    width: 12px;
    background-position: -50px 0;
    height: 16px;
    width: 14px;
}

.setting-sns-row i {
    float: left;
    font-size: 18px;
    margin: 9px 20px 0 0;
}

.setting-sns-row .ln-bind {
    float: left;
}

		</style>
	</head>

	<body>
		
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
			<div id="loginAfter"  style="display:none">
				<div id="message"></div>
				<div id="messageDetail" style="display:none">
					<div class="message">
						这是一个系统消息
					</div>
					<div class="message">
						这是一个系统消息
					</div>
					<div class="message">
						这是一个系统消息
					</div>
					<div id="bottom">
						查看全部消息
					</div>
				</div>
				<div id="information">
					<img src="img/autho.png" width="16px" height="16px" id="touXiang"/>
					<label id="account">这是昵称</label>
					
				</div>
				
				<div id="operate" style="display:none">
						
					<div id="cc">
						<a><label class="myLabel" id="my"></label>我的落网</a>
						<a><label class="myLabel" id="setting"></label>账号设置</a>
						<a><label class="myLabel" id="logout"></label>退出</a>
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
								<form action="#" method="post">

									<div id="Email">
										<label>邮箱</label>
										<input type="text" id="email" />
									</div>

									<div id="Password">
										<label>密码</label>
										<input type="password" id="password" />
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
								<form action="#" method="post">

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
		</div>
		
		<div class="container setting">
			<div class="header clearfix">
				<h1 class="profile-title">账号设置</h1>
			</div>
			<div class="nav clearfix">
				<a href="#basic" rel="nofollow" id="tab-basic" class="nav-item">基础设置</a>
				<a href="#pwd" rel="nofollow" id="tab-pwd" class="nav-item">修改密码</a>
				<a href="#sns" rel="nofollow" id="tab-sns" class="nav-item">社区绑定</a>
			</div>

			<div class="uc-ct">
				<!-- setting-base -->
				
				<%
					User user = (User)request.getAttribute("user");
				%>
				
				<div class="setting-base tab-content-item" style="display: block;">
					<p class="setting-row nickname">
						<%=user.getNickname() %>
						<a href="javascript:;" class="ln-setting-edit" id="lnEditUsername" rel="nofollow">更改</a>
					</p>
					<div class="setting-row" style="border-bottom: 1px solid #E5E5E5; padding-bottom: 25px;">
						<div class="setting-email">
							<span class="helper">
							登录邮箱
						</span>
							<br>
							<p>
								<%=user.getEmail() %>
								<a href="javascript:;" class="ln-setting-edit" id="lnEditEmail" rel="nofollow">更改</a>
							</p>
						</div>
						<div class="setting-autoplay">
							<span class="helper">
							播放设置
						</span>
							<br>
							<label>
							<input type="checkbox" name="autoplay" id="chkAutoplay" checked="">自动播放网站音乐
						</label>
						</div>
					</div>
					<div class="setting-row helper"> 资料 </div>
					<form method="post" class="form-ajax" callback="profile_common_cback">

						<div class="setting-row">
							<span class="label">性别</span>
							<label>
							<input type="radio" name="sex" value="1" class="input-listener"> 男
						</label>
							<label>
							<input type="radio" name="sex" value="2" class="input-listener"> 女
						</label>
						</div>
						<div class="setting-row" style="position: relative;">
							<span class="label">生日</span>
							<span id="birthdayPlaceholder">生日日期</span>
							<a href="javascript:;" class="ln-setting-edit input-listener" rel="nofollow" id="lnEditBrithday">更改</a>
							<input type="text" id="txtBirthday" name="birthday" style="width: 185px; visibility: hidden; position: absolute; top: -26px; margin-left: 5px;">
						</div>
						<div class="setting-row">
							<span class="label">常居</span>
							<span id="areaSelector">
							<select class="province input-listener" name="province" data-val="山东">
								<option value="0">请选择</option>
								<option value="北京">北京</option>
							</select> 
							<select class="city input-listener" name="city" data-val="济南" style="">
								<option value="0">请选择</option>
								<option value="济南">济南</option>
							</select>
						</span>
						</div>
						<div class="setting-row">
							<span class="label">职业</span>
							<input type="text" name="vocation" style="width: 52px;" class="rounded input-listener" value="职业职业职业">
						</div>
						<div class="setting-row setting-bottom">
							<input type="submit" value="保存" class="btn rounded btn-positive btn-not-ready" id="btnBasicSubmit">
							<input type="button" value="取消" class="btn rounded btn-negative btn-reload">
						</div>
					</form>
				</div>
				<!-- setting-base end-->

				<!-- setting-pwd -->
				<div class="setting-pwd tab-content-item" style="display: none;">
					<form action="http://www.luoo.net/user/password" method="post" class="form-ajax" callback="pwd_cback" prepare="pwd_valid">
						<div class="setting-row">
							<span class="label">当前密码</span>
							<input type="password" name="password" class="rounded" id="txtPassword" autocomplete="off">
							<span class="valid-msg"></span>
						</div>
						<div class="setting-row">
							<span class="label">新的密码</span>
							<input type="password" name="newpassword" class="rounded" id="txtNewpassword" autocomplete="off">
							<span class="valid-msg"></span>
						</div>
						<div class="setting-row">
							<span class="label">确认密码</span>
							<input type="password" name="cmfpassword" class="rounded" id="txtCmfpassword" autocomplete="off">
							<span class="valid-msg"></span>
						</div>
						<div class="setting-row setting-bottom">
							<input type="submit" value="保存" class="btn btn-positive rounded">
							<input type="button" value="取消" class="btn btn-negative rounded btn-reload">
						</div>
					</form>
				</div>
				<!-- setting-pwd end-->

				<!-- setting-sns -->
				<div class="setting-sns tab-content-item" style="display: none;">
					<div class="setting-row">
						绑定社区账号，能够将你的评论同步到以下平台。
					</div>

					<div class="setting-sns-row">
						<i class="icon-uc-qq"></i>
						<a href="http://www.luoo.net/login/oauth/site/qq/act/bind" class="ln-bind">绑定QQ账号</a>
					</div>

					<div class="setting-sns-row">
						<i class="icon-share-weibo"></i>
						<a href="http://www.luoo.net/login/oauth/site/weibo/act/bind" class="ln-bind" rel="nofollow">绑定微博账号</a>
					</div>

					<div class="setting-sns-row">
						<i class="icon-share-douban"></i>
						<a href="http://www.luoo.net/login/oauth/site/douban/act/bind" class="ln-bind" rel="nofollow">绑定豆瓣账号</a>
					</div>

					<div class="setting-sns-row">
						<i class="icon-tweibo"></i>
						<a href="http://www.luoo.net/login/oauth/site/tweibo/act/bind" class="ln-bind" rel="nofollow">绑定腾讯微博</a>
					</div>
				</div>
				<!-- setting-sns end-->

			</div>
		</div>
		
		<script type="text/javascript" src="js/jquery-1.7.2.js" ></script>
		<script type="text/javascript">
			$(function() {

				/*搜索框添加事件*/
				var $search = $("#search");
				$search.click(function() {

					$search.removeClass("searchBlur").addClass("searchFocus");
					$("#searchEverything").show().animate({
						"width": "115px"
					}, "fast");
					$search.animate({
						"width": "145px"
					}, "fast");
					$("#searchEverything").focus();
				});

				$("#searchEverything").blur(function() {

					$search.removeClass("searchFocus").addClass("searchBlur");
					$("#searchEverything").hide();
					$search.animate({
						"width": "105px"
					}, "fast");
				});

				/*画出小角角*/
				var c = document.getElementById("mycanvas");
				var ctx = c.getContext("2d");
				ctx.beginPath();
				var height = 16 * Math.sin(Math.PI / 3); //计算等边三角形的高
				ctx.moveTo(5, 0); //从A（100,0）开始
				ctx.lineTo(16, height); //从A(100,0)开始，画到B (0,173)结束
				ctx.lineTo(0, height); //B(0,173)-C(200,173)
				ctx.strokeStyle = '#E5E5E5';
				ctx.fillStyle = 'white'; //以纯色绿色填充
				ctx.fill(); //闭合形状并且以填充方式绘制出来

				//点击注册
				$("#loginTop .label2 a").click(function() {

					$("#login").hide();
					$("#registe").show();
					$("#Submit").text("登录");
					$("#Submit").removeClass("null").addClass("Submit");
				});

				//点击返回登录
				$("#registeTop .label2").click(function() {

					$("#registe").hide();
					$("#login").show();
					$("#Registe").text("注册");
					$("#Registe").removeClass("null").addClass("Registe");
				});

				//鼠标悬停显示登录注册框
				$("#longinAregiste").mouseover(function() {

					$("#registe").hide();
					$("#login").show();
					$("#all").show();
				});
				
				//鼠标悬停消息列表
				$("#message").mouseover(function() {
					$("#operate").hide();
					$("#messageDetail").show();
				});
				
				//鼠标悬停显示我的信息
				$("#information").mouseover(function() {
					$("#messageDetail").hide();
					$("#operate").show();
				});

				//除登录注册框外点击其余任何地方登录注册框都消失
				$(document).bind("click", function(e) {
					var target = $(e.target);
					if(target.closest("#all").length == 0) {
						$("#all").hide();
					}
				});
				//除消息列表之外的任何地方都隐藏
				$(document).bind("click", function(e) {
					var target = $(e.target);
					if(target.closest("#messageDetail").length == 0) {
						$("#messageDetail").hide();
					}
				});
				
				$(document).bind("click", function(e) {
					var target = $(e.target);
					if(target.closest("#operate").length == 0) {
						$("#operate").hide();
					}
				});
				
				//登录框的验证
				$("#Submit").click(function  () {
					
					var email = $("#email").val();
					var passwordV = $("#password").val();
					
					if(email.trim()==""&&passwordV.trim()==""){
						
						$("#Submit").text("邮箱或密码不能为空");
						$("#Submit").removeClass("Submit").addClass("null");
					}else if(email.trim()==""){
						
						$("#Submit").text("邮箱不能为空");
						$("#Submit").removeClass("Submit").addClass("null");
					}else if(passwordV.trim()==""){
						$("#Submit").text("密码不能为空");
						$("#Submit").removeClass("Submit").addClass("null");
					}else{
						
						
						
						if(checkEmail(email)){
							
							//发送ajax  验证是否是正确的用户名和密码
						}else{
							
							$("#Submit").text("请输入正确的邮箱");
							$("#Submit").removeClass("Submit").addClass("null");
						}
						
					
					}
				});
				
				//邮箱密码框聚焦的时候，登录按钮变回来
				$("#loginMiddle input[type=text]").focus(function  () {
					
					if($("#Submit").hasClass("null")){
						
						$("#Submit").text("登录");
						$("#Submit").removeClass("null").addClass("Submit");
					}
				});
				//密码框聚焦的时候，登录按钮变回来
				$("#loginMiddle input[type=password]").focus(function  () {
					
					if($("#Submit").hasClass("null")){
						
						$("#Submit").text("登录");
						$("#Submit").removeClass("null").addClass("Submit");
					}
				});
				
				//注册框的验证
				$("label.labelTishi").click(function  () {
					
					$(this).prev("input").focus();
					
				});
				//任何一个错误发生都要换一个验证码
				$("#Registe").click(function  () {
					
					var accountR = $("#accountRegiste").val();
					var emailR = $("#emailRegiste").val();
					var passwordR = $("#passwordRegiste").val();
					var authR = $("#authRegiste").val();
					
					if(accountR.trim()==""&&emailR.trim()==""&&passwordR.trim()==""&&authR.trim()==""){
						
						$("#Registe").text("请完善未填项目");
						$("#Registe").removeClass("Registe").addClass("null");
						changeImg();
					}else if(accountR.trim()==""){
						
						$("#Registe").text("请输入昵称");
						$("#Registe").removeClass("Registe").addClass("null");
						changeImg();
					}else if(emailR.trim()==""){
						
						$("#Registe").text("请输入邮箱");
						$("#Registe").removeClass("Registe").addClass("null");
						changeImg();
					}else if(passwordR.trim()==""){
						
						$("#Registe").text("请输入密码");
						$("#Registe").removeClass("Registe").addClass("null");
						changeImg();
					}else if(authR.trim()==""){
						
						$("#Registe").text("请输入验证码");
						$("#Registe").removeClass("Registe").addClass("null");
						changeImg();
					}else if(!checkName(accountR)){
						$("#Registe").text("昵称为中英文数字的组合");
						$("#Registe").removeClass("Registe").addClass("null");
						changeImg();
					}else if(!checkEmail(emailR)){
						$("#Registe").text("请输入正确的邮箱");
						$("#Registe").removeClass("Registe").addClass("null");
						changeImg();
					}else if(passwordR.length<6||passwordR>16){
						$("#Registe").text("请输入6-16位密码");
						$("#Registe").removeClass("Registe").addClass("null");
						changeImg();
					}else if(checkAuth(authR)=="错误"){//进行验证码的比较，是不是相等
						$("#Registe").text("验证码错误");
						$("#Registe").removeClass("Registe").addClass("null");
						changeImg();
						//换一个验证码
					}else if(!$("#agree").is(":checked")){
						$("#Registe").text("请同意该网站的协议");
						$("#Registe").removeClass("Registe").addClass("null");
						changeImg();
					}else{
						
						//发送ajax  验证该昵称是否已被注册
					}
				});
				
				//点击图片换一个验证码
				/* $("#changeImageCode").click(function(){
					
					$("#changeImageCode").src = "${pageContext.request.contextPath}/JSP/RandomCodeServlet";
					
				});
				 */
				//邮箱昵称、验证码框聚焦的时候，注册按钮变回来
				$("#registeMiddle input[type=text]").focus(function  () {
					
					if($("#Registe").hasClass("null")){
						
						$("#Registe").text("注册");
						$("#Registe").removeClass("null").addClass("Registe");
					}
					
				}).keyup(function  () {
					
					if($(this).val()==""){
						
						$(this).next("label").show();
					}else{
						
						$(this).next("label").hide();
					}
				});
				//密码框聚焦的时候，注册按钮变回来
				$("#registeMiddle input[type=password]").focus(function  () {
					
					if($("#Registe").hasClass("null")){
						
						$("#Registe").text("注册");
						$("#Registe").removeClass("null").addClass("Registe");
					}
					
				}).keyup(function  () {
					
					if($(this).val()==""){
						
						$(this).next("label").show();
					}else{
						
						$(this).next("label").hide();
					}
				});
			});
			//检查邮箱
			function checkEmail (email) {
				
				
				var regEXP = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
				
				return regEXP.test(email);
			}
			//检查昵称
			function checkName (accountR) {
				
				var regEXP = /^[A-Za-z0-9]+$/;
				return regEXP.test(accountR);
			}
			//点击换一换验证码
			function changeImg(){
		         document.getElementById("imageCode").src = document.getElementById("imageCode").src + "?";
		    }
		    
		    //
		    function checkAuth(authR){
		    	
		    	$.post("CheckAuth",{
		    		"action":"checkAuth",
		    		"auth":(""+authR)
		    	},function(data,status){
		    		alert(data);
		    		return data;
		    	},"text");
		    };
		</script>
		<script type="text/javascript">
			$(function () {
				
				$(".tab-content-item").css("display","none");
				$(".nav-item").removeClass("actived");
				var tab = location.hash;
				if (tab=="#basic") {
					$($(".nav-item")[0]).addClass("actived");
					$($(".tab-content-item")[0]).css("display","block");
				} else if(tab=="#pwd"){
					$($(".nav-item")[1]).addClass("actived");
					$($(".tab-content-item")[1]).css("display","block");
				}else if(tab=="#sns"){
					$($(".nav-item")[2]).addClass("actived");
					$($(".tab-content-item")[2]).css("display","block");
				}
				
				//点击切换tab-item
				$(".nav-item").click(function () {
					$(".nav-item").removeClass("actived");
					$(this).addClass("actived");
					$(".tab-content-item").hide(100);
					$($(".tab-content-item")[$(this).index()]).show(100);
				});
			});
		</script>
	</body>

</html>