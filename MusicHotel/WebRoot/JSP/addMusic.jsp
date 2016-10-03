<%@ page language="java" import="java.util.*,com.po.Hotel" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>创建新的hotel</title>
		<link rel="stylesheet" type="text/css" href="css/addMusic.css"/>
		<link rel="stylesheet" type="text/css" href="js/jQuery-confirm/jquery-confirm.css"/>
	</head>
	<body>
	
	<%
	
		Hotel hotel = (Hotel)request.getAttribute("hotel");
		String[] style = (String[])request.getAttribute("style");
		String[] hotelDesc = (String[])request.getAttribute("hotelDesc");
	%>
		<div id="hotelMiddle">
			<div id="hotelType">
				
				<%
					for(String s:style){
						
						if(s!=null){
							%>
							
							<a class="typeH">#<%=s %></a>
							<%
						}
					}
				%>
				
				<br class="clear"/>
			</div>
			
			<div id="titleH">
				<span id="no"><a class="noo"><%=hotel.getHotelId() %></a></span>
				<div class="title">
					<%=hotel.getTitile() %>
				</div>
			</div>
			
			<div id="remain">
				<div id="coverImg">
					<img src="img/coverImg.jpg"/>
				</div>
				<div id="article">
					<%
						for(String str:hotelDesc){
							
							if(str!=null){
								
								%>
								<p><%=str %></p>
								<br />
								
								<%
								
								
							}
						}
					%>
					
				</div>
				<div id="uploadButton">
					<input type="button" name="upload" id="upload" value="上传歌曲"/>
					<input type="file" name="file1" id="file1" style="display: none;"/>
				</div>
				
				<!--上传歌曲之后显示的地方-->
				<div id="songs">
					<table>
						<tr>
							<th>音乐标题</th>
							<th>歌手</th>
							<th>文件大小</th>
							<th>时长</th>
							<th>操作</th>
						</tr>
						<tr>
							<td class="songName">我很快乐</td>
							<td class="otherTd">刘惜君</td>
							<td class="otherTd">1.74MB</td>
							<td class="otherTd">03:33</td>
							<td class="otherTd"><span class="span1"></span><span class="span2"></span></td>
							
						</tr>
						
						<tr style="display: none;">
							<td colspan="5">
								<div class="details">
									<div class="coverSong">
										<img src="img/coverSong.jpg"/>
									</div>
									
									<div class="lyric">
										<span><a>添加歌词</a></span>
										<input type="file" name="lyrics" style="display: none;"/>
									</div>
								</div>
							</td>
						</tr>
						
						<tr>
							<td class="songName">我很快乐</td>
							<td class="otherTd">刘惜君</td>
							<td class="otherTd">1.74MB</td>
							<td class="otherTd">03:33</td>
							<td class="otherTd"><span class="span1"></span><span class="span2"></span></td>
						</tr>
						<tr style="display: none;">
							<td  colspan="5">
								<div class="details">
									<div class="coverSong">
										<img src="img/coverSong.jpg"/>
									</div>
									
									<div class="lyric">
										<span><a>添加歌词</a></span>
										<input type="file" name="lyric" style="display: none;"/>
									</div>
								</div>
							</td>
						</tr>
						
					</table>
				</div>
			</div>
			
		</div>
		
		<script src="js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/jQuery-confirm/jquery-confirm.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			
			$(function  () {
				
				$("#upload").click(function  () {
					
					$("#file1").click();
				});
				
				$(".lyric>span").click(function  () {
					
					$(this).next().click();
				});
				
				$(".span1").toggle(function  () {
					
					$(this).parent().parent().next("tr").show();
				},function  () {
					$(this).parent().parent().next("tr").hide();
				});
				
				$(".span2").click(function  () {
					
					//删除的逻辑，把该首歌信息删除，同时从数据库中删除
					$.confirm({
						title : ' ',
						content : '确定删除该首歌曲吗？',
						confirm : function() {
							
							
						},
						cancel : function() {
		
						}
					});
				});
			});
		</script>
	</body>
</html>
