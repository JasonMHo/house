<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'register.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>


<body>
	<h2>用户注册</h2>
	<form action="<%=path %>/user/add" method="post">
		<table width="50%" border="1" cellspacing="0" cellpadding="5">
			<tr>
				<td>用户名:</td>
				<td><input type="text" name="userName" id="userName" /></td>
			</tr>
			<tr>
				<td>密码:</td>
				<td><input type="text" name="passWord" id="passWord" /></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" name="reg"
					id="reg" value="注册" /></td>
			</tr>

		</table>
	</form>

</body>
</html>

