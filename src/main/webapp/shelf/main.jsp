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
#id_shelf_content > div{
    float:left;
}
</style>
<div id = "id_shelf_content">
    <div id="id_shelf_content_left"  style="width:auto;">
	    <div class="m_box">
	        <div>运行状态</div>
	        <div>正在运行</div>
	        <div>
	           <div class="m_button">点击我改变状态</div>
	        </div>
	    </div>
	    <div class="m_box" style="min-width:200px;">
	       <div>调整方案</div>
           <div><input type="radio" />平均上下架</div>
           <div><input type="radio" />最热时间</div>
           <div><input type="radio" />工作日最热时间</div>
           <div>
           <div class="m_button">创建调整方案</div>
           <div class="m_button">使用选中方案</div>
           </div>
	    </div>
    </div>
        
    <div id="id_shelf_content_right"  style="min-width:500px;">

    <#include "/shelf/adjust_table.jsp">
    </div>
</div>
</body>
</html>