<style type="text/css">
.item_pick{font-size:80%;}
.item_pick > div{
    clear:both;
    width:99%;
}
.item_pick .search{
    clear:both;
}
.item_pick .search div{float:left; padding-left:15px;}

.item_pick hr{
    border:1px solid #EEEEEE;
}

.item_pick .item_header{}
.item_pick .item_detail{height:550px;border:1px solid #DDDDDD;overflow-y:scroll;}
.item_pick .item_detail .cls_items_contain_odd{background-color:#EEEEEE}
.item_pick .item_header{
    font-size:70%;
    height:15px;
    text-align:center;
    background-color:#5cc26F;
}

.item_pick .item_detail div{
    float:left;
    font-size:70%;
    height:50px;
    margin:3px 0 3px 1px;
    text-align:left;
}

.item_pick .item_detail >div{
    clear:both;
}


.item_pick .item_select {width:2%; min-width:15px; }
.item_pick .item_in_show {width:2%;}
.item_pick .item_pic {width:3%;}
.item_pick .item_title {width:40%;}
.item_pick .item_status {width:5%;}
.item_pick .item_status_change {width:5%;}
.item_pick .item_detail .item_select input{top:10px;}
.item_pick .item_detail label,
.item_pick .item_detail select{
    width:120px;
}

.item_pick .item_detail .search{
    width:100px;
    border-right:1px solid #EEEEEE;
}

.item_pick .search label,
.item_pick .search select,
.item_pick .search input{
    width:100px;
}
.item_pick .item_navigation {clear:both; text-align:right;}
.item_pick .item_navigation div{float:right;}
.item_pick .item_navigation select{border:1px solid #EEEEEE;}
.item_pick .item_navigation .finish{border:1px solid #EEEEEE; padding-top:5px;padding-right:100px;}
.item_pick .item_navigation .pre_page{border:1px solid #EEEEEE; padding-top:0px;padding-right:30px;}
.item_pick .item_navigation .select_page{border:1px solid #EEEEEE; padding-top:0px;padding-right:30px;}
.item_pick .item_navigation .next_page{border:1px solid #EEEEEE; padding-top:0px;padding-right:50px;}
.item_pick .item_navigation .select_change{border:1px solid #EEEEEE; padding-top:0px;padding-right:50px;}
</style>
<script type="text/javascript">
$(document).ready(function(){
    $("#id_item_pick_select_all").livequery("click", function(){
    	   //console.log ("------" + $(this).attr("checked"));
    	   if ($(this).attr("checked"))
    	       $("#id_form_items_detail :checkbox").attr("checked", true);
    	   else
    		   $("#id_form_items_detail :checkbox").attr("checked", false);
        });
});
$("#id_config_items_sort").ready(function(){
	console.log("--------------------------------");
	$("#id_config_items_sort option").attr("selected", null);
	var $sort = $.cookie('sort');
	console.log ($sort);
	$("#id_config_items_sort "+ "[href=" + $sort +"]").attr("selected", "selected")
});
</script>
<div class="item_pick">
	<div class="search">
	   <form id="id_form_item_pick">
	    <div>
	        <label>关键词</label> 
	        <input name="key" type="text" value="">
	    </div>
	    <div>
	        <label>类目</label> 
	        <select name="cats" >
	            <option value="-1" selected="selected">所有的宝贝</option>
	        </select>
	    </div>
	    <div>
	        <label for="id_config_items_inshow">橱窗</label> 
	        <select
	            name="inshow" id="id_config_items_inshow" size="1">
	            <option value="-1" selected="selected">忽略</option>
	            <option value="0">不在橱窗中</option>
	            <option value="1">在橱窗中</option>
	        </select>
	    </div>
	    <div>
	        <label for="id_config_items_sort">排序</label> 
	        <select name="sort" 
	            id="id_config_items_sort" size="1">
	            <option value="ignore" >忽略</option>
	            <option value="list_time:asc">最早上架在先</option>
	            <option value="list_time:desc">最晚上架在先</option>
	            <option value="delist_time:asc">最早下架在先</option>
	            <option value="delist_time:desc">最晚下架在先</option>
	            <option value="num:asc">最多数量在先</option>
	            <option value="num:desc">最少数量在先</option>
	            <option value="modifoed:asc">最早修改在先</option>
	            <option value="modifoed:desc">最近修改在先</option>
	        </select>
	    </div>
	    <div>
	        <label for="id_config_items_page_item_no">每页</label> 
	        <select
	            name="page_item_no" id="id_config_items_page_item_no" size="1">
	            <option value="10">10</option>
	            <option value="20">20</option>
	            <option value="40" selected="selected">40</option>
	            <option value="100">100</option>
	        </select>
	    </div>
	    <div>
	       <a class="a_group"
	              action = "/sand/show_itemPick.action" 
	              target = "#id_showcase_content"
	              params = ""
	              form = "#id_form_item_pick">搜索</a>
	    </div>
	    </form>
	</div>
	<div>
	   <table>
	    <tr class="item_header">
            <td class="item_select"><input class="" type="checkbox" id="id_item_pick_select_all" ></td>
            <td class="item_in_show">状态</td>
            <td class="item_pic">商品图片</td>
            <td class="item_title">商品名称</td>
            <td class="item_status">当前状态</td>
            <td class="item_status_change">转换</td>
        </tr>
        </table>
	</div>
    <div class="item_detail">
        <form id="id_form_items_detail">
        <table>
        <#assign x = 0>
        <#list allItemsInShow as item>
	    <tr class="cls_items_contain <#if x%2 =1>cls_items_contain_odd</#if>">
	        <td class="item_select"><input name="item_select_${item.num_iid}" class="" type="checkbox"></td>
	        <td class="item_in_show">状态</td>
	        <td class="item_pic"><img src="${item.pic_url}" width="50px" height="50px"/></td>
	        <td class="item_title">${item.title}</td>
	        <td class="item_status">正常</td>
	        <td class="item_status_change">
		        <select name="change_to_${item.num_iid}">
		            <option value="normal">转为正常推荐</option>
		            <option value="forever">转为始终推荐</option>
		            <option value="never">转为始终不推荐</option>
		        </select>
	        </td>
	    </tr>
	    <#assign x = x + 1>
	    </#list>
	    </table>
	    </form>
	    <div style="clear:both;"></div>
	</div>
    <div class="item_navigation">
        <div class="next_page"><div class="m_button">下一页</div></div>
	    <div class="select_page">第<select name="page">
	        <option>1</option>   
	        <option>2</option>   
	        <option>3</option>   
	        <option>4</option>   
	        <option>5</option>   
        </select>页</div>
        <div class="pre_page"><div class="m_button">上一页</div></div>
        <div class="finish"><b style="color:red">
        <a class="m_button"
            action = "/sand/show_mainContent.action" 
            target = "#id_showcase_content"
            >返回</a></b></div>
        <div class="select_change">
            <div class="m_button"
                  action = "/sand/show_itemPick.action" 
                  target = "#id_showcase_content"
                  params = "mode=normal"
                  form = "#id_form_items_detail">正常模式</div>
            <div class="m_button"
                  action = "/sand/show_itemPick.action" 
                  target = "#id_showcase_content"
                  params = "mode=forever"
                  form = "#id_form_items_detail">始终推荐模式</div>
            <div class="m_button"
                  action = "/sand/show_itemPick.action" 
                  target = "#id_showcase_content"
                  params = "mode=never"
                  form = "#id_form_items_detail">始终不推荐模式</div>
        </div>
    </div>
</div>

