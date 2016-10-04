<%@ page language="java" import="java.util.*,com.po.Hotel"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>创建新的hotel</title>
<link rel="stylesheet" type="text/css" href="css/addMusic.css" />
<link rel="stylesheet" type="text/css"
	href="js/jQuery-confirm/jquery-confirm.css" />
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

			<br class="clear" />
		</div>

		<form id='musicForm' style='display:none' enctype="multipart/form-data">
						<input type='hidden' name='hotelId' id='hotelId' value='<%=hotel.getHotelId() %>'/>
						<input type='hidden' name='title' id='title'/>
						<input type='hidden' name='album' id='album'/>
						<input type='hidden' name='artist' id='artist'/>
						<input type='hidden' name='genre' id='genre'/>
						<input type='hidden' name='coverImg' id='imgM'/>
		</form>

		<div id="titleH">
			<span id="no"><a class="noo"><%=hotel.getHotelId() %></a></span>
			<div class="title">
				<%=hotel.getTitile() %>
			</div>
		</div>

		<div id="remain">
			<div id="coverImg">
				<img src="img/hotel/coverImg/<%=hotel.getCoverImg()%>" width="640px"
					height="452px" />
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
				<input type="button" name="upload" id="upload" value="上传歌曲" /> <input
					type="file" name="file1" id="file1" style="display: none;" /> <input
					type="button" name="Submit" id="Submit" value="提交"
					style="display: none;" />
			</div>
			<!-- 这是上传音乐文件的form -->
			<!--上传歌曲之后显示的地方-->

			<div id="songs">
				<table>
					<tr id="tt">
						<th>音乐标题</th>
						<th>歌手</th>
						<th>专辑</th>
						<th>风格</th>
						<th>操作</th>
					</tr>
					<%-- <form action="addMusic.action?hotelId=<%=hotel.getHotelId() %>" method="post" enctype="multipart/form-data"> --%>
					<!-- <tr>
							<td class="songName">我很快乐</td><input type='hidden' name='titile' id='titile'/>
							<td class="otherTd">刘惜君</td><input type="hidden" name="artist" id="artist"/>
							<td class="otherTd">1.74MB</td><input type="hidden" name="artist" id="artist"/>
							<td class="otherTd">03:33</td>
							<td class="otherTd"><span class="span1"></span><span class="span2"></span></td>
							
						</tr>
						
						<tr style="display: none;">
							<td colspan="5">
								<div class="details">
									<div class="coverSong">
										<img src="img/coverSong.jpg"  id="music-cover"/>
									</div>
									
									<div class="lyric">
										<span><a>添加歌词</a></span>
										<input type="file" name="lyrics" style="display: none;"/>
									</div>
									
									
								</div>
							</td>
						</tr>
						</form> -->

					

				</table>
			</div>


		</div>

	</div>

	<script src="js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/jQuery-confirm/jquery-confirm.js"
		type="text/javascript" charset="utf-8"></script>
	<script src="js/jquery.form.js"
		type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
			
			$(function  () {
				//提交按钮
				$("#Submit").click(function(){
					
					$.confirm({
						title : '',
						content : '确定提交该hotel吗？',
						confirm : function() {
							
							
						},
						cancel : function() {
						
						}
					});
				});
				
				$("#upload").click(function  () {
					
					$("#file1:first").click();
				});
				
				$("body").on("click",".lyric>span",function  () {
					
					$(this).next().click();
				});
				
				$("#file1").change(function(){
					
					alert("this this");
					var input1 = $(this);
					//克隆一个input
					
					var input2 = $(this).clone();
					
					
					
					
					var insertT = $("<tr><td class='songName' id='music-title'></td><td class='otherTd' id='music-artist'></td><td class='otherTd' id='music-album'></td><td class='otherTd' id='music-genre'></td><td class='otherTd'><span class='span1'></span><span class='span2'></span></td></tr><tr style='display: none;'><td colspan='5'><div class='details'><div class='coverSong'><img src='img/coverSong.jpg'  id='music-cover'/></div><div class='lyric'><span><a>添加歌词</a></span><input type='file' name='lyrics' style='display: none;'/></div></div></td></tr>")
					
					
					$("#songs table tr#tt").after(insertT);
					$("form input[type=file]").remove();
					input1.insertAfter($("form input:last"));
					$("#songs table tr#tt").after(input2);
					loadFile(input1[0]);
					
					//发送ajax对相应的表单进行提交,返回相应的id来进行填充
					
					 $("#musicForm").ajaxSubmit({  
			            url : "addMusic.action",  
			            type : "post",  
			            dataType : 'json',  
			            success : function(data) {  
			                alert("设置成功！");  
			            },  
			            error : function(data) {  
			                alert("error:");  
			            }  
			        });  
					
					/* var form = new FormData($("#musicForm"));
					
					 $.ajax({
			                url:"${pageContext.request.contextPath}/JSP/addMusic.action",
			                type:"post",
			                data:form,
			                processData:false,
			                contentType:false,
			                success:function(data){
			                   alert("success");
			                },
			                error:function(e){
			                    alert("错误！！");
			                   
			                }
			            });    */
					
					/* $.ajax({
		                cache: true,
		                type: "POST",
		                url:"addMusic.action",
		                data:$('#musicForm:first').serialize(),// 你的formid
		                async: false,
		                error: function(request) {
		                    alert("Connection error");
		                },
		                success: function(data) {
		                   alert("success");
		                }
           			 }); */
						
					//当这个input的值改变的时候,表示选择了音乐文件进行上传
					$("#upload").val("继续上传");
					
					$("#Submit").show();
					
				});
				
				var tag = 1;//表示该div隐藏
				$("body").on("click",".span1",function(){
					if(tag==1){
						$(this).parent().parent().next("tr").show();
						tag = 0;
					}else{
						$(this).parent().parent().next("tr").hide();
						tag = 1;
					}
				});
				
				/* $(".span1").toggle(function  () {
					
					$(this).parent().parent().next("tr").show();
				},function  () {
					$(this).parent().parent().next("tr").hide();
				}); */
				
				$("body").on("click",".span2",function(){
					//删除的逻辑，把该首歌信息删除
					var span2 = $(this);
					$.confirm({
						title : '',
						content : '确定删除该首歌曲吗？',
						confirm : function() {
							
							span2.parent().parent().next().next().remove();
							span2.parent().parent().next().remove();
							span2.parent().parent().remove();
						},
						cancel : function() {
						
						}
					});
				});
				
				/* $(".span2").click(function  () {
					
					//删除的逻辑，把该首歌信息删除，同时从数据库中删除
					$.confirm({
						title : ' ',
						content : '确定删除该首歌曲吗？',
						confirm : function() {
							
							
						},
						cancel : function() {
		
						}
					});
				}); */
			});
		</script>

	<!--
        	作者：yueyi14@hotmail.com
        	时间：2016-10-02
        	描述：获取音乐文件的内嵌信息
        -->
	<script type="text/javascript"
		src="admin/js/ID3-Reader-master/dist/id3-minimized.js"></script>
	<script type="text/vbscript">
			Function IEBinary_getByteAt(strBinary, iOffset) IEBinary_getByteAt = AscB(MidB(strBinary,iOffset+1,1)) End Function Function IEBinary_getLength(strBinary) IEBinary_getLength = LenB(strBinary) End Function
		</script>
	<script>
			/**
			 * Loading the tags using XHR.
			 */
			//sample.mp3 sits on your domain
			ID3.loadTags("sample.mp3", function() {
				showTags("sample.mp3");
			}, {
				tags: ["title", "artist", "album", "track", "genre", "picture", "lyrics"]
			});

			/**
			 * Loading the tags using the FileAPI.
			 */
			function loadFile(input) {
				var file = input.files[0],
					url = file.urn || file.name;

				ID3.loadTags(url, function() {
					showTags(url);
				}, {
					tags: ["title", "artist", "album", "track", "genre", "picture", "lyrics"],
					dataReader: ID3.FileAPIReader(file)
				});
			}

			/**
			 * Generic function to get the tags after they have been loaded.
			 */
			function showTags(url) {
				var tags = ID3.getAllTags(url);
				console.log(tags);
				document.getElementById('music-title').textContent = tags.title || "-";
				document.getElementById('music-artist').textContent = tags.artist || "-";
				document.getElementById('music-album').textContent = tags.album || "-";
				
				document.getElementById('music-genre').textContent = tags.genre || "-";
				$("#title:first")[0].value = tags.title || "-";
				$("#artist:first")[0].value = tags.artist || "-";
				$("#album:first")[0].value = tags.album || "-";
				$("#genre:first")[0].value = tags.genre || "-";
				/* if(document.getElementById('music-lyric').textContent != undefined){
				 	document.getElementById('music-lyric').textContent	= tags.lyrics
				 }else{
				 	document.getElementById('music-lyric').textContent = "暂无歌词";
				 }*/

				var image = tags.picture;
				if(image) {
					var base64String = "";
					for(var i = 0; i < image.data.length; i++) {
						base64String += String.fromCharCode(image.data[i]);
					}
					var base64 = "data:" + image.format + ";base64," +
						window.btoa(base64String);
					document.getElementById('music-cover').setAttribute('src', base64);
					$("#imgM:first")[0].value = base64;
				} else {
					document.getElementById('music-cover').setAttribute('src', 'img/icon-add-1.jpg');
				}
			}
		</script>
</body>
</html>
