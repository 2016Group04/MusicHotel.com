<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>新建文章</title>
		<link rel="stylesheet" type="text/css" href="js/bootstrap-wysihtml5/bootstrap-wysihtml5.css" />
		<link href="../css/style.css" rel="stylesheet">
		<link href="../css/style-responsive.css" rel="stylesheet">

		<style type="text/css">
			a.btn-file {
				display: inline-block;
				width: 550px;
				height: 40px;
				line-height: 30px;
				position: relative;
				overflow: hidden;
				border: solid #ccc 1px;
			}
			
			img {
				overflow: hidden;
			}
			
			input.bootstrap-wysihtml5-insert-image-url {
				position: absolute;
				right: 0;
				top: 0;
				font-size: 100px;
				opacity: 0;
				filter: alpha(opacity=0);
			}
			
			.wysihtml5-sandbox {
				height: 400px !important;
			}
			
			.fileupload .fileupload-btn,
			.cover-img-input {
				font-size: 16px;
			}
			
			.fileupload {
				margin-top: 10px;
			}
			
			.fileupload .file-source1 {
				width: 430px;
				display: inline-block;
				padding-top: 50px;
				padding-left: 150px;
				padding-bottom: 50px;
			}
			
			.fileupload .file-source2 {
				
				display: inline-block;
				padding-top: 50px;
				padding-left: 50px;
				padding-bottom: 50px;
			}
			
			.cover-img-input,
			.article-music-input {
				width: 0;
				height: 0;
				opacity: 0;
			}
			
			.cover-img {
				margin: auto;
			}
			
			.music-upload-panel {
				padding-left: 20px;
			}
			
			.col-md-9 {
				    border-bottom: 1px dotted rgba(0, 0, 0, 0.2);
				width: 100%;
				display: inline-block;
			}
			
			table th,
			table td {
				white-space: nowrap;
				overflow: hidden;
				text-overflow: ellipsis;
				height: 30px;
				line-height: 20px;
				width: 150px;
				text-align: center;
			}
			
			.details {
				width: 600px;
				float: right;
				border: 1px gainsboro solid;
				border-radius: 3px;
				margin-right: 60px;
			}
			
			.coverSong,
			.lyric {
				display: inline-block;
			}
			
			.coverSong {
				position: relative;
				width: 200px;
				top: -90px;
			}
			
			.coverSong img {
				width: 180px;
				height: 180px;
				border-radius: 5px;
			}
			
			.music-audio {
				width: 100%;
			}
			
			.lyric {
				
				width: 380px;
			}
			
			.lyric>span>a {
				position: relative;
				top: 5px;
			}
			
			input {
				outline: none;
			}
			
			.lyric>span {
				position: absolute;
				display: inline-block;
				bottom: 10px;
				right: 10px;
				width: 75px;
				height: 30px;
				text-align: center;
				line-height: 30px;
				background-color: #DD5862;
				color: #fff;
				font: 13px Verdana, 微软雅黑, 'Microsoft YaHei', Helvetica, Arial;
				border-radius: 5px;
				cursor: pointer;
			}
			
			.file-source {
				height: 34px;
			}
			
			.lyric {
				position: relative;
			}
			
			#music-lyrics {
				float: right;
				margin-top: 10px;
				width: 100%;
				height: 200px;
				outline: none;
				border: none;
				overflow: hidden;
				resize: none;
				text-align: center;
			}
			
			.details .d1 {
					height: 220px;
			}
		</style>
	</head>

	<body style="background: #eff0f4;" class="sticky-header">
		<!-- page heading start-->
		<div class="page-heading">
			<h3>
                新建文章
            </h3>
			<ul class="breadcrumb">
				<li>
					<lable>文章管理</lable>
				</li>
				<li class="active">
					<lable> 新建文章</lable>
				</li>
			</ul>
		</div>
		<!-- page heading end-->

		<div class="wrapper">

			<!--封面板开始-->
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="article-title-h4">封面和音乐</h4></div>

				<div class="panel-body">
					<div class="form-group last">
						<div class="col-md-9">
							<div class="fileupload fileupload-new" data-provides="fileupload">
								<div class="fileupload-new thumbnail" style="width: 600px; max-width: 800px;height: 300px;float: right; padding: 10px 20px;margin-right: 60px;">
									<img class="cover-img" src="img/cover/cover_image_upload.png" alt="封面图片" style=" max-height: 282px; margin: 0px auto">
								</div>
								<div class="file-source1">
									<a href="javascript:;" class="btn btn-primary fileupload-btn cover-upload-btn" data-dismiss="fileupload"> 选择图片</a>
									<input class="cover-img-input" type="file" name="article-cover">
									<br />
									<span class="label label-info">提示</span>
									<span>封面图片建议尺寸: 640px*452px</span>
								</div>

							</div>

						</div>

						<!--上传音乐 开始-->
						<div class="music-upload-panel">
							<div class="fileupload fileupload-new" data-provides="fileupload">
								<div class="fileupload-new thumbnail">

									<table class="table  table-hover general-table">
										<thead>
											<tr>
												<th> 音乐标题</th>
												<th>歌手</th>
												<th>专辑</th>
												<th>音轨</th>
												<th>类型</th>
											</tr>
										</thead>
										<tbody>

											<tr>
												<td id="music-title">-</td>
												<td id="music-artist">-</td>
												<td id="music-album">-</td>
												<td id="music-year">-</td>
												<td id="music-genre">-</td>
											</tr>
											<tr>
												<td colspan="5">
													<div class="file-source2">
														<div style="float: left;">
															<a href="javascript:;" class="btn btn-primary fileupload-btn music-upload-btn pull-left" data-dismiss="fileupload" onclick="loadFile(this);" style="color: white;"> 选择音乐</a>&nbsp;&nbsp;&nbsp;&nbsp;
															<input class=" music-upload-input article-music-input" type="file" />
														</div>
														<br/><br/><br/>
														<div style="float: left;">

															<span class="label label-info">提示</span>
															<span>建议格式: MP3、AAC、OGG</span>
														</div>

													</div>
													<div class="details">
														<div class="d1">
														<div class="coverSong">
															<img id="music-cover" class="music-cover" src="img/cover/cover_image_upload.png">
														</div>

														<div class="lyric">

															<span class="lyric-btn"><a style="color: white;">添加歌词</a></span>
															<textarea name="lyric" id="music-lyrics">暂无歌词</textarea>
															<input type="file" name="lyrics" style="display: none;">

														</div>
														</div>
														<div>
															<audio src="" class="music-audio" controls="controls" loop="loop" style="display: block;">亲 您的浏览器不支持html5的audio标签</audio>
														</div>

													</div>
												</td>
											</tr>
										</tbody>
									</table>

								</div>

							</div>

						</div>
						<!--上传音乐 结束-->
					</div>
				</div>
			</div>

			<!--封面图片面板结束-->
			<!--编辑器开始-->
			<div class="row">
				<div class="col-md-12">
					<section class="panel panel-default">
						<div class="panel-heading">
					<h4 class="article-title-h4">文章内容</h4></div>
						<header class="article-title">
							<input name="title" class="article-title form-control" value="在此输入文章标题" style="font-size: 18px;height: 40px;" />

						</header>
						<div class="panel-body">
							<form action="#" class="form-horizontal ">
								<div class="form-group">
									<div class="col-md-12">
										<textarea class="wysihtml5 form-control" rows="9"></textarea>
									</div>
								</div>
							</form>
						</div>
					</section>
				</div>
			</div>
			<!--编辑器结束-->
			
			<div class="row">
                        <div class="col-md-12">
                            <div class="panel">
                                <form>
                                    <textarea class="form-control input-lg p-text-area" rows="6" placeholder="在此输入文章的简述。"></textarea>
                                </form>
                                <div class="panel-footer" style="height: 100px;">
                                	<br />
                                	<div class="text-center">
                                		
                                		<a class="btn btn-success btn-lg"><i class="fa fa-check"></i>&nbsp;发表</a>&nbsp;&nbsp;&nbsp;
                                		<a class="btn btn-primary btn-lg"><i class="fa fa-file-text-o"></i>&nbsp;草稿</a>
                                	</div>
                                    
                                    
                                </div>
                            </div>
                        </div>
                    </div>
		</div>
		<script src="../js/jquery-1.10.2.min.js"></script>
		<script src="../js/jquery-ui-1.9.2.custom.min.js"></script>
		<script src="../js/jquery-migrate-1.2.1.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<script src="../js/modernizr.min.js"></script>
		<script src="../js/jquery.nicescroll.js"></script>

		<script type="text/javascript" src="js/ckeditor/ckeditor.js"></script>

		<script type="text/javascript" src="js/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
		<script type="text/javascript" src="js/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>

		<!--common scripts for all pages-->
		<script src="../js/scripts.js"></script>

		<script>
			jQuery(document).ready(function() {
				$('.wysihtml5').wysihtml5();
			});

			$(".article-title").focus(function() {
				if($(this).val() == "在此输入文章标题") $(this).val("");
			});
			$(".article-title").blur(function() {
				if($(this).val() == "") $(this).val("在此输入文章标题");
			});

			//文章图片的input
			//一选一个图片插入  就发ajax上传
			$("body").on("change", ".bootstrap-wysihtml5-insert-image-url", function() {
				var path = $(this).val();
				//				alert(path);
				var pos = path.lastIndexOf("\\");
				var fileName = path.substring(pos + 1);
				$(".insert-image-url").text(fileName);

				//
				

			});

			$(".cover-upload-btn").click(function() {
				$(".cover-img-input").click();

			});

			$(".music-upload-btn").click(function() {
				$(".music-upload-input").click();
			});

			$(".music-upload-input").change(function() {
				
				loadFile(this);
				var file = $(this)[0].files[0];
				//   alert(file);
				var reader = new FileReader();
				reader.addEventListener("load", function() {
					//audio控件加载音乐
					$(".music-audio")[0].src = reader.result;
				}, false);
				if(file) {
					reader.readAsDataURL(file);
				}
				
				if($(this).val() != null) {
					$(".music-upload-btn").text("更改选择");
				} else {
					$(".music-upload-btn").text("选择音乐");
				}

			});

			$(".cover-img-input").change(function() {
				//				alert($(this).val());
				if($(this).val() != null) {
					$(".cover-upload-btn").text("更改选择");
				} else {
					$(".cover-upload-btn").text("选择图片");
				}
				//读图片文件路径的方法
				//不能直接用$input.val  受浏览器保护 得不到真正路径
				var file = $(this)[0].files[0];
				//          	alert(file);
				var reader = new FileReader();
				reader.addEventListener("load", function() {
					$(".cover-img")[0].src = reader.result;
				}, false);
				if(file) {
					reader.readAsDataURL(file);
				}
			});
		</script>

		<!--
        	作者：yueyi14@hotmail.com
        	时间：2016-10-02
        	描述：获取音乐文件的内嵌信息
        -->
		<script type="text/javascript" src="../js/ID3-Reader-master/dist/id3-minimized.js"></script>
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
				document.getElementById('music-year').textContent = tags.track || "-";
				document.getElementById('music-genre').textContent = tags.genre || "-";
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

				} else {
					document.getElementById('music-cover').setAttribute('src', 'img/cover/cover_image_upload.png');
				}
			}
		</script>
	</body>

</html>