<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title><decorator:title default="第一个装饰器页面"/></title>
        <link href="/sand/lib/css/common.css" rel="stylesheet" type="text/css">
        <link href="/sand/lib/css/smoothness/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
        <link href="/sand/lib/treeview/jquery.treeview.css" rel="stylesheet" type="text/css" />
        
        <script src="/sand/lib/js/jquery-1.7.2.min.js" type="text/javascript"></script>
        <script src="/sand/lib/js/livequery.js" type="text/javascript"></script>
        <script src="/sand/lib/js/sand.js" type="text/javascript"></script>
        <script src="/sand/lib/js/jquery-ui-1.8.21.custom.min.js" type="text/javascript"></script>
        <script src="/sand/lib/treeview/lib/jquery.cookie.js" type="text/javascript"></script>
        <script src="/sand/lib/treeview/jquery.treeview.js" type="text/javascript"></script>
    </head>

    <body style="background-color:#F9F9F9">
    <style type="text/css">
		.cls_main_body{
		  height:100%;
		}
        .cls_main_body > div{
            float:left;
        }
		.cls_main_body_menu{
  		  min-width:100px;
		  background:#EEEEEE;
		}
		
		.cls_main_body_menu li{
		  list-style-type:none;
		}
		#id_main_body_content{
          overflow-y:auto;
          overflow-x:auto;
          background-color:#F9F9F9;
        }
        .ui-progressbar .ui-progressbar-value{ background-image: url(/sand/lib/images/pbar-ani.gif); }
    </style>
	<script type="text/javascript">
	/*
	$(document).ready(function(){
		$.extend({aa:function(){
            $("#id_main_body_menu").attr("style","height:" + (document.documentElement.clientHeight -2) + "px;");
            $("#id_main_body_content").attr("style",
                    "height:" + (document.documentElement.clientHeight - 2) + "px;" + 
                    "width:" + (document.documentElement.clientWidth - 100 -3) + "px;");			
		}});
		$.aa();
        $(window).resize(function() {
            $.aa();
        });
	});*/
	</script>
    <table class="cls_main_body">
        <tr>
        <td class="cls_main_body_menu" id="id_main_body_menu">
            <li><a href="<s:url action='main.action'/>">主页</a></li>
            <li><a href="<s:url action='show_main.action'/>">自动橱窗</a></li>
            <li><a href="<s:url action='shelf_main.action'/>">自动上下架</a></li>
            <li><a href="<s:url action='check_main.action'/>">宝贝诊断</a></li>
            <li><a href="#">标题优化</a></li>
            <li><a href="#">自动提醒</a></li>
            <li><a href="#">进销存</a></li>
        </td>
        <td id="id_main_body_content">
            <decorator:body/>
        </td>
        </tr>
    </table>
    </body>
    <div id="runing" class="ui-progressbar  ui-progressbar-value"
    style="background-image: url(/sand/lib/images/pbar-ani.gif);">
    </div>
</html>