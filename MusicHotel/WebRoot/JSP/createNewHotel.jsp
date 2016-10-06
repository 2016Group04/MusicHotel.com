<%@ page language="java" import="java.util.*,com.po.Hotel,com.po.User" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>创建新的hotel</title>
		<link rel="stylesheet" type="text/css" href="css/createNewHotel.css"/>
		<link rel="stylesheet" type="text/css" href="css/motaiHotel.css"/>
		<link rel="stylesheet" type="text/css" href="js/jQuery-confirm/jquery-confirm.css"/>
		<link rel="stylesheet" type="text/css" href="css/top.css"/>
	</head>
	<body>
	
	<%@include file="top.jsp" %>
	
	<%
		User user = (User)session.getAttribute("user");
		int userId = user.getUserId();
	%>
	<form action="addMyHotel.action?userId=<%=user.getUserId() %>" method="post" enctype="multipart/form-data">
		<div id="hotelMiddle">
		
			<div id="hotelType">
				
				<!-- <a class="typeH">#摇滚</a>
				<a class="typeH">#世界音乐</a> -->
				<div id="hotelT">
				<label class="cc">hotel风格</label>
				<input type="hidden" name="style" id="style" value=""/>
				<div id="style1"><label class="ss">无</label><label class="sc">▼</label></div>
						
						<select class="style1" multiple="multiple" size="7" style="display: none;">
							
							<option>独立音乐</option>
							<option>民谣</option>
							<option>金属</option>
							<option>电子</option>
							<option>流行</option>
							<option>英伦</option>
							<option>后摇</option>
							<option>迷幻</option>
							<option>暗潮</option>
							<option>氛围</option>
							<option>华语</option>
							<option>朋克</option>
							<option>世界音乐</option>
							<option>硬核</option>
							<option>说唱</option>
							<option>爵士</option>
							<option>古典</option>
							<option>摇滚</option>
							<option>原声</option>
							<option>另类</option>
							<option>后朋克</option>
							<option>雷鬼</option>
							<option>乡村</option>
							<option>蓝调</option>
							<option>人声</option>
							<option>品牌</option>
						</select>
						
						<span class="tip">最多选择两种风格哟</span>
					</div>
					
					</div>
				<br class="clear"/>
			</div>
			
			<div id="titleH">
				<span id="no"><a class="noo">标题</a></span>
				<div class="title">
				
				<input type="text" name="title" id="title" value="请输入hotel标题"/>
				</div>
			</div>
			
			<div id="remain">
				<div id="coverImg">
					<img id="cover-img" src="img/hotelCover.jpg" width="640px" height="452px"/>
					<input type="button" name="uploadImg" id="uploadImg" value="上传hotel封面"/>
					
						<input type="file" name="hotelCover" id="hotelCover" style="display:none"/>
						<input type="submit" id="tijiao" style="display:none"/>
				</div>
				<div id="article">
					
					<textarea rows="100" cols="88" id="hotelDesc1">请输入hotel简介</textarea>
					<input type="hidden" name="hotelDesc" id="hotelDesc" value=""/>
				</div>
				<div id="uploadButton">
					<input type="button" name="upload" id="upload" value="保存"/>
					
				</div>
				
				<!--上传歌曲之后显示的地方-->
				<div id="songs" style="display:none">
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
									</div>
								</div>
							</td>
						</tr>
						
					</table>
				</div>
			</div>
			
		</div>
		</form>
		<script src="js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/top.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/jQuery-confirm/jquery-confirm.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			
			$(function  () {
				//点击保存按钮，保存hotel的相关信息
				$("#upload").click(function  () {
					
					//进行判断，是否都写全了，不可空缺
					var style = $("label.ss").text();
					var titile = $("#title").val().trim();
					var file = $("#hotelCover")[0].files[0]; 
					var hotelDesc = $("#hotelDesc1").val();
					
					var userId = <%=userId%>;
					if(style=="无"){
						
						$.alert({
						    title: '',
						    content: '请选择hotel风格',
						    confirm: function(){
						    	
						    }
						});
					}else if(titile==""||titile=="请输入hotel标题"){
						$.alert({
						    title: '',
						    content: '请填写hotel标题',
						    confirm: function(){
						    	
						    }
						});
					}else if(file === null || file === undefined){
						
						
						$.alert({
						    title: '',
						    content: '请选择hotel封面',
						    confirm: function(){
						    	
						    }
						});
					}else if(file.type.indexOf('image') === -1){
						
						$.alert({
						    title: '',
						    content: '请选择正确的图片格式',
						    confirm: function(){
						    	
						    }
						});
						
					}else if(hotelDesc==""||hotelDesc=="请输入hotel简介"){
						
						$.alert({
						    title: '',
						    content: '请填写hotel简介',
						    confirm: function(){
						    	
						    }
						});
						
					}else{
						
						$.post("checkHotelTitle.action",{
							
							"titile":titile
						},function(data){
							
							if(data=="1"){
								$.alert({
								    title: '',
								    content: '该标题已被使用',
								    confirm: function(){
								    	
								    }
								});
							}else{
							
								$.confirm({
									title : '',
									content : 'hotel相关信息一经保存将不得再次修改，是否确认保存？',
									confirm : function() {
										
										//进行保存
										
										$("form").submit();
									},
									cancel : function() {
					
									}
								});
							}
							
						});
						
						
						
					}
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
				
				//选择风格
				$("#style1").click(function  () {
					$("#alertH").hide();
					$("select.style1").show();
					
				});
			
				
				$(document).bind("click", function(e) {
					var target = $(e.target);
					if(target.closest("#hotelT").length == 0) {
						
						$(".style1").hide();
						
						var options = $("select option:selected");
						if(options.length>2){
							
							$.alert({
							    title: '',
							    content: '最多只能选择两种风格',
							    confirm: function(){
							    	
							    }
							});
							
							options.prop("selected",false);
						}else{
							
							console.info(options);
							var s = "";
							for(var i=0;i<options.length;i++){
								if(i==options.length-1){
									
									s = s + options[i].value;
								}else{
									s = s + options[i].value + ",";
								}
								
							}
							if(s!=""){
								$("label.ss").text(s);
								$("#style").val(s);
								console.info($("#style").val());
							}
						}
					}
				});
				
				//上传封面图片
				$("#uploadImg").click(function(){
					$(this).next().click();
				});
				
				$("#hotelCover").change(function(){
					
					var reader = new FileReader();
					var file = $(this)[0].files[0];
					reader.addEventListener("load",function(){
						$("#cover-img")[0].src=reader.result;
					},false);
					
					if(file){
						reader.readAsDataURL(file);
					}
					
					//发送ajax上传图片，返回图片的名字
					$("#uploadImg").val("更改图片");
				});
				
				$("#title").focus(function(){
					if($("#title").val()=="请输入hotel标题"){
						$("#title").val("");
					}
					
				}).blur(function(){
					var titile = $("#title").val().trim();
					if(titile==""){
						
						$("#title").val("请输入hotel标题");
					}else{//标题不为空，则判断是否是已经存在该标题
						
						$.post("checkHotelTitle.action",{
							
							"titile":titile
						},function(data){
							
							if(data=="1"){
								$.alert({
								    title: '',
								    content: '该标题已被使用',
								    confirm: function(){
								    	
								    }
								});
							}
							
						});
					
						
					}
					
				});
				
				$("#hotelDesc1").focus(function(){
					if($("#hotelDesc1").val()=="请输入hotel简介"){
						$("#hotelDesc1").val("");
					}
					
				}).blur(function(){
					if($("#hotelDesc1").val().trim()==""){
						
						$("#hotelDesc1").val("请输入hotel简介");
					}else{
						$("#hotelDesc").val($("#hotelDesc1").val());
					}
				});
			});
			
			function checkTitile(titile){
				$.post("checkHotelTitle.action",{
					
					"titile":titile
				},function(data){
					
					if(data=="1"){
						
					}else{
						
					}
					
				});
			}
		</script>
	</body>
</html>
