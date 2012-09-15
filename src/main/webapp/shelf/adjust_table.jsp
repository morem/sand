<script type="text/javascript">
$(document).ready(function(){
    $.extend({update_day_hour:function($day, $hour){
    	var $day_sum=[0,0,0,0,0,0,0]
    	var $sum = 0
        var $days = ["0","1","2","3","4","5","6"]
        var $hours = ["00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23"]
        for ($h in $hours){
        	var $hour_sum = 0
        	for ($d in $days){
        		var e = $("#id_at_input_" + $days[$d] + "_" + $hours[$h])
        		var $value = Number(e.attr("value")).toFixed(2)*100
        		$hour_sum = $hour_sum + $value
        		$day_sum[$d] = $day_sum[$d] + $value
        		$sum = $sum + $value
         	}
        	$("#id_at_sum_hour_" + $hours[$h]).text (($hour_sum/100).toFixed(2))
        }

    	for ($d in $day_sum){
    		$("#id_at_sum_day_" + $days[$d]).text (($day_sum[$d]/100).toFixed(2))   		
    	}
    	
    	$("#id_at_sum_all").text (($sum/100).toFixed(2))
    	if ($sum/100 > 100)
    		$("#id_at_sum_all").attr ("style","color:red")
        else
        	$("#id_at_sum_all").attr ("style","color:green")
    }})
    $.update_day_hour ()
    
    $("#id_adjust_table :input").livequery("change", function(){
    	$.update_day_hour ()
    })
	
    $("[id$='.atb_hour']").livequery("click", function(){
        var $day
        var $days = ["0","1","2","3","4","5","6"]
        var $hour = $(this).attr("data")
        var $mode = $(this).attr("m_mode")
        for ($i in $days){
            var e = $("#id_at_input_" + $days[$i] + "_" + $hour)
            var $value = Number(e.attr("value")).toFixed(2)*100
            if ($mode == "add")
                $value = $value + 1        
            else if ($mode == "addd")
            	$value = $value + 10
            else if ($mode == "sub")
            	$value = $value - 1 
            else
            	$value = $value - 10

            if ($value < 0) $value = 0
            e.attr("value", ($value/100).toFixed(2))
        }
        $.update_day_hour ()
    })

    $("[id$='.atb_day']").livequery("click", function(){
        var $hours = ["00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23"]
        var $day = $(this).attr("data")
        var $mode = $(this).attr("m_mode")
        for ($i in $hours){
            var e = $("#id_at_input_" + $day + "_" + $hours[$i])
            var $value = Number(e.attr("value")).toFixed(2)*100
            if ($mode == "add")
                $value = $value + 1        
            else if ($mode == "addd")
                $value = $value + 10
            else if ($mode == "sub")
                $value = $value - 1 
            else
                $value = $value - 10

            if ($value < 0) $value = 0
            e.attr("value", ($value/100).toFixed(2))
        }
        $.update_day_hour ()
    })
})
</script>

<div class="" id="id_adjust_table">
        <div>
        <div>方案名称<input type="text" value="请输入方案名称"></div>
        <div>方案名称<input type="radio" value="请输入方案名称"></div>
        <div>方案名称<input type="radio" value="请输入方案名称"></div>
        </div>
        <div>
        <table class="m_table">
            <tr class="m_table_header">
                <td></td>
                <#list ["周一","周二","周三","周四","周五","周六","周日"] as day>
                    <td>${day}</td>
                </#list>
                 <td>总计</td>
                 <td>调整</td>
            </tr>
         <#list ["00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23"] as hour>
            <tr>
            <td class="m_table_row_header">${hour}:00~${hour}:59</td>
            <#list ["1","2","3","4","5","6","0"] as day>
                <td>
                    <input type="text" value='0.59' id="id_at_input_${day}_${hour}" day="${day}" hour="${hour}"/>%
                </td>
            </#list>
            <td><b id="id_at_sum_hour_${hour}">90</b>%</td>
            <td>
            <div class="m_button m_add_sub" id="id_at_button.atb_hour" m_mode="addd" data=${hour}>++</div>
            <div class="m_button m_add_sub" id="id_at_button.atb_hour" m_mode="add" data=${hour}>+</div>
            <div class="m_button m_add_sub" id="id_at_button.atb_hour" m_mode="sub"  data=${hour}>-</div>
            <div class="m_button m_add_sub" id="id_at_button.atb_hour" m_mode="subb"  data=${hour}>--</div>
            </td>
            </tr>
         </#list>
         <tr>
            <td></td>
            <#list ["1","2","3","4","5","6","0"] as day>
                <td><b id="id_at_sum_day_${day}">0</b>%</td>
            </#list>
            <td><b id="id_at_sum_all">100</b>%</td>
         </tr>
         <tr>
             <td></td>
             <#list ["1","2","3","4","5","6","0"] as day>
             <td>
             <div class="m_button m_add_sub" id="id_at_button.atb_day" m_mode="add" data=${day}>+</div>
             <div class="m_button m_add_sub" id="id_at_button.atb_day" m_mode="sub" data=${day}>-</div>
             </td>
             </#list>
         </tr>
         <tr>
             <td></td>
             <#list ["1","2","3","4","5","6","0"] as day>
             <td>
             <div class="m_button m_add_sub" id="id_at_button.atb_day" m_mode="addd" data=${day}>++</div>
             <div class="m_button m_add_sub" id="id_at_button.atb_day" m_mode="subb" data=${day}>--</div>
             </td>
             </#list>
             
         </tr>
         </table>
         <div class="m_button">保存</div>
        </div>
</div>