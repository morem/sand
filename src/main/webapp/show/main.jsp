<#assign page=JspTaglibs["/WEB-INF/sitemesh-page.tld"] /> <#assign
sx=JspTaglibs["/WEB-INF/struts-dojo-tags.tld"] /> <#assign
s=JspTaglibs["/WEB-INF/struts-tags.tld"] />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<style type="text/css">
#id_showcase_content > div{float:left;}
</style>
<div id="id_showcase_content">
    <#include "/show/mainContent.jsp">
</div>
</body>
</html>