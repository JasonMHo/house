<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>list</title>
 
<style type="text/css">
  #notLogin,#operate{color:blue; font-size: 12px;}
  a{text-decoration: none;}
</style>   
<script type="text/javascript" src="<%=path %>/resource/js/jquery-1.12.4.js"></script>
<script type="text/javascript" >
		
	  $(document).ready(function(){
			$("#districtId").change(function(){
				//清空下拉框街道的选项
				$("#streetId option:gt(0)").remove();
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
							var $option = $("<option value='"+street.id+"'>"+street.name+"</option>");
							//将新节点添加到select标签下
							$("#streetId").append($option);
						 }
					},
					"error":function(error){		//响应失败的回调函数
						alert("请求失败:" + error.status );
					}
				});
			})
			
					
			$("#firstPage").click(function(){
				//改变pageNo的值
				$("#pageNo").val(1);
				//提交表单
				$("#searchForm").submit();
			})
			
			$("#prePage").click(function(){
				$("#pageNo").val(parseInt($("#pageNo").val()) - 1);
				$("#searchForm").submit();
			})
			
			$("#nextPage").click(function(){
				$("#pageNo").val(parseInt($("#pageNo").val()) + 1);
				$("#searchForm").submit();
			})
			
			$("#lastPage").click(function(){
				$("#pageNo").val('${pages.totalPages}');
				$("#searchForm").submit();
			})
			
			$("#searchBtn").click(function(){
				$("#pageNo").val(1);
				$("#searchForm").submit();
			})
			
			$("#goBtn").click(function(){
			    if(  checkJump()== true){
				    var pNo = $("#jumpPage").val();
					$("#pageNo").val(pNo);
					$("#searchForm").submit();
			    }
			})
			
			$("#clearBtn").click(function(){
			    //改变pageNo的值为1
			 	$("#pageNo").val(1);
			 	$("#title").val("");
			 	$("#priceType").val("");
			 	$("#floorageType").val("");
			 	$("#districtId").val("");
			 	$("#streetId").val("");
			 	$("#typeId").val("");
			 	
			})
			
			var msg = $("#msg").val();
	        if(msg != null && msg != " " && msg.length != 0){
	           alert(msg);
	           $("#msg").val("");
	           msg=$("#msg").val();
	              
	        }
	        
			 
			
		})
		
		
		
		
			function checkJump(){
			   var jumpPageNo = $("#jumpPage").val();
			   
			   var reg = /^[1-9]\d*$/;
			  if(!reg.test(jumpPageNo)){
			    alert("请输入一个正整数");
			    $("#jumpPage").val("");
			    $("#jumpPage").focus();
			    return false;
			  }
			   
			   if(jumpPageNo < 1 || jumpPageNo > ${pages.totalPages}){
				   alert("输入的页码不在范围内");
				    $("#jumpPage").val("");
				    $("#jumpPage").focus();
			     return false;
			   }
			     return true;
			}
			
			function clickConfirm(){
			    if(confirm("确定要删除吗？")) {
			        return true;
			    }else{
			        return false;
			    }
 			}
			
</script>
	

  </head>
  
 <body>
 
<table width="80%" border="1" cellspacing="0" cellpadding="5">
  <tr>
      <td>
      <input type="hidden" id="msg" name="msg" value="${msg}">
       <c:if test="${not empty user.userName}"> 
         <a href="<%=path%>/house/add" ><input type="button" name="pubBtn" id="pubBtn" value="发布信息" /></a>
         <a href="<%=path%>/logout" ><input type="button" name="logoutBtn" id="logoutBtn" value="退出系统" /></a>
       </c:if>
       <c:if test="${empty user.userName}"> 
        <span id="notLogin">用户未登录</span>
       </c:if>
      </td>
      <td align="right">
           <form action="<%=path %>/login" method="post">
		      	用户名:<input type="text" name="userName" id="userName" value="${empty user.userName ?'':user.userName}"/>
		    	密码:<input type="password" name="passWord" id="passWord" />
		        <input type="submit" name="button" id="button" value="登录" />
                <a href="<%=path%>/register.jsp"><input type="button" name="regBtn" id="regBtn" value="注册" /></a>
		    </form>    
      </td>
  </tr>
  
</table>
<br/>

<form id="searchForm" action="<%=path%>/house/list" method="post">
<table width="80%" border="1" cellspacing="0" cellpadding="5">
  <tr>
    <td>
    <input type="hidden" id="pageNo" name="pageNo" value="${houseQuery.pageNo}" />
 
    标题：
    <input type="text" name="title" id="title" value="${houseQuery.title }"/></td>
    <td>
		价格:
		<select name="priceType" id="priceType">
			<option value="">--请选择--</option>
			<!-- c:if写在option里面会报错，编译器BUG -->
        <%-- <option value="1" <c:if test="${houseQuery.priceType == 1}">selected="selected"</c:if> >0-1000</option> --%>
			
		<!-- 	可使用EL表达式结合三目运算做简单的判断，Example : testStatement ? value1 : value2,-->
			 <option value="1" ${houseQuery.priceType == 1 ? 'selected="selected"' :''} >0-1000</option>
			 <option value="2" ${houseQuery.priceType == 2 ? 'selected="selected"' :''} >1000-2000</option>
			 <option value="3" ${houseQuery.priceType == 3 ? 'selected="selected"' :''} >2000以上</option>
			
	   </select>
    </td>
    <td>
		面积:
		<select name="floorageType" id="floorageType">
			<option value="">--请选择--</option>
			<option value="1" ${houseQuery.floorageType == 1 ? 'selected="selected"' :''} >60以下</option>
			<option value="2" ${houseQuery.floorageType == 2 ? 'selected="selected"' :''} >60-100</option>
			<option value="3" ${houseQuery.floorageType == 3 ? 'selected="selected"' :''} >60-100</option>
			<option value="4" ${houseQuery.floorageType == 4 ? 'selected="selected"' :''} >150以上</option>
	   </select>
	</td>
  </tr>
  <tr>
    <td>房屋位置:
      <select name="districtId" id="districtId">
		<option value="">--请选择--</option>
	
		<c:forEach items="${districts}" var="district">
		
		     <option value="${district.id}" ${houseQuery.districtId == district.id ?'selected="selected"':''}>${district.name}</option>    
		           
		</c:forEach>
	  </select>
      <select name="streetId" id="streetId">
		<option value="">--请选择--</option>
		<c:forEach items="${streets }" var="street" >
		
	     <option value="${street.id}" ${houseQuery.streetId == street.id ?'selected="selected"':''}>${street.name}</option>
		
		</c:forEach>
	  </select>
	 </td>
    <td>房屋类型:
      <select name="typeId" id="typeId">
		<option value="">--请选择--</option>
		<option value="1"  ${houseQuery.typeId == 1 ? 'selected="selected"' :''} >一房一厅</option>
		<option value="2"  ${houseQuery.typeId == 2 ? 'selected="selected"' :''} >两房一厅</option>
		<option value="3"  ${houseQuery.typeId == 3 ? 'selected="selected"' :''} >三房一厅</option>
		<option value="4"  ${houseQuery.typeId == 4 ? 'selected="selected"' :''} >三房两厅</option>
	   </select>
	</td>
    <td><input type="button" name="searchBtn" id="searchBtn" value="搜索房屋" />&nbsp;&nbsp;&nbsp;
        <input type="button" name="clearBtn" id="clearBtn" value="清空条件" />
    </td>
  </tr>
</table>
</form>


<br/>
<table width="80%" border="1" cellspacing="0" cellpadding="5">
  <tr>
    <td>编号</td>
    <td>图片</td>
    <td>标题</td>
    <td>房屋位置</td>
    <td>面积</td>
    <td>联系方式</td>
    <td>价格</td>
    <td>房屋类型</td>
    <td>操作</td>
  </tr>
  <c:forEach items="${pages.contentList }" var="house">
  <tr>
    <td>${house.id }</td>
    <td><img src="<%=path %>/resource/image/ab.jpg" /></td>
    <td>${house.title }</td>
    <td>${house.district.name} ${house.street.name}</td>
    <td>${house.floorage }</td>
    <td>${house.contact }</td>
    <td>${house.price }</td>
    <td>${house.ttype.name }</td>
    <td>
        <c:if test="${empty user.userName}"><span id="operate">请登录后操作</span></c:if>
        <c:if test="${not empty user.userName}">
	        <a id ="deletHouse" name="deletHouse" href="<%=path%>/house/delete/${house.id }" onclick="return clickConfirm();">删除</a>&nbsp; 
	        <a id ="modifyHouse" name="modifyHouse" href="<%=path%>/house/modify/${house.id }">修改</a>
        </c:if>
     </td>
  </tr>

   </c:forEach>

  <tr>
    <td colspan="9"> 
         <a id="firstPage" name="firstPage" href="javascript:void(0)">首页</a> 
    <c:if test="${pages.pageNo > 1 }">
         <a id="prePage" name="prePage" href="javascript:void(0)">上一页</a>
    </c:if>     
    <c:if test="${pages.pageNo < pages.totalPages }">
         <a id="nextPage" name="nextPage" href="javascript:void(0)">下一页</a>
    </c:if>     
          <a id="lastPage" name="lastPage" href="javascript:void(0)">尾页</a> 
	    第 ${pages.pageNo } / ${pages.totalPages } 页 
	    共${pages.totalInfos }条记录  
	    跳
	    <input  type="text"  name="jumpPage" id="jumpPage" size="4" maxlength="4" />
	    页
	    <input type="button" name="goBtn" id="goBtn" value="GO" />
    </td>
  </tr>
  

   
</table>
<p>&nbsp;</p>


</body>
</html>
