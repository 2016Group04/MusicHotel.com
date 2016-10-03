<%@ page language="java" import="java.util.*,com.po.Administrator" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <link rel="shortcut icon" href="#" type="image/png">

    <title>管理员登录</title>

    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet">

</head>

<body class="login-body">

<div class="container">

	<%-- <%
		String msg = (String)request.getAttribute("msg");
		if(msg==null){msg=""}
	%> --%>
	
    <form class="form-signin" action="login.action">
        <div class="form-signin-heading text-center">
            <h1 class="sign-title">登 录${msg}</h1>
            <img src="images/login-logo.png" alt=""/>
        </div>
        <div class="login-wrap">
            <input type="text" class="form-control" name="name" placeholder="User ID" autofocus>
            <input type="password" class="form-control" name="password" id="password" placeholder="Password">

            <button type="submit" class="btn btn-lg btn-login btn-block" >
                <i class="fa fa-check"></i>
            </button>
            
            <label class="checkbox">
                <input type="checkbox" value="remember-me"> 记住密码
                <span class="pull-right">
                    <a data-toggle="modal" href="#myModal"> 忘记密码?</a>

                </span>
            </label>

        </div>

        <!-- Modal -->
        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">忘记密码 ?</h4>
                    </div>
                    <div class="modal-body">
                        <p>填写邮箱以重置密码.</p>
                        <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">

                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
                        <button class="btn btn-primary" type="button">登录</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- modal -->

    </form>

</div>



<!-- Placed js at the end of the document so the pages load faster -->

<!-- Placed js at the end of the document so the pages load faster -->
<script src="js/jquery-1.7.2.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/modernizr.min.js"></script>
</body>
</html>
