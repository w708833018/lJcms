//加载日期函数库
function ct_editor(id){
	$.getScript('/Public/Js/Editor/kindeditor-min.js', function() {
						KindEditor.basePath = '/Public/Js/Editor/';
						KindEditor.create('textarea[name="content"]',{newlineTag:'P'});
					});

	}

function ct_dialog(titles,urls,lock){
var myDialog = art.dialog({id:'BLCITY1990',title:titles,lock:true,padding:5});// 初始化一个带有loading图标的空对话框
jQuery.ajax({
    url: urls,
    success: function (data) {
        myDialog.content(data);// 填充对话框内容
    }
});
}

function cg_language(titles,urls){
var myDialog = art.dialog({
	id:'BLCITY1990',
	title:titles,
	lock:true,
	padding:5,
	ok: function () {
			var l=$('input:radio[name=l]:checked').val();
			parent.location.href=l;
			this.close();
    		}
	});// 初始化一个带有loading图标的空对话框
jQuery.ajax({
    url: urls,
    success: function (data) {
        myDialog.content(data);// 填充对话框内容
    }
});
}

function set_city(urls){
	jQuery.ajax({
    url: urls,
    success: function (data) {
        art.dialog.list['BLCITY1990'].content(data);
    }
});
}

function set_city_value(id,value,cityname){
	$('#'+id).val(value);
	$('#'+id+'_instr').html('已选择：'+cityname);

	art.dialog.list['BLCITY1990'].close();
}

function myupload(titles,urls,inputid,p,paths){
	if(p==undefined){p=1;};
	if(paths==undefined){
		paths='';types='';
		}else{
			types='alllist';
			}
	if(urls==''){urls='./index.php?g=Admin&m=Attache&a=index';};
	if(inputid==''){inputid='choosepic'};
	var myDialog = art.dialog({
		padding:0,
		width:'447px',
		id:'BLUPLOAD',
		title:titles,
		lock:false,
		ok: function () {
			$("#"+inputid).val($("#upurl").val());
			this.close();
    		},
		button: [
        {
            name: '图片库',
            callback: function () {
                this.content('正在读取中......');
				jQuery.ajax({
					url:urls+"&type=alllist&page="+p,
					success:function(data){
						myDialog.content(data);// 填充对话框内容
						}
				});
				return false;
            },
        },
        
    ]
		
		});// 初始化一个带有loading图标的空对话框
	jQuery.ajax({
		url: urls+"&type="+types+"&paths="+paths+"&page="+p,
		success: function (data) {
			myDialog.content(data);// 填充对话框内容
		}
	});
}

function gzconfirm(titles){
	//个性化提示框
	art.dialog.confirm(titles, function () {
    	return true;
	}, function () {
    	return false;
	});
	}