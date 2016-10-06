<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
		
		<title>是怦然心动还是刻骨铭心？</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	
	
		<link rel="stylesheet" type="text/css" href="css/kaitoujiewei.css" />
		<link rel="stylesheet" href="css/stylesheets/style.css">
		<link rel="stylesheet" type="text/css" href="css/top.css"/>
		<style type="text/css">

			* {
				margin: 0px;
				padding: 0px;
			}
			
			body {
				font: 13px/i22px Verdana, '微软雅黑', 'Microsoft YaHei', Helvetica, Arial;
				color: #2d2d2d;
			}
			
			.clearfix {
			    *zoom: 1;
			    overflow: hidden;
			}
			
			a {
				text-decoration: none;
				color: #2d2d2d;
			}
			
			.container {
				margin: 0 auto;
				width: 960px;
				min-height: 248px;
				
			}
			
			.ct-sm {
				width: 620px;
			}
			
			.article-nav .nav-back {
				color: #7d7d7d;
			}
			
			.icon-back {
				display: inline-block;
				width: 20px;
				height: 20px;
				line-height: 1;
				vertical-align: middle;
				background-image: url(img/icon-common.png);
				background-position: top left;
				background-repeat: no-repeat;
				height: 12px;
				width: 8px;
				background-position: -110px -420px;
			}
			
			.essay-detail-wrapper {
				overflow-x: hidden;
			}
			/*标题*******************************************/
			.essay-detail-wrapper .essay-title {
				font-size: 24px;
				margin-top: 40px;
			}
			
			h1,h2,h3,h4 {
				font: 13px/1.5 Verdana, '微软雅黑', 'Microsoft YaHei', Helvetica, Arial;
				font-weight: 400;
			}
			
			.essay-detail-wrapper .essay-meta {
				color: #7d7d7d;
				font-size: 12px;
				margin: 4px 0 30px;
			}
			/*音乐口播放*********************************************/
			.essay-detail-wrapper .essay-music {
				border-bottom: 1px solid #e5e5e5;
				margin-bottom: 40px;
				overflow: hidden;
			}
			
			ul {
				list-style: none;
			}
			
			.track-wrapper {
			    border-radius: 4px;
			    padding: 7px 0 7px 20px;
			}
			
			.track-wrapper .btn-control {
			    color: #dd5862;
			    float: left;
			    width: 15px;
			    margin-left: -17px;
			    margin-top: -2px;
			    cursor: pointer;
			}
			/*播放*/
			.icon-status-play {
			    display: inline-block;
			    line-height: 1;
			    vertical-align: middle;
			    background-image: url(img/icon-player.png);
			    background-position: top left;
			    background-repeat: no-repeat;
			    height: 12px;
			    width: 12px;
			    background-position: 0 -120px;
			}
			/*停止*/
			.icon-status-pause {
			    display: inline-block;
			    line-height: 1;
			    vertical-align: middle;
			    background-image: url(img/icon-player.png);
			    background-position: top left;
			    background-repeat: no-repeat;
			    height: 12px;
			    width: 12px;
			    background-position: 0 -140px;
			}
			
			.track-wrapper .trackname {
			    color: #a40101;
			    float: left;
			    margin-right: 10px;
			    max-width: 270px;
			    overflow: hidden;
			    text-overflow: ellipsis;
			    white-space: nowrap;
			    height: 22px;
			}
			
			.track-wrapper .artist {
			    color: #7d7d7d;
			    float: left;
			    max-width: 140px;
			    overflow: hidden;
			    text-overflow: ellipsis;
			    white-space: nowrap;
			    height: 22px;
			    cursor: pointer;
			}
			
			.track-wrapper .icon-info {
			    visibility: hidden;
			    float: right;
			    margin: 6px 6px 0 12px;
			}
			.icon-info {
			    display: inline-block;
			    line-height: 1;
			    vertical-align: middle;
			    background-image: url(img/icon-player.png);
			    background-position: top left;
			    background-repeat: no-repeat;
			    height: 12px;
			    width: 12px;
			    background-position: 0 -20px;
			}
			
			.track-wrapper .icon-share, .track-wrapper .icon-fav, .track-wrapper .icon-trash {
			    visibility: hidden;
			    float: right;
			    margin: 6px 0 0 12px;
			}
			.icon-share {
			    display: inline-block;
			    line-height: 1;
			    vertical-align: middle;
			    background-image: url(img/icon-player.png);
			    background-position: top left;
			    background-repeat: no-repeat;
			    height: 12px;
			    width: 12px;
			    background-position: 0 0;
			}
			
			.icon-fav {
			    display: inline-block;
			    line-height: 1;
			    vertical-align: middle;
			    background-image: url(img/icon-player.png);
			    background-position: top left;
			    background-repeat: no-repeat;
			    height: 12px;
			    width: 12px;
			    background-position: 0 -60px;
			}
			
			.track-wrapper .duration {
			    color: #7d7d7d;
			    display: none;
			    float: right;
			    font-size: 11px;
			}
			
			/*文章内容**********************************************/
			.essay-detail-wrapper .essay-content {
			    font: 14px/1.5 Verdana,Helvetica,'微软雅黑','Microsoft YaHei';
			}
			
			.word-style {
				font-family:'Times New Roman';
				color:rgb(89,89,89);
				font-size:14px;
				background:rgb(255,255,255);
			}
			
			.essay-word-style {
				font-family:华文中宋;
				color:rgb(89,89,89);
				font-size:14px;
				background:rgb(255,255,255);
			}
			/*收藏分享图标***********************************/
			.essay-detail-wrapper .essay-share {
			    padding: 75px 0;
			    text-align: center;
			}
			
			.icon-essay-fav {
			    display: inline-block;
			    line-height: 1;
			    vertical-align: middle;
			    background-image: url(img/icon-musician.png);
			    background-position: top left;
			    background-repeat: no-repeat;
			    height: 20px;
			    width: 20px;
			    background-position: 0 -40px;
			    margin-right: 20px;
			}
			
			.icon-essay-share {
				display: inline-block;
				line-height: 1;
				vertical-align: middle;
				background-image: url(img/icon-musician.png);
				background-position: top left;
				background-repeat: no-repeat;
				height: 20px;
				width: 20px;
				background-position: -100px -20px;
			}
			
			/*作者和版权信息*******************************************/
			.essay-detail-wrapper .essay-author-wrapper {
			    border-top: 1px solid #e5e5e5;
			    border-bottom: 1px solid #e5e5e5;
			    margin-bottom: 35px;
			    padding: 20px 0;
			}
			
			.essay-detail-wrapper .essay-author {
			    float: left;
    			    width: 260px;
			    padding-right: 50px;
			    border-right: 1px solid #e5e5e5;
			    margin-right: 49px;
			}
			
			.essay-detail-wrapper .essay-author-wrapper .title {
			    font-size: 14px;
			    margin-bottom: 10px;
			}
			
			.essay-detail-wrapper .avatar-wrapper {
			    display: block;
			    float: left;
			}
			
			.essay-detail-wrapper .avatar {
			    display: block;
			    height: 60px;
			    width: 60px;
			    border-radius: 30px;
			}
			img {
			    border: 0;
			}
			
			.essay-detail-wrapper .essay-author-info {
			    float: left;
			    width: 185px;
			    margin-left: 15px;
			    height: 60px;
			    display: table;
			}
			
			.essay-detail-wrapper .cell {
			    display: table-cell;
			    vertical-align: middle;
			}
			
			.essay-detail-wrapper .essay-author-name {
			    color: #dd5862;
			}
			
			.essay-detail-wrapper .copyright {
			    float: left;
			    width: 260px;
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
		
		
		<div class="container ct-sm">
			<nav class="article-nav">
				<a href="#" class="nav-back">
					<i class="icon-back"></i>
					返回专栏首页
				</a>
			</nav>
			<div class="essay-detail-wrapper">
				<h1 class="essay-title">是怦然心动？还是刻骨铭心？</h1>
				<p class="essay-meta">
					言之・<span>弹弹我的理想</span>・2016-09-08			
				</p>
				<div class="essay-music">
					<div id="luooPlayerPlaylist" class="vol-tracklist">
						<ul>
							<li class="track-item rounded" id="track16905">
								<div class="track-wrapper clearfix">							
									<div class="btn-play">
										<span class="btn-control">
											<i style="display: none;" class="icon icon-status-play"></i>
											<i style="display: inline-block;" class="icon icon-status-pause"></i>
										</span>
										<a href="javascript:;" rel="nofollow" class="trackname">01. I Hate You But I Love You</a>
										<div class="artist">Russian Red</div>
									</div>
									
									<a style="visibility: visible;" class="icon icon-info" data-sid="16905"></a>
														
									<a style="visibility: visible;" class="btn-action-share icon icon-share" ></a>
	
									<a style="visibility: visible;" class="btn-action-like icon icon-fav" ></a>
									<div style="display: block;" class="duration">
										<span class="current-time">00:55</span>
										<span>/</span>
										<span class="total-time">03:01</span>
									</div>
								</div>
													
							
							</li>
						</ul>
						
					</div>  
				</div>
				<div class="essay-content">
					<p style="text-align: center;"><img src="img/essay-content-img1.jpg"></p>
					<p style="margin: 7px 0px; text-align: center;">
						<span class="word-style">
							 （怦然心动 | 导演 : 罗伯·莱纳 ） 
						</span>
					</p>
					<p><br></p>
					<p>
						<span class="essay-word-style">
							芒果从一个书呆子女生终于变成了整天碎碎念、神经脆弱的怨妇。这一切，得归功于那场毕业季的“黄昏恋”。
						</span>
					</p>
					<p><br></p>
					<p>
						<span class="essay-word-style">
							这场不长不短的恋爱，彻底打开了芒果的情感大门。
						</span>
					</p>
					<p><br></p>
					<p>
						<span class="essay-word-style">
							芒果是我们宿舍的老三，因为疯狂嗜好芒果而得此昵称。她神经大条，出门路痴，但也能依靠手机导航找到新闻发生地点；不用别人提箱子托行李，一巴掌能拍死未知名虫子，但也能细细品味一杯咖啡的浓香苦涩。毫无疑问，这个酷爱为姑娘们贴标签的社会一定会为芒果这类女孩子贴上一张大大的“女汉子”的标签。
						</span>
					</p>
					<p><br></p>
					<p>
						<span class="essay-word-style">
							在我们的宿舍里，每个人都可以娓娓道来一段段脍炙人口的情感故事。可令人潸然泪下，可叫人扼腕叹息，亦能使人心生羡慕，啧啧称奇。却唯独少了芒果。在我们三个人面前，她的感情世界就是一张空白的纸，也许这也是她从来不加入我们深夜卧谈活动的原因吧。其实，芒果并非人丑没人爱的女孩。她出门从来会把自己收拾得干干净净。像南京夏末这样的时节里，芒果穿一件酒红色毛衣，着一条紧身牛仔裤，斜挎着个略大的帆布包。白白的皮肤，晶莹透彻的眸子，利落中不失可爱。这样的女生怎么会没人喜欢？尤其是在我们这个男女比例7:1的理工科类的学校里。追芒果的男孩子可以凑一桌饭局了。
						</span>
					</p>
					<p><br></p>
					<p>
						<span class="essay-word-style">
							四年大学生涯一晃就要结束，室友们纷纷惋惜和自责，仿佛没有把芒果“嫁出”，是“娘家人”的过错。
						</span>
					</p>
					<p><br></p>
					<p>
						<span class="essay-word-style">
							而我却知道，芒果只是不愿意为谈恋爱而谈恋爱，她等的是能够令她怦然心动的那个人。她常被室友嘲笑情商太低，人家表白的就差喊楼了，她还一脸懵懂地扛死理——男女之间就是存在纯友谊！这是个存在诸多争论的话题。我想，只要男女双方没有越界，纯友谊大概是存在的。
						</span>
					</p>
					<p><br></p>
					<p style="text-align: right;">
						<span class="essay-word-style">编辑<span class="word-style">/eyelight</span></span>
					</p>
				</div>
				<div class="essay-share">
					<a class="btn-action-like" href="">
						<span class="icon-essay-fav"></span>
					</a>
					<a class="btn-action-share" href="#">
						<span class="icon-essay-share"></span>
					</a>
				</div>
				<div class="essay-author-wrapper clearfix">
					<div class="essay-author">
						<p class="title">文章作者</p>
						<div class="clearfix">
							<a href="#" class="avatar-wrapper">
								<img src="img/author.jpg" class="avatar rounded">
							</a>
							<div class="essay-author-info">
								<div class="cell">
									<a href="#" class="essay-author-name">
										弹弹我的理想
									</a>
									
								</div>
							</div>
						</div>
					</div>
					<div class="copyright">
						<div class="copyright">
						<p class="title">
							版权声明
						</p>
						<div class="copyright-ct">
							「落网」专栏内文章，未经作者及「落网」许可，不得转载、摘编。一经发现，自行承担全部法律责任。 谢谢合作。
						</div>
				</div>
					</div>
				</div>
			
			</div>
			
			
	<div class=comment-wrwrapper>
				<h3 class="volcount">
					评论<small id="volcount">999</small>
				</h3>
				<div class="comment-editor">
					<a class="avatar-wrapper"> <img src="img/avatar.gif" alt=""
						class="avatar">

					</a>

					<div class="editor-wrapper">
						<form id="commentform" action="#" method="post">
							<input type="hidden" name="topicType" id="topicType" value="hotel" /> <input
								type="hidden" name="topicId" id="topicId" value="1" /> <input type="hidden"
								name="fromUid" id="fromUid" value="1" />

							<div class="from-editor">
								<textarea name="content" id="content"></textarea>
							</div>
							<div class="toolbar">
								<div class="sns-sync">
									同步到 <a href="" class="sns-item"> <span
										class="icon-share-weibo"></span> <input type="hidden"
										name="sync[weibo]" value="0" class="">
									</a> <a href="" rel="nofollow" class="sns-item"> <span
										class="icon-share-douban"></span> <input type="hidden"
										name="sync[douban]" value="0" class="">
									</a> <a href="" rel="nofollow" class="sns-item"> <span
										class="icon-tweibo"></span> <input type="hidden"
										name="sync[tweibo]" value="0" class="">
									</a>
								</div>
								<input type="button"
									class="btn btn-positive btn-not-ready rounded"
									id="commentSubmit" value="发布" />
							</div>
						</form>
					</div>
				</div>
				<!--
	作者：1181613079@qq.com
	时间：2016-09-17
	描述：评论列表开始
-->
				<div class="comment-sort">
					<a class="curt-sort" id="commentSort" href="#"> <span
						id="commentSortText">最新评论</span> <span id="icon-sort-menu"
						class="icon-sort-menu">▼</span>

					</a>

					<div class="sort-menu" id="commentSortMenu" style="display: none;">
						<a class="comment-sort-item" href="#" id="new">最新评论</a> <a
							class="comment-sort-item" href="#" id="hot">热门评论</a>
					</div>

				</div>
				<div class="comment-list">
					<div id="commentItems">
						<!--
    	作者：1181613079@qq.com
    	时间：2016-09-17
    	描述：单个个人评论列表开始
    -->
						<c:forEach items="${list}" var="comment">
							<div id="divItem" class="item">
								<a class="avatar-wrapper"> <img src="img/avatar.gif"
									alt="${comment.fromUid}" class="avatar" />
								</a>
								<div class="item-wrapper">
									<div class="helper">
										<a href="" class="username" target="_blank">${comment.fromUid}</a>
										<div class="more">
											<span class="icon-more"> ▼ 
											<span class="more-menu"
												style="display: none;">
												 <a href="javascript:void(0);"
													class="comment-more-item btn-report" rel="nofollow">
													 <span
														class="icon-report"></span> <span class="report-status">
															举报</span>
															
												</a>
											</span>
											<input type="hidden" value="${comment.commentId}"/>
											</span>

										</div>
									</div>
									<div class="comment-ct">
										<p class="the-comment">${comment.content}</p>

									</div>
									<div class="helper clear-fix">
										${comment.commentDate}
										<a class="btn-vote">
											 <i class="icon-vote"></i>
											 赞
											<span>${comment.likeSum}</span>

										</a>
										<input type="hidden" value="${comment.commentId}"/>
										 <a href="" class="btn-replay"> <span id=""
											class="icon-replay"> </span> 回复
										</a>

									</div>
									<div class="sub-comment" style="display: none;">
										<span class="arrows"></span>

										<form action="" class="editor-wrapper hide form-comment-at"
											style="border: 0px;">
											<div class="editor">
												<textarea name="content" class="editor-comment-at"></textarea>
											</div>

											<div class="toolbar clearfix">
												<div class="btn-group">
													<a href="#" class="btn-link btn-action-cancel">取消</a>
													<button
														class="btn btn-positive btn-not-ready rounded btn-at-comment-submit">评论</button>
												</div>
											</div>

										</form>
										

									</div>
								</div>
							</div>
						</c:forEach>
						
						
						<!-- 重复三个div个人评论列表结束 -->
					</div>
					<div id="commentItems2" style="display:none;">
						<!--
    	作者：1181613079@qq.com
    	时间：2016-09-17
    	描述：单个个人评论列表开始
    -->
   
						<c:forEach items="${listLikeSum}" var="comment">
							<div id="divItem" class="item">
								<a class="avatar-wrapper"> <img src="img/avatar.gif"
									alt="${comment.fromUid}" class="avatar" />
								</a>
								<div class="item-wrapper">
									<div class="helper">
										<a href="" class="username" target="_blank">${comment.fromUid}</a>
										<div class="more">
											<span class="icon-more"> ▼ 
											<span class="more-menu"
												style="display: none;">
												 <a href="javascript:void(0);"
													class="comment-more-item btn-report" rel="nofollow">
													 <span
														class="icon-report"></span> <span class="report-status">
															举报</span>
															
												</a>
											</span>
											<input type="hidden" value="${comment.commentId}"/>
											</span>

										</div>
									</div>
									<div class="comment-ct">
										<p class="the-comment">${comment.content}</p>

									</div>
									<div class="helper clear-fix">
										${comment.commentDate}
										<a class="btn-vote">
											 <i class="icon-vote"></i>
											 赞
											<span>${comment.likeSum}</span>

										</a>
										<input type="hidden" value="${comment.commentId}"/>
										 <a href="" class="btn-replay"> <span id=""
											class="icon-replay"> </span> 回复
										</a>

									</div>
									<div class="sub-comment" style="display: none;">
										<span class="arrows"></span>

										<form action="" class="editor-wrapper hide form-comment-at"
											style="border: 0px;">
											<div class="editor">
												<textarea name="content" class="editor-comment-at"></textarea>
											</div>

											<div class="toolbar clearfix">
												<div class="btn-group">
													<a href="#" class="btn-link btn-action-cancel">取消</a>
													<button
														class="btn btn-positive btn-not-ready rounded btn-at-comment-submit">评论</button>
												</div>
											</div>

										</form>
										

									</div>
								</div>
							</div>
						</c:forEach>
						
						
						<!-- 重复三个div个人评论列表结束 -->
					</div>
					<div class="paginator" id="paginator">
						<a href="" class="previous disabled" rel="nofollow">上一页</a> <a
							href="" class="page actived" rel="nofollow">1</a> <a href=""
							class="page" rel="nofollow">2</a> <a href="" class="page"
							rel="nofollow">3</a> <a href="" class="page" rel="nofollow">4</a>
						<a href="" class="page" rel="nofollow">5</a> <span class="break">...</span>
						<a class="page" rel="nofollow">43</a> <a href="" class="next"
							rel="nofollow">下一页</a>
					</div>

				</div>
			</div>
			
			
					
			
		
		</div>

		
		<script type="text/javascript" src="js/jquery-1.7.2.js" ></script>
		<script type="text/javascript" src="js/top.js" ></script>
		<script type="text/javascript">
		
		
		
		$(function() {

			/*图片的两个箭头的显示和隐藏*/
			$("div.wrapper").mouseover(function() {
				$("img.cover~a").css("display", "inline");
			});
			$("div.wrapper").mouseout(function() {
				$("img.cover~a").css("display", "none");
			});
			/*最新评论和最热评论*/

			var $commentSortMenu = $("div.comment-sort");

			$commentSortMenu.toggle(function() {
				$("#icon-sort-menu").text("▲");

				$("#commentSortMenu").show();

			}, function() {
				$("#icon-sort-menu").text("▼");

				$("#commentSortMenu").hide();

			});
			/*回复显示框*/

			$("a.btn-replay").toggle(function() {
				$(this).parent("div").next().show();
			}, function() {
				
				$(this).parent("div").next().hide();
			});
			//查询最新评论
			$("#new").click(function(){
				$("#commentSortText").text("最新评论");
				//使用dom技术来更新 创建出一个 二级产品种类的下来列表框 把以前的替换
				 	var div1 = $("#commentItems");
				 	var div2 = $("#commentItems2");
				 	div1.show();
				 	div2.hide();
			});
			
			//查询热门评论
			$("#hot").click(function(){
				
				$("#commentSortText").text("最热评论");
					var div1 = $("#commentItems");
			 		var div2 = $("#commentItems2");
			 		div2.show();
			 		div1.hide();
			});
			
			//点赞
			$("a.btn-vote").toggle(function(){
				var i = $(this).children("i");
				i.removeClass("icon-vote");
				i.addClass("icon-vote-actived");
				   
				alert("test likeSum");
				var span = $(this).children("span");
				var commentId = $(this).next().val();
				 $.post("updateCommentById.action",{
				 	"commentId":commentId
				 },function(data,status){
				 	//使用dom技术来更新 
				 
				 	var likeSumSpan =  "<span>"+data.likeSum+"</span>";

					span.replaceWith(likeSumSpan);
					
					
					
				 },"json");

			},function(){
				//取消点赞
				
				
			});

			/*举报框的显示和隐藏*/

			$("span.icon-more").on("mouseover",function() {
				$(this).children("span").show();
				
				
			});
			//举报
			$(".more-menu").click(function(){
				//alert("test");
				var report =$(this).children("a").children("span.report-status");
				var id = $(this).next().val();
				$.post("updateCommentReport.action",{
				 	"commentId":id
				 },function(data,status){
				 	var html = "<span class='report-status'>已举报</span>";

					 report.replaceWith(html);
				
				 },"json");
				
			});
			
			$("span.icon-more").on("mouseout",function() {
				$(this).children("span").hide();
			});
			
			/* 增加一条回复 */
			$("#commentSubmit").click(function(){
				
				var topicType = $("#topicType").val();
				var topicId = $("#topicId").val();
				var fromUid = $("#formUid").val();
				var content = $("#content").val();
				$("#content").val("");
				$.post("addComment.action",{
				 	"topicType":topicType,
				 	"topicId":topicId,
				 	"fromUid":fromUid,
				 	"content":content
				 },function(data){
					 	var div = $("#commentItems");
					 	var divItem = "<div id='commentItems'>";
					 	
					 	for(var i =0;i<data.length;i++){
					 		 divItem = divItem + "<div id ='divItem' class='item'><a class='avatar-wrapper'> <img src='img/avatar.gif' alt='"+data[i].fromUid+"' class='avatar' /></a><div class='item-wrapper'><div class='helper'><a  class='username' target='_blank'>"+data[i].fromUid+"</a><div class='more'><span class='icon-more'> ▼ <span class='more-menu' style='display: none;'> <a href='javascript:void(0);' class='comment-more-item btn-report' rel='nofollow'> <span class='icon-report'></span> <span class='report-status'>举报</span></a></span></span></div></div><div class='comment-ct'><p class='the-comment'>"+data[i].content+"</p></div><div class='helper clear-fix'>"+data[i].commentDate+"<a class='btn-vote'> <i class='icon-vote'></i> 赞<span>"+data[i].likeSum+"</span></a> <a  class='btn-replay'> <span id='' class='icon-replay'> </span> 回复</a></div><div class='sub-comment' style='display: none;'><span class='arrows'></span><form action='' class='editor-wrapper hide form-comment-at' style='border: 0px;'><div class='editor'><textarea name='content' class='editor-comment-at'></textarea></div><div class='toolbar clearfix'><div class='btn-group'><a  class='btn-link btn-action-cancel'>取消</a>	<button	class='btn btn-positive btn-not-ready rounded btn-at-comment-submit'>评论</button></div></div></form></div></div></div>";

					 	}
					 	divItem = divItem + "</div>";
					 	//替换以前的
					 	div.replaceWith(divItem);
				 },"json");
				
				
			});
			
			
			
		});
	</script>
		
	</body>

  </head>
  
  <body>
    
  </body>
</html>
