<div class="m_box" style="min-width:500px;">
    <#if showMode=="user">
        <div>你现在的橱窗模式已经是<b>按用户指定宝贝</b>参与推荐了,你可以继续指定宝贝的推荐方式</div>
    </#if>
    <#if showMode!="user">
        <div>修改调整方式</div>
        <div>
        <div class="m_button" style="display:inline;"
             action="/sand/show_configModeUser.action"
             params="showMode=user"
             target="#id_showcase_config_content">点我修改自动橱窗推荐模式</div>为<b>按用户指定宝贝</b>参与推荐</div>
    </#if>
</div>
<#if showMode=="user">
<div class="m_box" style="min-width:500px;">
<div>定制宝贝推荐方式</div>
<style type="text/css">
#id_config_mode_user_item_search{
    clear:both;
    height:30px;
}
#id_config_mode_user_item_search > div{
    float:left;
}
    
</style>
<div id="id_config_mode_user_item_search">
    <div>
        <label for="id_config_items_keyword">商品名称</label>
        <input type="text" name="keyword" id="id_config_items_keyword" size="20" style="padding:0 0 0 0;margin:0 0 0 0;width:85px;"/>
    </div>
    <div>
        <label for="id_config_items_search_cata">类目</label>
        <select name="cata" id="id_config_items_search_cata" size="1"> 
            <option value="-1" selected="selected">所有的宝贝</option>
            <#if cats??>
            <#list cats as cat>
            <option value="${cat.cid}" >${cat.name}</option>
            </#list>
            </#if>          
        </select>
    </div>
    <div>
        <label for="id_config_items_inshow">橱窗</label>
        <select name="inshow" id="id_config_items_inshow" size="1">
            <option value="-1" selected="selected">忽略</option>
            <option value="0">不在橱窗中</option>
            <option value="1">在橱窗中</option>
        </select>
    </div>  
    <div>
        <label for="id_config_items_sort">排序</label>
        <select name="sort" id="id_config_items_sort" size="1">
            <option value="ignore" selected="selected">忽略</option>
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
        <select name="page_item_no" id="id_config_items_page_item_no" size="1">
            <option value="10">10</option>
            <option value="20">20</option>
            <option value="40" selected="selected">40</option>
            <option value="100">100</option>
        </select>
    </div>
    <div id="id_config_search_button" class="m_button"><a>查找</a></div>
</div>
<hr style="padding:0 0 0 0;margin:0 0 0 0;"/>
<style type="text/css">
#id_config_mode_user_item_detail{
    clear:both;
}
.cls_items_contain{
    clear:both;
    overflow:auto;
    border-bottom:1px solid #CCCCCC;
    padding:1px 1px 1px 1px;
}
.cls_items_contain > div{
    float:left;
    border-left:1px solid #CCCCCC;
    padding: 0 3px 0 3px;
}

.cls_items_contain .title{
    width:400px
}

.cls_items_contain .show_status{
    font-size:60%;
    width:20px;
}

.cls_items_contain .checkbox{ margin-top:15px;}
.cls_items_contain .show_status{ margin-top:6px;}
.cls_items_contain .title{ margin-top:10px;}
.cls_items_contain .status{ margin-top:18px;}
.cls_items_contain .status_change{ margin-top:15px;}


</style>
<div id="id_config_mode_user_item_detail">
	<#list allItemsInShow as item>
	<div class="cls_items_contain">
	    <div class="checkbox"><input type="checkbox"/></div>
	    <div class="show_status">已推荐</div>
	    <div class="image"><img src="${item.pic_url}" width="50px" height="50px" border="1px solid #CCCCCC"/></div>
	    <div class="title">${item.title}</div>
	    <div class="status">正常</div>
	    <div class="status_change">
        <select>
            <option>转为正常推荐</option>
            <option>转为始终推荐</option>
            <option>转为始终不推荐</option>
        </select>
        </div>
	</div>
	</#list>
</div>
<hr/>
<div id="id_config_mode_user_item_footer">
    <div>上一页</div>
    <div>跳到第[]页,总20页</div>
    <div>下一页</div>
</div>

</div>
</#if>