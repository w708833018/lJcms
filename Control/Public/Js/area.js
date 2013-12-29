function loadArea(areaId,areaType) {
    $.post(ajaxurl,{'parent':areaId},function(data){
		data=eval('('+data+')');
        $('#'+areaType).html('<option value="">请选择城市</option>');
			if(data){
				$.each(data,function(no,items){
					$('#'+areaType).append('<option value="'+items.id+'">'+items.name+'</option>');
			 });
			}
    });
}