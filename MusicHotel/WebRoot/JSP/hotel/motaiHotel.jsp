<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="../css/motaiHotel.css"/>
		<link rel="stylesheet" type="text/css" href="../js/jQuery-confirm/jquery-confirm.css"/>
	</head>
	<body>
		<div id="createHotel">
			<div id="doThing">
				<span class="title1">添加我的hotel</span>
				<span class="closeButton">×</span>
				<div id="alertH" style="display: none;">
					<div id="biao"><img src="../img/alert.jpg" width="20px" height="20px"/></div>
					<div id="textH">请输入hotel标题</div>
				</div>
			</div>
			<div id="hotelMessage">
				<form>
					
					<div id="hotelN">
						<label>hotel标题</label>
						<input type="text" name="hotelName" id="hotelName" maxlength="20"/>
					</div>
					
					<div id="hotelT">
						<label class="cc">hotel风格</label>
						<div id="style1" class="style"><label class="ss">无</label><label class="sc">▼</label></div>
						<select class="style style1" multiple="multiple" size="7" style="display: none;">
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
							<option>其他</option>
						</select>
						
						<span>最多两种风格哟</span>
					</div>
					
					<div id="hotelC">
						<label>hotel简介</label>
						<textarea name="hotelContent" id="hotelContent" rows="7" cols="30" maxlength="200"></textarea>
					</div>
					
					<div id="hotelCov">
						<label>hotel封面</label>
						<input type="text" id="position" value="未选择任何文件" disabled="disabled"><a id="selectButton">请选择</a>
						<input type="file" name="hotelCover" id="hotelCover" style="display: none;"/>
					</div>
					
					<div id="submitHotel">
						<a class="tijiao">提交</a>
						<a class="quxiao">取消</a>
					</div>
				</form>
			</div>
		</div>
		<script src="../js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
		<script src="../js/jQuery-confirm/jquery-confirm.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			$(function  () {
				//选择hotel封面
				$("#selectButton").click(function  () {
					
					$("#hotelCover").click();
				});
				
				
				$("#hotelCover").change(function  () {
					$("#position").val($("#hotelCover").val());
					moveToEnd();
				});
				//关闭按钮
				$("span.closeButton").click(function  () {
					
					$.confirm({
						title : ' ',
						content : '确定放弃创建我的hotel吗？',
						confirm : function() {
							$("#createHotel").hide();
							$("#hotelName").val("");
				 			$("label.ss").text("无");
					        $("#hotelContent").val("");
							$("#position").val("未选择任何文件");
						},
						cancel : function() {
			
						}
					});
				});
				
				//取消按钮
				$("a.quxiao").click(function  () {
					$.confirm({
						title : ' ',
						content : '确定放弃创建我的hotel吗？',
						confirm : function() {
							$("#createHotel").hide();
							$("#hotelName").val("");
				 			$("label.ss").text("无");
					        $("#hotelContent").val("");
							$("#position").val("未选择任何文件");
							
						},
						cancel : function() {
		
						}
					});
				});
				
				$("input").click(function  () {
					$("#alertH").hide();
				});
				
				//选择风格
				$("#style1").click(function  () {
					$("#alertH").hide();
					$("select.style1").css("display","block");
					
				});
			
				
				$(document).bind("click", function(e) {
					var target = $(e.target);
					if(target.closest("#hotelT").length == 0) {
						
						$(".style1").hide();
						
						var options = $("select option:selected");
						
						if(options.length>2){
							
							$("#textH").text("最多两种风格");
							$("#alertH").show();
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
							}
						}
					}
				});
				
				//提交按钮的验证
				$("a.tijiao").click(function  () {
					
					var hotelName = $("#hotelName").val();
					var hotelType = $("label.ss").text();
					var hotelContent = $("#hotelContent").val().trim();
					var hotelCover = $("#position").val();
					
					if(hotelName==""){
						$("#textH").text("请输入hotel标题");
						$("#alertH").show();
					}else if(hotelType=="无"){
						$("#textH").text("请选择hotel风格");
						$("#alertH").show();
					}else if(hotelContent==""){
						$("#textH").text("请输入hotel简介");
						$("#alertH").show();
					}else if(hotelCover==""){
						$("#textH").text("请选择hotel封面");
						$("#alertH").show();
					}else{
						
						//使用ajax对hotel的标题进行验证
						
						//存在就不能创建
						
						//不存在可以创建新的hotel
					}
				});
			
					
				});
				
			
			function moveToEnd () {
				var content = $("#position");
				 content.focus(); 
				 var len = content.value.length;
				 if (document.selection) {  
				  var sel = content.createTextRange();  
				  sel.moveStart('character', len);  
				  sel.collapse();  
				  sel.select(); 
				 } else if (typeof content.selectionStart == 'number' && typeof content.selectionEnd == 'number') {
				  content.selectionStart = content.selectionEnd = len; 
				 }
			}
		</script>
	</body>
</html>
