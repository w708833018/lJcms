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
<script>
function load_auto_field(fieldtype){
	switch(fieldtype){
		case "catid":	//内容栏目
			$("#setup_t").hide();
			break;
			
		default:	//单文件上传
			
			$("#setup_t").show();		
			$("#setup").load("<php>echo U('fieldajax');</php>",{fieldid: <php>echo $id;</php>,fieldtypes : fieldtype});			
		}
	}
</script>
</head>
<body>

<div style="z-index: 1; right: 20px; top: 30px; color: rgb(255, 255, 255); position: absolute; display: none;" id="loading"><img src="__PUBLIC__/images/loader.gif"></div>

<div id="main">
  <div class="main_box">  
	<div class="main_h2">
	<h2>{$actions}数据库字段</h2>
    <div id="m_h_right"></div>
    </div>
<form name="modform" id="myform" action="{if $id}{:U('fieldupdate')}{else}{:U('fieldinsert')}{/if}" method="post">
<input type="hidden" name="id" value="{$id}" />
<input type="hidden" name="mid" value="{$mid}" />
<input type="hidden" name="moduleid" value="{$mid}" />
<input type="hidden" name="cmd" value="save" /> 
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
      
       <tr>
        <td width="100" class="td_right">字段类型：</td>
        <td class="td_left"><select name="type" id="types" class="inpt_1" onchange="load_auto_field(this.value)" validate="required:true">
          <option value="">请选择类型</option>
          <option value="catid" <if condition="$type eq 'catid'">selected</if>>内容栏目</option>
          <option value="number" <if condition="$type eq 'number'">selected</if>>数字</option>
          <option value="file" <if condition="$type eq 'file'">selected</if>>单文件上传</option>
          <option value="files" <if condition="$type eq 'files'">selected</if>>多文件上传</option>
          <option value="editor" <if condition="$type eq 'editor'">selected</if>>文本编辑器</option>
          <option value="text" <if condition="$type eq 'text'">selected</if>>文本框</option>
          <option value="checkbox" <if condition="$type eq 'checkbox'">selected</if>>复选框</option>
          <option value="radio" <if condition="$type eq 'radio'">selected</if>>单选框</option>
          <option value="select" <if condition="$type eq 'select'">selected</if>>下拉列表</option>
          <option value="textarea" <if condition="$type eq 'textarea'">selected</if>>多行文本域</option>
          <option value="datetime" <if condition="$type eq 'datetime'">selected</if>>日期选择</option>
          <option value="posid" <if condition="$type eq 'posid'">selected</if>>推荐展位</option>
          <option value="image" <if condition="$type eq 'image'">selected</if>>单张图片</option>
          <option value="images" <if condition="$type eq 'images'">selected</if>>多张图片</option>
  </select></td>
      </tr>
      
      
      <tr>
        <td width="100" class="td_right">字段名称：</td>
        <td class="td_left"><input type="text" name="field" id="field" value="{$field}" class="inpt_1" size="15" maxlength="30"  validate="required:true,english:true"></td>
      </tr>
      
      <tr>
        <td width="100" class="td_right">字段别名：</td>
        <td class="td_left"><input type="text" name="name" id="name" value="{$name}" class="inpt_1" size="25" maxlength="30" validate="required:true"/></td>
      </tr>
      
      <tr id="setup_t" style="display:none;">
        <td width="100" class="td_right">附加参数：</td>
        <td class="td_left" id="setup"></td>
      </tr>
      
      <tr>
        <td width="100" class="td_right">表单样式：</td>
        <td class="td_left"><input type="text" name="class" id="class" value="{$class}" class="inpt_1" size="10" maxlength="30"></td>
      </tr>
      
      
      <tr>
        <td width="100" class="td_right">必 填 项：</td>
        <td class="td_left">&nbsp;<input type="radio" name="required" id="required_1" value="1" <if condition="$required eq 1"> checked</if>><label for="required_1">必填</label>
  &nbsp;<input type="radio" name="required" id="required_0" value="0" <if condition="$required eq 0"> checked</if>><label for="required_0">非必填</label></td>
      </tr>
      
      <tr>
        <td width="100" class="td_right">验证规则：</td>
        <td class="td_left">{:Form::select(array('field'=>'pattern','options'=>$field_pattern,'class'=>'inpt_1'),$pattern)}</td>
      </tr>
      
      
      
    <tr>
      <td  width="100" class="td_right">字符限制：</td>
      <td  class="td_left">
      最小长度：
      <input type="text" name="minlength" id="minlength" value="{$minlength}" class="inpt_1" size="5" maxlength="10">
      &nbsp;最大长度：
      <input type="text" name="maxlength" id="maxlength" value="{$maxlength}" class="inpt_1" size="5" maxlength="10">
      
      </td>
    </tr>
    
    <tr>
      <td class="td_right">验证失败提示：&nbsp;</td>
      <td  class="td_left">&nbsp;<input type="text" name="errormsg" id="errormsg" value="{$errormsg}" class="inpt_1" size="35" maxlength="80"></td>
    </tr>
    
    
    
    <tr>
      <td class="td_right">前台提交：&nbsp;</td>
      <td  class="td_left">
      &nbsp;<input type="radio" name="ispost" id="ispost_1" value="1" <if condition="$ispost eq 1"> checked</if>><label for="ispost_1">正常</label>
      &nbsp;<input type="radio" name="ispost" id="ispost_0" value="0" <if condition="$ispost eq 0"> checked</if>><label for="ispost_0">禁用</label>
      </td>
    </tr>
    
    <tr>
      <td class="td_right">后台提交：&nbsp;</td>
      <td  class="td_left">
      &nbsp;<input type="radio" name="status" id="status_1" value="1" <if condition="$status eq 1"> checked</if>><label for="status_1">正常</label>
      &nbsp;<input type="radio" name="status" id="status_0" value="0" <if condition="$status eq 0"> checked</if>><label for="status_0">禁用</label>
      </td>
    </tr>
    

     
      <tr>
        <td class="td_right">&nbsp;</td>
        <td class="td_left">
	      <input type="hidden" value="{$id}" name="id">
          <input type="hidden" name="cmd" value="save">
          <input type="submit" value="提交" id="submit" onmouseout="this.className='btn05'" onmouseover="this.className='btn06'" class="btn05" name="submit">
          <input type="reset" class="btn05"  onmouseout="this.className='btn05'" onmouseover="this.className='btn06'" value="清除" name="reset_button">
          <input type="button" value="返回"  onmouseout="this.className='btn05'" onmouseover="this.className='btn06'" onclick="location.href='{:U('index','mid='.$mid)}'" class="btn05" id="backbutton" name="backbutton"></td>
      </tr>
    </tbody></table>
</form>    

	</div>
</div>
<script>
load_auto_field('{$type}');
</script>
</body>
</html>