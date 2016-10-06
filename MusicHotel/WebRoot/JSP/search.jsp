 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>搜索结果</title>
		<link rel="stylesheet" type="text/css" href="css/search.css" />
	</head>

	<body>
		<div class="container ct-sm" style="min-height: 245px;">
			<form class="search-form clearfix">
				<div class="filter rounded">
					<a rel="nofollow" class="filter-current" data-ct="searchFilterWrapper" data-tipid="searchFilterDialog" data-adjustx="15" data-width="90" data-hasqtip="searchFilterDialog">
						全部 <span class="icon-search-filter"></span>
					</a>
					<div id="qtip-searchFilterDialog" class="qtip qtip-default qtip-luoo qtip-pos-tc qtip-focus" tracking="false" role="alert" aria-live="polite" aria-atomic="false" aria-describedby="qtip-searchFilterDialog-content" aria-hidden="false" data-qtip-id="searchFilterDialog" style="width: 90px; z-index: 15002; display: none; top: 30px; left: 10px;">
						<div class="qtip-tip" style="border: 0px !important; width: 8px; height: 8px; line-height: 8px; left: 50%; margin-left: -4px; top: -8px; background-color: transparent !important;"><canvas width="8" height="8" style="border: 0px !important; width: 8px; height: 8px; background-color: transparent !important;"></canvas></div>
						<div class="qtip-content" id="qtip-searchFilterDialog-content" aria-atomic="true">
							<div class="qtip-content" id="qtip-searchFilterDialog-content" aria-atomic="true">
								<ul class="search-filter-wrapper">
									<li>
										<a href="#" class="filter-item" rel="nofollow">全部</a>
									</li>
									<li>
										<a href="#" class="filter-item" rel="nofollow">期刊</a>
									</li>
									<li>
										<a href="#" class="filter-item" rel="nofollow">文章</a>
									</li>
									<li>
										<a href="#" class="filter-item" rel="nofollow">场所</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<input type="text" class="keyword rounded" placeholder="查找你喜欢的内容" name="q" value="">
				<input type="hidden" name="t" value="">
				<button type="button" class="btn rounded" onclick="return search()">
				<span class="icon-search-w"></span>
				搜索
			</button>
			</form>

			<div class="search-result">

				<div id="item780" class="item item-essay" data-id="780">
					<div class="rs-text">
						<p class="title">
							[文章]
							<a href="http://www.luoo.net/essay/780">何大河：姑娘是音乐里最美的意象</a>
						</p>
						<p class="content">
							他淡然谦逊，却在如迷的舒缓沉静中不知不觉把四季的花都烧了个干净。
						</p>
					</div>

					<div class="rs-pic-wrapper">
						<img src="img/57cf0a34a8f42.jpg" alt="何大河：姑娘是音乐里最美的意象" class="rs-pic">
					</div>

				</div>

				<div id="item779" class="item item-essay" data-id="779">
					<div class="rs-text">
						<p class="title">
							[文章]
							<a href="http://www.luoo.net/essay/779">赵雷：生活是我储存灵感的粮仓</a>
						</p>
						<p class="content">
							每个人都有属于自己的表达方式，我的渠道是：歌曲。所以我的歌是内心所想。
						</p>
					</div>

					<div class="rs-pic-wrapper">
						<img src="img/57cf0a34a8f42.jpg" alt="赵雷：生活是我储存灵感的粮仓" class="rs-pic">
					</div>

				</div>

				<div id="item885" class="item item-vol" data-id="885">
					<div class="rs-text">
						<p class="title">
							[期刊]
							<a href="http://www.luoo.net/music/854">vol.854 摇滚的孩子不会老去</a>
						</p>
						<p class="content">
							摇滚的孩子不会老去 他们只是渐行渐远 - John Lennon 本期音乐为硬核类音乐专题。 Cover From Giò Tarantini

						</p>
					</div>

					<div class="rs-pic-wrapper">
						<img src="img/57cf0a34a8f42.jpg" alt="vol.854 摇滚的孩子不会老去" class="rs-pic">
					</div>

				</div>

				<div id="item774" class="item item-essay" data-id="774">
					<div class="rs-text">
						<p class="title">
							[文章]
							<a href="http://www.luoo.net/essay/774">女人自是变化万千的谜题</a>
						</p>
						<p class="content">
							女性以她们独特的性格特质和摇滚乐相处，创造着女性自己的音乐神话，让世界臣服，讶异不已。
						</p>
					</div>

					<div class="rs-pic-wrapper">
						<img src="img/57cf0a34a8f42.jpg" alt="女人自是变化万千的谜题" class="rs-pic">
					</div>

				</div>

				<div id="item884" class="item item-vol" data-id="884">
					<div class="rs-text">
						<p class="title">
							[期刊]
							<a href="http://www.luoo.net/music/853">vol.853 散落的光阴</a>
						</p>
						<p class="content">
							音乐的意义，不仅在于取悦我们的耳膜，更在于它能通往我们的心灵。这些音乐像是交谈的歌，时而高扬，时而低郁，真真切切的包围在我们的身边，让我们脱离暂时性的冷漠和目光迷离。这些音乐还可以...
						</p>
					</div>

					<div class="rs-pic-wrapper">
						<img src="img/57cf0a34a8f42.jpg" alt="vol.853 散落的光阴" class="rs-pic">
					</div>

				</div>

				<div id="item772" class="item item-essay" data-id="772">
					<div class="rs-text">
						<p class="title">
							[文章]
							<a href="http://www.luoo.net/essay/772">程璧：音乐是“未知”与“即兴”的触碰</a>
						</p>
						<p class="content">
							她是一种慢，或者是稳，像是活在一滴露珠里，她看着你或者对你说话，中间是一层奇异的时光感。
						</p>
					</div>

					<div class="rs-pic-wrapper">
						<img src="img/57cf0a34a8f42.jpg" alt="程璧：音乐是“未知”与“即兴”的触碰" class="rs-pic">
					</div>

				</div>

				<div id="item767" class="item item-essay" data-id="767">
					<div class="rs-text">
						<p class="title">
							[文章]
							<a href="http://www.luoo.net/essay/767">Aesthesys：音乐让我们遇见了更好的彼此</a>
						</p>
						<p class="content">
							我们的音乐旅程在我们遇见彼此之前就开始了，也是在那时我们第一次意识到我们对音乐的热爱，它是一种能够让我们比任何其它方式表达得都要多的东西。
						</p>
					</div>

					<div class="rs-pic-wrapper">
						<img src="img/57cf0a34a8f42.jpg" alt="Aesthesys：音乐让我们遇见了更好的彼此" class="rs-pic">
					</div>

				</div>

			</div>
			<div class="paginator">
				<a class="previous disabled" rel="nofollow" href="javascript:;">上一页</a>
				<a class="page actived" rel="nofollow" href="javascript:;">1</a>
				<a class="page" href="#">2</a>
				<a class="page" href="#">3</a>
				<a class="page" href="#">4</a>
				<a class="page" href="#">5</a>
				<a class="page" href="#">6</a>
				<a class="page" href="#">7</a>
				<a class="page" href="#">8</a>
				<a class="page" href="#">9</a>
				<a class="page" href="#">10</a><span class="break">...</span>
				<a class="page" href="#">74</a>
				<a class="next" href="#">下一页</a>
			</div>
		</div>
		<script src="js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			$(function() {
				var active = $(".actived");
				if(active.text()==1){
					
					$(".previous").addClass("disabled");
				}
				
				/*if(active.text()==最后一页的值){//等于最后一页
					$(".next").addClass("disabled");
				}*/

				$("a.filter-current").click(function() {

					$("#qtip-searchFilterDialog").toggle();
				});
				
				$("a.page").click(function  () {
					
					$(this).addClass("actived");
					$(this).siblings("a").removeClass("actived");
				});
			});

			function search() {
				var value = $("input[name='q']").val();
				//alert(value);
				if(value == "") {
					return false;
				} else {
					//提交进行搜索
					alert("search");
				}
			}
		</script>
	</body>

</html>