<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
 div{float:left;padding:3px; width:50px;text-align:center;border:1px solid #000000;}
</style>
<html>
<body>
    <table>
	<c:forEach var="item" items="${header}" varStatus="varStatus">
	   <tr bgcolor="${varStatus.index % 2 == 1? '#EFEFEF':'#FFFFFF'}">
	        <td>${varStatus.index}</td>
	        <td>${item.key}</td>
	        <td>${item.value}</td>
	    </tr>
	</c:forEach>
</table>
</body>
</html>
