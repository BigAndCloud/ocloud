<%@page import="com.ourselec.ocloud.util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/default.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
input,button{
	width: 150px;
};
.notnull{
	color: red;
};

</style>		
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>	
<script type="text/javascript" src="<%=request.getContextPath()%>/js/Dialog.js"></script>	
<script type="text/javascript" src="<%=request.getContextPath()%>/js/timezone.js"></script>	
<script type="text/javascript">	





<% 
String errormsg = (String)request.getAttribute("errormsg");
if(!StringUtil.isEmpty(errormsg)) {
%>
function showerror() {
	Dialog.alert("<%=errormsg%>");
}
$(document).ready(function() {
	showerror();
});
<%	
}
%>	




</script>	

</head>

<body>
<br>
<br>
<div class="sensor-div">
<form action="<%=request.getContextPath()%>/deviceModel/modelListDeve" method="post" id="form1">
	
	
	<table width="100%"  cellpadding="2">
		<tbody>
		<tr >
				<td colspan="5" align="left"><strong>属性列表</strong>
				</td>
			</tr>
				<tr >
					
					<th >模板名称，ID</th>
					<th >模板图片地址</th>
					<th >接入/规划数量</th>
					<th >状态</th>
					
						
					</tr>					
				<c:forEach items="${list}" var="dto" varStatus="num">
				<tr>
				
					<td title="进入审批提交页面" >
					<a href="<%=request.getContextPath()%>/deviceModel/modelInfo?model_id=${dto.model.model_id}">${dto.model.model_name}(${dto.model.model_id})</a></td>
					<td title="${dto.model.picture}" ><img alt="" src="${dto.model.picture}">${dto.model.picture}</td>
					<td title="" ></td>
					<td title="${dto.model.audit_status}" align="left">
					<c:if test="${dto.model.audit_status == 3}"  ><span style="color: red">模板已生成</span><a href="<%=request.getContextPath()%>/deviceModel/toupdateModelSubmitAudit?id=${dto.model.id}">(提交审批)</a></c:if>
					<c:if test="${dto.model.audit_status == 0}"  ><span style="color: red">已提交审批</span></c:if>
					<c:if test="${dto.model.audit_status == 1}"  ><span style="color: red">审批驳回</span>(${dto.DMAC.audit_comment})<a href="<%=request.getContextPath()%>/deviceModel/toupdateModelSubmitAudit?id=${dto.model.id}">(重新提交)</a></c:if>
					<c:if test="${dto.model.audit_status == 2}"  ><span style="color: red">已重新提交</span></c:if>
					<c:if test="${dto.model.audit_status == 8}"  ><span style="color: red">审核通过</span>（${dto.model.updated_at}）</c:if>
					</td>
					</tr>
 									
				</c:forEach>
		
	</tbody>
	</table>
	


</form>
</div>
</body>
</html>