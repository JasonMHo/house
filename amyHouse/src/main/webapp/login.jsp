<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>login</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="<%=path %>/resource/css/common.css">
	<style type="text/css">
	a{text-decoration: none; font-size: 12px;}
	</style>
	<script type="text/javascript" src="resource/js/jquery-1.12.4.js"></script>
	<script type="text/javascript">
	     $(document).ready(function(){
	         window.history.forward(1);  
	        var registerMsg = $("#registerMsg").val();
	        if(registerMsg != null && registerMsg != " " &&  registerMsg.length != 0){
	           alert(registerMsg);
	           $("#registerMsg").val(" ");
	             
	        }
	        var loginMsg = $("#loginMsg").val();
	        if(loginMsg != null && loginMsg != " " && loginMsg.length != 0){
	           alert(loginMsg);
	           $("#loginMsg").val(" ");
	              
	        }
	        
	      
	     }) 
	
	</script>

  </head>
  
  <body>
<%-- <h2>${registerMsg} </h2>
<h2>${loginMsg}</h2> --%>
	<form action="<%=path %>/login" method="post">
		<table width="60%" border="1" cellspacing="0" cellpadding="5">
		  <tr>
		    <td>
		    	用户名:<input type="text" name="userName" id="userName" value=""/>
		    	密码:<input type="password" name="passWord" id="passWord" value=""/>
		    	<input type="submit" name="sbt" id="sbt" value="登录" />
	 	    	 <input type="hidden" id="registerMsg" name="registerMsg" value="${registerMsg} "> 
	 	    	 <input type="hidden" id="loginMsg" name="loginMsg" value="${loginMsg} "> 
		    	
		    	
		    	<a href="register.jsp"><input type="button" name="reg" id="reg" value="注册" /></a>
		    	&nbsp;&nbsp;&nbsp;&nbsp;
		    	<a href="<%=path %>/house/list">不登录,随便看看</a>
		    </td>
		  </tr>
		</table>
	</form>
</body>
</html>
