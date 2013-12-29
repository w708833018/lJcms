<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/Control/Public/Admin/layout.css" rel="stylesheet" type="text/css" />
<title>联系我们</title>
<script type="text/javascript" src="/Control/Public/Js/jquery.min.js"></script>
<script type="text/javascript" src="/Control/Public/Js/jquery.validate.js"></script>
<load href="/Control/Public/Css/Jquery.form.css" />
<load href="/Control/Public/Js/Date/WdatePicker.js" />
<script type="text/javascript" src="/Control/Public/Js/artDialog/jquery.artDialog.js?skin=default"></script>
<script type="text/javascript" src="/Control/Public/Js/Editor/kindeditor-min.js"></script>
<script type="text/javascript" src="/Control/Public/Js/editor.js"></script>

</head>
<body>

<div style="z-index: 1; right: 20px; top: 30px; color: rgb(255, 255, 255); position: absolute; display: none;" id="loading"><img src="/Public/Css/images/loader.gif"></div>

<div id="main">
  <div class="main_box">  
	<div class="main_h2">
	<h2>查看留言</h2>
    <div id="m_h_right"></div>
    </div>
<form name="modform" id="myform" action="{:U('Contact/editmessage')}" method="post">
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
      
      <input type="hidden" name="register" value="register" />
      <tr>
        <td width="120" class="td_right">姓名：</td>
        <td class="td_left"><input type="text" name="name" id="name" value="{$name}"/>  
        </td>
      </tr>
      
      <tr>
        <td width="120" class="td_right">电话：</td>
        <td class="td_left"><input type="text" name="phone" id="phone" value="{$phone}"/>
        </td>
      </tr>
      <tr>
        <td  width="120" class="td_right">邮箱：</td>
       <td class="td_left"><input type="text" name="email" id="email" value="{$email}"/>
          </td>
      </tr>
       <tr>
        <td  width="120" class="td_right">留言内容：</td>
        <td class="td_left"><textarea name="message" id="message" cols="50" rows="10">{$message}</textarea>
        </td>
      </tr>
      <tr>
        <td class="td_right">&nbsp;</td>
        <td class="td_left">
	      <input type="hidden" value="{$id}" name="id">
          <input type="hidden" name="cmd" value="save">
        </td>
      </tr>
    </tbody></table>
</form>    

	</div>
</div>
<script>

var modulearr = new Array();
<volist name="module_x" id="mdate">
modulearr[{$mdate['id']}] = "{$mdate['name']}";
</volist>
var templatearr = new Array();
<volist name="templates" id="tem">
templatearr[{$i}] = "{$tem['name']},{$tem['value']},{$tem['filename']}";
</volist>


var datas = "<option value=''>请选择文件</option>";
var moduleid =  $('#moduleid').val();


showtemplist(moduleid,<if condition="empty($listtype)">0<else />{$listtype}</if>);
function showtemplist(m,t)
{
	var type='_list';
	if(t){type='_index';}
	var mtlist = modulearr[m]+type;
	var mtshow = modulearr[m]+'_show';
	if(modulearr[m]=='Page'){
		$("#lbyid").hide();
		mtlist=mtshow ='Page';
		}else{
			$("#lbyid").show();
			}
	$('#template_list').html(datas);
	$('#template_show').html(datas);
	listdatas = showdatas ='';

	for(i=1;i<templatearr.length;i++){
		data = templatearr[i].split(',');
		if(data[0].indexOf(mtlist)  >= 0){
			listdatas  ="<option value='"+data[1]+"'>"+data[2]+"</option>";
			$('#template_list').append(listdatas);
		}
		if(data[0].indexOf(mtshow)  >= 0){
			showdatas ="<option value='"+data[1]+"'>"+data[2]+"</option>";
			$('#template_show').append(showdatas);
		}
	}
	$("#template_list").attr("value",'{$vo.template_list}');
	$("#template_show").attr("value",'{$vo.template_show}');
}
function changetemplate(m){
	if(m==0){
		$('#module_url').show();
		$('#type').val('1');
		$('#catdir').removeClass('required');
	}else{
		$('#module_url').hide();
		$('#type').val('0');
		$('#catdir').addClass('required');
	}
	showtemplist(m,0);
	$("#listtype").removeAttr("checked");
}
function templatetype(){
	var moduleid = $('#moduleid').val();
	if($("#listtype").attr('checked')=='checked'){
		showtemplist(moduleid,1);
	}else{
		showtemplist(moduleid,0);
	}
}

<if condition="!empty($_GET['type'])">
$('#moduleid').val(0);
changetemplate(0);
</if>

function showothers()
{
	iss=$("#stats").html();
	if(iss=="显示")
	{
		tps=0;
		$("#stats").html("隐藏");
	}else{
			tps=1;
			$("#stats").html("显示");
	}
	if(tps>=1)
	{
		for(i=1;i<=3;i++)
		{
			$("#sh_"+i).hide("fast");
		}	
	}else{
		for(i=1;i<=3;i++)
		{
			$("#sh_"+i).show("fast");
		}	
	}
		
	
}
showothers();
</script>
</body>
</html>