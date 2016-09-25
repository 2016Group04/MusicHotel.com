 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>test.html</title>
	
    <meta name="keywords" content="keyword1,keyword2,keyword3">
    <meta name="description" content="this is my page">
    <meta name="content-type" content="text/html; charset=UTF-8">
    
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->

  </head>
  
  <body>
    <img src="${pageContext.request.contextPath}/JSP/RandomCodeServlet">
    <from action = "getCommentOrderByDate.action" method="post">
    <input name="topicType" value = "hotel" />
    <input name="topicId" value = "1" />
    </from>
    <a href="getCommentOrderByDate.action">11111</a>
  </body>
</html>
