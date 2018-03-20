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

<title>My JSP 'districtAdd.jsp' starting page</title>

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
	<h2>添加区</h2>
	<table width="50%" border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td>区名称:</td>
			<td><input type="text" name="districtName" id="districtName" /></td>
		</tr>
		<tr>
			<td>街道/负责人:</td>
			<td><input type="text" name="streetName" /> <input type="text"
				name="linkMan" /></td>
		</tr>
		<tr>
			<td>街道/负责人:</td>
			<td><input type="text" name="streetName" /> <input type="text"
				name="linkMan" /></td>
		</tr>
		<tr>
			<td><input type="submit" name="sbt" id="sbt" value="提交" /></td>
		</tr>
		</table>
</body>
</html>
