    <div class="m_box" >
        <div>当前状态</div>
        <div>
            <div>当前"自动橱窗"功能已经</div>
           <div id="id_show_status">
           <b>
           <#if runStatus =="run">正在运行</#if>
           <#if runStatus =="stop">停止</#if>
           </b>
           </div>
        </div>
        <div class="a_group"> <a id="id_ajax_showcase_run_status"
                    action="/sand/show_mainContent.action"
                    params="toggleRunStatus=''" 
                    target="#id_showcase_content">点我切换..</a>
        </div>
    </div>