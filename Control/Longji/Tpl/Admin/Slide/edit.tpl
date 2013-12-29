<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="__PUBLIC__/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="__BJS__/jquery.min.js"></script>
<script type="text/javascript" src="__BJS__/jquery.validate.js"></script>
<load href="__CSS__/Jquery.form.css" />
</head>
<body>

<div style="z-index: 1; right: 20px; top: 30px; color: rgb(255, 255, 255); position: absolute; display: none;" id="loading"><img src="__PUBLIC__/images/loader.gif"></div>

<div id="main">
  <div class="main_box">  
	<div class="main_h2">
	<h2>{$actions}幻灯片</h2>
    <div id="m_h_right"></div>
    </div>
<form name="modform" id="myform" action="" method="post">
<input type="hidden" name="id" value="{$id}" />
<input type="hidden" name="cmd" value="save" /> 
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
 <tr>
  <td  width="120" class="td_right">区块标题：</td>
  <td class="td_left"><input type="text" name="name" id="name" value="{$name}" size="35" />	
    </td>
  </tr>


<tr>
  <td class="td_right">幻灯模板：</td>
  <td class="td_left"><select name="tpl" id="tpl">
  <volist name="Tpl" id="r">
  <option value="{$r.filepath}">{$r.filename}</option>
  </volist>
  </select>
</tr>

  <tr>
  <td  width="120" class="td_right">最佳宽高：</td>
  <td class="td_left">
   宽：<input type="text" name="width" id="width" value="{$width}" size="5" maxlength="5" />
   * 
   高：<input type="text" name="height" id="height" value="{$height}" size="5" maxlength="5" />	
    </td>
  </tr>
  
    <tr>
        <td class="td_right">状态：</td>
        <td class="td_left"><input type="radio" name="status" id="status_1" value="1" <if condition="$status egt 1">checked="checked"</if>  />
          <label for="status_1">正常</label>
          <input type="radio" name="status" id="status_0" value="0" <if condition="$status elt 0">checked="checked"</if>  />
          <label for="status_0">隐藏</label></td>
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

</body>
</html>
