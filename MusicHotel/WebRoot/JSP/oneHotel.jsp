<%@ page language="java" import="java.util.*,com.po.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>期刊首页阿卡贝拉</title>
<link rel="stylesheet" type="text/css" href="css/kaitoujiewei.css" />
<link rel="stylesheet" href="css/stylesheets/style.css">


<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">


</head>

<body>
<%
	User user = (User)session.getAttribute("user");
	if(user==null){
		
		user = new User();
		user.setUserId(0);
	}
%>
	<input type="hidden" id="userId" value="<%=user.getUserId()%>"/>
	<div class="container-all">
		<div class="container container-left">
			<!--返回期刊首页-->
			<div>
				<div class="vol vol-meta">
					<a class="nav-block"> <i class="icon-block">&lt;</i> 返回期刊首页
					</a> <a class="item">#流行</a> <a class="item">#原声</a>
				</div>
				<!--
            	作者：1181613079@qq.com
            	时间：2016-09-17
            	描述：期刊首页图片简介开始
            -->
				<div class="name">
					<span class="number"> 685 </span> <span class="title"> 阿卡贝拉
					</span>
				</div>
				<div class="wrapper">
					<img src="img/54ad6b08d34be.jpg" alt="阿卡贝拉" class="cover"> <a
						href="" class="nav-prev" title="前一期">&nbsp;</a> <a href=""
						class="nav-next" title="后一期">&nbsp;</a>
				</div>
				<div class="desc">
					本期音乐为Acapella（无伴奏合唱）音乐专题。这种音乐源自中世纪的教会音乐，当时的教会音乐只以人声清唱，并不应用乐器。<br>
					<br>
					虽然Acapella的演唱者们技艺超人，但是目前世面上的绝大部分Acapella作品大多以翻唱为主，这未免是一种缺憾。本期最后一首虽然是清唱，但非Acapella风格。另外这期音乐专题总让人想到林嗣环写的《口技》：
					<br> <br>
					京中有善口技者。会宾客大宴，于厅事之东北角，施八尺屏障，口技人坐屏障中，一桌、一椅、一扇、一抚尺而已。众宾团坐。少顷，但闻屏障中抚尺二下，满堂寂然，无敢哗者。
					<br>
					遥遥闻深巷中犬吠，便有妇人惊觉欠伸，摇其夫语猥亵事，夫呓语，初不甚应，妇摇之不止，则二人语渐间杂，床又从中戛戛。既而儿醒，大啼。夫令妇抚儿乳，儿含乳啼，妇拍而呜之。夫起溺，妇亦抱儿起溺，床上又一大儿醒，狺狺不止。当是时，妇手拍儿声，口中呜声，儿含乳啼声，大儿初醒声，床声，夫叱大儿声，溺瓶中声，溺桶中声，一齐凑发，众妙毕备。满座宾客无不伸颈，侧目，微笑，嘿叹，以为妙绝也。
					<br>
					既而夫上床寝，妇又呼大儿溺，毕，都上床寝。小儿亦渐欲睡。夫茀声起，妇拍儿亦渐拍渐止。微闻有鼠作作索索，盆器倾侧，妇梦中咳嗽之声。宾客意少舒，稍稍正坐。
					<br>
					忽一人大呼：“火起！”夫起大呼，妇亦起大呼。两儿齐哭。俄而百千人大呼，百千儿哭，百千狗吠。中间力拉崩倒之声，火爆声，呼呼风声，百千齐作；又夹百千求救声，曳屋许许声，抢夺声，泼水声。凡所应有，无所不有。虽人有百手，手有百指，不能指其一端；人有百口，口有百舌，不能名其一处也。于是宾客无不变色离席，奋袖出臂，两股战战，几欲先走。
					<br> 而忽然抚尺一下，群响毕绝。撤屏视之，一人、一桌、一椅、一扇、一抚尺如故。
				</div>

			</div>

		</div>

		<div class="container container-right">

			<div class="clearfix vol-meta">

				<img src="img/u50001445339175.png" alt="落在低处"
					class="author-avatar rounded"> <a class="vol-author" href=""
					target="_blank">落在低处</a> <span class="separator fleft">・</span> <span
					class="vol-date">2015-01-08</span> <a href="javascript:;"
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
			<div class=comment-wrwrapper>
				<h3 class="volcount">
					评论<small id="volcount">999</small>
				</h3>
				<div class="comment-editor">
					<a class="avatar-wrapper"> <img src="img/avatar.gif" alt=""
						class="avatar">

					</a>

					<div class="editor-wrapper">
						<form id="commentform" action="addComment.action" method="post">
							<input type="hidden" name="topicType" value="hotel" /> <input
								type="hidden" name="topicId" value="1" /> <input type="hidden"
								name="fromUid" value="1" />

							<div class="from-editor">
								<textarea name="content"></textarea>
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
								<input type="submit"
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
							<div class="item">
								<a class="avatar-wrapper"> <img src="img/avatar.gif"
									alt="${comment.fromUid}" class="avatar" />
								</a>
								<div class="item-wrapper">
									<div class="helper">
										<a href="" class="username" target="_blank">${comment.fromUid}</a>
										<div class="more">
											<span class="icon-more"> ▼ <span class="more-menu"
												style="display: none;"> <a href="javascript:void(0);"
													class="comment-more-item btn-report" rel="nofollow"> <span
														class="icon-report"></span> <span class="report-status">
															举报</span>
												</a>
											</span>
											</span>

										</div>
									</div>
									<div class="comment-ct">
										<p class="the-comment">${comment.content}</p>

									</div>
									<div class="helper clear-fix">
										${comment.commentDate}<a class="btn-vote"> <i class="icon-vote"></i>
											<span> 赞 </span>

										</a> <a href="" class="btn-replay"> <span id=""
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
	</div>

	<script src="js/jquery-3.1.0.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/jquery-1.7.2.min.js"></script>
	<script src="js/jquery-ui-1.8.17.custom.min.js"></script>
	<!-- <script src="js/script.js"></script> -->
	<script type="text/javascript">
		$(function() {
			//页面加载完毕就发送ajax请求
			$.post("getAllMusic.action",{
				//这里传hoteId
				"hotelId":92
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
							title: data[i].titile,
							artist:data[i].artist ,
							album: data[i].titile,
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
						alert("是这里把应该是");
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
						
						//把心变成红色
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
							"id":92,
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
							"id":92,
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
				"id":92,
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
				//$("div.sub-comment").hide();
				$(this).parent("div").next().hide();
			});
			/*举报框的显示和隐藏*/

			$("span.icon-more").mouseover(function() {
				$(this).children("span").show();
			});
			$("span.icon-more").mouseout(function() {
				$(this).children("span").hide();
			});
			/*显示当前发布时间*/
			
			//查询最新评论
			$("#new").click(function(){
				location.assign("getCommentOrderByDate.action");
			});
			
			//查询热门评论
			$("#hot").click(function(){
				
				//location.assign("getCommentOrderByLikeSum.action");
				 $.post("getCommentOrderByLikeSum.action",{
					 	"action":"getCommentOrderByLikeSum",
					 	
					 },function(data,status){
					 	//使用dom技术来更新 创建出一个 二级产品种类的下来列表框 把以前的替换
					 	var divItem = null;
					 	
					 	for(var i =0;i<data.length;i++){
					 		 divItem = "<div class='item'><a class='avatar-wrapper'> <img src='img/avatar.gif' alt='"+data[i].fromUid+"' class='avatar' /></a><div class='item-wrapper'><div class='helper'><a  class='username' target='_blank'>"+data[i].fromUid+"</a><div class='more'><span class='icon-more'> ▼ <span class='more-menu' style='display: none;'> <a href='javascript:void(0);' class='comment-more-item btn-report' rel='nofollow'> <span class='icon-report'></span> <span class='report-status'>举报</span></a></span></span></div></div><div class='comment-ct'><p class='the-comment'>"+data[i].content+"</p></div><div class='helper clear-fix'>"+data[i].commentDate+"<a class='btn-vote'> <i class='icon-vote'></i>	<span> 赞 </span></a> <a  class='btn-replay'> <span id='' class='icon-replay'> </span> 回复</a></div><div class='sub-comment' style='display: none;'><span class='arrows'></span><form action='' class='editor-wrapper hide form-comment-at' style='border: 0px;'><div class='editor'><textarea name='content' class='editor-comment-at'></textarea></div><div class='toolbar clearfix'><div class='btn-group'><a  class='btn-link btn-action-cancel'>取消</a>	<button	class='btn btn-positive btn-not-ready rounded btn-at-comment-submit'>评论</button></div></div></form></div></div></div>";

					 	}
					 	
					 	//替换以前的
					 	$("#hot").replaceWith(divItem);
					 },"json");
			});
			//
		});
	</script>
</body>
</html>
