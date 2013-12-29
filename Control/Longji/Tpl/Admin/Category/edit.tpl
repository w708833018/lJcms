<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="__PUBLIC__/layout.css" rel="stylesheet" type="text/css" />
<title></title>
<script type="text/javascript" src="__BJS__/jquery.min.js"></script>
<script type="text/javascript" src="__BJS__/jquery.validate.js"></script>
<load href="__CSS__/Jquery.form.css" />
<script type="text/javascript" src="__BJS__/artDialog/jquery.artDialog.js?skin=default"></script>
<script type="text/javascript" src="__BJS__/editor.js"></script>
</head>
<body>

<div style="z-index: 1; right: 20px; top: 30px; color: rgb(255, 255, 255); position: absolute; display: none;" id="loading"><img src="__PUBLIC__/images/loader.gif"></div>

<div id="main">
  <div class="main_box">  
	<div class="main_h2">
	<h2>{$actions}栏目目录</h2>
    <div id="m_h_right"></div>
    </div>
<form name="modform" id="myform" action="" method="post">    
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
      
       <tr>
        <td width="160" class="td_right">栏目模型：</td>
        <td class="td_left">
        <select name="moduleid" id="moduleid" validate="required:true" onchange="changetemplate(this.value)">
        <option value="">----请选择栏目模型----</option>
        <volist name="module_x" id="mv">
        	<option value="{$mv.id}" <if condition="$moduleid eq $mv[id]"> selected</if>>{$mv.title}</option>
        </volist>
        <option value="0">外部链接</option>
        </select>
        </td>
      </tr>
      <tr>
          <td class="td_right">上级目录：&nbsp;</td>
          <td class="td_left"><select name="parentid" id="parentid" class="inpt_1">
            <option value="0">设置为一级目录</option>
            {$select_categorys}
            </select>
          </td>
  </tr>
      <tr>
        <td class="td_right">栏目名称：</td>
        <td class="td_left"><input type="text" id="catname" size="30" maxlength="50" name="catname" value="{$catname}" validate="required:true,minlength:2,maxlength:150" /></td>
      </tr>
      
      <tr>
        <td class="td_right">栏目目录：</td>
        <td class="td_left"><input type="text" id="catdir" size="20" maxlength="50" name="catdir" value="{$catdir}" validate="required:true,minlength:2,maxlength:150,en_num:true" /></td>
      </tr>
      
      <tr>
        <td class="td_right">是否为导航：</td>
        <td class="td_left">
        <input type="radio" id="ismenu_1" name="ismenu" value="1" <if condition="$ismenu egt 1">checked</if>/><label for="ismenu_1">导航显示</label>
        <input type="radio" id="ismenu_1" name="ismenu" value="0" <if condition="$ismenu elt 0">checked</if>/><label for="ismenu_0"><font color="#FF0000">导航不显示</font></label>
        </td>
      </tr>
       <tr>
        <td class="td_right"  width="100" >栏目形象图：</td>
        <td class="td_left"><input type="text" id="image" name="image"  value="{$image}" /> <button type="button" class="btn02" onclick="myupload('上传栏目形象图','{:U('Attache/index')}','image');">上传图片</button>
        
        <b onclick="showothers()" >设置栏目优化参数[<span id="stats" values="1" style="color:#F00; cursor:pointer;">隐藏</span>]</b></td>
      </tr>
      
      
      
      <tr id="sh_1">
        <td class="td_right">SEO标题：</td>
        <td class="td_left"><input type="text" name="title" id="title" value="{$title}" size="35" maxlength="150">
        (提示：该标题可以与栏目名称不同)
        </td>
      </tr>
      
      <tr id="sh_2">
        <td class="td_right">SEO关键字：</td>
        <td class="td_left"><input type="text" name="keywords" id="keywords" value="{$keywords}"  size="35" maxlength="100">
        (提示：每个页面关键字不建议超过10个，每个关键字之间用 , 隔开。)
        </td>
      </tr>
      
      <tr id="sh_3">
        <td class="td_right">SEO标题：<br />
        (提示：简单描<br />述该栏目主要<br />介绍的信息。)
        </td>
        <td class="td_left"><textarea name="description" id="description"  class="inpt_1" cols="58" rows="6">{$description}</textarea>
        </td>
      </tr>
      <tr>
        <td class="td_right"><font color=red>以下设置应用到子类：</font></td>
        <td class="td_left"><input type="checkbox" id="tochild" value="1" name="tochild"/><label for="tochild">设置后子类的分页跟模板参数将与该栏目一致</label></td>
      </tr>
      <tr>
        <td class="td_right">分页条数：</td>
        <td class="td_left"><input type="text" id="pagesize" size="5" maxlength="3" name="pagesize" value="{$pagesize}"/></td>
      </tr>
      
      <tr id="lbyid" style="display:none;">
  		<td class="td_right">列表页面文件：&nbsp;</td>
  		<td class="td_left"><select id="template_list" name="template_list" class="inpt_1"></select> &nbsp;&nbsp; <input type="checkbox"  class="input_checkbox " id="listtype" name="listtype"  onclick="javascript:templatetype();" value="1"  <if condition="!empty($listtype)">checked</if> /> <label for="template_list">页面内调用子栏目列表</label>
  		</td>
	</tr>


    <tr>
      <td  width="100"  class="td_right">内容页文件：&nbsp;</td>
      <td  class="td_left"><select id="template_show" name="template_show" class="inpt_1"></select></td>
    </tr>
      
     
      
      
      
      <tr>
        <td class="td_right">&nbsp;</td>
        <td class="td_left">
	      <input type="hidden" value="{$id}" name="id">
          <input type="hidden" name="cmd" value="save">
          <input type="submit" value="提交" id="submit" onmouseout="this.className='btn05'" onmouseover="this.className='btn06'" class="btn05" name="submit">
        	<input type="button" value="返回"  onmouseout="this.className='btn05'" onmouseover="this.className='btn06'" onclick="location.href='{:U('index')}'" class="btn05" id="backbutton" name="backbutton"></td>
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
function showtemplist(m,t){
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

function showothers(){
	iss=$("#stats").html();
	if(iss=="显示"){
		tps=0;
		$("#stats").html("隐藏");
		}else{
			tps=1;
			$("#stats").html("显示");
			}
	if(tps>=1){
		for(i=1;i<=3;i++){
			$("#sh_"+i).hide("fast");
			}	
	}else{
		for(i=1;i<=3;i++){
			$("#sh_"+i).show("fast");
			}	
		}
		
	
	}
showothers();
</script>
</body>
</html>