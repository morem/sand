<div class="m_box" style="min-width:500px;">
    <#if showMode=="all">
        <div>你现在的橱窗模式已经是<b>全部宝贝</b>参与推荐了</div>
    </#if>
    <#if showMode!="all">
        <div>修改调整方式</div>
        <div>
        <div class="m_button" style="display:inline;"
             action="/sand/show_configModeAll.action"
             params="showMode=all"
             target="#id_showcase_config_content">点我修改自动橱窗推荐模式</div>为<b>全部宝贝</b>参与推荐</div>
    </#if>
</div>