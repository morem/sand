<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title><decorator:title default="第一个装饰器页面"/></title>
        <script src="/sand/lib/js/jquery-1.7.2.min.js" type="text/javascript"></script>
        <script src="/sand/lib/js/livequery.js" type="text/javascript"></script>
    </head>

    <body>
    <style type="text/css">
	   .myheader
	   {
	       background-image: url(/sand/res/menu_back.JPG);
	       height:80px;
	       padding: 0 0 0 0;
	       margin:0 0 0 0;
		}
		.cls_main_body{
		  overflow:hidden;
		}
		.cls_main_body > div{
		  float:left;
		  border: solid 1px #EEEEEE;
		}
		.cls_main_body_menu{
		  width:100px;
		  background:#EEEEEE;
		}
		
		.cls_main_body_menu li{
		  list-style-type:none;
		}
		#id_main_body_content{
          overflow-y:scroll;
          overflow-x:scroll;
        }

    </style>
	<script type="text/javascript">
	$(document).ready(function(){
        $("span").text(document.documentElement.clientWidth);
        $("span1").text(document.documentElement.clientHeight);
        $(window).resize(function() {
               $("#id_main_body_menu").attr("style","height:" + (document.documentElement.clientHeight -140) + "px;");
               $("#id_main_body_content").attr("style",
                       "height:" + (document.documentElement.clientHeight - 140) + "px;" + 
                       "width:" + (document.documentElement.clientWidth - 120) + "px;");
        });
        $("#id_main_body_menu").attr("style","height:" + (document.documentElement.clientHeight -140) + "px;");
        $("#id_main_body_content").attr("style",
        		"height:" + (document.documentElement.clientHeight - 140) + "px;" + 
        		"width:" + (document.documentElement.clientWidth - 120) + "px;");      
	});
	</script>

    <div class="myheader">
        SiteMesh快速入门
    </div>
    <div style="clear: both;" class="cls_main_body">
        <div class="cls_main_body_menu" id="id_main_body_menu">
            <li><a href="<s:url action='main.action'/>">主页</a></li>
            <li><a href="#">自动橱窗</a></li>
            <li>-状态</li>
            <li>-配制</li>
            <li><a href="#">自动上下架</a></li>
            <li><a href="#">标题优化</a></li>
            <li><a href="#">自动提醒</a></li>
            <li><a href="#">进销存</a></li>
        </div>
        <div id="id_main_body_content">
            <decorator:body/>
        </div>
    </div>
    <div style="font:9pt; clear: both;" align="center">
        <hr/>
           我的小东东 by Lysin.Miao</div>
    </body>
</html>