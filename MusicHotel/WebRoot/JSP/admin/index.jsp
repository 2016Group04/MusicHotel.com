<%@ page language="java" import="java.util.*,com.po.Administrator" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
        
    <title>admin index.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	

  </head>
  
  <body>
    <%
    	Administrator admin = (Administrator)session.getAttribute("admin");
    	if(admin!=null){
    		%>
    		<jsp:forward page="admin.jsp"></jsp:forward>
    		<%
    	}else{
    		%>
    		<jsp:forward page="login.jsp"></jsp:forward>
    		<%
    	}
    %>
    
  </body>
 
</html>
