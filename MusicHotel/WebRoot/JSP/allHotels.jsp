<%@ page language="java" import="java.util.*,com.po.Hotel" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>音乐馆</title>
			
	    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	    <meta http-equiv="description" content="this is my page">
	    <meta http-equiv="content-type" content="text/html; charset=UTF-8">   
		<link rel="stylesheet" type="text/css" href="css/top.css" />
		
		<style type="text/css">
			
			body {
				font: 13px/22px Verdana,'微软雅黑','Microsoft YaHei',Helvetica,Arial;
				color: #2d2d2d;
			}
			
			body, div, p, blockquote, ul, li, a, span, i, em, strong, h1, h2, h3, h4, h5, h6, form, fieldset, legend, input, button, textarea, blockquote {
			    margin: 0;
			    padding: 0;
			}
			
			/* input[type="text"], input[type="password"], input[type="url"], input[type="email"] {
			    border: 1px solid #e5e5e5;
			    border-radius: 4px;
			    height: 19px;
			    line-height: 19px;
			    padding: 3px 9px;
			} */
			
			h1, h2, h3, h4 {
			    font: 13px/1.5 Verdana,'微软雅黑','Microsoft YaHei',Helvetica,Arial;
			    font-weight: 400;
			}
			
			div.header {
				background-color: #F2F2F2;
				border-top: 2px solid #dd5862;
				border-bottom: 1px solid #e9e8e8;
				margin-bottom: 60px;
				min-width: 960px;
			}
			
			div.header-ct {
				height: 50px;
				line-height: 51px;
				width: 960px;
				margin: 0 auto;
			}
			
			a {
				text-decoration: none;
				color: #2d2d2d;
			}
			
			a:hover {
				text-decoration: none;
			}
			
			a.logo {			
				float: left;
				height: 44px;
				width: 34px;
				overflow: hidden;
			}
			
			span.icon-logo {
				display: inline-block;
				line-height: 1;
				vertical-align: middle;
				background-image: url(img/icon-common.png);
				background-repeat: no-repeat;
				background-position: 0 -300px;
				height: 39px;
				width: 32px;
			}
			
			div.nav {
				float: left;
				margin-left: 8px;
			}
			
			ul {
				list-style: none;
			}
			
			div.nav ul li {
				float: left;
			}
			
			.nav ul li a {
				display: block;
				margin-left: 25px;
				color: #2d2d2d;
				font-size: 16px;
			}
			
			.nav ul li a:hover {
			    color: #dd5862;
			    text-decoration: none;
			}
			
			div.head-search {
				float: left;
				margin-left: 20px;
				position: relative;
				line-height: 49px;
			}
			
			.head-search .search-input {
			    background: #ededed;
			    border: 1px solid #e5e5e5;
			    border-radius: 19px;
			    font-size: 12px;
			    padding: 3px 10px 3px 30px;
			    box-shadow: 1px 1px 1px #ECECEC inset;
			    width: 65px;
			    width: 105px\0;
			    transition: width 300ms ease 0s;
			}
			
			.head-search .search-btn {
			    background: 0 0;
			    border: 0;
			    color: #C9C9C9;
			    cursor: pointer;
			    position: absolute;
			    left: 5px;
			    top: 15px;
			    top: 0\0;
			    font-size: 14px;
			    width: 18px;
			    z-index: 99;
			}
			
			.icon-search {
			    display: inline-block;
			    width: 20px;
			    height: 20px;
			    line-height: 1;
			    vertical-align: middle;
			    background-image: url(img/icon-common.png);
			    background-position: top left;
			    background-repeat: no-repeat;
			    height: 16px;
			    background-position: -110px -240px;
			}
			
			.logged-out-wrapper {
			    color: #7d7d7d;
			    display: none;
			    float: right;
			    max-width: 70px;
			    position: relative;
			    cursor: pointer;
			}
			
			.logged-out-wrapper a.ln-top-login {
			    color: #363636;
			}
			
			.container {
				margin: 0 auto;
				width: 960px;					
			}
			
			/*幻灯片 start*/			
			.flexslider {
			    position: relative;
			    zoom: 1;
			}
			.flexslider {
			    margin: 0;
			    padding: 0;
			}
			.section-site-first {
			    margin-top: -30px;
			    margin-bottom: 30px;
			    height: 324px;/*删除*/
			}
			
			.slides, .flex-control-nav, .flex-direction-nav {
			    margin: 0;
			    padding: 0;
			    list-style: none;
			}
			
			.flex-control-nav {
			    width: 100%;
			    height: 7px;
			    padding: 3px 0;
			    position: absolute;
			    bottom: -4px;
			    text-align: center;
			}
			.flex-control-nav {
			    bottom: -20px;
			    z-index: 99;
			    height: 7px;
			}
			
			.flex-control-nav li {
			    margin: 0 6px;
			    display: inline-block;
			    zoom: 1;
			    *display: inline;
			}
			
			.flex-control-paging li a {
			    width: 7px;
			    height: 7px;
			    display: block;
			    background: #B5B5B5;
			    cursor: pointer;
			    text-indent: -9999px;
			    -webkit-border-radius: 20px;
			    -moz-border-radius: 20px;
			    -o-border-radius: 20px;
			    border-radius: 20px;
			}
			
			.flex-control-paging li a:hover {
			    background: #E43E4A;
			}
			
			.flex-control-paging li a.flex-active {
			    background: #E43E4A;
			    cursor: default;
			}
			/*幻灯片 end*/
			
			.clearfix {
			    *zoom: 1;
			}
			
			/*article start*/
			.article {
			    float: left;
			    width: 670px;
			}
			
			.article-sm {
			    width: 590px;
			}
			
			/*最新期刊 start*/
			.page-nav {
			    display: table;
			}
			.page-nav {
			    background: #f2f2f2;
			    border-radius: 4px;
			    margin-bottom: 35px;
			    padding: 7px 7px 7px 20px;
			}
			.page-nav .curt-nav {
			    float: left;
			    border-right: 1px solid #e5e5e5;
			    margin-right: 10px;
			    height: 56px;
			    line-height: 56px;
			}
			.page-nav .curt-nav {
			    float: none;
			    border-right: 0;
			    margin-right: 0;
			    height: inherit;
			    line-height: normal;
			    display: table-cell;
			    vertical-align: middle;
			}
			.page-nav .item {
			    color: #5F5F5F;
			    display: inline-block;
			    height: 28px;
			    line-height: 28px;
			    margin-right: 15px;
			}
			.page-nav .actived {
			    color: #dd5862;
			}
			.page-nav .pagenav-wrapper {
			    float: left;
			    width: 480px;
			}
			.page-nav .pagenav-wrapper {
			    float: left;
			    padding-left: 10px;
			    width: 470px;
			    border-left: 1px solid #e5e5e5;
			}
			.page-nav .pagenav-wrapper a:hover{
				color: #dd5862;
			}
			/*最新期刊 end*/
			/*vol-list start*/
			.vol-list {
			    margin-bottom: 60px;
			}
			.vol-list .item {
			    margin-bottom: 30px;
			}
			.vol-list .cover-wrapper {
			    display: block;
			    line-height: 0;
			}
			.vol-list .cover {
			    max-width: 590px;
			    border-radius: 4px 4px 0 0;
			}
			.vol-list .meta {
			    background-color: #f2f2f2;
			    border-radius: 0 0 4px 4px;
			    height: 35px;
			    line-height: 35px;
			    padding: 0 20px 0 12px;
			}
			.vol-list .name {
			    font-size: 14px;
			    float: left;
			    max-width: 440px;
			    overflow: hidden;
			    text-overflow: ellipsis;
			    white-space: nowrap;
			}
			.vol-list .comments {
			    color: #7d7d7d;
			    float: right;
			}
			.icon-comment-count {
			    display: inline-block;
			    line-height: 1;
			    vertical-align: middle;
			    background-image: url(img/icon-vol.png);
			    background-position: top left;
			    background-repeat: no-repeat;
			    height: 20px;
			    width: 20px;
			    height: 13px;
			    width: 13px;
			}
			.vol-list .favs {
			    color: #7d7d7d;
			    float: right;
			    margin: 0 20px;
			}
			.icon-favd {
			    display: inline-block;
			    line-height: 1;
			    vertical-align: middle;
			    background-image: url(img/icon-vol.png);
			    background-position: top left;
			    background-repeat: no-repeat;
			    height: 20px;
			    width: 20px;
			    background-position: 0 -20px;
			    height: 13px;
			    width: 13px;
			}
			/*vol-list end*/
			/*paginator start*/
			.paginator {
			    text-align: center;
			}
			.paginator .previous {
			    background: url(img/icon-common.png) -70px -300px no-repeat;
			    color: #7d7d7d;
			    display: inline-block;
			    height: 25px;
			    line-height: 22px;
			    width: 64px;
			    text-indent: 4px;
			    margin-right: 3px;
			}
			.paginator .previous:hover{
				background: url(img/icon-common.png) -70px -330px no-repeat;
				color: #FFF;
			}
			.paginator .next {
			    background: url(img/icon-common.png) -70px -360px no-repeat;
			    color: #7d7d7d;
			    display: inline-block;
			    height: 25px;
			    line-height: 25px;
			    width: 64px;
			    text-indent: -6px;
			}
			.paginator .next:hover{
				background: url(img/icon-common.png) -70px -390px no-repeat;
				color: #FFF;
			}
			.paginator .disabled {
			    color: #D9D9D9;
			    cursor: default;
			}
			.paginator .page {
			    background-color: #f2f2f2;
			    color: #7d7d7d;
			    display: inline-block;
			    margin-right: 5px;
			    border-radius: 3px;
			    height: 25px;
			    line-height: 25px;
			    min-width: 26px;
			}
			.paginator a.page:hover {
				background-color: #dd5862;
			    color: #FFF;
			}
			.paginator .actived {
			    background-color: #dd5862;
			    color: #FFF;
			}
			.paginator .break {
			    color: #7d7d7d;
			    margin-right: 4px;
			}
			/*paginator end*/
			/*article end*/
			
			/*aside start*/
			.aside {
			    float: right;
			    width: 290px;
			    overflow-x: hidden;
			}
			.widget {
			    margin-bottom: 25px;
			}
			.widget-head {
			    padding-bottom: 17px;
			    line-height: 1;
			}
			.widget-head .title {
			    font-size: 14px;
			}
			.pic-widget .item {
			    *zoom: 1;
			    margin-bottom: 25px;
			}
			.pic-widget .cover-wrapper {
			    display: block;
			    float: left;
			    overflow: hidden;
			    margin-right: 13px;
			}
			.pic-widget .vol-cover {
			    display: block;
			    height: auto;
			    max-width: 42px;
			    border-radius: 3px;
			}
			.pic-widget .info {
			    line-height: 1;
			}
			.pic-widget .title {
			    margin: 1px 0 4px;
			    display: block;
			    max-width: 240px;
			    overflow: hidden;
			    text-overflow: ellipsis;
			    white-space: nowrap;
			}
			.pic-widget a.title:hover {
				color: #dd5862;
			}
			
			.pic-widget .description {
			    color: #7d7d7d;
			    font-size: 12px;
			}
			/*aside end*/
			
			/*注册/登录 start*/
			/* label input[type="radio"], label input[type="checkbox"] {
			    display: inline-block;
			    vertical-align: middle;
			}
			.qtip-luoo {
			    background-color: #fff;
			    border-color: #E5E5E5;
			    border-radius: 4px;
			    color: #706f6f;
			    font-size: 13px;
			    line-height: 13px;
			    box-shadow: 0 0 3px #dedede;
			}
			.qtip-default {
			    border-width: 1px;
			    border-style: solid;
			    border-color: #F1D031;
			    background-color: #FFFFA3;
			}
			.qtip {
			    position: absolute;
			    left: -28000px;
			    top: -28000px;
			    display: none;
			    max-width: 280px;
			    min-width: 50px;
			    line-height: 13px;
			    direction: ltr;
			    box-shadow: none;
			    padding: 0;
			}
			.qtip .qtip-tip, .qtip .qtip-tip .qtip-vml, .qtip .qtip-tip canvas {
			    position: absolute;
			    color: #123456;
			    background: 0 0;
			    border: 0 dashed transparent;
			}
			.qtip .qtip-tip {
			    margin: 0 auto;
			    overflow: hidden;
			    z-index: 10;
			}
			.qtip:not(.ie9haxors) div.qtip-content, .qtip:not(.ie9haxors) div.qtip-titlebar {
			    filter: none;
			    -ms-filter: none;
			}
			.qtip-luoo .qtip-content {
			    padding: 0;
			}
			.qtip-content {
			    position: relative;
			    padding: 5px 9px;
			    overflow: hidden;
			    text-align: left;
			    word-wrap: break-word;
			}
			
			.dialog-passport {
			    padding: 20px 15px;
			    min-width: 201px;
			}
			.dialog-login-oauth {
			    border-top: 1px solid #e5e5e5;
			    padding: 15px;
			    text-align: center;
			}
			
			.dialog-passport .dialog-head {
			    overflow: hidden;
			    margin-bottom: 15px;
			    line-height: 1;
			}
			
			.dialog-passport .title {
			    float: left;
			    font-size: 14px;
			    color: #000;
			}
			
			.dialog-passport .ln-reg {
			    float: right;
			    color: #dd5862;
			}
			
			.fright {
			    float: right;
			}
			
			.dialog-passport .inline-input {
			    margin-bottom: 10px;
			}
			.inline-input {
			    border: 1px solid #e5e5e5;
			    border-radius: 3px;
			    padding: 5px 7px;
			}
			
			.inline-input .label {
			    color: #000;
			    display: inline-block;
			    font-size: 13px;
			    margin-right: 5px;
			}
			
			.dialog-passport .input-passport {
			    width: 149px;
			}
			.inline-input input {
			    border: 0;
			    padding: 0;
			}
			
			.dialog-passport .btn-wrapper {
			    margin: 20px 0 15px;
			}
			
			.dialog-passport .btn {
			    display: block;
			    padding: 7px 0;
			    text-align: center;
			}
			.btn-positive {
			    background: #dd5862;
			    color: #FFF;
			}
			.btn {
			    border: 0;
			    border-radius: 4px;
			    cursor: pointer;
			    display: inline-block;
			    padding: 5px 10px;
			}
			
			.dialog-passport .ln-resetpwd {
			    color: #dd5862;
			    float: right;
			}
			
			.dialog-login-oauth a {
			    margin-right: 15px;
			}
			.icon-open-weibo {
			    display: inline-block;
			    width: 20px;
			    height: 20px;
			    line-height: 1;
			    vertical-align: middle;
			    background-image: url(img/icon-common.png);
			    background-position: top left;
			    background-repeat: no-repeat;
			    width: 24px;
			    height: 24px;
			    background-position: -110px -30px;
			}
			.icon-open-douban {
			    display: inline-block;
			    width: 20px;
			    height: 20px;
			    line-height: 1;
			    vertical-align: middle;
			    background-image: url(img/icon-common.png);
			    background-position: top left;
			    background-repeat: no-repeat;
			    width: 24px;
			    height: 24px;
			    background-position: -110px -90px;
			}
			.icon-open-qq {
			    display: inline-block;
			    width: 20px;
			    height: 20px;
			    line-height: 1;
			    vertical-align: middle;
			    background-image: url(img/icon-common.png);
			    background-position: top left;
			    background-repeat: no-repeat;
			    width: 24px;
			    height: 24px;
			    background-position: -110px -60px;
			}
			
			#qtip-headLoginDialog {
				background-color: white;
				border: 1px solid #e9e8e8;
			} */
			/*注册/登录 end*/
			
			/*footer start*/
			.footer {
			    background: #222;
			    border-top: 1px solid #111;
			    margin-top: 90px;
			    padding: 35px 0;
			    width: 100%;
			    height: 158.5px;
			}
			.clearfix {
			    *zoom: 1;
			}
			.foot-ct {
			    color: #e1e1e1;
			    width: 960px;
			    margin: 0 auto;
			}
			
			.foot-ct .about-wrapper {
			    float: left;
			    width: 380px;
			}
			.foot-ct .foot-item-head {
			    color: #FFF;
			    font-size: 14px;
			    margin-bottom: 7px;
			}
			.foot-ct .about-wrapper p {
			    margin: 2px 0;
			}
			.foot-ct .ln-about {
			    color: #e1e1e1;
			}
			
			.foot-ct .app-wrapper {
			    float: left;
			    width: 305px;
			}
			.foot-ct .foot-item-head {
			    color: #FFF;
			    font-size: 14px;
			    margin-bottom: 7px;
			}
			.foot-ct .app-wrapper p {
			    margin: 2px 0;
			}
			.foot-ct .ln-app {
			    color: #e1e1e1;
			    display: inline-block;
			    margin-top: 12px;
			    margin-bottom: 7px;
			}
			.icon-ios {
			    display: inline-block;
			    width: 20px;
			    height: 20px;
			    line-height: 1;
			    vertical-align: middle;
			    background-image: url(img/icon-common.png);
			    background-position: top left;
			    background-repeat: no-repeat;
			    background-position: 0 -90px;
			}
			.icon-android {
			    display: inline-block;
			    width: 20px;
			    height: 20px;
			    line-height: 1;
			    vertical-align: middle;
			    background-image: url(img/icon-common.png);
			    background-position: top left;
			    background-repeat: no-repeat;
			    background-position: 0 -30px;
			}
			.icon-wp {
			    display: inline-block;
			    width: 20px;
			    height: 20px;
			    line-height: 1;
			    vertical-align: middle;
			    background-image: url(img/icon-common.png);
			    background-position: top left;
			    background-repeat: no-repeat;
			    background-position: 0 -60px;
			}
			
			.foot-ct .sns-wrapper {
			    text-align: right;
			    float: right;
			    width: 275px;
			}
			.foot-ct .foot-item-head {
			    color: #FFF;
			    font-size: 14px;
			    margin-bottom: 7px;
			}
			.foot-ct .sns-items {
			    margin-bottom: 40px;
			}
			.icon-sns-qq {
			    display: inline-block;
			    width: 20px;
			    height: 20px;
			    line-height: 1;
			    vertical-align: middle;
			    background-image: url(img/icon-common.png);
			    background-position: top left;
			    background-repeat: no-repeat;
			    background-position: -110px -270px;
			}
			.icon-sns-wechat {
			    display: inline-block;
			    width: 20px;
			    height: 20px;
			    line-height: 1;
			    vertical-align: middle;
			    background-image: url(img/icon-common.png);
			    background-position: top left;
			    background-repeat: no-repeat;
			    background-position: 0 -270px;
			}			
			.foot-ct .icon-sns-qq, .foot-ct .icon-sns-wechat {
			    position: relative;
			}
			.icon-sns-weibo {
			    display: inline-block;
			    width: 20px;
			    height: 20px;
			    line-height: 1;
			    vertical-align: middle;
			    background-image: url(img/icon-common.png);
			    background-position: top left;
			    background-repeat: no-repeat;
			    background-position: 0 -210px;
			}
			.icon-sns-douban {
			    display: inline-block;
			    width: 20px;
			    height: 20px;
			    line-height: 1;
			    vertical-align: middle;
			    background-image: url(img/icon-common.png);
			    background-position: top left;
			    background-repeat: no-repeat;
			    background-position: 0 -240px;
			}
			.foot-ct .sns-items a {
			    margin-left: 15px;
			}
			.foot-ct .slogan {
			    margin-top: 15px;
			}
			.icon-slogan {
			    display: inline-block;
			    width: 20px;
			    height: 20px;
			    line-height: 1;
			    vertical-align: middle;
			    background-image: url(img/icon-common.png);
			    background-position: top left;
			    background-repeat: no-repeat;
			    width: 136px;
			}
			/*footer end*/
			
			#backTop {
			    position: fixed;
			    left: 1200px;
			    bottom: 60px;
			    display: none;
			    height: 50px;
			    width: 50px;
			    background: url(img/icon-common.png) no-repeat 0 -360px;
			    cursor: pointer;
			}
			#backTop:hover {
			    background-position: 0 -420px;
			}
		</style>
	
	</head>
	  
	<body>
	  	
	  	<!--一整个顶部栏-->
		<div id="wholeTop" style="margin-bottom: 60px">
			<!--网站logo-->
			<div class="logo">
				<span id="logo"></span>

			</div>
			<!--选择进入什么模块-->
			<div id="yourSelection">
				<div class="selection">
					<a>期刊</a>
				</div>
				<div class="selection">
					<a>单曲</a>
				</div>
				<div class="selection">
					<a>专栏</a>
				</div>
				<div class="selection">
					<a>活动</a>
				</div>
				<div class="selection">
					<a>APP</a>
				</div>
			</div>
			<!--搜索框-->
			<div id="searchAll">
				<div id="search" class="search searchBlur">
					<span id="searchMirror"></span>
					<input type="text" name="searchEverything" id="searchEverything" style="display: none;" />
				</div>
			</div>
			<!-- 登录上之后出现的 -->
			<div id="loginAfter"  style="display:none">
				<div id="message"></div>
				<div id="messageDetail" style="display:none">
					<div class="message">
						这是一个系统消息
					</div>
					<div class="message">
						这是一个系统消息
					</div>
					<div class="message">
						这是一个系统消息
					</div>
					<div id="bottom">
						查看全部消息
					</div>
				</div>
				<div id="information">
					<img src="img/autho.png" width="16px" height="16px" id="touXiang"/>
					<label id="account">这是昵称</label>
					
				</div>
				
				<div id="operate" style="display:none">
						
					<div id="cc">
						<a><label class="myLabel" id="my"></label>我的落网</a>
						<a><label class="myLabel" id="setting"></label>账号设置</a>
						<a><label class="myLabel" id="logout"></label>退出</a>
					</div>
				</div>
			</div>
			
			<div id="loginAngRegiste" class="searchAfter">
				<span id="longinAregiste">注册/登录</span>

				<div id="all" style="display: none;">
					<div id="tip"><canvas id="mycanvas" width="8px" height="8px"></canvas></div>

					<div class="loginOrResite" id="loginOrResite">
						<!--登录框-->
						<div id="login" style="z-index:99">
							<div id="loginTop">
								<label class="label1">登录</label>
								<label class="label2">没有账号？<a>注册</a></label>
							</div>

							<div id="loginMiddle">
								<form action="#" method="post">

									<div id="Email">
										<label>邮箱</label>
										<input type="text" id="email" />
									</div>

									<div id="Password">
										<label>密码</label>
										<input type="password" id="password" />
									</div>

									<div id="tijiao">
										<a id="Submit" class="Submit">登录</a>
									</div>

									<div id="option">

										<div id="AutoLogin">
											<input type="checkbox" name="autoLogin" id="autoLogin" />
										</div>
										<label>下次自动登录</label>
										<label id="getBackPasseord">找回密码</label>
									</div>
								</form>

							</div>

							<div id="otherLogin">
								<a href="#" id="QQ"></a>
								<a href="#" id="DOU"></a>
								<a href="#" id="WEIBO"></a>
							</div>
						</div>
						<!--注册框-->
						<div id="registe" style="display: none;">
							<div id="registeTop">
								<label class="label1">注册</label>
								<label class="label2">返回登录</label>
							</div>

							<div id="registeMiddle">
								<form action="#" method="post">

									<div id="AccountRegiste">
										<label class="label1">昵称</label>
										<input type="text" id="accountRegiste" maxlength="14"/>
										<label class="labelTishi accountRegiste">14位以内中英文数字</label>
									</div>

									<div id="EmailRegiste">
										<label class="label1">邮箱</label>
										<input type="text" id="emailRegiste" />
										<label class="labelTishi emailRegiste">您的常用邮箱</label>
									</div>

									<div id="PasswordRegiste">
										<label class="label1">密码</label>
										<input type="password" id="passwordRegiste" maxlength="16"/>
										<label class="labelTishi passwordRegiste">6-16个字符</label>
									</div>

									<div id="AuthRegiste">
										<label class="label1">验证码</label>
										<input type="text" id="authRegiste" />
										<img src="${pageContext.request.contextPath}/JSP/RandomCodeServlet" width="80px" height="100%" id="imageCode" alt="看不清?点击换一张" onclick="changeImg()"/>
									</div>

									<div id="protocal">

										<div id="agreePro">
											<input type="checkbox" name="agree" id="agree" checked="checked"/>
										</div>
										<label>同意网站的</label>
										<a>《使用协议》</a>
									</div>

									<div id="register">
										<a id="Registe" class="Registe">注册</a>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	  	
		
		<div class="container index-c" style="min-height: 209px;">
			
			<!--幻灯片 start-->
			<div id="carousel-example-generic" class="flexslider section-site-first">
	
				<ul class="slides">
					<li style="width: 100%; float: left; margin-right: -100%; position: relative; display: block; z-index: 2; opacity: 1;">
				    	<a href="#" title="AirRadio" target="_blank"><img draggable="false" src="img/57d7e22ff0080.jpg.png" alt="AirRadio"></a>
				    </li>
				    <li style="width: 100%; float: left; margin-right: -100%; position: relative; display: block; z-index: 1; opacity: 0;">
				    	<a href="#" title="AirRadio" target="_blank"><img draggable="false" src="img/57d7b7dead0c2.jpg.png" alt="AirRadio"></a>
				    </li>
				    <li style="width: 100%; float: left; margin-right: -100%; position: relative; display: block; z-index: 1; opacity: 0;">
				    	<a href="#" title="AirRadio" target="_blank"><img draggable="false" src="img/57c6c04e02b2e.jpg.png" alt="AirRadio"></a>
				    </li>
				    <li style="width: 100%; float: left; margin-right: -100%; position: relative; display: block; z-index: 1; opacity: 0;">
				    	<a href="#" title="AirRadio" target="_blank"><img draggable="false" src="img/57c416332f13e.jpg.png" alt="AirRadio"></a>
				    </li>
				    <li style="width: 100%; float: left; margin-right: -100%; position: relative; display: block; z-index: 1; opacity: 0;">
				    	<a href="#" title="AirRadio" target="_blank"><img draggable="false" src="img/57dfaca3a3be1.jpg.png" alt="AirRadio"></a>
				    </li>
				</ul>
				
				<ol class="flex-control-nav flex-control-paging">
					<li><a class="flex-active">1</a></li>
					<li><a class="">2</a></li>
					<li><a class="">3</a></li>
					<li><a class="">4</a></li>
					<li><a class="">5</a></li>
				</ol>
			</div>
			<!--幻灯片 end-->
		</div>
		
		<div class="container" style="min-height: 209px;">
			
			<div class="clearfix" style="position: relative;height: 1635px">
				
				<!--article start-->
				<div class="article article-sm">
					
					<!--最新期刊 start-->
					<div class="page-nav rounded clearfix">
						
						<div class="curt-nav">
							<a href="#" class="item actived">最新期刊</a>
						</div>
						
						<div class="pagenav-wrapper">
							<a href="http://www.luoo.net/music/indie" class="item">独立音乐</a>
							<a href="http://www.luoo.net/music/folk" class="item">民谣</a>
							<a href="http://www.luoo.net/music/metal" class="item">金属</a>
							<a href="http://www.luoo.net/music/electronic" class="item">电子</a>
							<a href="http://www.luoo.net/music/pop" class="item">流行</a>
							<a href="http://www.luoo.net/music/britpop" class="item">英伦</a>
							<a href="http://www.luoo.net/music/post-rock" class="item">后摇</a>
							<a href="http://www.luoo.net/music/psychedelic" class="item">迷幻</a>
							<a href="http://www.luoo.net/music/neo-wave" class="item">暗潮</a>
							<a href="http://www.luoo.net/music/ambient" class="item">氛围</a>
							<a href="http://www.luoo.net/music/chinese" class="item">华语</a>
							<a href="http://www.luoo.net/music/punk" class="item">朋克</a>
							<a href="http://www.luoo.net/music/world" class="item">世界音乐</a>
							<a href="http://www.luoo.net/music/hardcore" class="item">硬核</a>
							<a href="http://www.luoo.net/music/hip-hop" class="item">说唱</a>
							<a href="http://www.luoo.net/music/jazz" class="item">爵士</a>
							<a href="http://www.luoo.net/music/classical" class="item">古典</a>
							<a href="http://www.luoo.net/music/rock" class="item">摇滚</a>
							<a href="http://www.luoo.net/music/ost" class="item">原声</a>
							<a href="http://www.luoo.net/music/alternative" class="item">另类</a>
							<a href="http://www.luoo.net/music/post-punk" class="item">后朋克</a>
							<a href="http://www.luoo.net/music/reggae" class="item">雷鬼</a>
							<a href="http://www.luoo.net/music/country" class="item">乡村</a>
							<a href="http://www.luoo.net/music/blues" class="item">蓝调</a>
							<a href="http://www.luoo.net/music/vocal" class="item">人声</a>
							<a href="http://www.luoo.net/music/brand" class="item">品牌</a>
						</div>
					</div>
					<!--最新期刊 end-->
					<!--vol-list-->
					<div class="vol-list">
						<%
							List<Hotel> list = (List<Hotel>)request.getAttribute("list");
							for(Hotel hotel:list){
						%>
						<div class="item">
							<a class="cover-wrapper" title="<%=hotel.getTitile()%>">
								<img src="<%=hotel.getCoverImg()%>" alt="<%=hotel.getTitile()%>" class="cover rounded">
							</a>
							<div class="meta rounded clearfix">
								<a href="#" class="name" title="<%=hotel.getTitile()%>">vol.<%=hotel.getHotelId() %> <%=hotel.getTitile()%></a>
								<span class="comments">
									<span class="icon-comment-count"></span>
									<%=hotel.getCommentSum() %>
								</span>
								<span class="favs">
									<span class="icon-favd"></span>
									<%=hotel.getLikeSum() %>
								</span>
							</div>
						</div>
						<%
							}
						%>
					</div>
					<!--vol-list end-->
					<!--paginator start-->
					<div class="paginator">
						<a class="previous" rel="nofollow" href="javascript:;">上一页</a>
						<a class="page actived" rel="nofollow" href="javascript:;">1</a>
						<a class="page" href="#">2</a>
						<a class="page" href="#">3</a>
						<a class="page" href="#">4</a>
						<a class="page" href="#">5</a>
						<a class="page" href="#">6</a>
						<a class="page" href="#">7</a>
						<a class="page" href="#">8</a>
						<a class="page" href="#">9</a>
						<a class="page" href="#">10</a>
						<span class="break">...</span>
						<a class="page" href="#">86</a>
						<a class="next" href="#">下一页</a>
					</div>
					<!--paginator end-->
				</div>
				<!--article end-->
				
				<!--aside start-->
				<div class="aside" style="">
					
					<div id="widgetHotVol" class="widget">
						
						<div class="widget-head">
							<span class="title">最近热门期刊</span>
						</div>
						<div class="widget-ct pic-widget">
						
							<div class="item">
								<a href="http://www.luoo.net/music/045" class="cover-wrapper">
									<img src="img/52550c7d3b76d.jpg" alt="他们在恋爱" class="vol-cover rounded">
								</a>
								<div class="info">
									<a href="http://www.luoo.net/music/045" title="他们在恋爱" class="title">他们在恋爱</a>
									<p class="description">18885人收藏</p>
								</div>
							</div>
							
							<div class="item">
								<a href="http://www.luoo.net/music/632" class="cover-wrapper">
									<img src="img/53c94f9d68090.jpg" alt="不断的拥有 不断的失去" class="vol-cover rounded">
								</a>
								<div class="info">
									<a href="http://www.luoo.net/music/632" title="不断的拥有 不断的失去" class="title">不断的拥有 不断的失去</a>
									<p class="description">21452人收藏</p>
								</div>
							</div>
							
							<div class="item">
								<a href="http://www.luoo.net/music/826" class="cover-wrapper">
									<img src="img/5750635f9f56e.jpg" alt="云自无心水自闲" class="vol-cover rounded">
								</a>
								<div class="info">
									<a href="http://www.luoo.net/music/826" title="云自无心水自闲" class="title">云自无心水自闲</a>
									<p class="description">19855人收藏</p>
								</div>
							</div>
							
							<div class="item">
								<a href="http://www.luoo.net/music/850" class="cover-wrapper">
									<img src="img/57be0d220fa7f.jpg" alt="因为短暂 所以永恒" class="vol-cover rounded">
								</a>
								<div class="info">
									<a href="http://www.luoo.net/music/850" title="因为短暂 所以永恒" class="title">因为短暂 所以永恒</a>
									<p class="description">13310人收藏</p>
								</div>
							</div>
							
							<div class="item">
								<a href="http://www.luoo.net/music/856" class="cover-wrapper">
									<img src="img/57dbfb2c3e6c2.jpg" alt="生命中不能承受之轻" class="vol-cover rounded">
								</a>
								<div class="info">
									<a href="http://www.luoo.net/music/856" title="生命中不能承受之轻" class="title">生命中不能承受之轻</a>
									<p class="description">1670人收藏</p>
								</div>
							</div>
							
						</div>
					</div>	
				</div>
				<!--aside end-->
			</div>
		</div>
		
	  	<!--footer start-->
	  	<div class="footer">
	  		<div class="foot-ct clearfix">
	  			
	  			<div class="about-wrapper">
	  				<h4 class="foot-item-head">关于</h4>
	  				<p><a class="ln-about" href="http://www.luoo.net/about/">关于落网</a></p>
	  				<p><a class="ln-about" href="http://www.luoo.net/jobs/">加入我们</a></p>
	  				<p><a class="ln-about" href="http://www.luoo.net/contact/">联系合作</a></p>
	  				<p><a class="ln-about" href="javascript:;" id="feedback">反馈建议</a></p>
	  				<p><a class="ln-about" href="http://www.luoo.net/links/">友情链接</a></p>
	  			</div>
	  			
	  			<div class="app-wrapper">
	  				<h4 class="foot-item-head">APP</h4>
	  				<p><a class="ln-app" href="http://www.luoo.net/app/"><span class="icon-ios"></span>&nbsp;&nbsp;for iPhone</a></p>
	  				<p><a class="ln-app" href="http://www.luoo.net/app/"><span class="icon-android"></span>&nbsp;&nbsp;for Android</a></p>
	  				<p><a class="ln-app" href="http://www.luoo.net/app/"><span class="icon-wp"></span>&nbsp;&nbsp;for Windows Phone 8</a></p>
	  			</div>
	  			
	  			<div class="sns-wrapper">
	  				<h4 class="foot-item-head">关注落网</h4>
	  				<div class="sns-items">
	  					<a class="icon-sns-qq" id="luooQqAccount"></a>
	  					<a href="http://s.luoo.net/img/wechat-qr.gif" target="_blank" class="icon-sns-wechat" id="luooWechatAccount"></a>
	  					<a href="http://weibo.com/luoofm" target="_blank" class="icon-sns-weibo"></a>
	  					<a href="http://www.douban.com/group/luoo/" target="_blank" class="icon-sns-douban"></a>
	  				</div>
	  				<p class="icp">© 2016 落网</p>
	  				<p class="slogan"><span class="icon-slogan"></span></p>
	  			</div>
	  		</div>
	  	</div>
	  	<!--footer end-->
	  	
	  	<!--注册/登录 start-->
	    <!--
	    <div id="qtip-headLoginDialog" class="qtip qtip-default qtip-luoo qtip-pos-tc qtip-focus" data-qtip-id="headLoginDialog" aria-hidden="false" aria-describedby="qtip-headLoginDialog-content" aria-atomic="false" aria-live="polite" role="alert" tracking="false" style="width: 235px; z-index: 15001; top: 48px; left: 1007px;">
	  		<div style="background-color: transparent ! important; border: 0px none ! important; width: 8px; height: 8px; line-height: 8px; left: 50%; margin-left: -4px; top: -8px;" class="qtip-tip">
	  			<canvas height="8" width="8" style="background-color: transparent ! important; border: 0px none ! important; width: 8px; height: 8px;"></canvas>
	  		</div>
	  		
	  		<div id="qtip-headLoginDialog-content" class="qtip-content" aria-atomic="true">
	  			
	  			<div class="dialog-passport">
	  				
	  				<div class="dialog-head">
	  					<span class="title">登录</span>
	  					<a href="javascript:;" rel="nofollow" class="ln-reg btn-dialog-register" data-tipid="registerDialog" data-remote="http://www.luoo.net/register/dialog" data-width="235">
							注册
						</a>
						<span class="fright">没有账号？</span>
	  				</div>
	  				
	  				<form class="form-ajax">
	  					
	  					<div class="inline-input">
	  						<span class="label">邮箱</span>
	  						<input class="input-passport" name="name" required="" type="text">
	  					</div>
	  					
	  					<div class="inline-input">
							<span class="label">密码</span>
							<input class="input-passport" name="password" required="" type="password">
						</div>
						
						<div class="btn-wrapper">
							<a href="javascript:;" class="btn btn-positive btn-login-submit rounded" rel="nofollow">
								登录
							</a>
						</div>
						
						<div class="clearfix">
							<label><input name="remember" type="checkbox"> 下次自动登录</label>
							<a href="http://www.luoo.net/login/forgot" rel="nofollow" class="ln-resetpwd">找回密码</a>
						</div>
						
	  				</form>
	  			</div>
	  			
	  			<div class="dialog-login-oauth">
	  				<div class="platforms">
	  					<a href="http://www.luoo.net/login/oauth/site/weibo" class="icon-open-weibo" rel="nofollow"></a>
	  					<a href="http://www.luoo.net/login/oauth/site/douban" class="icon-open-douban" rel="nofollow"></a>
	  					<a href="http://www.luoo.net/login/oauth/site/qq" class="icon-open-qq" rel="nofollow"></a>
	  				</div>
	  			</div>
	  		</div>
	  	</div> -->
	  	<!--注册/登录 end-->
	  	
	  	<div style="display: block; left: 1174.5px; bottom: 10px;" id="backTop">&nbsp;</div>
	  	
	  	<script src="js/jquery-2.1.4.js"></script>
		<script src="js/bootstrap.js"></script>
		<script src="js/top.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function(){

								
				//幻灯片 自动播放
				var i = 0;
				self.setInterval(function(){		
					$(".slides li").attr("style","width: 100%; float: left; margin-right: -100%; position: relative; display: block; z-index: 1; opacity: 0;");
					$(".slides li").eq(i).attr("style","width: 100%; float: left; margin-right: -100%; position: relative; display: block; z-index: 2; opacity: 1;");
					$(".flex-control-paging li a").removeClass("flex-active");
					$(".flex-control-paging li a").eq(i).addClass("flex-active");
					i = i + 1;
					if(i==5){
						i = 0;
					}
				},2000);
				
				//幻灯片 控制器部分
				$(".flex-control-paging li a").click(function(){
					$(".flex-control-paging li a").removeClass("flex-active");
					$(this).addClass("flex-active");
					$(".slides li").attr("style","width: 100%; float: left; margin-right: -100%; position: relative; display: block; z-index: 1; opacity: 0;");
					$(".slides li").eq($(this).html()-1).attr("style","width: 100%; float: left; margin-right: -100%; position: relative; display: block; z-index: 2; opacity: 1;");
					i = $(this).html() - 1;
				});
				
				//页数paginator
				$("div.paginator a.page").click(function(){
					$("div.paginator a.page").removeClass("actived");
					$(this).addClass("actived");
				});
				
				//注册/登录 框
				$(".ln-top-login").bind("mouseover",function(){
					if($("div.qtip").css("display")=="none"){
						$("div.qtip").css("display","block")
					}else if($("div.qtip").css("display")=="block"){
						$("div.qtip").css("display","none")
					}
				});
				
				
				$("div#backTop").click(function(){
					location.assign("#top");
				});
			});
			
		</script>
	</body>
</html>
