<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>add</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
<script type="text/javascript" src="<%=path %>/resource/js/jquery-1.12.4.js"></script>	
<script type="text/javascript">
	  $(document).ready(function(){
			$("#districtId").change(function(){
				//清空下拉框街道的选项
				$("#streetid option:gt(0)").remove();
				//获取要发送的数据
				var districtIdVal = $("#districtId").val();
				
				//如果没有选择区不进行ajax请求
				if(null == districtIdVal || "" ==  districtIdVal){
					return;
				}
				//发送ajax请求
				$.ajax({
					"url":"<%=path%>/house/getStreetByAjax",	//请求的地址
					"type":"POST",	//发送请求的方式
					"data":{"districtId":districtIdVal},		//发送的数据
					"dataType":"json",		//定义服务端返回的数据格式
					"success":function(data){	//响应成功的回调函数
						/* alert(data); */
						 for(var i=0; i<data.length; i++){
							var street = data[i];
							//创建option元素节点
							
							if( ${house.street.id == street.id }){
							 var $option = $("<option value='"+street.id+"' selected='selected'>"+street.name+"</option>");
							}else{
							  var $option = $("<option value='"+street.id+"'>"+street.name+"</option>");
							}
							
							//将新节点添加到select标签下
							$("#streetid").append($option);
						 }
					},
					"error":function(error){		//响应失败的回调函数
						alert("请求失败:" + error.status );
					}
				});
			})
		})
</script>

</head>

<body>
	<h2>修改房屋</h2>
	<form action="<%=path%>/house/modify" method="post" enctype="multipart/form-data">
	<table width="50%" border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td>房屋标题:</td>
			<td><input type="text" name="title" id="title" value="${house.title }"/>
			    <input type="hidden" name="id" id="id" value="${house.id }"/>
			    <input type="hidden" name="userid" id="userid" value="${house.userid }"/>
			    <input type="hidden" name="adddate" id="adddate" value="${house.adddate }"/>
			</td>
		</tr>
		<tr>
		  <td>房屋图片:</td>
		  <td><input type="file" name="img" id="img" /></td>
	   </tr>
		<tr>
		  <td>图片描述:</td>
		  <td>
			<textarea rows="4" cols="30" name="imgDesc" id="imgDesc" >图片描述</textarea>
		  </td>
	   </tr>
		<tr>
			<td>房屋位置:</td>
			<td><select name="districtId" id="districtId">
					<option value="">--请选择--</option>
		         <c:forEach items="${districts}" var="district">
			          <option value="${district.id}" ${house.district.id == district.id ?'selected="selected"':''}>${district.name}</option> 
		         </c:forEach>
		
			</select> 
			<select name="streetid" id="streetid">
			<option value="">--请选择--</option>
			 <c:forEach items="${streets }" var="street" > 
			  <option value="${street.id }" ${house.street.id == street.id ?'selected="selected"':''}>${street.name }</option>
		    </c:forEach>  
			</select></td>
		</tr>
		<tr>
			<td>面积:</td>
			<td><input type="text" name="floorage" id="floorage"  value="${house.floorage }"/></td>
		</tr>
		<tr>
			<td>房屋类型:</td>
			<td><select name="typeid" id="typeid">
					<option value="">--请选择--</option>
                    <option value="1"  ${house.typeid == 1 ? 'selected="selected"' :''} >一房一厅</option>
					<option value="2"  ${house.typeid == 2 ? 'selected="selected"' :''} >两房一厅</option>
					<option value="3"  ${house.typeid == 3 ? 'selected="selected"' :''} >三房一厅</option>
					<option value="4"  ${house.typeid == 4 ? 'selected="selected"' :''} >三房两厅</option>
					
			    </select>
			 </td>
		</tr>
		<tr>
			<td>价格:</td>
			<td><input type="text" name="price" id="price" value="${house.price }"/></td>
		</tr>
		<tr>
			<td>房屋详情:</td>
			<td>
			<!-- <input type="text" name="description" id="description" /> -->
			<textarea rows="4" cols="30" name="description" id="description" > 精装修，拎包入住</textarea>
			</td>
		</tr>
		<tr>
			<td>联系人:</td>
			<td><input type="text" name="contact" id="contact" value="${user.realName}" /></td>
		</tr>
		<tr>
			<td>联系电话:</td>
			<td><input type="text" name="contactTel" id="contactTel" value=" ${user.telephone}" /></td>
		</tr>
		<tr align="center">
			<td colspan="2"><input type="submit" name="button2" id="button2"
				value="提交修改" /></td>
		</tr>

	</table>
	</form>
</body>
</html>
