<div class="m_box" style="min-width:500px;">
    <#if showMode=="cats">
        <div>你现在的橱窗模式已经是<b>按指定类目</b>参与推荐了，你可以继续修改类目的推荐属性</div>
    </#if>
    <#if showMode!="cats">
        <div>修改调整方式</div>
        <div>
        <div class="m_button" style="display:inline;"
             action="/sand/show_configModeCats.action"
             params="showMode=cats"
             target="#id_showcase_config_content">点我修改自动橱窗推荐模式</div>为<b>按指定类目</b>参与推荐</div>
    </#if>
</div>
<#if showMode=="cats">
<div class="m_box" style="min-width:500px;">
    <div>请通过勾选类目前的方框选择推荐类目</div>
    <div>
        <#if cats??>
		<ul style="padding-left:20px;">
		</#if>
		
		<#if cats??>
		<#list cats as cat>
		<li id="config_cats_cat_${cat.cid}"><input type="checkbox" id="${cat.cid}"/>
		    <a>${cat.name}</a>
		    <#if cat.sons??>
		    <ul>
		        <#list cat.sons as son>
		            <li id="config_cats_cat_${son.cid}"><input type="checkbox" id="${son.cid}"/><a>${son.name}</a></li>
		        </#list>
		    </ul>
		    </#if>
		</li>
		</#list>
		</#if>
		
		<#if cats??>
		</ul>
		</#if>
    </div>
</div>
</#if>