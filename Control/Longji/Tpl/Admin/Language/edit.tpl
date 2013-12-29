<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="__PUBLIC__/layout.css" rel="stylesheet" type="text/css" />
<title></title>
<script type="text/javascript" src="__BJS__/jquery.min.js"></script>
<script type="text/javascript" src="__BJS__/jquery.validate.js"></script>
<load href="__CSS__/Jquery.form.css" />
<load href="__BJS__/Date/WdatePicker.js" />
<script type="text/javascript" src="__BJS__/artDialog/jquery.artDialog.js?skin=default"></script>
<script type="text/javascript" src="__BJS__/Editor/kindeditor-min.js"></script>
<script type="text/javascript" src="__BJS__/editor.js"></script>
</head>
<body>

<div style="z-index: 1; right: 20px; top: 30px; color: rgb(255, 255, 255); position: absolute; display: none;" id="loading"><img src="__PUBLIC__/images/loader.gif"></div>

<div id="main">
  <div class="main_box">  
	<div class="main_h2">
	<h2>{$actions}语言</h2>
    <div id="m_h_right"></div>
    </div>
<form name="gzform" id="myform" method="post" action="">
<input type="hidden" name="id" value="{$id}" />
<input type="hidden" name="cmd" value="save" />
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
      <tr>
  <td  width="120" class="td_right">语言名称：&nbsp;</td>
  <td class="td_left">&nbsp;
<input type="text" name="name" id="name" value="{$name}" class="inpt_1" size="15" maxlength="15" validate="required:true"></td>
  </tr>
<tr>
  <td class="td_right">语言标示：&nbsp;</td>
  <td  class="td_left">&nbsp;
<input type="text" name="mark" id="mark" value="{$mark}" class="inpt_1" size="10" maxlength="10"  validate="required:true,enlish:true"/></td>
  </tr>
  
<tr>
  <td class="td_right">语言图标：&nbsp;</td>
  <td  class="td_left">&nbsp;
    <input type="text" name="flag" id="flag" value="{$flag}" class="inpt_1" size="20" maxlength="20" /><button type="button" class="btn02" onclick="myupload('上传语言图标','{:U('Attache/index')}','flag');">上传图片</button></td>
</tr>

<tr>
  <td class="td_right">模板路径：&nbsp;</td>
  <td  class="td_left">&nbsp;
  <select name="template" id="template">
  <option value="{:TEMPLATE_PATH}">默认模板</option>
  <volist name="templatedir" id="r">
  	<option value="{:TEMPLATE_PATH}{$r}/" {if $template==TEMPLATE_PATH.$r.'/'}selected {/if}>/{$r}/</option>
  </volist>
  </select>
  </td>
  </tr>

<tr>
  <td class="td_right">是否启用：&nbsp;</td>
  <td  class="td_left">
  &nbsp;
  <input type="radio" name="status" id="status_1" value="1" <if condition="$status eq 1"> checked</if>><label for="status_1">启用</label>
  &nbsp;
  <input type="radio" name="status" id="status_0" value="0" <if condition="$status eq 0"> checked</if>><label for="status_0">禁用</label>
  </td>
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
</body>
</html>