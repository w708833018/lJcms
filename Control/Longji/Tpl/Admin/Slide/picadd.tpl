<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="__PUBLIC__/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="__BJS__/jquery.min.js"></script>
<script type="text/javascript" src="__BJS__/jquery.validate.js"></script>
<script type="text/javascript" src="__BJS__/artDialog/jquery.artDialog.js?skin=default"></script>
<script type="text/javascript" src="__BJS__/editor.js"></script>

<load href="__CSS__/Jquery.form.css" />
</head>
<body>

<div style="z-index: 1; right: 20px; top: 30px; color: rgb(255, 255, 255); position: absolute; display: none;" id="loading"><img src="__PUBLIC__/images/loader.gif"></div>

<div id="main">
  <div class="main_box">  
	<div class="main_h2">
	<h2>{$actions}幻灯片图片</h2>
    <div id="m_h_right"></div>
    </div>
<form name="modform" id="myform" action="" method="post">

<table width="100%" cellspacing="0" cellpadding="0" border="0" class="t_list">
      <tbody>
 <tr>
  <td  width="120" class="td_right">图片标题：</td>
  <td class="td_left"><input type="text" name="title" id="title" value="{$title}" size="35" />	
    </td>
  </tr>


<tr>
  <td class="td_right">图片链接：</td>
  <td class="td_left"><input type="text" name="link" id="link" validate="url:true" size="30" maxlength="50"  value="{$link}" />
</tr>

<tr>
  <td class="td_right">图片路径：</td>
  <td class="td_left"><input type="text" name="pic" id="pic" validate="required:true" size="30" maxlength="150" value="{$pic}" />
  <button class="btn02" type="button" onclick="myupload('上传幻灯片图片','{:U('Attache/index')}','pic')">上传</button>
</tr>
 
 
<tr>
  <td class="td_right">图片描述：</td>
  <td class="td_left"><textarea name="description" cols="50" rows="5" id="description" >{$description}</textarea>
</tr>

<tr>
  <td class="td_right">附加数据：</td>
  <td class="td_left"><textarea name="data" cols="50" rows="5" id="data" >{$data}</textarea>
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
           <input type="hidden" value="{$fid}" name="fid">
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
