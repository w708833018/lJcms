<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>模型字段新增/编辑</title>
<load href="__PUBLIC__/Admin/Css/Style.css" />
<load href="__PUBLIC__/Js/jquery.min.js" />
<load href="__PUBLIC__/Js/framemenu.js" />
<script>
function load_auto_field(fieldtype){
	switch(fieldtype){
		case "catid":	//内容栏目
			$('#field').val("catid");
			$('#field').attr("readonly",true);
			$('#name').val("内容栏目");
			$("#setup_t").hide();
			break;
			
		default:	//单文件上传
			$("#setup_t").show();		
			$("#setup").load("<php>echo U('fieldajax');</php>",{fieldid: <php>echo $id;</php>,fieldtype : fieldtype});			
		}
	}
</script>
</head>

<body>
<div class="main_top">
<div class="top_tip">
在这里您可以新增跟编辑模型。
</div>
<ul>
	<li><button class="btn1" type="button" onclick="location.href='{:U('modulefield','mid='.$mid)}'">字段列表</button></li>
</ul>
</div>
<div class="addtable">
<form name="gzform" method="post" action="{:U('fieldinsert')}">
<input type="hidden" name="id" value="{$id}" />
<input type="hidden" name="moduleid" value="{$mid}" />
<input type="hidden" name="cmd" value="save" />
<table width="100%" cellpadding="1" cellspacing="1" bgcolor="#DDDDDD">

<tr>
  <td align="right" valign="middle">字段类型：&nbsp;</td>
  <td align="left" valign="middle">&nbsp;<select name="type" id="types" class="inpt_1" onchange="load_auto_field(this.value)">
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
  <!--<option value="usergroup">会员组</option>-->
  <option value="posid" <if condition="$type eq 'posid'">selected</if>>推荐展位</option>
  <option value="image" <if condition="$type eq 'image'">selected</if>>单张图片</option>
  <option value="images" <if condition="$type eq 'images'">selected</if>>多张图片</option>
  </select></td>
  </tr>


<tr>
  <td width="180" align="right" valign="middle">字段名称：&nbsp;</td>
  <td align="left" valign="middle">&nbsp;<input type="text" name="field" id="field" value="{$field}" class="inpt_1" size="15" maxlength="30"  ></td>
  </tr>
<tr>
  <td align="right" valign="middle">字段别名：&nbsp;</td>
  <td align="left" valign="middle">&nbsp;<input type="text" name="name" id="name" value="{$name}" class="inpt_1" size="25" maxlength="30" /></td>
  </tr>
  
  <tr id="setup_t" style="display:none;">
  <td align="right" valign="middle">字段附加参数：&nbsp;</td>
  <td align="left" valign="middle" id="setup">&nbsp;</td>
  </tr>
  
<tr>
  <td align="right" valign="middle">表单样式：&nbsp;</td>
  <td align="left" valign="middle">&nbsp;<input type="text" name="class" id="class" value="{$class}" class="inpt_1" size="10" maxlength="30"></td>
</tr>




<tr>
  <td align="right" valign="middle">必 填 项：&nbsp;</td>
  <td align="left" valign="middle">
  &nbsp;<input type="radio" name="required" id="required_1" value="1" <if condition="$required eq 1"> checked</if>><label for="required_1">必填</label>
  &nbsp;<input type="radio" name="required" id="required_0" value="0" <if condition="$required eq 0"> checked</if>><label for="required_0">非必填</label>
  </td>
</tr>

<tr>
  <td align="right" valign="middle">验证规则：&nbsp;</td>
  <td align="left" valign="middle">&nbsp;{:Form::select(array('field'=>'pattern','options'=>$field_pattern,'class'=>'inpt_1'),$pattern)}</td>
</tr>

<tr>
  <td align="right" valign="middle">字符限制：&nbsp;</td>
  <td align="left" valign="middle">&nbsp;
  最小长度：
  <input type="text" name="minlength" id="minlength" value="{$minlength}" class="inpt_1" size="5" maxlength="10">
  &nbsp;最大长度：
  <input type="text" name="maxlength" id="maxlength" value="{$maxlength}" class="inpt_1" size="5" maxlength="10">
  
  </td>
</tr>

<tr>
  <td align="right" valign="middle">验证失败提示：&nbsp;</td>
  <td align="left" valign="middle">&nbsp;<input type="text" name="errormsg" id="errormsg" value="{$errormsg}" class="inpt_1" size="35" maxlength="80"></td>
</tr>



<tr>
  <td align="right" valign="middle">前台提交：&nbsp;</td>
  <td align="left" valign="middle">
  &nbsp;<input type="radio" name="ispost" id="ispost_1" value="1" <if condition="$ispost eq 1"> checked</if>><label for="ispost_1">正常</label>
  &nbsp;<input type="radio" name="ispost" id="ispost_0" value="0" <if condition="$ispost eq 0"> checked</if>><label for="ispost_0">禁用</label>
  </td>
</tr>

<tr>
  <td align="right" valign="middle">后台提交：&nbsp;</td>
  <td align="left" valign="middle">
  &nbsp;<input type="radio" name="status" id="status_1" value="1" <if condition="$status eq 1"> checked</if>><label for="status_1">正常</label>
  &nbsp;<input type="radio" name="status" id="status_0" value="0" <if condition="$status eq 0"> checked</if>><label for="status_0">禁用</label>
  </td>
</tr>

<tr>
	<td colspan="2" align="center" valign="middle" style="border:none;"><input name="button" type="submit" class="btn2" id="button" value=" 保 存 " /></td>
    </tr>
</table>
</form>
</div>
<script>
load_auto_field('{$type}');
</script>
</body>
</html>
