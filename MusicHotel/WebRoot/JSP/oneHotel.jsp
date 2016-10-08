<%@ page language="java" import="java.util.*,java.io.*,java.text.SimpleDateFormat,com.po.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%
	Hotel hotel = (Hotel)request.getAttribute("hotel");
%>
<head>
  
<title><%=hotel.getTitle()%></title>
<link rel="stylesheet" type="text/css" href="css/top.css"/>
<link rel="stylesheet" type="text/css" href="css/kaitoujiewei.css" />
<link rel="stylesheet" href="css/stylesheets/style.css">

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

</head>

<body>
<%@include file="top.jsp" %>
<%
	//User user = (User)session.getAttribute("user");
	if(user==null){
		
		user = new User();
		user.setUserId(0);
	}
%>
	<input type="hidden" id="userId" value="<%=user.getUserId()%>"/>
	<div class="container">
			<!--返回期刊首页-->
			<div>
				<div class="vol vol-meta">
					<a class="nav-block" href="index.jsp"> <i class="icon-block">&lt;</i> 返回期刊首页
					</a> 
					<%
						String hotelStyle = hotel.getStyle();
						String[] style = hotelStyle.split("\\|");
						for(String s:style){
					%>
						<a class="item">#<%=s%></a>
					<%
						}
					%>
				</div>
				<!--
            	作者：1181613079@qq.com
            	时间：2016-09-17
            	描述：期刊首页图片简介开始
            -->
				<div class="name">
					<span class="number"> <%=hotel.getHotelId()%> </span> <span class="title"> <%=hotel.getTitle()%>
					</span>
				</div>
				<div class="wrapper">
					<img src="img/hotel/coverImg/<%=hotel.getCoverImg()%>" alt="<%=hotel.getTitle()%>" class="cover">
					<%
						int maxHotelId = (Integer)request.getAttribute("maxHotelId");
						int minHotelId = (Integer)request.getAttribute("minHotelId");
						
						if(hotel.getHotelId()+1<=maxHotelId){
					%>
					<a href="getHotelById.action?hotelId=<%=hotel.getHotelId()+1%>" class="nav-prev" title="前一期">&nbsp;</a> 
					<%
						}
						if(hotel.getHotelId()-1>=minHotelId){
					%>
					<a href="getHotelById.action?hotelId=<%=hotel.getHotelId()-1%>" class="nav-next" title="后一期">&nbsp;</a>
					<%
						}
					%>		
				</div>
				<div class="desc">
					<%
					String s = null;
					FileReader fr = null;
					BufferedReader br = null;
					String path = application.getRealPath("/");//当前WEB应用的物理路径
					String hotelDesc = hotel.getHotelDesc();
					try {
						fr = new FileReader(path+"JSP/txt/"+hotelDesc);
						br = new BufferedReader(fr);
					} catch (FileNotFoundException e) {
						System.out.println("文件没有找到");
						e.printStackTrace();
						System.exit(-1);
					}catch (IOException e) {
						System.out.println("文件没有找到");
						e.printStackTrace();
						System.exit(-1);
					}	
					try {		
						while((s=br.readLine())!=null){							
							if(br.ready()){
					%>
								<%=s%><br/>
					<%
							}else{
					%>
								<%=s%><br/>
					<%
							}
						}
					} catch (IOException e) {
						System.out.println("读取失败");
						e.printStackTrace();
					}finally{
						if(br!=null){
							try {
								br.close();
							} catch (IOException e) {
								System.out.println("关闭BufferedReader失败");
								e.printStackTrace();
							}
						}
						if(fr!=null){
							try {
								fr.close();
							} catch (IOException e) {
								System.out.println("关闭FileReader失败");
								e.printStackTrace();
							}
						}
					}
				%>
				</div>

			</div>

	


			<div class="clearfix vol-meta">
				
				<img src="img/u50001445339175.png" alt="落在低处"
					class="author-avatar rounded"> <a class="vol-author" href=""
					target="_blank">落在低处</a> <span class="separator fleft">・</span> <span
					class="vol-date">><%=hotel.getCreateDate()%></span> <a href="javascript:;"
					class="btn-action-like icon-fav icon-fav3" title="收藏" id="favHotel"></a> <a
					href="javascript:;" class="icon-share btn-action-share"
					rel="nofollow"> </a>

			</div>
			<!--期刊首页图片简介结束-->
			<!--音乐播放器开始-->
			<div class="kePublic">
				<!--效果html开始-->
				<!--<div id="background"></div>-->
				<div id="player">
					<div class="cover"></div>
					<div class="ctrl">
						<div class="tag">
							<strong>Title</strong> <span class="artist">Artist</span> <span
								class="album">Album</span>
						</div>
						<div class="control">
							<div class="left">
								<div class="rewind icon"></div>
								<div class="playback icon"></div>
								<div class="fastforward icon"></div>
							</div>
							<div class="volume right">
								<div class="mute icon left"></div>
								<div class="slider left">
									<div class="pace"></div>
								</div>
							</div>
						</div>
						<div class="progress">
							<div class="slider">
								<div class="loaded"></div>
								<div class="pace"></div>
							</div>
							<div class="timer left">0:00</div>
							<div class="right">
								<a href="javascript:;" class="btn-action-like icon-fav icon-fav2 icon-fav3" id="like" title="收藏"></a>
								<div class="repeat icon"></div>
								<div class="shuffle icon"></div>
							</div>
						</div>
					</div>
				</div>
				<ul id="playlist"></ul>

				<!--效果html结束-->
			</div>

			<!--音乐播放器结束-->
			<!--
	作者：1181613079@qq.com
	时间：2016-09-17
	描述：增加评论
-->
			<div  id ="comment-wrapper" class=comment-wrwrapper>
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
								<input type="hidden"
								name="toCid" id="toCid" value="0" />
							
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
					<a class="curt-sort" id="commentSort" href="javascript:void(0);"> <span
						id="commentSortText">最新评论</span> <span id="icon-sort-menu"
						class="icon-sort-menu">▼</span>

					</a>

					<div class="sort-menu" id="commentSortMenu" style="display: none;">
						<a class="comment-sort-item" href="javascript:void(0);" id="new">最新评论</a> <a
							class="comment-sort-item" href="javascript:void(0);" id="hot">热门评论</a>
					</div>

				</div>
				<div class="comment-list">
					<div id="commentItems">
						<!--
    	作者：1181613079@qq.com
    	时间：2016-09-17
    	描述：单个个人评论列表开始
    -->
						<c:forEach items="${list}" var ="commentList">
						<c:set var="comment" value="${commentList}" />
						<c:set var ="oldComment" value="${commentList.toComment}" />
							<!-- 一条评论 -->
						<div id="divItem" class="item">
								<a class="avatar-wrapper"> <img src="img/avatar.gif"
									alt="${comment.fromUid}" class="avatar" />
								</a>
								<div class="item-wrapper">
									<div class="helper">
										<a href="javascript:void(0);" class="username" target="_blank">${comment.fromUid}</a>
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
									
	<c:if test="${oldComment!=null}">
  
  	<!-- 一条评论回复 -->
  			<!-- 原评论 开始-->
									<div class="que">
										<span class="darr">
											<i class="bd">◆</i>
											<i class="bg">◆</i>
										</span>
										<a class="s-fc7" href="#">${oldComment.commentId}</a>
									：${oldComment.content}
									</div>
									<!-- 原评论结束 -->
									
  	</c:if>
								<div class="helper clear-fix">
										${comment.commentDate}
										<a href="javascript:void(0);" class="btn-vote">
											 <i class="icon-vote"></i>
											 赞
											<span>${comment.likeSum}</span>

										</a>
										<input type="hidden" value="${comment.commentId}"/>
										<a href="javascript:void(0);" class="btn-replay"> <span id=""
											class="icon-replay"> </span> 回复
										</a>

									</div>
									<div class="sub-comment" style="display: none;">
										<span class="arrows"></span>

										<div class="editor-wrapper hide form-comment-at"
											style="border: 0px;">
											<!-- 传固定的值 -->
											<input type="hidden" name="replayTopicType" id="replayTopicType" value="hotel" /> <input
								type="hidden" name="replayTopicId" id="replayTopicId" value="1" /> <input type="hidden"
								name="replayFromUid" id="replayFromUid" value="1" />
								<input type="hidden" name="replayToCid" id="replayToCid" value="${comment.commentId}" />
										<!-- 传固定的值 结束 -->
											<div class="editor">
												<textarea name="replayContent" id="replayContent" class="editor-comment-at"> </textarea>
											</div>

											<div class="toolbar clearfix">
												<div class="btn-group">
													<a href="javascript:void(0);" class="btn-link btn-action-cancel">取消</a>
													<button
														class="btn btn-positive btn-not-ready rounded btn-at-comment-submit">评论</button>
												</div>
											</div>

										</div>
										

									</div>
								</div>
							</div>
							
						</c:forEach>
						
						
						<!-- 重复div个人评论列表结束 -->
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
	
	<script src="js/jquery-3.1.0.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/top.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/jquery-1.7.2.min.js"></script>
	<script src="js/jquery-ui-1.8.17.custom.min.js"></script>
	<script type="text/javascript">
		$(function() {
			//页面加载完毕就发送ajax请求
			var hotelId = <%=hotel.getHotelId()%>;
			$.post("getAllMusic.action",{
				//这里传hoteId
				"hotelId":hotelId
			},function(data){
				var repeat = localStorage.repeat || 0,
				shuffle = localStorage.shuffle || 'false',
				continous = true,
				autoplay = true;
				var playlistStr = "[]";
				var playlist = eval('('+playlistStr+')');
				for(var i=0;i<data.length;i++){
					console.info(data[i].cover_img);
					var arr = {
							id:data[i].musicId,
							title: data[i].title,
							artist:data[i].artist ,
							album: data[i].album,
							cover:data[i].coverImg,
							mp3: 'music/'+data[i].path,
							ogg: ''
					};
					playlist.push(arr);
				}
				
				// Load playlist
				for (var i=0; i<playlist.length; i++){
					var item = playlist[i];
					$('#playlist').append("<li>"+item.artist+" - "+item.title+"</li><input type='hidden' value='"+item.id+"'/>");
				}

				var time = new Date(),
					currentTrack = shuffle === 'true' ? time.getTime() % playlist.length : 0,
					trigger = false,
					audio, timeout, isPlaying, playCounts;

				var play = function(userId){
					audio.play();
					$('.playback').addClass('playing');
					console.info($(".playing:last").next());
					var id = $(".playing:last").next().val();
					var useId = $("#userId").val();
					console.info( $("#userId").val());
					if($("#userId").val()=="0"){
						
					}else{
						$.post("getUserLike.action",{
							"userId":$("#userId").val(),
							"id":id,
							"likeType":"music"
						},function(data){
							
							
							if(data=="1"){//有这个喜爱
								//就是红色的
								if($("#like").hasClass("icon-fav3")){
									$("#like").removeClass("icon-fav3");
									$("#like").addClass("icon-fav4");
								}
							}else if(data=="0"){
								if($("#like").hasClass("icon-fav4")){
									$("#like").removeClass("icon-fav4");
									$("#like").addClass("icon-fav3");
								}
							}
						},"json");
						
						$.post("listenedSumAddOne.action",{
							"userId":$("#userId").val()
						});
					
					}
					timeout = setInterval(updateProgress, 500);
					isPlaying = true;
				}

				var pause = function(){
					audio.pause();
					$('.playback').removeClass('playing');
					clearInterval(updateProgress);
					isPlaying = false;
				}
				

				// Update progress
				var setProgress = function(value){
					var currentSec = parseInt(value%60) < 10 ? '0' + parseInt(value%60) : parseInt(value%60),
						ratio = value / audio.duration * 100;

					$('.timer').html(parseInt(value/60)+':'+currentSec);
					$('.progress .pace').css('width', ratio + '%');
					$('.progress .slider a').css('left', ratio + '%');
				}

				var updateProgress = function(){
					setProgress(audio.currentTime);
				}

				// Progress slider
				$('.progress .slider').slider({step: 0.1, slide: function(event, ui){
					$(this).addClass('enable');
					setProgress(audio.duration * ui.value / 100);
					clearInterval(timeout);
				}, stop: function(event, ui){
					audio.currentTime = audio.duration * ui.value / 100;
					$(this).removeClass('enable');
					timeout = setInterval(updateProgress, 500);
				}});

				// Volume slider
				var setVolume = function(value){
					audio.volume = localStorage.volume = value;
					$('.volume .pace').css('width', value * 100 + '%');
					$('.volume .slider a').css('left', value * 100 + '%');
				}

				var volume = localStorage.volume || 0.5;
				$('.volume .slider').slider({max: 1, min: 0, step: 0.01, value: volume, slide: function(event, ui){
					setVolume(ui.value);
					$(this).addClass('enable');
					$('.mute').removeClass('enable');
				}, stop: function(){
					$(this).removeClass('enable');
				}}).children('.pace').css('width', volume * 100 + '%');

				$('.mute').click(function(){
					if ($(this).hasClass('enable')){
						setVolume($(this).data('volume'));
						$(this).removeClass('enable');
					} else {
						$(this).data('volume', audio.volume).addClass('enable');
						setVolume(0);
					}
				});

				// Switch track
				var switchTrack = function(i){
					if (i < 0){
						track = currentTrack = playlist.length - 1;
					} else if (i >= playlist.length){
						track = currentTrack = 0;
					} else {
						track = i;
					}

					$('audio').remove();
					loadMusic(track);
					if (isPlaying == true) play();
				}

				// Shuffle
				var shufflePlay = function(){
					var time = new Date(),
						lastTrack = currentTrack;
					currentTrack = time.getTime() % playlist.length;
					if (lastTrack == currentTrack) ++currentTrack;
					switchTrack(currentTrack);
				}

				// Fire when track ended
				var ended = function(){
					pause();
					audio.currentTime = 0;
					playCounts++;
					if (continous == true) isPlaying = true;
					if (repeat == 1){
						play();
					} else {
						if (shuffle === 'true'){
							shufflePlay();
						} else {
							if (repeat == 2){
								switchTrack(++currentTrack);
							} else {
								if (currentTrack < playlist.length) switchTrack(++currentTrack);
							}
						}
					}
				}

				var beforeLoad = function(){
					var endVal = this.seekable && this.seekable.length ? this.seekable.end(0) : 0;
					$('.progress .loaded').css('width', (100 / (this.duration || 1) * endVal) +'%');
				}

				// Fire when track loaded completely
				var afterLoad = function(){
					if (autoplay == true) play();
				}

				// Load track
				var loadMusic = function(i){
					var item = playlist[i],
						newaudio = $('<audio>').html('<source src="'+item.mp3+'"><source src="'+item.ogg+'">').appendTo('#player');
					
					$('.cover').html('<img src="'+item.cover+'" alt="'+item.album+'">');
					$('.tag').html('<strong>'+item.title+'</strong><span class="artist">'+item.artist+'</span><span class="album">'+item.album+'</span>');
					$('#playlist li').removeClass('playing').eq(i).addClass('playing');
					audio = newaudio[0];
					audio.volume = $('.mute').hasClass('enable') ? 0 : volume;
					audio.addEventListener('progress', beforeLoad, false);
					audio.addEventListener('durationchange', beforeLoad, false);
					audio.addEventListener('canplay', afterLoad, false);
					audio.addEventListener('ended', ended, false);
				}

				loadMusic(currentTrack);
				$('.playback').on('click', function(){
					if ($(this).hasClass('playing')){
						pause();
					} else {
						play();
					}
				});
				$('.rewind').on('click', function(){
					if (shuffle === 'true'){
						shufflePlay();
					} else {
						switchTrack(--currentTrack);
					}
				});
				$('.fastforward').on('click', function(){
					if (shuffle === 'true'){
						shufflePlay();
					} else {
						switchTrack(++currentTrack);
					}
				});
				$('#playlist li').each(function(i){
					var _i = i;
					$(this).on('click', function(){
						switchTrack(_i);
					});
				});

				if (shuffle === 'true') $('.shuffle').addClass('enable');
				if (repeat == 1){
					$('.repeat').addClass('once');
				} else if (repeat == 2){
					$('.repeat').addClass('all');
				}

				$('.repeat').on('click', function(){
					if ($(this).hasClass('once')){
						repeat = localStorage.repeat = 2;
						$(this).removeClass('once').addClass('all');
					} else if ($(this).hasClass('all')){
						repeat = localStorage.repeat = 0;
						$(this).removeClass('all');
					} else {
						repeat = localStorage.repeat = 1;
						$(this).addClass('once');
					}
				});

				$('.shuffle').on('click', function(){
					if ($(this).hasClass('enable')){
						shuffle = localStorage.shuffle = 'false';
						$(this).removeClass('enable');
					} else {
						shuffle = localStorage.shuffle = 'true';
						$(this).addClass('enable');
					}
				});
				
			},"json");
			//收藏歌曲
			$("#like").click(function(){
				
				var id = $(".playing:last").next().val();
				
				var userId = $("#userId").val();
				if($("#userId").val()=="0"){
					//提示进行登录
					alert("请先登录");
				}else{
					
					if($(this).hasClass("icon-fav4")){
						
						//发送ajax取消收藏
						$.post("deleteOneUserLike.action",{
							"id":id,
							"userId":$("#userId").val(),
							"likeType":"music"
						},function(data){
							
						});
						
						//把心变成灰色
						$("#like").removeClass("icon-fav4");
						$("#like").addClass("icon-fav3");
					}else{
						
					
						//发送ajax进行收藏
						$.post("addUserLike.action",{
							"id":id,
							"userId":$("#userId").val(),
							"likeType":"music"
						},function(data){
							
						});
						
						//把心变成红色
						$("#like").removeClass("icon-fav3");
						$("#like").addClass("icon-fav4");
					
					}
				}
			});
			
			//收藏该hotel
			$("#favHotel").click(function(){
				//判断是不是已经登录
				
				
				var userId = $("#userId").val();
				if($("#userId").val()=="0"){
					//提示进行登录
					alert("请先登录");
				}else{
					
					if($(this).hasClass("icon-fav4")){
						
						//发送ajax取消收藏
						$.post("deleteOneUserLike.action",{
							"id":hotelId,
							"userId":$("#userId").val(),
							"likeType":"hotel"
						},function(data){
							
						});
						
						//把心变成红色
						$("#favHotel").removeClass("icon-fav4");
						$("#favHotel").addClass("icon-fav3");
					}else{
						
					
						//发送ajax进行收藏
						$.post("addUserLike.action",{
							"id":hotelId,
							"userId":$("#userId").val(),
							"likeType":"hotel"
						},function(data){
							
						});
						
						//把心变成红色
						$("#favHotel").removeClass("icon-fav3");
						$("#favHotel").addClass("icon-fav4");
					
					}
				}
			});
			
			var userId = $("#userId").val();
			if($("#userId").val()=="0"){
				
			}else{
			$.post("getUserLike.action",{
				"userId":$("#userId").val(),
				"id":hotelId,
				"likeType":"hotel"
			},function(data){
				
				
				if(data=="1"){//有这个喜爱
					//就是红色的
					if($("#favHotel").hasClass("icon-fav3")){
						$("#favHotel").removeClass("icon-fav3");
						$("#favHotel").addClass("icon-fav4");
					}
				}else if(data=="0"){
					if($("#favHotel").hasClass("icon-fav4")){
						$("#favHotel").removeClass("icon-fav4");
						$("#favHotel").addClass("icon-fav3");
					}
				}
			},"json");
			}
			var commentWrapper = $("#comment-wrapper");
			/*图片的两个箭头的显示和隐藏*/
			$("div.wrapper").mouseover(function() {
				$("img.cover~a").css("display", "inline");
			});
			$("div.wrapper").mouseout(function() {
				$("img.cover~a").css("display", "none");
			});
			/*最新评论和最热评论*/

			var flag = 1;
			commentWrapper.on("click","#commentSort",function() {
				
			
				
				if(flag==1){
					$("#icon-sort-menu").text("▲");

					$("#commentSortMenu").show();
					flag=0;
				}else if(flag==0){
					
					$("#icon-sort-menu").text("▼");

					$("#commentSortMenu").hide();
					flag=1;
				}
			});
			/*回复显示框*/
			var showR = 1;
			commentWrapper.on("click",".btn-replay",function() {
				if(showR==1){
					$(this).parent("div").next().show();
					showR=0;
				}else if(showR==0){
					$(this).parent("div").next().hide();
					showR=1;
				}
				
			});
			//查询最新评论
			commentWrapper.on("click","#new",function(){
				$("#commentSortText").text("最新评论");
				$("#icon-sort-menu").text("▼");

				$("#commentSortMenu").hide();
				flag=1;
				//使用dom技术来更新 创建出一个 二级产品种类的下来列表框 把以前的替换
				$.post("getCommentOrderByNewDate.action",{
					
				 },function(data){
					 
					 	var div = $("#commentItems");
					 	var divItem = "<div id='commentItems'>";
					 	alert("test getCommentOrderByNewDate");
						
						for(var i =0;i<data.length;i++){
							
							var comment = data[i]; 
							var oldComment = comment.toComment;
							
							 divItem = divItem + "<div id ='divItem' class='item'><a class='avatar-wrapper'> <img src='img/avatar.gif' alt='"+comment.fromUid+"' class='avatar' /></a><div class='item-wrapper'><div class='helper'><a  class='username' target='_blank'>"+comment.fromUid+"</a><div class='more'><span class='icon-more'> ▼ <span class='more-menu' style='display: none;'> <a href='javascript:void(0);' class='comment-more-item btn-report' rel='nofollow'> <span class='icon-report'></span> <span class='report-status'>举报</span></a></span><input type='hidden' value='"+comment.commentId+"'/></span></div></div><div class='comment-ct'><p class='the-comment'>"+comment.content+"</p></div>";
					 		 if(oldComment!=null){
					 			divItem = divItem +"<!-- 一条评论回复 --><!-- 原评论 开始--><div class='que'><span class='darr'><i class='bd'>◆</i><i class='bg'>◆</i></span><a class='s-fc7' href='#''>"+oldComment.commentId+"</a>："+oldComment.content+"</div><!-- 原评论结束 -->"; 
					 		 }
					 		
					 		 divItem = divItem +"<div class='helper clear-fix'>"+comment.commentDate+"<a class='btn-vote'> <i class='icon-vote'></i> 赞<span>"+comment.likeSum+"</span></a> <input type='hidden' value='"+comment.commentId+"'/><a  class='btn-replay'> <span id='' class='icon-replay'> </span> 回复</a></div><div class='sub-comment' style='display: none;'><span class='arrows'></span><div class='editor-wrapper hide form-comment-at' style='border: 0px;'><input type='hidden' name='topicType' id='topicType' value='hotel' /> <input type='hidden' name='topicId' id='topicId' value='1' /> <input type='hidden' name='fromUid' id= 'fromUid ' value='1' /> <input type='hidden' name='toCid' id='toCid' value='"+comment.commentId+"' /><div class='editor'><textarea name='content' class='editor-comment-at'></textarea></div><div class='toolbar clearfix'><div class='btn-group'><a  class='btn-link btn-action-cancel'>取消</a>	<button	class='btn btn-positive btn-not-ready rounded btn-at-comment-submit'>评论</button></div></div></div></div></div></div>";
						}
					 	
						
						
					 	//替换以前的
					 	div.replaceWith(divItem);
				 },"json");	
			});
			//查询热门评论
			commentWrapper.on("click","#hot",function(){
				
				$("#commentSortText").text("最热评论");
				$("#icon-sort-menu").text("▼");

				$("#commentSortMenu").hide();
				flag=1;
				$.post("getCommentOrderNewByLikeSum.action",{
					
				 },function(data){
					 
					 	var div = $("#commentItems");
					 	var divItem = "<div id='commentItems'>";
					 	
					 	 alert("test getCommentOrderNewByLikeSum");
					for(var i =0;i<data.length;i++){
							
							var comment = data[i]; 
							var oldComment = comment.toComment;
							
					 		 divItem = divItem + "<div id ='divItem' class='item'><a class='avatar-wrapper'> <img src='img/avatar.gif' alt='"+comment.fromUid+"' class='avatar' /></a><div class='item-wrapper'><div class='helper'><a  class='username' target='_blank'>"+comment.fromUid+"</a><div class='more'><span class='icon-more'> ▼ <span class='more-menu' style='display: none;'> <a href='javascript:void(0);' class='comment-more-item btn-report' rel='nofollow'> <span class='icon-report'></span> <span class='report-status'>举报</span></a></span><input type='hidden' value='"+comment.commentId+"'/></span></div></div><div class='comment-ct'><p class='the-comment'>"+comment.content+"</p></div>";
					 		 if(oldComment!=null){
					 			 divItem = divItem + "<!-- 一条评论回复 --><!-- 原评论 开始--><div class='que'><span class='darr'><i class='bd'>◆</i><i class='bg'>◆</i></span><a class='s-fc7' href='#''>"+oldComment.commentId+"</a>："+oldComment.content+"</div><!-- 原评论结束 -->"; 
					 		 }
					 		
					 		 divItem = divItem + "<div class='helper clear-fix'>"+comment.commentDate+"<a class='btn-vote'> <i class='icon-vote'></i> 赞<span>"+comment.likeSum+"</span></a> <input type='hidden' value='"+comment.commentId+"'/><a  class='btn-replay'> <span id='' class='icon-replay'> </span> 回复</a></div><div class='sub-comment' style='display: none;'><span class='arrows'></span><div  class='editor-wrapper hide form-comment-at' style='border: 0px;'><input type='hidden' name='topicType' id='topicType' value='hotel' /> <input type='hidden' name='topicId' id='topicId' value='1' /> <input type='hidden' name='fromUid' id= 'fromUid ' value='1' /> <input type='hidden' name='toCid' id='toCid' value='"+comment.commentId+"' /><div class='editor'><textarea name='content' class='editor-comment-at'></textarea></div><div class='toolbar clearfix'><div class='btn-group'><a  class='btn-link btn-action-cancel'>取消</a>	<button	class='btn btn-positive btn-not-ready rounded btn-at-comment-submit'>评论</button></div></div></div></div></div></div>";
					 	}
					 	 divItem = divItem +  "</div>";
					 	//替换以前的
					 	div.replaceWith(divItem);
				 },"json");	
			});
			//点赞
			commentWrapper.on("click","a.btn-vote",function(){
				var i = $(this).children("i");
				if(i.hasClass("icon-vote")){
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
				 
				}else{
					//取消点赞
					
					i.removeClass("icon-vote-actived");
					i.addClass("icon-vote");
					   
					var span = $(this).children("span");
					var commentId = $(this).next().val();
					 $.post("cancelTheThumbUp.action",{
						 	"commentId":commentId
						 },function(data,status){
						 	//使用dom技术来更新 
						 
						 	var likeSumSpan =  "<span>"+data.likeSum+"</span>";

							span.replaceWith(likeSumSpan);
							
							
							
						 },"json");
				}		
				
			});
			
			
			/*举报框的显示和隐藏*/

			$("span.icon-more").mouseover(function() {
				$(this).children("span").show();
			});
			$("span.icon-more").mouseout(function() {
				$(this).children("span").hide();
			});
			
			//举报
			commentWrapper.on("click",".more-menu",function(){
				
				var report =$(this).children("a").children("span.report-status");
				var id = $(this).next().val();
				$.post("updateCommentReport.action",{
				 	"commentId":id
				 },function(data,status){
				 	var html = "<span class='report-status'>已举报</span>";

					 report.replaceWith(html);
				
				 },"json");
				
			});
			
			commentWrapper.on("mouseout","span.icon-more",function() {
				$(this).children("span").hide();
			});
			
			/* 增加一条评论 */
			$("#commentSubmit").click(function(){
				$("#commentSortText").text("最新评论");
				var topicType = $("#topicType").val();
				var topicId = $("#topicId").val();
				var fromUid = $("#formUid").val();
				var content = $("#content").val();
				var toCid = $("#toCid").val();
				$("#content").val("");
				$.post("addComment.action",{
				 	"topicType":topicType,
				 	"topicId":topicId,
				 	"fromUid":fromUid,
				 	"content":content,
				 	"toCid":toCid
				 },function(data){
					 var div = $("#commentItems");
					 	var divItem = "<div id='commentItems'>";
					 	alert("test getCommentOrderByNewDate in add");
						
						for(var i =0;i<data.length;i++){
							
							var comment = data[i]; 
							var oldComment = comment.toComment;
							
							 divItem = divItem + "<div id ='divItem' class='item'><a class='avatar-wrapper'> <img src='img/avatar.gif' alt='"+comment.fromUid+"' class='avatar' /></a><div class='item-wrapper'><div class='helper'><a  class='username' target='_blank'>"+comment.fromUid+"</a><div class='more'><span class='icon-more'> ▼ <span class='more-menu' style='display: none;'> <a href='javascript:void(0);' class='comment-more-item btn-report' rel='nofollow'> <span class='icon-report'></span> <span class='report-status'>举报</span></a></span><input type='hidden' value='"+comment.commentId+"'/></span></div></div><div class='comment-ct'><p class='the-comment'>"+comment.content+"</p></div>";
					 		 if(oldComment!=null){
					 			divItem = divItem +"<!-- 一条评论回复 --><!-- 原评论 开始--><div class='que'><span class='darr'><i class='bd'>◆</i><i class='bg'>◆</i></span><a class='s-fc7' href='#''>"+oldComment.commentId+"</a>："+oldComment.content+"</div><!-- 原评论结束 -->"; 
					 		 }
					 		
					 		 divItem = divItem +"<div class='helper clear-fix'>"+comment.commentDate+"<a class='btn-vote'> <i class='icon-vote'></i> 赞<span>"+comment.likeSum+"</span></a> <input type='hidden' value='"+comment.commentId+"'/><a  class='btn-replay'> <span id='' class='icon-replay'> </span> 回复</a></div><div class='sub-comment' style='display: none;'><span class='arrows'></span><div  class='editor-wrapper hide form-comment-at' style='border: 0px;'><input type='hidden' name='topicType' id='topicType' value='hotel' /> <input type='hidden' name='topicId' id='topicId' value='1' /> <input type='hidden' name='fromUid' id= 'fromUid ' value='1' /> <input type='hidden' name='toCid' id='toCid' value='"+comment.commentId+"' /><div class='editor'><textarea name='content' class='editor-comment-at'></textarea></div><div class='toolbar clearfix'><div class='btn-group'><a  class='btn-link btn-action-cancel'>取消</a>	<button	class='btn btn-positive btn-not-ready rounded btn-at-comment-submit'>评论</button></div></div></div></div></div></div>";
						}
					 	
					 	//替换以前的
					 	div.replaceWith(divItem);
				 },"json");
				
				
			});
			/* 增加一条评论回复 */
			/* var subComment = $(".sub-comment").children("form");
			var buttonSub = subComment.children("button"); */
			commentWrapper.on("click","button",function(){
				
				$("#commentSortText").text("最新评论");
				var topicType = $("#replayTopicType").val();
				var topicId = $("#replayTopicId").val();
				var fromUid = $("#replayFormUid").val();
				var content = $("#replayContent").val();
				
				var toCid = $("#replayToCid").val();
				$("#replayContent").val("");
				alert("toCid="+toCid);
				$.post("addCommentReplay.action",{
				 	"topicType":topicType,
				 	"topicId":topicId,
				 	"fromUid":fromUid,
				 	"content":content,
				 	"toCid":toCid
				 	
				 },function(data){
					 alert("this  this");
					 var div = $("#commentItems");
					 	var divItem = "<div id='commentItems'>";
					 	alert("test getCommentOrderByNewDate");
						
						for(var i =0;i<data.length;i++){
							
							var comment = data[i]; 
							var oldComment = comment.toComment;
							
							 divItem = divItem + "<div id ='divItem' class='item'><a class='avatar-wrapper'> <img src='img/avatar.gif' alt='"+comment.fromUid+"' class='avatar' /></a><div class='item-wrapper'><div class='helper'><a  class='username' target='_blank'>"+comment.fromUid+"</a><div class='more'><span class='icon-more'> ▼ <span class='more-menu' style='display: none;'> <a href='javascript:void(0);' class='comment-more-item btn-report' rel='nofollow'> <span class='icon-report'></span> <span class='report-status'>举报</span></a></span><input type='hidden' value='"+comment.commentId+"'/></span></div></div><div class='comment-ct'><p class='the-comment'>"+comment.content+"</p></div>";
					 		 if(oldComment!=null){
					 			divItem = divItem +"<!-- 一条评论回复 --><!-- 原评论 开始--><div class='que'><span class='darr'><i class='bd'>◆</i><i class='bg'>◆</i></span><a class='s-fc7' href='#''>"+oldComment.commentId+"</a>："+oldComment.content+"</div><!-- 原评论结束 -->"; 
					 		 }
					 		
					 		 divItem = divItem +"<div class='helper clear-fix'>"+comment.commentDate+"<a class='btn-vote'> <i class='icon-vote'></i> 赞<span>"+comment.likeSum+"</span></a> <input type='hidden' value='"+comment.commentId+"'/><a  class='btn-replay'> <span id='' class='icon-replay'> </span> 回复</a></div><div class='sub-comment' style='display: none;'><span class='arrows'></span><div class='editor-wrapper hide form-comment-at' style='border: 0px;'><input type='hidden' name='topicType' id='topicType' value='hotel' /> <input type='hidden' name='topicId' id='topicId' value='1' /> <input type='hidden' name='fromUid' id= 'fromUid ' value='1' /> <input type='hidden' name='toCid' id='toCid' value='"+comment.commentId+"' /><div class='editor'><textarea name='content' class='editor-comment-at'></textarea></div><div class='toolbar clearfix'><div class='btn-group'><a  class='btn-link btn-action-cancel'>取消</a>	<button	class='btn btn-positive btn-not-ready rounded btn-at-comment-submit'>评论</button></div></div></div></div></div></div>";
						}
					 	
					 	//替换以前的
					 	div.replaceWith(divItem);
				 },"json");
				
				
			});
			
			
			<%-- //点收藏后 likeSum+1
			$("a.btn-action-like").click(function(){
				$.post("addLikeSum.action",{
				 	"hotelId":"<%=hotel.getHotelId()%>"
				 },function(data,status){
					
					 //$("a.icon-fav").css("background-position","0 -80px");
				 },"json");
			}); --%>
	
		});
	</script>
</body>
</html>
