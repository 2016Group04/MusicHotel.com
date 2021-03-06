<%@ page language="java" import="java.util.*,com.po.Article" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>落网专栏页</title>
		<link rel="stylesheet" href="../../html/css/top.css" />

		<style type="text/css">
			* {
				margin:0px;
				padding: 0px;
			}
			
			body {
			    font: 13px/22px Verdana,'微软雅黑','Microsoft YaHei',Helvetica,Arial;
			    color: #2d2d2d;
			}
			
			.container {
			    margin: 0 auto;
			    width: 960px;
			    
			}
			
			.essay-banner {
			    margin-bottom: 50px;
			   
			}
			
			.clearfix {
			    *zoom: 1;
			     overflow: hidden;
			}
			/*第一个div的***********************************/
			.essay-banner .cover {
			    float: left;
			    width: 480px;
			    height: 340px;
			    border-radius: 4px;
			    margin-right: 50px;
			}
			
			.img {
				border:0px;
			}
			
			.essay-banner .title {
			    font-size: 20px;
			    margin: 55px 0 35px;
			    display: block;
			}
			
			a {
			    text-decoration: none;
			    color: #2d2d2d;
			}
			
			.essay-banner .date {
				margin-top: 15px;
				color: #9f9f9f;
			}
			
			.essay-banner .more {
			    text-align: right;
			    margin-top: 35px;
			}
			
			.essay-banner .ln-more {
			    color: #dd5862;
			}
			
			/*之下两栏**********************/
			/*列表栏div***********************/
			
			.article {
			    float: left;
			    width: 590px;
			}
			
			.essay-list {
				margin-bottom: 45px;
				margin-top: -30px;
				overflow: hidden;
			}
			
			.essay-list .item {
			    *zoom: 1;
			    padding: 30px 0;
			    border-bottom: 1px solid #e5e5e5;
			    overflow: hidden;
			}
			
			.essay-list .cover-wrapper {
			    border-radius: 4px;
			    display: block;
			    float: left;
			    height: 156px;
			    margin-right: 20px;
			    overflow: hidden;
			    width: 220px;
			}
			
			.essay-list .essay-wrapper {
			    float: left;
			    width: 345px;
			}
			
			.essay-list .title {
			    display: block;
			    font-size: 18px;
			    margin: 6px 0 3px;
			}
			
			.essay-list .meta {
			    color: #7d7d7d;
			    margin-bottom: 15px;
			}
			
			.essay-list .meta a {
			    color: #7d7d7d;
			}
			
			.essay-list .cover {
			    display: block;
			    border-radius: 4px;
			    max-width: 220px;
			}
			
			.essay-list .separator {
			    margin: 0;
			}
			.separator {
			    color: #7d7d7d;
			    font-size: 14px;
			    font-weight: 700;
			}
			
			/*分页div***************************/
			.paginator {
			    text-align: center;
			}
			/*上一页*********************************/
			.paginator .previous {
			    background: url(img/icon-common.png) -70px -300px no-repeat;
			    color: #7d7d7d;
			    display: inline-block;
			    height: 25px;
			    line-height: 22px;
			    width: 64px;
			    text-indent: 4px;
			    margin-right: 3px;
			}
			
			.paginator .previous:hover {
				color:#FFF;
				background-position:-70px -330px
			}
			.paginator .previous:active {
				color:#FFF;
				background-position:-70px -330px
			}
			.paginator .previous.disabled:hover {
				background-position:-70px -300px
			}
			
			.paginator .page {
			    background-color: #f2f2f2;
			    color: #7d7d7d;
			    display: inline-block;
			    margin-right: 5px;
			    margin-left: 0px;
			    border-radius: 3px;/*圆角设置*/
			    height: 25px;
			    line-height: 25px;
			    min-width: 26px;
			}
			
			.paginator .page:hover {
				background-color:#dd5862;
				color:#FFF
			}
			
			/*上一页或下一页失效*********************/
			.paginator .disabled {
			    color: #D9D9D9;
			    cursor: default;
			}
			
			/*页码被选中时********************/
			.paginator .actived {
			    background-color: #dd5862;
			    color: #FFF;
			}
			
			/*未显示页码***************************/
			.paginator .break {
			    color: #7d7d7d;
			    margin-right: 4px;
			}
			/*下一页*****************************************/
			.paginator .next {
			    background: url(img/icon-common.png) -70px -360px no-repeat;
			    color: #7d7d7d;
			    display: inline-block;
			    height: 25px;
			    line-height: 25px;
			    width: 64px;
			    text-indent: -6px;
			}
			
			.paginator .next:hover {
				color:#FFF;
				background-position:-70px -390px
			}
			.paginator .next:active {
				color:#FFF;
				background-position:-70px -390px
			}
			.paginator .next.disabled:hover {
				background-position:-70px -360px
			}
			
			/*侧边推荐栏**********************************************/
			
			.aside {
			    float: right;
			    width: 290px;
			    overflow-x: hidden;
			}
			
			.kazhu {
				top:0px;
				position: fixed; 
				width: 290px; 
				padding-left: 670px;
			}
			/*页面卡住******************************/
			.recommend {
				position: static;
				width: 290px;
				height: 398px;
				display: block;
				vertical-align: baseline;
				float: right;
			}
			
			.stuck {
			    position: fixed;
			    width: 290px;
			    top: -19px;
			}
			
			
			.widget {
			    margin-bottom: 25px;
			}
			
			.widget-head {
			    padding-bottom: 17px;
			    line-height: 1;
			}
			
			.widget-head .title {
			    font-size: 14px;
			}
			
			.pic-widget .item {
			    *zoom: 1;
			    margin-bottom: 25px;
			}
			
			.pic-widget .cover-wrapper {
			    display: block;
			    float: left;
			    overflow: hidden;
			    margin-right: 13px;
			}
			
			.pic-widget .essay-cover {
			    display: block;
			    height: auto;
			    width: 46px;
			    height: 32px;
			    border-radius: 3px;
			}
			
			.pic-widget .info {
			    line-height: 1;
			}
			
			.pic-widget .title {
			    margin: 1px 0 4px;
			    display: block;
			    max-width: 240px;
			    overflow: hidden;
			    text-overflow: ellipsis;
			    white-space: nowrap;
			}
			
			.pic-widget .description {
			    color: #7d7d7d;
			    font-size: 12px;
			}
			
			.pic-widget .separator {
			    margin: 0 1px;
			}
			
			.pic-widget .description a {
			    color: #7d7d7d;
			}
			
			.ln-widget-block {
			    color: #7d7d7d;
			    background: #F8F8F8;
			    display: block;
			    font-size: 14px;
			    height: 57px;
			    line-height: 57px;
			    text-align: center;
			    margin-top: 23px;
			    border-radius: 4px;
			}
			
		</style>
		
		
	</head>
	<body>
		
		<!-- 顶部开始 -->
		
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
					<img src="../img/autho.png" width="16px" height="16px" id="touXiang"/>
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
		</div>
		
		<!-- 顶部结束 -->
		
		<div class="container" style="min-height: 248px;">
			<div class="essay-banner clearfix">
				<img class="cover" src="../img/div1-img.jpg" alt="香蕉鱼和一支乐队"/>
				<div class="meta">
					<a class="title" href="#">香蕉鱼和一支乐队</a>
					<p class="content">如果心中净土破灭童真死去，存在还有何意义？他们说，唱给我听！</p>
					<p class="date">2016-9-16</p>
					<p class="more">
						<a href="#" class="ln-more">全文</a>
					</p>
				</div>
			</div>
			<div class="clearfix" style="position: relative;">
				<div class="article">
					<div class="essay-list">
						<div class="item">
							<a class="cover-wrapper" href="">
								<img class="cover rounded" src="../img/essay-list1.jpg" alt="是怦然心动？还是刻骨铭心？">
							</a>
							<div class="essay-wrapper">
								<a href="#" class="title" title="是怦然心动？还是刻骨铭心？">是怦然心动？还是刻骨铭心？</a>
								<div class="meta">
									<span class="category">言之</span>
									<span class="separator">・</span>
									<a class="entry-author" href="#">弹弹我的理想</a>
									<span class="separator">・</span>
									<span class="time">2016-09-17</span>
								</div>
								<div class="subscribe">
										她知道这样的“黄昏恋”像旧唱片，摆在角落里就好，任凭它被灰尘重重掩埋。只是偶尔拿出来怀念一番，再醉一场。如果还能碰到怦然心动的人，不至于因为莽撞而失了真爱。
								</div>
							</div>
						</div>
						
						<div class="item">
							<a class="cover-wrapper" href="">
								<img class="cover rounded" src="../img/essay-list1.jpg" alt="是怦然心动？还是刻骨铭心？">
							</a>
							<div class="essay-wrapper">
								<a href="#" class="title" title="是怦然心动？还是刻骨铭心？">是怦然心动？还是刻骨铭心？</a>
								<div class="meta">
									<span class="category">言之</span>
									<span class="separator">・</span>
									<a class="entry-author" href="#">弹弹我的理想</a>
									<span class="separator">・</span>
									<span class="time">2016-09-17</span>
								</div>
								<div class="subscribe">
										她知道这样的“黄昏恋”像旧唱片，摆在角落里就好，任凭它被灰尘重重掩埋。只是偶尔拿出来怀念一番，再醉一场。如果还能碰到怦然心动的人，不至于因为莽撞而失了真爱。
								</div>
							</div>
						</div>
						
						<div class="item">
							<a class="cover-wrapper" href="">
								<img class="cover rounded" src="../img/essay-list1.jpg" alt="是怦然心动？还是刻骨铭心？">
							</a>
							<div class="essay-wrapper">
								<a href="#" class="title" title="是怦然心动？还是刻骨铭心？">是怦然心动？还是刻骨铭心？</a>
								<div class="meta">
									<span class="category">言之</span>
									<span class="separator">・</span>
									<a class="entry-author" href="#">弹弹我的理想</a>
									<span class="separator">・</span>
									<span class="time">2016-09-17</span>
								</div>
								<div class="subscribe">
										她知道这样的“黄昏恋”像旧唱片，摆在角落里就好，任凭它被灰尘重重掩埋。只是偶尔拿出来怀念一番，再醉一场。如果还能碰到怦然心动的人，不至于因为莽撞而失了真爱。
								</div>
							</div>
						</div>
						
						<div class="item">
							<a class="cover-wrapper" href="">
								<img class="cover rounded" src="../img/essay-list1.jpg" alt="是怦然心动？还是刻骨铭心？">
							</a>
							<div class="essay-wrapper">
								<a href="#" class="title" title="是怦然心动？还是刻骨铭心？">是怦然心动？还是刻骨铭心？</a>
								<div class="meta">
									<span class="category">言之</span>
									<span class="separator">・</span>
									<a class="entry-author" href="#">弹弹我的理想</a>
									<span class="separator">・</span>
									<span class="time">2016-09-17</span>
								</div>
								<div class="subscribe">
										她知道这样的“黄昏恋”像旧唱片，摆在角落里就好，任凭它被灰尘重重掩埋。只是偶尔拿出来怀念一番，再醉一场。如果还能碰到怦然心动的人，不至于因为莽撞而失了真爱。
								</div>
							</div>
						</div>
						
					</div>
					<div class="paginator">
						<a class="previous disabled" rel="nofollow" href="javascript:;">上一页</a>
						<a class="page actived" rel="nofollow" href="javascript:;">1</a>
						<a class="page" href="http://www.luoo.net/essay/index/p/2">2</a>
						<a class="page" href="http://www.luoo.net/essay/index/p/3">3</a>
						<a class="page" href="http://www.luoo.net/essay/index/p/4">4</a>
						<a class="page" href="http://www.luoo.net/essay/index/p/5">5</a>
						<a class="page" href="http://www.luoo.net/essay/index/p/6">6</a>
						<a class="page" href="http://www.luoo.net/essay/index/p/7">7</a>
						<a class="page" href="http://www.luoo.net/essay/index/p/8">8</a>
						<a class="page" href="http://www.luoo.net/essay/index/p/9">9</a>
						<a class="page" href="http://www.luoo.net/essay/index/p/10">10</a>
						<span class="break">...</span>
						<a class="page" href="http://www.luoo.net/essay/index/p/56">56</a>
						<a class="next" href="http://www.luoo.net/essay/index/p/2">下一页</a>
					</div>
				</div>
				<div class="aside"><!--recommend-->
					<!--卡住是这里会加上一个div  aside stuck-->	
					<div class="widget"> 
						<div class="widget-head">
							<span class="title">推荐文章</span>
						</div>
						<div class="widget-ct pic-widget">
							<div class="item">
								<a href="#" title="每一个梦都是奇妙的旅程" class="cover-wrapper">
									<img src="../img/aside-img1.png" alt="每一个梦都是奇妙的旅程" class="essay-cover rounded">
								</a>
								<div class="info">
									<a href="#" title="每一个梦都是奇妙的旅程" class="title">每一个梦都是奇妙的旅程</a>
									<p class="description">
										<span>言之</span>
										<span class="separator">・</span>
										<a href="#">荭粉茚畫</a>
									</p>
								</div>
							</div>
							
							<div class="item">
								<a href="#" title="每一个梦都是奇妙的旅程" class="cover-wrapper">
									<img src="../img/aside-img1.png" alt="每一个梦都是奇妙的旅程" class="essay-cover rounded">
								</a>
								<div class="info">
									<a href="#" title="每一个梦都是奇妙的旅程" class="title">每一个梦都是奇妙的旅程</a>
									<p class="description">
										<span>言之</span>
										<span class="separator">・</span>
										<a href="#">荭粉茚畫</a>
									</p>
								</div>
							</div>
							
							<div class="item">
								<a href="#" title="每一个梦都是奇妙的旅程" class="cover-wrapper">
									<img src="../img/aside-img1.png" alt="每一个梦都是奇妙的旅程" class="essay-cover rounded">
								</a>
								<div class="info">
									<a href="#" title="每一个梦都是奇妙的旅程" class="title">每一个梦都是奇妙的旅程</a>
									<p class="description">
										<span>言之</span>
										<span class="separator">・</span>
										<a href="#">荭粉茚畫</a>
									</p>
								</div>
							</div>
							
							<div class="item">
								<a href="#" title="每一个梦都是奇妙的旅程" class="cover-wrapper">
									<img src="../img/aside-img1.png" alt="每一个梦都是奇妙的旅程" class="essay-cover rounded">
								</a>
								<div class="info">
									<a href="#" title="每一个梦都是奇妙的旅程" class="title">每一个梦都是奇妙的旅程</a>
									<p class="description">
										<span>言之</span>
										<span class="separator">・</span>
										<a href="#">荭粉茚畫</a>
									</p>
								</div>
							</div>
							
							<div class="item">
								<a href="#" title="每一个梦都是奇妙的旅程" class="cover-wrapper">
									<img src="../img/aside-img1.png" alt="每一个梦都是奇妙的旅程" class="essay-cover rounded">
								</a>
								<div class="info">
									<a href="#" title="每一个梦都是奇妙的旅程" class="title">每一个梦都是奇妙的旅程</a>
									<p class="description">
										<span>言之</span>
										<span class="separator">・</span>
										<a href="#">荭粉茚畫</a>
									</p>
								</div>
							</div>
							
							<div class="item">
								<a href="#" title="每一个梦都是奇妙的旅程" class="cover-wrapper">
									<img src="../img/aside-img1.png" alt="每一个梦都是奇妙的旅程" class="essay-cover rounded">
								</a>
								<div class="info">
									<a href="#" title="每一个梦都是奇妙的旅程" class="title">每一个梦都是奇妙的旅程</a>
									<p class="description">
										<span>言之</span>
										<span class="separator">・</span>
										<a href="#">荭粉茚畫</a>
									</p>
								</div>
							</div>
							
						</div>
					</div>
					<div class="widget">
						<div class="widget-ct">
							<a href="#" class="ln-widget-block rounded">
								投稿推荐
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="../js/jquery-3.1.0.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="../js/top.js" ></script>
		
		<script type="text/javascript">
			$(function(){
				$('.title').mouseover(function(){
					$(this).css({
						'color':'#dd5862'
					})
				});
				$('.title').mouseout(function(){
					$(this).css({
						'color':'#2d2d2d'
					})
				});
			});
			$(function(){
				var aside = $('.aside'),
				pos = aside.offset();
				
				$(window).scroll(function(){
					if ($(this).scrollTop() > 340 && aside.hasClass('aside')) {
						aside.removeClass('aside').addClass('kazhu')
					} else if ($(this).scrollTop() <= 340 && aside.hasClass('kazhu')){
						aside.removeClass('kazhu').addClass('aside')
					}
				});
			})
			
		</script>
	</body>
</html>
