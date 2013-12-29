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
</script>
</head>
<body>

<div style="z-index: 1; right: 20px; top: 30px; color: rgb(255, 255, 255); position: absolute; display: none;" id="loading"><img src="__PUBLIC__/images/loader.gif"></div>

<div id="main">
  <div class="main_box">  
	<div class="main_h2">
	<h2>{$actions}模型</h2>
    <div id="m_h_right"></div>
    </div>
<form name="modform" id="myform" action="" method="post">    
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
      <tr>
  <td width="180" class="td_right">模型名称：&nbsp;</td>
  <td class="td_left">&nbsp;<input type="text" name="name" id="name" value="{$name}" class="input1" size="25" maxlength="30" validate="english:true,required:true" <if condition="!empty($id)" > disabled</if>></td>
  </tr>
<tr>
  <td class="td_right">模型标题：&nbsp;</td>
  <td class="td_left">&nbsp;<input type="text" name="title" id="title" value="{$title}" class="input1" size="25" maxlength="50" validate="required:true"></td>
  </tr>
<tr>
  <td class="td_right">调用字段：&nbsp;</td>
  <td class="td_left">&nbsp;<input type="text" name="infield" id="infield" value="{$infield}" class="input1" size="35" maxlength="80"></td>
</tr>

<tr>
  <td class="td_right">模型介绍：&nbsp;</td>
  <td class="td_left">&nbsp;<textarea name="demo" id="demo" class="input1" cols="45" rows="6">{$demo}</textarea></td>
</tr>

{if $lgtypes!='page'}
<tr>
  <td  class="td_right">模型类型：&nbsp;</td>
  <td class="td_left">
  &nbsp;<select name="lgtypes" id="lgtypes" class="input1" validate="required:true">
  		<option value="">--请选择--</option>
        <option value="guestbook" <if condition="$lgtypes eq 'guestbook'"> selected</if>>留言互动</option>
        <option value="content" <if condition="$lgtypes eq 'content'"> selected</if>>内容模型</option>
  </select>
  </td>
</tr>
{/if}
      <tr>
        <td class="td_right">模型状态：&nbsp;</td>
        <td class="td_left"><input type="radio" name="status" id="status_1" value="1" <if condition="$status gt 0">checked="checked"</if>  />
          <label for="status_1">发布</label>
          <input type="radio" name="status" id="status_0" value="0" <if condition="$status elt 0">checked="checked"</if>/>
          <label for="status_0">禁止</label></td>
      </tr>
      <tr>
        <td class="td_right">&nbsp;</td>
        <td class="td_left">
	      <input type="hidden" value="{$id}" name="id">
          <input type="hidden" name="cmd" value="save">
          <input type="submit" value="提交" id="submit" onmouseout="this.className='btn05'" onmouseover="this.className='btn06'" class="btn05" name="submit">
          <input type="reset" class="btn05"  onmouseout="this.className='btn05'" onmouseover="this.className='btn06'" value="清除" name="reset_button">
          <input type="button" value="返回"  onmouseout="this.className='btn05'" onmouseover="this.className='btn06'" onclick="location.href='{:U('config')}'" class="btn05" id="backbutton" name="backbutton"></td>
      </tr>
    </tbody></table>
</form>    

	</div>
</div>
</body>
</html>