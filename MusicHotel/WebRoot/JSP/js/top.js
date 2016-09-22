;
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
					}else if(checkAuth(authR)=="0"){//进行验证码的比较，是不是相等
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
						//发送ajax  验证该昵称是否已被注册
						$.post("checkAccount.action",{
							"account":accountR
						},function(data,status){
						
							alert(data + "1：该昵称已被使用  0：没有使用，可以注册");
							if(data=="1"){
								
								$("#Registe").text("该昵称已存在");
								$("#Registe").removeClass("Registe").addClass("null");
							}else{
								alert("submit");
							}
						});
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
		    	
		    	$.post("checkAuth.action",{
		    		"auth":(""+authR)
		    	},function(data,status){
		    		alert(data+"---0：错误，1：正确");
		    		return data;
		    	},"text");
		    }