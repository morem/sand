<div class="m_box">
	<div>当前调整方案</div>
	<form>
		<div id="id_showcase_config_showMode">
			<li><input name = "plan" type='radio' action=".change" <#if showMode="all">checked=true</#if>
			           target="#id_config_ctrl_all;#id_config_ctrl_cats;#id_config_ctrl_user"
			           target_attr="style;style;style"
			           target_value="display:block;display:none;display:none"/>全部宝贝</li>
			<li><input name = "plan" type='radio' action=".change" <#if showMode="cats">checked=true</#if>
                       target="#id_config_ctrl_all;#id_config_ctrl_cats;#id_config_ctrl_user"
                       target_attr="style;style;style"
                       target_value="display:none;display:block;display:none"/>按选定类目推荐</li>
			<li><input name = "plan" type='radio' action=".change" <#if showMode="user">checked=true</#if>
                       target="#id_config_ctrl_all;#id_config_ctrl_cats;#id_config_ctrl_user"
                       target_attr="style;style;style"
                       target_value="display:none;display:none;display:block"/>按指定宝贝推荐</li>
		</div>
	</form>
    <div class="a_group" id="id_config_ctrl_all" <#if showMode !="all">style="display:none"</#if>>
       <a>帮助</a>
       <a id="id_apply_plan" action="show_mainContent.action"
                             target="#id_showcase_content"
                             params="showMode=all">使用当前选中</a>
    </div>
    <div class="a_group" id="id_config_ctrl_cats" <#if showMode !="cats">style="display:none"</#if>>
       <a>帮助</a>
       <a id="id_apply_plan" action="show_mainContent.action"
                             target="#id_showcase_content"
                             params="showMode=cats">使用当前选中</a>
       <a id="id_change_plan" action="" target="#id_create_case_1" >修改..</a>
    </div>
    <div class="a_group" id="id_config_ctrl_user" <#if showMode !="user">style="display:none"</#if>>
       <a>帮助</a>
       <a id="id_apply_plan" action="show_mainContent.action"
                             target="#id_showcase_content"
                             params="showMode=user">使用当前选中</a>
       <a id="id_change_plan" action="show_itemPick.action" target="#id_showcase_content">修改..</a>
    </div>
</div>

<#include "/show/createCase.jsp">