<%@ page language="java" import="java.util.*,com.po.User,com.po.Music" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>个人主页</title>
		
		<link rel="stylesheet" href="css/bootstrap.css" />
		<link rel="stylesheet" href="js/jQuery-confirm/jquery-confirm.css" />
		<link rel="stylesheet" href="css/user.css" />
		<link rel="stylesheet" type="text/css" href="css/top.css"/>
		
	</head>

	<body>
	<%@include file="top.jsp" %>
	<%
		//User user = (User)session.getAttribute("user");
		List<Music> list = (List<Music>)request.getAttribute("list");
		
	%>
		<div class="container setting" style="min-height: 46px;">
			<!-- uc-head -->
			<div class="uc-head clearfix">
				<div class="avatar-wrapper" id="avatarEditWrapper">
					<img src="img/profile/<%=user.getProfileImg() %>" alt="<%=user.getNickname() %>" class="avatar">
					<a href="javascript:;" rel="nofollow" class="ln-edit-avatar" id="lnEditAvatar" style="display: none;">修改头像</a>
				</div>
				<div class="uinfo">
					<div class="clearfix">
						<h1 class="uname">
				<%=user.getNickname() %>			</h1>
						<p class="join"> <%=user.getSignupDate() %>加入</p>
					</div>

					<div class="sign">
						<div style="display: block;" id="textMood">
						<%
							if(user.getProfileText()==null){
								
								%>
								<span id="txtMoodCt" class="mood-ct" data-editable="true">说两句吧...</span>
								<a class="ln-edit-mood" href="javascript:;" id="lnEditMood">编辑</a>
						</div>

						<div style="display: none;" id="formMood" class="form-mood">
							<form action="http://www.luoo.net/mood/add" method="post" class="form-ajax" callback="add_mood_cback">
								<input type="hidden" value="<%=user.getUserId() %>" id="userId"/>
								<input type="text" id="txtContent" name="content" style="width:355px;" value="" data-value="" maxlength="70"> &nbsp;
								<%
							}else{
								
								
								%>
								
								<span id="txtMoodCt" class="mood-ct" data-editable="true"><%=user.getProfileText() %></span>
								<a class="ln-edit-mood" href="javascript:;" id="lnEditMood">编辑</a>
						</div>

						<div style="display: none;" id="formMood" class="form-mood">
							<form action="javascript:;" method="post" class="form-ajax" callback="add_mood_cback">
								<input type="hidden" value="<%=user.getUserId() %>" ID="userId"/>
								<input type="text" id="txtContent" name="content" style="width:355px;" value="<%=user.getProfileText() %>" data-value="<%=user.getProfileText() %>" maxlength="70"> &nbsp;
								<%
							}
						%>
							
							
								<a href="javascript:;" class="helper" id="lnSaveMood">保存</a>
								<a href="javascript:;" class="helper" id="lnCancleMood">取消</a>
							</form>
						</div>
					</div>
				</div>

				<div class="ainfo">
					<span class="playcnt">已经累计听过<%=user.getListenedSum() %>首音乐。</span>
					
				</div>
			</div>
			<!--/// uc-head end-->

			<!-- /// 我添加的 开始 -->
			<div class="i-upload clearfix">
				<div class="nav rounded  clearfix">
					<span class="retract1"></span>
					<div class="nav-item nav-title">我添加的</div>
					<a href="getMyHotel.action" class="nav-item">音乐馆</a>
					<a href="getMyArticle.action" class="nav-item">文章</a>
				</div>
				<!-- uc-ct -->
				<%-- <div class="uc-ct">

					<!-- /// fav-vols -->
					<div class="fav-vols">
					
						<%
							if(list==null||list.size()==0){
								
								%>
								
								<div class="uc-ct-empty">还没有建造音乐旅馆，
									<a class="try" href="#">尝试一下</a>
								</div>
								<%
							}else{
								
								
								%>
								
								<div class="item-wrapper">
								<%
								Iterator<Hotel> i = list.iterator();
								int j = 1;
								while(i.hasNext()){
									
									Hotel hotel = i.next();
									
									
									if(j%3==1&&j!=1){
										
										%>
										</div>
										<div class="item-wrapper">
										<%
									}
									
									%>
									
									
									<div class="item">
										<a href="http://www.luoo.net/music/561" class="cover-wrapper">
											<img src="img/hotel/<%=hotel.getCoverImg() %>" alt="<%=hotel.getTitle() %>" class="cover rounded">
										</a>
										<a href="http://www.luoo.net/music/561" class="name"><%=hotel.getTitle() %></a>
										<div class="op-bar">
											<span class="time"><%=hotel.getCreateDate() %></span>
		
											<a href="javascript:;" rel="nofollow" class="btn-action-like unfav delete" data-id="<%=hotel.getHotelId() %>" data-type="vol" data-cback="vol_unlike_cback" data-confirm="确定删除该hotel吗？">
												<i class="icon icon-trash"></i> 删除
											</a>
		
											
										</div>
									</div>
									
									<%
									j++;
								}
								
							}
						%>
						

						
							

						</div>
					</div>
					
					
					<div class="paginator">

					</div>

				</div> --%>
				<!--/// uc-ct end -->

			

			<!-- /// 我喜欢的 开始 -->
			<div class="i-like clearfix">
				<div class="nav rounded  clearfix">
					<span class="retract2"></span>
					<div class="nav-item nav-title">我喜欢的</div>
					<a href="javascript:;" class="nav-item actived">音乐</a>
					<a href="getAllUserLiked.action?likeType=hotel" class="nav-item">音乐馆</a>
					<a href="getAllUserLiked.action?likeType=article" class="nav-item">文章</a>
				</div>
				<!-- uc-ct -->
				<div class="uc-ct">

					<!-- fav-singles -->
					<div class="fav-singles" id="luooPlayerPlaylist">
						<%
							if(list==null||list.size()==0){
								
								%>
								
								<div class="uc-ct-empty">暂无收藏</div>
								<%
								
							}else{
								
								
								%>
								
								<ul>
								
								<%
								
								Iterator<Music> i = list.iterator();
								
								while(i.hasNext()){
									
									Music music = i.next();
									
									if(music.getArtist()==null){
										
										%>
										<li class="track-item rounded" id="track16921">
								<div class="track-wrapper clearfix">
									<span class="btn-control btn-play">
											<i class="icon-status-play"></i>
											<i class="icon-status-pause"></i>
										</span>
									<a href="javascript:;" rel="nofollow" class="trackname btn-play">歌曲已被删除</a>
									<span class="artist btn-play"></span>

									<a href="javascript:;" rel="nofollow" class="option icon-info" data-sid="<%=music.getMusicId() %>" style="visibility: hidden;"></a>
									<a href="javascript:;" rel="nofollow" class="option btn-action-share icon-share" data-app="single" data-id="<%=music.getMusicId() %>" data-text="推荐Divokej Bill的歌曲Čmelák" data-img="http://7xkszy.com2.z0.glb.qiniucdn.com/pics/albums/10559/cover.jpg?imageView2/1/w/580/h/580" style="visibility: hidden;">
									</a>

									<a href="javascript:;" rel="nofollow" class="option btn-action-like icon-trash delete" data-id="<%=music.getMusicId() %>" data-type="single" data-cback="unlike_cback" data-confirm="确定取消收藏该歌曲吗？" style="visibility: hidden;"></a>

									
								</div>
								<div class="track-detail-wrapper" id="trackDetailWrapper16921">
									<div class="track-detail-arrow">
										<img src="http://s.luoo.net/img/trian.png">
									</div>
									<div class="track-detail rounded clearfix">
										<div class="player-wrapper">
											<img src="img/not-found-img.jpg" alt="原文内容已被删除" class="cover rounded">
											
										</div>
										
									</div>
								</div>
								<!--track-detail-wrapper end-->
							</li>
										
										<%
									}else{
									
									%>
									
									<li class="track-item rounded" id="track16921">
								<div class="track-wrapper clearfix">
									<span class="btn-control btn-play">
											<i class="icon-status-play"></i>
											<i class="icon-status-pause"></i>
										</span>
									<a href="javascript:;" rel="nofollow" class="trackname btn-play"><%=music.getTitle() %></a>
									<span class="artist btn-play"><%=music.getArtist() %></span>

									<a href="javascript:;" rel="nofollow" class="option icon-info" data-sid="<%=music.getMusicId() %>" style="visibility: hidden;"></a>
									<a href="javascript:;" rel="nofollow" class="option btn-action-share icon-share" data-app="single" data-id="<%=music.getMusicId() %>" data-text="推荐Divokej Bill的歌曲Čmelák" data-img="http://7xkszy.com2.z0.glb.qiniucdn.com/pics/albums/10559/cover.jpg?imageView2/1/w/580/h/580" style="visibility: hidden;">
									</a>

									<a href="javascript:;" rel="nofollow" class="option btn-action-like icon-trash delete" data-id="<%=music.getMusicId() %>" data-type="single" data-cback="unlike_cback" data-confirm="确定取消收藏该歌曲吗？" style="visibility: hidden;"></a>

									<div class="duration">
										<audio src="/music/<%=music.getPath() %>" preload="preload">
										Your browser does not support the audio tag.
										</audio>
									</div>
								</div>
								<div class="track-detail-wrapper" id="trackDetailWrapper16921">
									<div class="track-detail-arrow">
										<img src="http://s.luoo.net/img/trian.png">
									</div>
									<div class="track-detail rounded clearfix">
										<div class="player-wrapper">
											<img src="<%=music.getCoverImg() %>" alt="Divokej Bill" class="cover rounded">
											<p class="name">
												<a href="http://www.luoo.net/single/16921" target="_blank"><%=music.getTitle() %></a>
											</p>
											<p class="artist">艺人：<%=music.getArtist() %></p>
											<p class="album">专辑：Divokej Bill</p>
											<!-- <div class="progress rounded">
												<div class="loaded rounded" style="width: 100%;">
													<div class="escaped rounded" style="width: 0%;"></div>
												</div>
											</div> -->
											<!-- <div class="duration">
												
											</div> -->
											<div class="player-btns">
												<!-- <a rel="nofollow" class="player-btn player-ctl icon-detail-play"></a> -->

												<!-- <a rel="nofollow" class="player-btn btn-action-like icon-faved" data-id="16921" data-type="single" data-cback="unlike_cback" data-confirm="确定取消收藏该歌曲吗？" style="visibility: visible;"></a> -->

												<!-- <a rel="nofollow" class="player-btn btn-action-share icon-share delete" data-app="vol" data-id="16921" data-text="推荐Divokej Bill的歌曲Čmelák（分享自@落网）"></a> -->
											</div>
										</div>
										<div class="lyric-wrapper">
											<div class="lyric-content">
												<div class="single-report">
													<a href="javascript:;" class="icon-single-report btn-single-report" data-sname="Čmelák" data-sid="16921">报错</a>
												</div>
												<p style="margin: 60px auto; text-align: center;">
													<a href="javascript:;" class="btn btn-positive btn-add-lyric" data-sid="16921">添加歌词</a>
												</p>
											</div>
										</div>
										<audio src="music/<%=music.getPath() %>" class="music-audio" controls="controls" loop="loop" style="display: block;">亲 您的浏览器不支持html5的audio标签</audio>
									</div>
								</div>
								<!--track-detail-wrapper end-->
							</li>
									<%
									}
								}
							}
						%>
						
						
						
							
							
						</ul>
					</div>

					<!-- ///fav-hotels -->

					<div class="fav-vols" style="display:none">

						<div class="uc-ct-empty">暂无收藏</div>

						<div class="item-wrapper">
							<div class="item">
								<a href="http://www.luoo.net/music/561" class="cover-wrapper">
									<img src="http://7xkszy.com2.z0.glb.qiniucdn.com/pics/vol/52c14db094079.jpg?imageView2/1/w/640/h/452" alt="暮冬重生" class="cover rounded">
								</a>
								<a href="http://www.luoo.net/music/561" class="name">暮冬重生</a>
								<div class="op-bar">
									<span class="time">2014-09-27</span>

									<a href="javascript:;" rel="nofollow" class="btn-action-like unfav" data-id="574" data-type="vol" data-cback="vol_unlike_cback" data-confirm="确定取消收藏该期刊吗？">
										<i class="icon icon-trash"></i> 删除
									</a>

									
								</div>
							</div>

						</div>
					</div>
					<!--///fav-essays  -->
					<div class="fav-essays" style="display:none">
						<div class="uc-ct-empty" style="display: block;">暂无收藏</div>
						<div class="item">
							<div class="clearfix">
								<a href="http://www.luoo.net/essay/779" class="cover-wrapper">
									<img src="http://7xkszy.com2.z0.glb.qiniucdn.com//library/201609/FjRjn0Bm6ydMk4vX85v9RsuxDVfy.jpg" alt="赵雷：生活是我储存灵感的粮仓" class="cover">
								</a>
								<div class="item-ct">
									<a href="http://www.luoo.net/essay/779" class="title">赵雷：生活是我储存灵感的粮仓</a>
									<p class="subscribe">每个人都有属于自己的表达方式，我的渠道是：歌曲。所以我的歌是内心所想。</p>
								</div>
							</div>
							<div class="clearfix">
								<span class="time">2016-09-25 / 15:55:15</span>

								<a href="javascript:;" rel="nofollow" class="unfav btn-action-like btn-unfav" data-id="779" data-type="essay" data-cback="vol_unlike_cback" data-confirm="确定取消收藏该文章吗？">
									<i class="icon icon-trash"></i>
								</a>
								<a href="javascript:;" rel="nofollow" class="share btn-action-share" data-app="vol" data-id="779" data-text="这篇文章值得一读【赵雷：生活是我储存灵感的粮仓 】（分享自@落网）" data-img="http://7xkszy.com2.z0.glb.qiniucdn.com//library/201609/FjRjn0Bm6ydMk4vX85v9RsuxDVfy.jpg">
									<i class="icon icon-share"></i>
								</a>
							</div>
						</div>
					</div>

					<div class="paginator">
					</div>

				</div>
				<!--/// uc-ct end -->
			</div>
			<!-- /// 我喜欢的 结束 -->
		</div>

		<script type="text/javascript" src="js/jquery-2.1.4.js"></script>
		<script src="js/top.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="js/bootstrap.js"></script>
		<script type="text/javascript" src="js/jQuery-confirm/jquery-confirm.js"></script>
		<script type="text/javascript">
			$(function() {

				$(".i-upload .nav a.nav-item").click(function() {
					$(".i-upload .nav .nav-item").removeClass("actived");
					$(this).addClass("actived");
				});

				$(".i-like .nav a.nav-item").click(function() {
					$(".i-like .nav .nav-item").removeClass("actived");
					$(this).addClass("actived");
				});

				$(".track-item").hover(function() {
						$(this).find("a.option").css("visibility", "visible");
					},
					function() {
						$(this).find("a.option").css("visibility", "hidden");
					}
				);

				$(".icon-info").click(function() {
					$(this).parent().next().toggle();
				});
				
				$("#avatarEditWrapper").mouseover(function  () {
					
					$("#lnEditAvatar").show();
				}).mouseout(function  () {
					
					$("#lnEditAvatar").hide();
				});
				
				$(".retract2").click(function  () {
					
				
					$(this).parent().next().toggle("slow");
				});
				
				//点击保存按钮保存签名的修改
				$("#lnSaveMood").click(function(){
					var userId = $("#userId").val();
					//判断输入的是不是空
					var value = $("#txtContent").val();
					if(value.trim()!=""){
						$("#formMood").hide();
						$("#txtMoodCt").text(value);
						$("#textMood").show();
						$.post("updateUserProfileText.action",{
							"userId":userId,
							"profileContent":value
						});
					}else{
					}
					
				});
				
				$("a.delete").click(function(){
					
					var id = $(this).data("id");
					//这里需要提示用户是不是真的要删除该hotel
					
					$.confirm({
						title : ' ',
						content : '确定取消收藏该首歌曲吗？',
						confirm : function() {
							location.assign("deleteUserLike.action?id="+id+"&likeType=music");
						},
						cancel : function() {
		
						}
					});	
						
					
				});
			});

			$("#lnEditMood").click(function() {
				$("#formMood").css("display", "block");
				$("#textMood").css("display", "none");
				$("#txtContent").select();
			});

			$("#lnCancleMood").click(function() {
				$("#formMood").css("display", "none");
				$("#textMood").css("display", "block");
			});
		</script>
	</body>

</html>