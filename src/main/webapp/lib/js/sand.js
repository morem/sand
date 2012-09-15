$(document).ready(function(){
	$("[action$='.action']").livequery("click", function(){
		var $action = $(this).attr("action");
		var $target = $(this).attr("target");
		var $params = $(this).attr("params");
		var $form = $(this).attr("form");
		
		if ($form)
			if ($params)$params = $params +"&"+ $($form).serialize();
			else $params = $($form).serialize();
		console.log ($params)
		$("#runing").dialog('open');
		if ($target){
			$($target).load($action,$params, function(){
				$("#runing").dialog('close');
			});
		}else{
			$.post($action,$params, function(){
				$("#runing").dialog('close');}, "html")			
		}
	})
	
	$("[action$='.dialog']").livequery("click", function(){
    	console.log($(this).attr("target"))
        var $target = $(this).attr("target");
        var $title = $($target).attr("title");
        $($target).dialog({
        	   title: $title,
        	   modal: true,
        	   draggable:false,
        	   resizable:false,
        	   autoOpen:true,
        	   width:"auto",
        	   });
        $(".ui-dialog-titlebar").hide();
        var $close_target = $(this).attr("close_target");
        if ($close_target)
        	$($close_target).dialog("close");
    });
	
	$("[action$='.change']").livequery("click", function(){
		if ($(this).attr ("type") == "radio"){
			console.log ($(this).attr ("checked"));
			if ($(this).attr ("checked") == false)
				return;
		}
        $target = $(this).attr ("target")
        $target_attr = $(this).attr ("target_attr")
        $target_value = $(this).attr ("target_value")
        $target_g = $target.split(";");
        $target_attr_g = $target_attr.split(";");
        $target_value_g = $target_value.split(";");
        var $i = 0;
        var $j = 0;
        for ($i in $target_g){
            $target_attr_gg = $target_attr_g[$i].split("%")
            $target_value_gg = $target_value_g[$i].split("%")
        	for ($j in $target_attr_gg){
        		$($target_g[$i]).attr ($target_attr_gg[$j], $target_value_gg[$j]);
        	}
        }
    });

	$("#runing").dialog({
	    modal: true,
	    draggable:false,
	    resizable:false,
	    width:300,
	    height:20,
	    autoOpen:false	
	});
	
	$(".ui-dialog-titlebar").hide();
})